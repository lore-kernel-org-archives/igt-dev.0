Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695E710E770
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Mar 2022 06:56:34 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Mar 2022 12:24:56 +0530
Message-Id: <20220324065456.590145-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220323072223.566016-1-bhanuprakash.modem@intel.com>
References: <20220323072223.566016-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V2] tests/kms_setmode: Limit the execution to two pipes
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

Restrict the execution of all subtests to two pipes to optimize
the CI execution time.

If we want to execute on all pipes, need to pass an extra flag
"-e" as a command line argument.

Example: ./build/tests/kms_setmode -e --r basic

V2:
* Remove simulation check, as we need this change on real h/w too
* Update commit message

Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_setmode.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index d5cb45d438..912352f140 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -37,10 +37,14 @@
 /* max combinations with repetitions */
 #define MAX_COMBINATION_ELEMS   MAX_CRTCS
 
+/* restricted pipe count */
+#define CRTC_RESTRICT_CNT 2
+
 static int drm_fd;
 static drmModeRes *drm_resources;
 static int filter_test_id;
 static bool dry_run;
+static bool extended = false;
 
 const drmModeModeInfo mode_640_480 = {
 	.name		= "640x480",
@@ -801,6 +805,14 @@ static void get_combinations(int n, int k, bool allow_repetitions,
 	iterate_combinations(n, k, allow_repetitions, 0, 0, &comb, set);
 }
 
+static int get_crtc_count(int count_crtcs, bool extend)
+{
+	if ((count_crtcs <= CRTC_RESTRICT_CNT) || extend)
+		return count_crtcs;
+	else
+		return CRTC_RESTRICT_CNT;
+}
+
 static void test_combinations(const struct test_config *tconf,
 			      int connector_count)
 {
@@ -808,6 +820,7 @@ static void test_combinations(const struct test_config *tconf,
 	struct combination_set crtc_combs;
 	struct connector_config *cconfs;
 	int i;
+	int crtc_count = get_crtc_count(tconf->resources->count_crtcs, extended);
 
 	if (connector_count > 2 && (tconf->flags & TEST_STEALING))
 		return;
@@ -815,17 +828,15 @@ static void test_combinations(const struct test_config *tconf,
 	igt_assert(tconf->resources);
 
 	connector_combs.capacity = pow(tconf->resources->count_connectors,
-				       tconf->resources->count_crtcs + 1);
-	crtc_combs.capacity = pow(tconf->resources->count_crtcs,
-				  tconf->resources->count_crtcs + 1);
-
+				       crtc_count + 1);
+	crtc_combs.capacity = pow(crtc_count,
+				  crtc_count + 1);
 	connector_combs.items = malloc(connector_combs.capacity * sizeof(struct combination));
 	crtc_combs.items = malloc(crtc_combs.capacity * sizeof(struct combination));
 
 	get_combinations(tconf->resources->count_connectors, connector_count,
 			 false, &connector_combs);
-	get_combinations(tconf->resources->count_crtcs, connector_count,
-			 true, &crtc_combs);
+	get_combinations(crtc_count, connector_count, true, &crtc_combs);
 
 	igt_info("Testing: %s %d connector combinations\n", tconf->name,
 		 connector_count);
@@ -866,9 +877,10 @@ free_cconfs:
 static void run_test(const struct test_config *tconf)
 {
 	int connector_num;
+	int crtc_count = get_crtc_count(tconf->resources->count_crtcs, extended);
 
 	connector_num = tconf->flags & TEST_CLONE ? 2 : 1;
-	for (; connector_num <= tconf->resources->count_crtcs; connector_num++)
+	for (; connector_num <= crtc_count; connector_num++)
 		test_combinations(tconf, connector_num);
 }
 
@@ -878,6 +890,9 @@ static int opt_handler(int opt, int opt_index, void *data)
 	case 'd':
 		dry_run = true;
 		break;
+	case 'e':
+		extended = true;
+		break;
 	case 't':
 		filter_test_id = atoi(optarg);
 		break;
@@ -890,9 +905,10 @@ static int opt_handler(int opt, int opt_index, void *data)
 
 const char *help_str =
 	"  -d\t\tDon't run any test, only print what would be done. (still needs DRM access)\n"
-	"  -t <test id>\tRun only the test with this id.";
+	"  -t <test id>\tRun only the test with this id\n"
+	"  -e \t\tExtend to run on all pipes. (By default tests will run on two pipes only)\n";
 
-igt_main_args("dt:", NULL, help_str, opt_handler, NULL)
+igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 {
 	const struct {
 		enum test_flags flags;
-- 
2.35.1
