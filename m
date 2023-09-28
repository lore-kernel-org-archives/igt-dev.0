Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F8010E42B
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Sep 2023 18:20:06 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 28 Sep 2023 17:45:21 +0000
Message-ID: <20230928174535.2074462-7-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230928174535.2074462-1-marcin.bernatowicz@linux.intel.com>
References: <20230928174535.2074462-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 06/17] benchmarks/gem_wsim: fix conflicting
 SSEU #define and enum
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

One SSEU is in enum w_step and then as #define SSEU (1 << 3).
Fix this.

v2:
- add FLAG_ prefix to all flags (Tvrtko)

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 71d1c55ae..3c25d801c 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -236,9 +236,9 @@ static struct drm_i915_gem_context_param_sseu device_sseu = {
 	.slice_mask = -1 /* Force read on first use. */
 };
 
-#define SYNCEDCLIENTS	(1<<1)
-#define DEPSYNC		(1<<2)
-#define SSEU		(1<<3)
+#define FLAG_SYNCEDCLIENTS	(1<<1)
+#define FLAG_DEPSYNC		(1<<2)
+#define FLAG_SSEU		(1<<3)
 
 static const char *ring_str_map[NUM_ENGINES] = {
 	[DEFAULT] = "DEFAULT",
@@ -1232,7 +1232,7 @@ add_step:
 	wrk->sseu = arg->sseu;
 	wrk->max_working_set_id = -1;
 	wrk->working_sets = NULL;
-	wrk->bo_prng = (flags & SYNCEDCLIENTS) ? master_prng : rand();
+	wrk->bo_prng = (flags & FLAG_SYNCEDCLIENTS) ? master_prng : rand();
 
 	free(desc);
 
@@ -1870,8 +1870,8 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
 	int i, j;
 
 	wrk->id = id;
-	wrk->bb_prng = (wrk->flags & SYNCEDCLIENTS) ? master_prng : rand();
-	wrk->bo_prng = (wrk->flags & SYNCEDCLIENTS) ? master_prng : rand();
+	wrk->bb_prng = (wrk->flags & FLAG_SYNCEDCLIENTS) ? master_prng : rand();
+	wrk->bo_prng = (wrk->flags & FLAG_SYNCEDCLIENTS) ? master_prng : rand();
 	wrk->run = true;
 
 	/*
@@ -2389,7 +2389,7 @@ static void *run_workload(void *data)
 
 			igt_assert(w->type == BATCH);
 
-			if (wrk->flags & DEPSYNC)
+			if (wrk->flags & FLAG_DEPSYNC)
 				sync_deps(wrk, w);
 
 			if (throttle > 0)
@@ -2596,7 +2596,7 @@ int main(int argc, char **argv)
 			/* Fall through */
 		case 'w':
 			w_args = add_workload_arg(w_args, ++nr_w_args, optarg,
-						  prio, flags & SSEU);
+						  prio, flags & FLAG_SSEU);
 			break;
 		case 'p':
 			prio = atoi(optarg);
@@ -2622,13 +2622,13 @@ int main(int argc, char **argv)
 			verbose++;
 			break;
 		case 'S':
-			flags |= SYNCEDCLIENTS;
+			flags |= FLAG_SYNCEDCLIENTS;
 			break;
 		case 's':
-			flags ^= SSEU;
+			flags ^= FLAG_SSEU;
 			break;
 		case 'd':
-			flags |= DEPSYNC;
+			flags |= FLAG_DEPSYNC;
 			break;
 		case 'I':
 			master_prng = strtol(optarg, NULL, 0);
-- 
2.42.0
