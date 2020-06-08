Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6706E2F0
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2020 10:18:34 +0000 (UTC)
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date: Mon,  8 Jun 2020 15:43:33 +0530
Message-Id: <20200608101334.19684-2-ankit.k.nautiyal@intel.com>
In-Reply-To: <20200608101334.19684-1-ankit.k.nautiyal@intel.com>
References: <20200608101334.19684-1-ankit.k.nautiyal@intel.com>
Subject: [igt-dev] [Patch][i-g-t v2 1/2] tests/kms_content_protection:
 Bifurcate tests into HDCP1.4 & 2.2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, petri.latvala@intel.com, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Currently, the test kms_content_protection does not distinguish
between HDCP1.4 and HDCP2.2 tests. Since the driver by default
always chooses HDCP2.2 protocol if the panel supports HDCP1.4 &
HDCP2.2, HDCP1.4 does not get tested.

This patch makes two versions of the existing subtests for testing
HDCP1.4 and HDCP2.2. For making sure that the required HDCP version
is chosen by the kernel, the test utilizes the debugfs
'i915_hdcp_version_request' for each HDCP supporting connector.
The desired HDCP version is written via the debugfs and is considered
by the kernel, if the platform and the panel support that
HDCP version.

This patch also makes the existing subtests as dynamic sub-subtests
based on all outputs supporting the protocol under test.

v2: Avoid re-opening and closing of debugfs and remove unnecessary
variables (Ramalingam)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_content_protection.c | 225 ++++++++++++++++++++++-----------
 1 file changed, 153 insertions(+), 72 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 3b9cedcb..1c34069e 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -59,6 +59,9 @@ struct data {
 #define HDCP_CONTENT_TYPE_0				0
 #define HDCP_CONTENT_TYPE_1				1
 
+#define HDCP_14						1
+#define HDCP_22						2
+
 #define LIC_PERIOD_MSEC				(4 * 1000)
 /* Kernel retry count=3, Max time per authentication allowed = 6Sec */
 #define KERNEL_AUTH_TIME_ALLOWED_MSEC		(3 *  6 * 1000)
@@ -593,44 +596,6 @@ static bool sink_hdcp2_capable(igt_output_t *output)
 	return strstr(buf, "HDCP2.2");
 }
 
-static void
-test_content_protection(enum igt_commit_style s, int content_type)
-{
-	igt_display_t *display = &data.display;
-	igt_output_t *output;
-	int valid_tests = 0;
-
-	if (data.cp_tests & CP_MEI_RELOAD)
-		igt_require_f(igt_kmod_is_loaded("mei_hdcp"),
-			      "mei_hdcp module is not loaded\n");
-
-	for_each_connected_output(display, output) {
-		if (!output->props[IGT_CONNECTOR_CONTENT_PROTECTION])
-			continue;
-
-		if (!output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE] &&
-		    content_type)
-			continue;
-
-		igt_info("CP Test execution on %s\n", output->name);
-
-		if (content_type && !sink_hdcp2_capable(output)) {
-			igt_info("\tSkip %s (Sink has no HDCP2.2 support)\n",
-				 output->name);
-			continue;
-		} else if (!sink_hdcp_capable(output)) {
-			igt_info("\tSkip %s (Sink has no HDCP support)\n",
-				 output->name);
-			continue;
-		}
-
-		test_content_protection_on_output(output, s, content_type);
-		valid_tests++;
-	}
-
-	igt_require_f(valid_tests, "No connector found with HDCP capability\n");
-}
-
 static void test_content_protection_cleanup(void)
 {
 	igt_display_t *display = &data.display;
@@ -651,58 +616,63 @@ static void test_content_protection_cleanup(void)
 	}
 }
 
