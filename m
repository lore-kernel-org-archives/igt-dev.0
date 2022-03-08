Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A3010E400
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Mar 2022 14:23:38 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Mar 2022 19:52:04 +0530
Message-Id: <20220308142205.275928-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20220308142205.275928-1-bhanuprakash.modem@intel.com>
References: <20220308142205.275928-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 i-g-t 2/3] Revert "tests/kms_setmode: Restrict the
 test execution to two pipes"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Initially we restricted the execution to two pipes, since it'll
take lot of time to exectute single subtest. As we are using
dynamic subtests it is ok to run subtests on all pipes.

This reverts commit 8c8499c29dd2aa189c3d687e057ba4df326b1732.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_setmode.c | 35 +++++++++--------------------------
 1 file changed, 9 insertions(+), 26 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index a47d47e5ab..a47070e50c 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -37,14 +37,10 @@
 /* max combinations with repetitions */
 #define MAX_COMBINATION_ELEMS   MAX_CRTCS
 
-/* restricted pipe count */
-#define CRTC_RESTRICT_CNT 2
-
 static int drm_fd;
 static drmModeRes *drm_resources;
 static int filter_test_id;
 static bool dry_run;
-static bool all_pipes = false;
 
 static char str_buf[MAX_CRTCS][1024];
 static const char *crtc_strs[MAX_CRTCS];
@@ -832,14 +828,6 @@ static void get_combinations(int n, int k, bool allow_repetitions,
 	iterate_combinations(n, k, allow_repetitions, 0, 0, &comb, set);
 }
 
-static int get_limit_crtc_count(int count_crtcs, bool all_pipe)
-{
-	if ((count_crtcs <= CRTC_RESTRICT_CNT) || all_pipe)
-		return count_crtcs;
-	else
-		return CRTC_RESTRICT_CNT;
-}
-
 static void test_combinations(const struct test_config *tconf,
 			      int connector_count)
 {
@@ -847,7 +835,6 @@ static void test_combinations(const struct test_config *tconf,
 	struct combination_set crtc_combs;
 	struct connector_config *cconfs;
 	int i;
-	int crtc_count = get_limit_crtc_count(tconf->resources->count_crtcs, all_pipes);
 
 	if (connector_count > 2 && (tconf->flags & TEST_STEALING))
 		return;
@@ -855,19 +842,20 @@ static void test_combinations(const struct test_config *tconf,
 	igt_assert(tconf->resources);
 
 	connector_combs.capacity = pow(tconf->resources->count_connectors,
-				       crtc_count + 1);
-	crtc_combs.capacity = pow(crtc_count,
-				  crtc_count + 1);
+				       tconf->resources->count_crtcs + 1);
+	crtc_combs.capacity = pow(tconf->resources->count_crtcs,
+				  tconf->resources->count_crtcs + 1);
+
 	connector_combs.items = malloc(connector_combs.capacity * sizeof(struct combination));
 	crtc_combs.items = malloc(crtc_combs.capacity * sizeof(struct combination));
 
 	get_combinations(tconf->resources->count_connectors, connector_count,
 			 false, &connector_combs);
-	get_combinations(crtc_count, connector_count, true, &crtc_combs);
+	get_combinations(tconf->resources->count_crtcs, connector_count,
+			 true, &crtc_combs);
 
 	igt_info("Testing: %s %d connector combinations\n", tconf->name,
 		 connector_count);
-
 	for (i = 0; i < connector_combs.count; i++) {
 		int *connector_idxs;
 		int ret;
@@ -905,10 +893,9 @@ free_cconfs:
 static void run_test(const struct test_config *tconf)
 {
 	int connector_num;
-	int crtc_count = get_limit_crtc_count(tconf->resources->count_crtcs, all_pipes);
 
 	connector_num = tconf->flags & TEST_CLONE ? 2 : 1;
-	for (; connector_num <= crtc_count; connector_num++)
+	for (; connector_num <= tconf->resources->count_crtcs; connector_num++)
 		test_combinations(tconf, connector_num);
 }
 
@@ -918,9 +905,6 @@ static int opt_handler(int opt, int opt_index, void *data)
 	case 'd':
 		dry_run = true;
 		break;
-	case 'e':
-		all_pipes = true;
-		break;
 	case 't':
 		filter_test_id = atoi(optarg);
 		break;
@@ -933,10 +917,9 @@ static int opt_handler(int opt, int opt_index, void *data)
 
 const char *help_str =
 	"  -d\t\tDon't run any test, only print what would be done. (still needs DRM access)\n"
-	"  -t <test id>\tRun only the test with this id\n"
-	"  -e \t\tRun on all pipes. (Default it will Run only two pipes)\n";
+	"  -t <test id>\tRun only the test with this id.";
 
-igt_main_args("det:", NULL, help_str, opt_handler, NULL)
+igt_main_args("dt:", NULL, help_str, opt_handler, NULL)
 {
 	const struct {
 		enum test_flags flags;
-- 
2.35.1
