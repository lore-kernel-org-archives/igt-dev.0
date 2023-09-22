Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Fri, 22 Sep 2023 14:44:34 +0100
Message-Id: <20230922134437.234888-10-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230922134437.234888-1-tvrtko.ursulin@linux.intel.com>
References: <20230922134437.234888-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 09/12] lib/igt_drm_clients: Allow passing in
 the memory region map
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Same concept as with the engine map, allowing callers to pass in fixed
map of names to indices, simplifying their implementation and avoiding
auto-detection while parsing.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 lib/igt_drm_clients.c | 5 +++--
 lib/igt_drm_clients.h | 3 ++-
 tools/gputop.c        | 4 ++--
 tools/intel_gpu_top.c | 8 +++++---
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index da51d7335b2b..025d60c51503 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -445,7 +445,8 @@ struct igt_drm_clients *
 igt_drm_clients_scan(struct igt_drm_clients *clients,
 		     bool (*filter_client)(const struct igt_drm_clients *,
 					   const struct drm_client_fdinfo *),
-		     const char **name_map, unsigned int map_entries)
+		     const char **name_map, unsigned int map_entries,
+		     const char **region_map, unsigned int region_entries)
 {
 	struct dirent *proc_dent;
 	struct igt_drm_client *c;
@@ -524,7 +525,7 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 			if (!__igt_parse_drm_fdinfo(dirfd(fdinfo_dir),
 						    fdinfo_dent->d_name, &info,
 						    name_map, map_entries,
-						    NULL, 0))
+						    region_map, region_entries))
 				continue;
 
 			if (filter_client && !filter_client(clients, &info))
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index cd37f8508b20..52888aedc25a 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -93,7 +93,8 @@ struct igt_drm_clients *
 igt_drm_clients_scan(struct igt_drm_clients *clients,
 		     bool (*filter_client)(const struct igt_drm_clients *,
 					   const struct drm_client_fdinfo *),
-		     const char **name_map, unsigned int map_entries);
+		     const char **name_map, unsigned int map_entries,
+		     const char **region_map, unsigned int region_entries);
 
 struct igt_drm_clients *
 igt_drm_clients_sort(struct igt_drm_clients *clients,
diff --git a/tools/gputop.c b/tools/gputop.c
index ea95e0333dd2..71e28f43ee4c 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -253,7 +253,7 @@ int main(int argc, char **argv)
 	if (!clients)
 		exit(1);
 
-	igt_drm_clients_scan(clients, NULL, NULL, 0);
+	igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
 
 	for (;;) {
 		struct igt_drm_client *c, *prevc = NULL;
@@ -270,7 +270,7 @@ int main(int argc, char **argv)
 			}
 		}
 
-		igt_drm_clients_scan(clients, NULL, NULL, 0);
+		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
 		igt_drm_clients_sort(clients, client_cmp);
 
 		printf("\033[H\033[J");
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index e18ec25e8036..eb0ef00abeaf 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -2619,8 +2619,9 @@ int main(int argc, char **argv)
 	}
 
 	pmu_sample(engines);
-	igt_drm_clients_scan(clients, client_match, engine_map,
-			     ARRAY_SIZE(engine_map));
+	igt_drm_clients_scan(clients, client_match,
+			     engine_map, ARRAY_SIZE(engine_map),
+			     NULL, 0);
 	gettime(&ts);
 
 	if (output_mode == JSON)
@@ -2655,7 +2656,8 @@ int main(int argc, char **argv)
 			display_clients(igt_drm_clients_scan(clients,
 							     client_match,
 							     engine_map,
-							     ARRAY_SIZE(engine_map)));
+							     ARRAY_SIZE(engine_map),
+							     NULL, 0));
 		scan_us = elapsed_us(&ts, period_us);
 
 		if (stop_top)
-- 
2.39.2
