Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 May 2022 13:18:20 +0100
Message-Id: <20220511121821.1010974-8-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20220511121821.1010974-1-tvrtko.ursulin@linux.intel.com>
References: <20220511121821.1010974-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 7/8] libdrmclient: Enforce client status
 sort order in the library
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Some libdrmclient operations require that inactive clients are last in the
list. Rather than relying on callers of the library sort routine to
implement their comparison callbacks correctly, enforce this order
directly in the library and let callers comparison callbacks concern
themselves only with ordering they are interested in.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 lib/igt_drm_clients.c | 37 +++++++++++++++-----
 lib/igt_drm_clients.h |  2 +-
 tools/intel_gpu_top.c | 81 +++++++++++++++++++------------------------
 3 files changed, 65 insertions(+), 55 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 5c24907d094d..ae00e0db120a 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -187,22 +187,38 @@ void igt_drm_client_free(struct igt_drm_client *c)
 	memset(c, 0, sizeof(*c));
 }
 
+struct sort_context
+{
+	int (*user_cmp)(const void *, const void *, void *);
+};
+
+static int sort_cmp(const void *_a, const void *_b, void *_ctx)
+{
+	const struct sort_context *ctx = _ctx;
+	const struct igt_drm_client *a = _a;
+	const struct igt_drm_client *b = _b;
+	int cmp = b->status - a->status;
+
+	if (cmp == 0)
+		return ctx->user_cmp(_a, _b, _ctx);
+	else
+		return cmp;
+}
+
 /**
  * igt_drm_clients_sort:
  * @clients: Previously initialised clients object
  * @cmp: Client comparison callback
  *
  * Sort the clients array according to the passed in comparison callback which
- * is compatible with the qsort(3) semantics.
- *
- * Caller has to ensure the callback is putting all active
- * (IGT_DRM_CLIENT_ALIVE) clients in a single group at the head of the array
- * before any other sorting criteria.
+ * is compatible with the qsort(3) semantics, with the third void * argument
+ * being unused.
  */
 struct igt_drm_clients *
 igt_drm_clients_sort(struct igt_drm_clients *clients,
-		     int (*cmp)(const void *, const void *))
+		     int (*cmp)(const void *, const void *, void *))
 {
+	struct sort_context ctx = { .user_cmp = cmp };
 	unsigned int active, free;
 	struct igt_drm_client *c;
 	int tmp;
@@ -210,8 +226,13 @@ igt_drm_clients_sort(struct igt_drm_clients *clients,
 	if (!clients)
 		return clients;
 
-	qsort(clients->client, clients->num_clients, sizeof(*clients->client),
-	      cmp);
+	/*
+	 * Enforce client->status ordering (active followed by free) by running
+	 * the user provided comparison callback wrapped in the one internal
+	 * to the library.
+	 */
+	qsort_r(clients->client, clients->num_clients, sizeof(*clients->client),
+	      sort_cmp, &ctx);
 
 	/* Trim excessive array space. */
 	active = 0;
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index 0a903b431eaa..df8022d42098 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -82,6 +82,6 @@ igt_drm_clients_scan(struct igt_drm_clients *clients,
 
 struct igt_drm_clients *
 igt_drm_clients_sort(struct igt_drm_clients *clients,
-		     int (*cmp)(const void *, const void *));
+		     int (*cmp)(const void *, const void *, void *));
 
 #endif /* IGT_DRM_CLIENTS_H */
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index e603d40fc98d..51006b272e74 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -644,85 +644,74 @@ static void pmu_sample(struct engines *engines)
 	}
 }
 
