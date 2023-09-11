Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53BC10E200
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Sep 2023 09:35:46 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 11 Sep 2023 14:57:31 +0530
Message-Id: <20230911092731.1962039-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/intel/kms_fbt: Convert basic test to dynamic
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

Convert basic test to dynamic to cover all tiling methods.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 40b3d4cb5..059d43519 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -5532,10 +5532,19 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	t.format = FORMAT_DEFAULT;
 	t.flip = FLIP_PAGEFLIP;
 	t.tiling = opt.tiling;
-	igt_subtest("basic") {
+	igt_subtest_with_dynamic("basic") {
 		if (!is_xe_device(drm.fd))
 			igt_require_gem(drm.fd);
-		basic_subtest(&t);
+
+		if (t.tiling != TILING_DEFAULT) {
+			igt_dynamic_f("%s", tiling_str(t.tiling))
+				basic_subtest(&t);
+		} else {
+			for (t.tiling = TILING_LINEAR; t.tiling < TILING_COUNT; t.tiling++) {
+				igt_dynamic_f("%s", tiling_str(t.tiling))
+					basic_subtest(&t);
+			}
+		}
 	}
 
 	igt_fixture
-- 
2.40.0