-igt_main
-{
-	igt_fixture {
-		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+static bool
+is_valid_output(igt_output_t *output, int content_type) {
+	if (!output->props[IGT_CONNECTOR_CONTENT_PROTECTION])
+		return false;
 
-		igt_display_require(&data.display, data.drm_fd);
+	if (!output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE] && content_type)
+		return false;
+
+	if (content_type && !sink_hdcp2_capable(output)) {
+		igt_info("\tSkip %s (Sink has no HDCP2.2 support)\n",
+			 output->name);
+		return false;
+
+	} else if (!sink_hdcp_capable(output)) {
+		igt_info("\tSkip %s (Sink has no HDCP support)\n",
+			 output->name);
+		return false;
 	}
+	return true;
+}
+
+static void
+test_content_protection_dynamic(igt_output_t *output, int content_type)
+{
 
-	igt_subtest("legacy") {
+	igt_dynamic_f("legacy-%s", output->name) {
 		data.cp_tests = 0;
-		test_content_protection(COMMIT_LEGACY, HDCP_CONTENT_TYPE_0);
+		test_content_protection_on_output(output, COMMIT_LEGACY,
+						  content_type);
 	}
 
-	igt_subtest("atomic") {
+	igt_dynamic_f("atomic-%s", output->name) {
 		igt_require(data.display.is_atomic);
 		data.cp_tests = 0;
-		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
+		test_content_protection_on_output(output, COMMIT_ATOMIC,
+						  content_type);
 	}
 
-	igt_subtest("atomic-dpms") {
+	igt_dynamic_f("atomic-dpms-%s", output->name) {
 		igt_require(data.display.is_atomic);
 		data.cp_tests = CP_DPMS;
-		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
+		test_content_protection_on_output(output, COMMIT_ATOMIC,
+						  content_type);
 	}
 
-	igt_subtest("LIC") {
+	igt_dynamic_f("LIC-%s", output->name) {
 		igt_require(data.display.is_atomic);
 		data.cp_tests = CP_LIC;
-		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
-	}
-
-	igt_subtest("type1") {
-		igt_require(data.display.is_atomic);
-		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);
-	}
-
-	igt_subtest("mei_interface") {
-		igt_require(data.display.is_atomic);
-		data.cp_tests = CP_MEI_RELOAD;
-		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);
-	}
-
-	igt_subtest("content_type_change") {
-		igt_require(data.display.is_atomic);
-		data.cp_tests = CP_TYPE_CHANGE;
-		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);
+		test_content_protection_on_output(output, COMMIT_ATOMIC,
+						  content_type);
 	}
 
-	igt_subtest("uevent") {
+	igt_dynamic_f("uevent-%s", output->name) {
 		igt_require(data.display.is_atomic);
 		data.cp_tests = CP_UEVENT;
-		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
+		test_content_protection_on_output(output, COMMIT_ATOMIC,
+						  content_type);
 	}
 
 	/*
@@ -713,7 +683,7 @@ igt_main
 	 *  either of these options, we test SRM writing from userspace and
 	 *  validation of the same at kernel. Something is better than nothing.
 	 */
-	igt_subtest("srm") {
+	igt_dynamic_f("srm-%s", output->name) {
 		bool ret;
 
 		igt_require(data.display.is_atomic);
@@ -721,7 +691,118 @@ igt_main
 		ret = write_srm_as_fw((const __u8 *)facsimile_srm,
 				      sizeof(facsimile_srm));
 		igt_assert_f(ret, "SRM update failed");
-		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
+		test_content_protection_on_output(output, COMMIT_ATOMIC,
+						  content_type);
+	}
+
+	/*
+	 * The tests mei_interface and content_type_change are meant only
+	 * for HDCP2.2 protocol, hence ignore for HDCP1.4.
+	 */
+	if (content_type != HDCP_CONTENT_TYPE_1)
+		return;
+
+	igt_dynamic_f("mei_interface-%s", output->name) {
+		igt_require(data.display.is_atomic);
+		data.cp_tests = CP_MEI_RELOAD;
+		test_content_protection_on_output(output, COMMIT_ATOMIC,
+						  content_type);
+	}
+
+	igt_dynamic_f("content_type_change-%s", output->name) {
+		igt_require(data.display.is_atomic);
+		data.cp_tests = CP_TYPE_CHANGE;
+		test_content_protection_on_output(output, COMMIT_ATOMIC,
+						  content_type);
+	}
+}
+
+static int request_hdcp_ver(igt_output_t *output, unsigned int hdcp_ver)
+{
+	char wrbuf[32] = {'0'};
+	char rdbuf[32] = {'0'};
+	char filename[128] = {'0'};
+	char *read_ver_str;
+	int fd, ret = -1;
+	unsigned int rd_ver;
+
+	fd = igt_debugfs_dir(data.drm_fd);
+
+	if (fd < 0) {
+		igt_info("Failed to open debugfs dir ret = %d\n", errno);
+		return errno;
+	}
+
+	strcpy(filename, output->name);
+	strcat(filename, "/i915_hdcp_version_request");
+
+	debugfs_read(fd, filename, rdbuf);
+	igt_debug("%s\n", rdbuf);
+
+	read_ver_str = strstr(rdbuf, "HDCP_VER_FLAGS: ");
+	if (!read_ver_str)
+		goto req_pass;
+
+	igt_debug("HDCP ver = %s\n", read_ver_str + strlen("HDCP_VER_FLAGS: "));
+
+	rd_ver = atoi(read_ver_str + strlen("HDCP_VER_FLAGS: "));
+	if (rd_ver == hdcp_ver)
+		goto req_pass;
+
+	snprintf(wrbuf, sizeof(wrbuf), "%d", hdcp_ver);
+	ret = igt_sysfs_write(fd, filename, wrbuf, 1);
+	if (ret <= 0) {
+		igt_info("Failed to write into debugfs ret = %d\n", ret);
+		goto req_fail;
+	}
+
+req_pass:
+	close(fd);
+	return 0;
+req_fail:
+	close(fd);
+	return ret;
+}
+
+igt_main
+{
+	int i;
+	struct cp_protocol {
+		const char *name;
+		int content_type;
+		unsigned int version;
+	} hdcp_protocol[] = {
+		{ "hdcp-1_4", HDCP_CONTENT_TYPE_0, HDCP_14},
+		{ "hdcp-2_2", HDCP_CONTENT_TYPE_1, HDCP_22} };
+
+	igt_fixture {
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+
+		igt_display_require(&data.display, data.drm_fd);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(hdcp_protocol); i++) {
+		igt_subtest_with_dynamic_f("%s", hdcp_protocol[i].name) {
+			igt_output_t *output;
+			int content_type = hdcp_protocol[i].content_type;
+
+			for_each_connected_output(&data.display, output) {
+				int ret;
+
+				if (!is_valid_output(output, content_type))
+					continue;
+				ret = request_hdcp_ver(output,
+						       hdcp_protocol[i].version);
+				if (ret) {
+					igt_info("Cannot set the required version for %s\n",
+						 output->name);
+					continue;
+				}
+				test_content_protection_dynamic(output,
+								content_type);
+
+			}
+		}
 	}
 
 	igt_fixture {
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