-static int client_last_cmp(const void *_a, const void *_b)
+static int
+__client_id_cmp(const struct igt_drm_client *a,
+		const struct igt_drm_client *b)
+{
+	if (a->id > b->id)
+		return 1;
+	else if (a->id < b->id)
+		return -1;
+	else
+		return 0;
+}
+
+static int client_last_cmp(const void *_a, const void *_b, void *unused)
 {
 	const struct igt_drm_client *a = _a;
 	const struct igt_drm_client *b = _b;
-	long tot_a, tot_b;
+	long val_a = a->last_runtime, val_b = b->last_runtime;
 
 	/*
 	 * Sort clients in descending order of runtime in the previous sampling
-	 * period for active ones, followed by inactive. Tie-breaker is client
-	 * id.
+	 * period. Tie-breaker is client id.
 	 */
 
-	tot_a = a->status == IGT_DRM_CLIENT_ALIVE ? a->last_runtime : -1;
-	tot_b = b->status == IGT_DRM_CLIENT_ALIVE ? b->last_runtime : -1;
-
-	tot_b -= tot_a;
-	if (tot_b > 0)
+	if (val_a == val_b)
+		return __client_id_cmp(a, b);
+	else if (val_b > val_a)
 		return 1;
-	if (tot_b < 0)
+	else
 		return -1;
-
-	return (int)b->id - a->id;
 }
 
-static int client_total_cmp(const void *_a, const void *_b)
+static int client_total_cmp(const void *_a, const void *_b, void *unused)
 {
 	const struct igt_drm_client *a = _a;
 	const struct igt_drm_client *b = _b;
-	long tot_a, tot_b;
+	long val_a = a->total_runtime, val_b = b->total_runtime;
 
-	tot_a = a->status == IGT_DRM_CLIENT_ALIVE ? a->total_runtime : -1;
-	tot_b = b->status == IGT_DRM_CLIENT_ALIVE ? b->total_runtime : -1;
-
-	tot_b -= tot_a;
-	if (tot_b > 0)
+	if (val_a == val_b)
+		return __client_id_cmp(a, b);
+	else if (val_b > val_a)
 		return 1;
-	if (tot_b < 0)
+	else
 		return -1;
-
-	return (int)b->id - a->id;
 }
 
-static int client_id_cmp(const void *_a, const void *_b)
+static int client_id_cmp(const void *_a, const void *_b, void *unused)
 {
 	const struct igt_drm_client *a = _a;
 	const struct igt_drm_client *b = _b;
-	int id_a, id_b;
-
-	id_a = a->status == IGT_DRM_CLIENT_ALIVE ? a->id : -1;
-	id_b = b->status == IGT_DRM_CLIENT_ALIVE ? b->id : -1;
-
-	id_b -= id_a;
-	if (id_b > 0)
-		return 1;
-	if (id_b < 0)
-		return -1;
 
-	return (int)b->id - a->id;
+	return __client_id_cmp(a, b);
 }
 
-static int client_pid_cmp(const void *_a, const void *_b)
+static int client_pid_cmp(const void *_a, const void *_b, void *unused)
 {
 	const struct igt_drm_client *a = _a;
 	const struct igt_drm_client *b = _b;
-	int pid_a, pid_b;
-
-	pid_a = a->status == IGT_DRM_CLIENT_ALIVE ? a->pid : INT_MAX;
-	pid_b = b->status == IGT_DRM_CLIENT_ALIVE ? b->pid : INT_MAX;
+	int val_a = a->pid, val_b = b->pid;
 
-	pid_b -= pid_a;
-	if (pid_b > 0)
+	if (val_a == val_b)
+		return __client_id_cmp(a, b);
+	else if (val_b > val_a)
 		return -1;
-	if (pid_b < 0)
+	else
 		return 1;
-
-	return (int)a->id - b->id;
 }
 
-static int (*client_cmp)(const void *, const void *) = client_last_cmp;
+static int (*client_cmp)(const void *, const void *, void *) = client_last_cmp;
 
 static bool aggregate_pids = true;
 
@@ -1910,7 +1899,7 @@ static void interactive_stdin(void)
 static void select_client_sort(void)
 {
 	struct {
-		int (*cmp)(const void *, const void *);
+		int (*cmp)(const void *, const void *, void *);
 		const char *msg;
 	} cmp[] = {
 		{ client_last_cmp, "Sorting clients by current GPU usage." },
-- 
2.32.0
