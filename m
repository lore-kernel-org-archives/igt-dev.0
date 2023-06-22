Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895DE10E175
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jun 2023 11:26:48 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Jun 2023 16:46:51 +0530
Message-ID: <20230622111651.9040-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_setmode: Fix dynamic subtests
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

basic-clone-single-crtc and invalid-clone-exclusive-crtc were not
part of dynamic subtest so tests were getting skipped. fixed the
test to execute skipping tests as expected.

v2: add missing call.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_setmode.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index a611d938..96fb0b4b 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -647,20 +647,19 @@ static void test_one_combination(const struct test_config *tconf,
 	struct crtc_config crtcs[MAX_CRTCS];
 	int crtc_count;
 	bool config_valid;
+	int i, pos = 0;
+	char test_name[256];
 
 	setup_crtcs(tconf, cconfs, connector_count, crtcs,
 		    &crtc_count, &config_valid);
 
-	if (config_valid == !(tconf->flags & TEST_INVALID)) {
-		int i, pos = 0;
-		char test_name[256];
-
-		for (i = 0; i < crtc_count; i++) {
-			if (i > 0)
-				pos += snprintf(&test_name[pos], ARRAY_SIZE(test_name) - pos, "-");
-			pos += get_test_name_str(&crtcs[i], &test_name[pos], ARRAY_SIZE(test_name) - pos);
-		}
+	for (i = 0; i < crtc_count; i++) {
+		if (i > 0)
+			pos += snprintf(&test_name[pos], ARRAY_SIZE(test_name) - pos, "-");
+		pos += get_test_name_str(&crtcs[i], &test_name[pos], ARRAY_SIZE(test_name) - pos);
+	}
 
+	if (config_valid == !(tconf->flags & TEST_INVALID)) {
 		for (i = 0; i < crtc_count; i++) {
 			struct crtc_config *crtc = &crtcs[i];
 
@@ -679,16 +678,17 @@ static void test_one_combination(const struct test_config *tconf,
 			    ((i > 0) && (crtc[i - 1].mode.hdisplay > MAX_HDISPLAY_PER_CRTC) &&
 			     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <= 1))) {
 				igt_info("Combo: %s is not possible with selected mode(s).\n", test_name);
-				goto out;
+				cleanup_crtcs(crtcs, crtc_count);
+				return;
 			}
 		}
 
 		igt_dynamic_f("%s", test_name)
 			test_crtc_config(tconf, crtcs, crtc_count);
+	} else {
+		igt_dynamic_f("%s", test_name)
+			cleanup_crtcs(crtcs, crtc_count);
 	}
-
-out:
-	cleanup_crtcs(crtcs, crtc_count);
 }
 
 static int assign_crtc_to_connectors(const struct test_config *tconf,
-- 
2.41.0
