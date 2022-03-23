Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8270D10E290
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Mar 2022 16:24:16 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Mar 2022 21:41:48 +0530
Message-Id: <20220323161148.581529-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_setmode: Limit the execution to
 two display config
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

Restrict the execution of all subtests to two disply config.

If we want to execute on all configs, need to pass an extra
flag "-e" as a command line argument.

Example: ./build/tests/kms_setmode -e --r basic

Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_setmode.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index d5cb45d438..5efb56ad7f 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -41,6 +41,7 @@ static int drm_fd;
 static drmModeRes *drm_resources;
 static int filter_test_id;
 static bool dry_run;
+static bool extended = false;
 
 const drmModeModeInfo mode_640_480 = {
 	.name		= "640x480",
@@ -809,7 +810,11 @@ static void test_combinations(const struct test_config *tconf,
 	struct connector_config *cconfs;
 	int i;
 
-	if (connector_count > 2 && (tconf->flags & TEST_STEALING))
+	igt_info("Testing: %s %d connector combinations\n", tconf->name,
+		 connector_count);
+
+	if (connector_count > 2 &&
+	    ((tconf->flags & TEST_STEALING) || !extended))
 		return;
 
 	igt_assert(tconf->resources);
@@ -827,8 +832,6 @@ static void test_combinations(const struct test_config *tconf,
 	get_combinations(tconf->resources->count_crtcs, connector_count,
 			 true, &crtc_combs);
 
-	igt_info("Testing: %s %d connector combinations\n", tconf->name,
-		 connector_count);
 	for (i = 0; i < connector_combs.count; i++) {
 		int *connector_idxs;
 		int ret;
@@ -878,6 +881,9 @@ static int opt_handler(int opt, int opt_index, void *data)
 	case 'd':
 		dry_run = true;
 		break;
+	case 'e':
+		extended = true;
+		break;
 	case 't':
 		filter_test_id = atoi(optarg);
 		break;
@@ -890,9 +896,10 @@ static int opt_handler(int opt, int opt_index, void *data)
 
 const char *help_str =
 	"  -d\t\tDon't run any test, only print what would be done. (still needs DRM access)\n"
-	"  -t <test id>\tRun only the test with this id.";
+	"  -t <test id>\tRun only the test with this id\n"
+	"  -e \t\tExtend to run on all display configs. (By default it's limited to 2 display config)\n";
 
-igt_main_args("dt:", NULL, help_str, opt_handler, NULL)
+igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 {
 	const struct {
 		enum test_flags flags;
-- 
2.35.1
