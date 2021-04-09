Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDB06E461
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Apr 2021 06:45:19 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Fri,  9 Apr 2021 12:15:25 +0530
Message-Id: <20210409064525.1437661-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_psr: Add subtest description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Gupta@freedesktop.org, Nidhi1 <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Added description for all subtests

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
---
 tests/kms_psr.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/kms_psr.c b/tests/kms_psr.c
index 4b7513d7..a80abf19 100644
--- a/tests/kms_psr.c
+++ b/tests/kms_psr.c
@@ -480,12 +480,14 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
 	for (data.op_psr_mode = PSR_MODE_1; data.op_psr_mode <= PSR_MODE_2;
 	     data.op_psr_mode++) {
 
+		igt_describe("Basic check for psr if it is detecting changes made in planes");
 		igt_subtest_f("%sbasic", append_subtest_name[data.op_psr_mode]) {
 			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 			test_setup(&data);
 			test_cleanup(&data);
 		}
 
+		igt_describe("Check if psr is detecting changes when drrs is disabled");
 		igt_subtest_f("%sno_drrs", append_subtest_name[data.op_psr_mode]) {
 			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 			test_setup(&data);
@@ -494,6 +496,8 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
 		}
 
 		for (op = PAGE_FLIP; op <= RENDER; op++) {
+			igt_describe("Check if psr is detecting page-flipping,memory mapping and "
+					"rendering operations performed on primary planes");
 			igt_subtest_f("%sprimary_%s",
 				      append_subtest_name[data.op_psr_mode],
 				      op_str(op)) {
@@ -506,6 +510,8 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
 		}
 
 		for (op = MMAP_GTT; op <= PLANE_ONOFF; op++) {
+			igt_describe("Check if psr is detecting memory mapping,rendering "
+					"and plane operations performed on sprite planes");
 			igt_subtest_f("%ssprite_%s",
 				      append_subtest_name[data.op_psr_mode],
 				      op_str(op)) {
@@ -516,6 +522,8 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
 				test_cleanup(&data);
 			}
 
+			igt_describe("Check if psr is detecting memory mapping, rendering "
+					"and plane operations performed on cursor planes");
 			igt_subtest_f("%scursor_%s",
 				      append_subtest_name[data.op_psr_mode],
 				      op_str(op)) {
@@ -527,6 +535,8 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
 			}
 		}
 
+		igt_describe("Check if psr is detecting changes when rendering operation is performed"
+				"  with dpms enabled or disabled");
 		igt_subtest_f("%sdpms", append_subtest_name[data.op_psr_mode]) {
 			data.op = RENDER;
 			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
@@ -536,6 +546,8 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
 			test_cleanup(&data);
 		}
 
+		igt_describe("Check if psr is detecting changes when plane operation is performed "
+				"with suspend resume cycles");
 		igt_subtest_f("%ssuspend", append_subtest_name[data.op_psr_mode]) {
 			data.op = PLANE_ONOFF;
 			data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
