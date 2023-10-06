Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A222A10E53D
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Oct 2023 16:41:06 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 Oct 2023 16:06:45 +0000
Message-ID: <20231006160654.3220198-12-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20231006160654.3220198-1-marcin.bernatowicz@linux.intel.com>
References: <20231006160654.3220198-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 11/17] benchmarks/gem_wsim: extract allocate
 and prepare contexts code to new functions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@linux.intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

No functional changes.
Extracted allocate_contexts and prepare_contexts functions
from prepare_workload.

v2:
- propagate error code from prepare_contexts (Tvrtko)
- don't mix unrelated changes (Tvrtko)

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 43 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 11 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index f4be066af..d4f11851a 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1762,19 +1762,11 @@ static void measure_active_set(struct workload *wrk)
 
 #define alloca0(sz) ({ size_t sz__ = (sz); memset(alloca(sz__), 0, sz__); })
 
-static int prepare_workload(unsigned int id, struct workload *wrk)
+static void allocate_contexts(unsigned int id, struct workload *wrk)
 {
-	struct working_set **sets;
-	unsigned long total = 0;
-	uint32_t share_vm = 0;
 	int max_ctx = -1;
 	struct w_step *w;
-	int i, j;
-
-	wrk->id = id;
-	wrk->bb_prng = (wrk->flags & FLAG_SYNCEDCLIENTS) ? master_prng : rand();
-	wrk->bo_prng = (wrk->flags & FLAG_SYNCEDCLIENTS) ? master_prng : rand();
-	wrk->run = true;
+	int i;
 
 	/*
 	 * Pre-scan workload steps to allocate context list storage.
@@ -1798,6 +1790,13 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
 
 		max_ctx = ctx;
 	}
+}
+
+static int prepare_contexts(unsigned int id, struct workload *wrk)
+{
+	uint32_t share_vm = 0;
+	struct w_step *w;
+	int i, j;
 
 	/*
 	 * Transfer over engine map configuration from the workload step.
@@ -1964,6 +1963,28 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
 	if (share_vm)
 		vm_destroy(fd, share_vm);
 
+	return 0;
+}
+
+static int prepare_workload(unsigned int id, struct workload *wrk)
+{
+	struct working_set **sets;
+	unsigned long total = 0;
+	struct w_step *w;
+	int i, j;
+	int ret = 0;
+
+	wrk->id = id;
+	wrk->bb_prng = (wrk->flags & FLAG_SYNCEDCLIENTS) ? master_prng : rand();
+	wrk->bo_prng = (wrk->flags & FLAG_SYNCEDCLIENTS) ? master_prng : rand();
+	wrk->run = true;
+
+	allocate_contexts(id, wrk);
+
+	ret = prepare_contexts(id, wrk);
+	if (ret)
+		return ret;
+
 	/* Record default preemption. */
 	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
 		if (w->type == BATCH)
@@ -2065,7 +2086,7 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
 
 	measure_active_set(wrk);
 
-	return 0;
+	return ret;
 }
 
 static double elapsed(const struct timespec *start, const struct timespec *end)
-- 
2.42.0
