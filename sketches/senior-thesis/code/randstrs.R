library("stringi");
library("igraph");

# Generate random strings
rand.strs <- function (num, len) {
  return (stri_rand_strings(num, len, "[A-D]"));
}

# Cost of merging a single string into a set
single.merge.cost <- function (key, base) {
  costs <- lapply(base, function (b) { return (adist(key, b)); });
  return (min(unlist(costs)));
}

# Cost of merging entire set into another set
whole.merge.cost <- function (keys, base) {
  costs <- lapply(keys, function (k) { return (single.merge.cost(k, base)); });
  return (max(unlist(costs)));
}

# Hausdorff distance
haus.dist <- function (set1, set2) {
  return (max(c(unlist(whole.merge.cost(set1, set2))),
                unlist(whole.merge.cost(set2, set1))));
}

bi.merge.cost <- function (set1, set2) {
  return ((sum(unlist(whole.merge.cost(set1, set2))) / length(set1)) +
          (sum(unlist(whole.merge.cost(set2, set1))) / length(set2)));
}

# Make the graph(s)

strs1 <- stri_rand_strings(100, 6, "[A-D]");
strs2 <- stri_rand_strings(100, 6, "[D-G]");
all.strs <- c(strs1, strs2);

strs1.len <- length(strs1);
strs2.len <- length(strs2);
all.len <- strs1.len + strs2.len;

all.ids <- c(1:all.len);

node.data <- data.frame(
  node.id = all.ids,
  node.str = all.strs,
  node.set = c(rep(c(1), times=strs1.len), rep(c(2), times=strs2.len))
)

edge.data <- data.frame(
  edge.from =
    unlist(lapply(all.ids, function (x) {
      return (rep(c(x), times=all.len));
    })),
  edge.to = rep(c(1:all.len), times=all.len),
  weight =
    unlist(lapply(all.ids, function (x) {
      return (unlist(lapply(all.ids, function (y) {
        return (1 / (1 + (adist(all.strs[x], all.strs[y]))));
    })))}))
)

net <- graph_from_data_frame(d=edge.data, vertices=node.data);

V(net)$color <- c("red", "pink")[V(net)$node.set];
V(net)$size <- 5;
V(net)$label <- NA;

E(net)$color <- "white";

haus <- haus.dist(strs1, strs2);
bimg <- bi.merge.cost(strs1, strs2);

title = paste(c("hausdorff:", haus, "bimerge:", bimg), collapse=" ");

l <- layout_with_kk(net);


png('AD6-DG6-100-IM.png');
plot(net, layout=l, main=title);
dev.off();



