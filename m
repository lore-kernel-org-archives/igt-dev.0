Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DCD10F203
 for <igt-dev@lists.freedesktop.org>; Thu, 12 May 2022 07:34:54 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 12 May 2022 13:02:02 +0530
Message-Id: <20220512073202.3348807-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220512061130.3347243-1-bhanuprakash.modem@intel.com>
References: <20220512061130.3347243-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V2] tests/kms_hdr: Fix dynamic subtest name
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

As we are using dynamic subtests, no need to use the same subtest
name in all dynamic subtests.

Example:
   Before: igt@kms_hdr@bpc-switch@bpc-switch-dp-1-pipe-a
   After:  igt@kms_hdr@bpc-switch@dp-1-pipe-a

V2:
* Change test name "<output_name>-<pipe_name>" to "<pipe_name>-<output_name>"

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_hdr.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 247eb658..446490cb 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -251,7 +251,7 @@ static bool has_max_bpc(igt_output_t *output)
 	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
 }
 
-static void test_bpc_switch(data_t *data, const char *test_name, uint32_t flags)
+static void test_bpc_switch(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
@@ -264,10 +264,11 @@ static void test_bpc_switch(data_t *data, const char *test_name, uint32_t flags)
 
 		for_each_pipe(display, pipe) {
 			if (igt_pipe_connector_valid(pipe, output)) {
-				 igt_dynamic_f("%s-%s-pipe-%s",
-					        test_name, output->name, kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s-%s",
+					      kmstest_pipe_name(pipe), output->name)
 					test_bpc_switch_on_output(data, pipe, output, flags);
-			/* One pipe is enough */
+
+				/* One pipe is enough */
 				break;
 			}
 		}
@@ -564,7 +565,7 @@ static bool has_hdr(igt_output_t *output)
 	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
 }
 
-static void test_hdr(data_t *data, const char *test_name, uint32_t flags)
+static void test_hdr(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
@@ -584,14 +585,15 @@ static void test_hdr(data_t *data, const char *test_name, uint32_t flags)
 
 		for_each_pipe(display, pipe) {
 			if (igt_pipe_connector_valid(pipe, output)) {
-				igt_dynamic_f("%s-%s-pipe-%s",
-					      test_name, output->name, kmstest_pipe_name(pipe)) {
+				igt_dynamic_f("pipe-%s-%s",
+					      kmstest_pipe_name(pipe), output->name) {
 					if (flags & TEST_NONE || flags & TEST_DPMS || flags & TEST_SUSPEND)
 						test_static_toggle(data, pipe, output, flags);
 					if (flags & TEST_SWAP)
 						test_static_swap(data, pipe, output);
 				}
-			/* One pipe is enough */
+
+				/* One pipe is enough */
 				break;
 			}
 		}
@@ -615,27 +617,27 @@ igt_main
 
 	igt_describe("Tests switching between different display output bpc modes");
 	igt_subtest_with_dynamic("bpc-switch")
-		test_bpc_switch(&data, "bpc-switch", TEST_NONE);
+		test_bpc_switch(&data, TEST_NONE);
 	igt_describe("Tests bpc switch with dpms");
 	igt_subtest_with_dynamic("bpc-switch-dpms")
-		test_bpc_switch(&data, "bpc-switch-dpms", TEST_DPMS);
+		test_bpc_switch(&data, TEST_DPMS);
 	igt_describe("Tests bpc switch with suspend");
 	igt_subtest_with_dynamic("bpc-switch-suspend")
-		test_bpc_switch(&data, "bpc-switch-suspend", TEST_SUSPEND);
+		test_bpc_switch(&data, TEST_SUSPEND);
 
 	igt_describe("Tests entering and exiting HDR mode");
 	igt_subtest_with_dynamic("static-toggle")
-		test_hdr(&data, "static-toggle", TEST_NONE);
+		test_hdr(&data, TEST_NONE);
 	igt_describe("Tests static toggle with dpms");
 	igt_subtest_with_dynamic("static-toggle-dpms")
-		test_hdr(&data, "static-toggle-dpms", TEST_DPMS);
+		test_hdr(&data, TEST_DPMS);
 	igt_describe("Tests static toggle with suspend");
 	igt_subtest_with_dynamic("static-toggle-suspend")
-		test_hdr(&data, "static-toggle-suspend", TEST_SUSPEND);
+		test_hdr(&data, TEST_SUSPEND);
 
 	igt_describe("Tests swapping static HDR metadata");
 	igt_subtest_with_dynamic("static-swap")
-		test_hdr(&data, "static-swap", TEST_SWAP);
+		test_hdr(&data, TEST_SWAP);
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-- 
2.35.1
