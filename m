Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6342110E0BF
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 06:54:10 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 11:56:40 +0530
Message-Id: <20220922062640.29863-3-karthik.b.s@intel.com>
In-Reply-To: <20220922062640.29863-1-karthik.b.s@intel.com>
References: <20220922062640.29863-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 2/2] tests/kms_content_protection:
 Convert test to dynamic
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

Covert the existing subtests to dynamic subtests at pipe/output level.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_content_protection.c | 220 +++++++++++++++++++--------------
 1 file changed, 126 insertions(+), 94 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 54288701..1bfa5ada 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -487,12 +487,17 @@ test_content_protection(enum igt_commit_style s, int content_type)
 {
 	igt_display_t *display = &data.display;
 	igt_output_t *output;
-	int valid_tests = 0;
+	enum pipe pipe;
 
 	if (data.cp_tests & CP_MEI_RELOAD)
 		igt_require_f(igt_kmod_is_loaded("mei_hdcp"),
 			      "mei_hdcp module is not loaded\n");
 
+	if (data.cp_tests & CP_UEVENT) {
+		data.uevent_monitor = igt_watch_uevents();
+		igt_flush_uevents(data.uevent_monitor);
+	}
+
 	for_each_connected_output(display, output) {
 		for_each_pipe(display, pipe) {
 			if (!igt_pipe_connector_valid(pipe, output))
@@ -504,9 +509,10 @@ test_content_protection(enum igt_commit_style s, int content_type)
 			if (!output_hdcp_capable(output, content_type))
 				continue;
 
-			test_content_protection_on_output(output, pipe, s, content_type);
-			test_fini(output, s);
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
+				test_content_protection_on_output(output, pipe, s, content_type);
 
+			test_fini(output, s);
 			/*
 			 * Testing a output with a pipe is enough for HDCP
 			 * testing. No ROI in testing the connector with other
@@ -514,11 +520,10 @@ test_content_protection(enum igt_commit_style s, int content_type)
 			 */
 			break;
 		}
-
-		valid_tests++;
 	}
 
-	igt_require_f(valid_tests, "No connector found with HDCP capability\n");
+	if (data.cp_tests & CP_UEVENT)
+		igt_cleanup_uevents(data.uevent_monitor);
 }
 
 static int parse_path_blob(char *blob_data)
@@ -728,6 +733,94 @@ static void create_fbs(void)
 			    0.f, 1.f, 0.f, &data.green);
 }
 
+static const struct {
+	const char *desc;
+	const char *name;
+	unsigned int cp_tests;
+	bool content_type;
+} subtests[] = {
+	{ .desc = "Test content protection with atomic modesetting",
+	  .name = "atomic",
+	  .cp_tests = 0,
+	  .content_type = HDCP_CONTENT_TYPE_0
+	},
+	{ .desc = "Test content protection with DPMS ON/OFF during atomic modesetting.",
+	  .name = "atomic-dpms",
+	  .cp_tests = CP_DPMS,
+	  .content_type = HDCP_CONTENT_TYPE_0
+	},
+	{ .desc = "Test for the integrity of link.",
+	  .name = "LIC",
+	  .cp_tests = CP_LIC,
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	},
+	{ .desc = "Test content protection with content type 1 "
+		  "that can be handled only through HDCP2.2.",
+	  .name = "type1",
+	  .cp_tests = 0,
+	  .content_type = HDCP_CONTENT_TYPE_1,
+	},
+	{ .desc = "Test the teardown and rebuild of the interface between "
+		  "I915 and mei hdcp.",
+	  .name = "mei_interface",
+	  .cp_tests = CP_MEI_RELOAD,
+	  .content_type = HDCP_CONTENT_TYPE_1,
+	},
+	{ .desc = "Test the content type change when the content protection already enabled",
+	  .name = "content_type_change",
+	  .cp_tests = CP_TYPE_CHANGE,
+	  .content_type = HDCP_CONTENT_TYPE_1,
+	},
+	{ .desc = "Test to detect the HDCP status change when we are reading the uevent "
+		  "sent with the corresponding connector id and property id.",
+	  .name = "uevent",
+	  .cp_tests = CP_UEVENT,
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	},
+	/*
+	 *  Testing the revocation check through SRM needs a HDCP sink with
+	 *  programmable Ksvs or we need a uAPI from kernel to read the
+	 *  connected HDCP sink's Ksv. With that we would be able to add that
+	 *  Ksv into a SRM and send in for revocation check. Since we dont have
+	 *  either of these options, we test SRM writing from userspace and
+	 *  validation of the same at kernel. Something is better than nothing.
+	 */
+	{ .desc = "This test writes the facsimile SRM into the /lib/firmware/ "
+		  "and check the kernel parsing of it by invoking the hdcp authentication.",
+	  .name = "srm",
+	  .cp_tests = 0,
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	},
+};
+
+static const struct {
+	const char *desc;
+	const char *name;
+	unsigned int cp_tests;
+	bool content_type;
+} mst_subtests[] = {
+	{ .desc = "Test Content protection(Type 0) over DP MST.",
+	  .name = "dp-mst-type-0",
+	  .cp_tests = 0,
+	  .content_type = HDCP_CONTENT_TYPE_0
+	},
+	{ .desc = "Test Content protection(Type 0) over DP MST with LIC.",
+	  .name = "dp-mst-lic-type-0",
+	  .cp_tests = CP_LIC,
+	  .content_type = HDCP_CONTENT_TYPE_0
+	},
+	{ .desc = "Test Content protection(Type 1) over DP MST.",
+	  .name = "dp-mst-type-1",
+	  .cp_tests = 0,
+	  .content_type = HDCP_CONTENT_TYPE_1,
+	},
+	{ .desc = "Test Content protection(Type 1) over DP MST with LIC.",
+	  .name = "dp-mst-lic-type-1",
+	  .cp_tests = CP_LIC,
+	  .content_type = HDCP_CONTENT_TYPE_1,
+	},
+};
+
 igt_main
 {
 	igt_fixture {
@@ -738,107 +831,46 @@ igt_main
 	}
 
 	igt_describe("Test content protection with legacy style commit.");
-	igt_subtest("legacy") {
+	igt_subtest_with_dynamic("legacy") {
 		data.cp_tests = 0;
 		test_content_protection(COMMIT_LEGACY, HDCP_CONTENT_TYPE_0);
 	}
 
-	igt_describe("Test content protection with atomic modesetting");
-	igt_subtest("atomic") {
-		igt_require(data.display.is_atomic);
-		data.cp_tests = 0;
-		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
-	}
+	igt_subtest_group {
+		igt_fixture
+			igt_require(data.display.is_atomic);
 
-	igt_describe("Test content protection with DPMS ON/OFF during atomic modesetting.");
-	igt_subtest("atomic-dpms") {
-		igt_require(data.display.is_atomic);
-		data.cp_tests = CP_DPMS;
-		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
-	}
+		for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
+			igt_describe_f("%s", subtests[i].desc);
 
-	igt_describe("Test for the integrity of link.");
-	igt_subtest("LIC") {
-		igt_require(data.display.is_atomic);
-		data.cp_tests = CP_LIC;
-		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
-	}
+			igt_subtest_with_dynamic(subtests[i].name) {
+				data.cp_tests = subtests[i].cp_tests;
 
-	igt_describe("Test content protection with content type 1 that "
-		     "can be handled only through HDCP2.2.");
-	igt_subtest("type1") {
-		igt_require(data.display.is_atomic);
-		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);
-	}
+				if (!strcmp(subtests[i].name, "srm")) {
+					bool ret;
 
-	igt_describe("Test the teardown and rebuild of the interface between "
-		     "I915 and mei hdcp.");
-	igt_subtest("mei_interface") {
-		igt_require(data.display.is_atomic);
-		data.cp_tests = CP_MEI_RELOAD;
-		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);
-	}
+					ret = write_srm_as_fw((const __u8 *)facsimile_srm,
+							     sizeof(facsimile_srm));
+					igt_assert_f(ret, "SRM update failed");
+				}
 
-	igt_describe("Test the content type change when the content protection already "
-		     "enabled.");
-	igt_subtest("content_type_change") {
-		igt_require(data.display.is_atomic);
-		data.cp_tests = CP_TYPE_CHANGE;
-		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);
-	}
-
-	igt_describe("Test to detect the HDCP status change when we are reading the uevent "
-		     "sent with the corresponding connector id and property id.");
-	igt_subtest("uevent") {
-		igt_require(data.display.is_atomic);
-		data.cp_tests = CP_UEVENT;
-		data.uevent_monitor = igt_watch_uevents();
-		igt_flush_uevents(data.uevent_monitor);
-		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
-		igt_cleanup_uevents(data.uevent_monitor);
-	}
-
-	/*
-	 *  Testing the revocation check through SRM needs a HDCP sink with
-	 *  programmable Ksvs or we need a uAPI from kernel to read the
-	 *  connected HDCP sink's Ksv. With that we would be able to add that
-	 *  Ksv into a SRM and send in for revocation check. Since we dont have
-	 *  either of these options, we test SRM writing from userspace and
-	 *  validation of the same at kernel. Something is better than nothing.
-	 */
-	igt_describe("This test writes the facsimile SRM into the /lib/firmware/ "
-		     "and check the kernel parsing of it by invoking the hdcp authentication.");
-	igt_subtest("srm") {
-		bool ret;
-
-		igt_require(data.display.is_atomic);
-		data.cp_tests = 0;
-		ret = write_srm_as_fw((const __u8 *)facsimile_srm,
-				      sizeof(facsimile_srm));
-		igt_assert_f(ret, "SRM update failed");
-		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
-	}
-
-	igt_describe("Test Content protection over DP MST");
-	igt_subtest("dp-mst-type-0") {
-		test_content_protection_mst(HDCP_CONTENT_TYPE_0);
+				test_content_protection(COMMIT_ATOMIC, subtests[i].content_type);
+			}
+		}
 	}
 
-	igt_describe("Test Content protection over DP MST with LIC");
-	igt_subtest("dp-mst-lic-type-0") {
-		data.cp_tests = CP_LIC;
-		test_content_protection_mst(HDCP_CONTENT_TYPE_0);
-	}
+	igt_subtest_group {
+		igt_fixture
+			igt_require(data.display.is_atomic);
 
-	igt_describe("Test Content protection over DP MST");
-	igt_subtest("dp-mst-type-1") {
-		test_content_protection_mst(HDCP_CONTENT_TYPE_1);
-	}
+		for (int i = 0; i < ARRAY_SIZE(mst_subtests); i++) {
+			igt_describe_f("%s", mst_subtests[i].desc);
 
-	igt_describe("Test Content protection over DP MST with LIC");
-	igt_subtest("dp-mst-lic-type-1") {
-		data.cp_tests = CP_LIC;
-		test_content_protection_mst(HDCP_CONTENT_TYPE_1);
+			igt_subtest(mst_subtests[i].name) {
+				data.cp_tests = mst_subtests[i].cp_tests;
+				test_content_protection_mst(mst_subtests[i].content_type);
+			}
+		}
 	}
 
 	igt_fixture {
-- 
2.22.0
