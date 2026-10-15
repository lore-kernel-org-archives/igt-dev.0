Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB05CC6B34
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 06:27:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5101120C7;
	Thu, 15 Oct 2026 06:27:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0935E10EB96
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 06:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792045481; x=1823581481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x/36dBn12L8ZAp4dc0nydpuI5xoZ3JOeDUzrBMEtDUU=;
 b=UNkHJuquXBl0EWjMt8asYV3ZO0BVxtSbHph71hrL9HQseXmfQeSYof7e
 M7rtmGQT3G+0opXbfxg5Wn1cWwapvsYCSw5Rf27pfw0U/G7hO0JkIijzU
 oqMWU+CymBTj6f+ClYk1WGB+br87mx1evtlnfcGwBw6nvjhQU903ysjFV
 UNOAIh4HWz3ptFXROK1H0cRnrEmeBDUykD0ufbPQntdbe4rrpI1DVxyxA
 lvfK5F14zXeNsvp4LJRUCCstmyAWZ8BgFn5LBcm/u0kA+hViOvexOGPCJ
 zC6VY7s8+nyFYKpcBDL/Ms8pxch2ZamWI8T56ybPlIAvCXguG8rwBIOP4 A==;
X-CSE-ConnectionGUID: loPMJBfQSL+jdSH0WFsa+g==
X-CSE-MsgGUID: 1TpdUllMSGuA5QUvd/RJMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="680122"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="680122"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 23:24:40 -0700
X-CSE-ConnectionGUID: +ei6L3hwTdWG2ntj/FgA+A==
X-CSE-MsgGUID: VwP/muWKTfS9TY5AlQnbjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1582598"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 23:24:38 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/kms_content_protection: use shared
 igt_hdcp library
Date: Thu, 15 Oct 2026 11:54:05 +0530
Message-ID: <20261015062411.268693-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015062411.268693-1-sowmiya.s@intel.com>
References: <20261015062411.268693-1-sowmiya.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Replace the duplicated single-output/DP-MST HDCP helpers (enable,
disable, LIC wait, sink capability, force-HDCP1.4, output
capability/exemption discovery) with calls into the new igt_hdcp
library. Retry orchestration, FB/plane handling, SRM firmware writing,
and subtest policy remain in the test; only the HDCP mechanism moves
to the shared library.

The Link Integrity Check and MST-disable helpers preserve each call
site's original strictness: igt_hdcp_check_lic() takes a retry_once
flag and reports which output failed so the assert message names the
right connector, and test_mst_cp_disable() keeps a single immediate
read on secondary outputs instead of polling them.

Uevent-based waiting (only used by the uevent/uevent-hdcp14 subtests)
stays local as wait_for_prop_value(), keeping its original name,
falling back to the shared igt_hdcp_wait_for_prop_value() for the
plain-poll case used by every other subtest.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_content_protection.c | 444 +++++++--------------------------
 1 file changed, 95 insertions(+), 349 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index d931ce768..64f167b3a 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -33,14 +33,11 @@
 #include <poll.h>
 #include <fcntl.h>
 #include <sys/epoll.h>
-#include <sys/stat.h>
 #include <libudev.h>
 #include "igt.h"
-#include "igt_edid.h"
-#include "igt_sysfs.h"
 #include "igt_kms.h"
 #include "igt_kmod.h"
-#include "igt_panel.h"
+#include "igt_hdcp.h"
 
 /**
  * SUBTEST: lic-type-0
@@ -124,23 +121,8 @@ struct data {
 #define CP_UEVENT				(1 << 4)
 #define SUSPEND_RESUME				(1 << 5)
 
-#define CP_UNDESIRED				0
-#define CP_DESIRED				1
-#define CP_ENABLED				2
 #define MAX_HDCP_OUTPUTS			10
 
-/*
- * HDCP_CONTENT_TYPE_0 can be handled on both HDCP1.4 and HDCP2.2. Where as
- * HDCP_CONTENT_TYPE_1 can be handled only through HDCP2.2.
- */
-#define HDCP_CONTENT_TYPE_0				0
-#define HDCP_CONTENT_TYPE_1				1
-
-#define LIC_PERIOD_MSEC				(4 * 1000)
-/* Kernel retry count=3, Max time per authentication allowed = 6Sec */
-#define KERNEL_AUTH_TIME_ALLOWED_MSEC		(3 *  6 * 1000)
-#define KERNEL_AUTH_TIME_ADDITIONAL_MSEC	100
-#define KERNEL_DISABLE_TIME_ALLOWED_MSEC	(1 * 1000)
 #define FLIP_EVENT_POLLING_TIMEOUT_MSEC		1000
 
 __u8 facsimile_srm[] = {
@@ -205,35 +187,30 @@ static int wait_flip_event(void)
 	return rc;
 }
 
-static bool
-wait_for_prop_value(igt_output_t *output, uint64_t expected,
-		    uint32_t timeout_mSec)
+/*
+ * uevent-based waiting is only exercised by the uevent/uevent-hdcp14
+ * subtests of this file, so it stays local here rather than in the shared
+ * igt_hdcp library - every other caller just polls via
+ * igt_hdcp_wait_for_prop_value().
+ */
+static bool wait_for_prop_value(igt_output_t *output, uint64_t expected,
+				uint32_t timeout_mSec)
 {
 	uint64_t val;
-	int i;
 
-	if (data.cp_tests & CP_UEVENT && expected != CP_UNDESIRED) {
-		igt_assert_f(igt_connector_event_detected(data.uevent_monitor,
-							  output->id,
+	if (!((data.cp_tests & CP_UEVENT) && expected != IGT_HDCP_UNDESIRED))
+		return igt_hdcp_wait_for_prop_value(output, expected, timeout_mSec);
+
+	igt_assert_f(igt_connector_event_detected(data.uevent_monitor,
+						  output->id,
 			     output->props[IGT_CONNECTOR_CONTENT_PROTECTION],
 			     timeout_mSec / 1000), "uevent is not received");
 
-		val = igt_output_get_prop(output,
-					  IGT_CONNECTOR_CONTENT_PROTECTION);
-		if (val == expected)
-			return true;
-	} else {
-		for (i = 0; i < timeout_mSec; i++) {
-			val = igt_output_get_prop(output,
-						  IGT_CONNECTOR_CONTENT_PROTECTION);
-			if (val == expected)
-				return true;
-			usleep(1000);
-		}
-	}
+	val = igt_output_get_prop(output, IGT_CONNECTOR_CONTENT_PROTECTION);
+	if (val == expected)
+		return true;
 
-	igt_info("prop_value mismatch %" PRId64 " != %" PRId64 "\n",
-		 val, expected);
+	igt_info("prop_value mismatch %" PRId64 " != %" PRId64 "\n", val, expected);
 
 	return false;
 }
@@ -296,19 +273,12 @@ static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_st
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
-	if (!type_change)
-		igt_output_set_prop_value(output,
-					  IGT_CONNECTOR_CONTENT_PROTECTION,
-					  CP_DESIRED);
-
-	if (output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE])
-		igt_output_set_prop_value(output,
-					  IGT_CONNECTOR_HDCP_CONTENT_TYPE,
-					  content_type);
+	igt_hdcp_set_content_protection_desired(output, content_type,
+						type_change);
 	igt_display_commit2(display, commit_style);
 
-	ret = wait_for_prop_value(output, CP_ENABLED,
-				  KERNEL_AUTH_TIME_ALLOWED_MSEC);
+	ret = wait_for_prop_value(output, IGT_HDCP_ENABLED,
+				  IGT_HDCP_KERNEL_AUTH_TIME_ALLOWED_MSEC);
 	if (ret) {
 		mode = igt_output_get_mode(output);
 		width = mode->hdisplay;
@@ -332,7 +302,7 @@ static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[],
 	int width, height;
 	bool ret;
 	int count;
-	u64 val;
+	uint64_t val;
 
 	for (count = 0; count < valid_outputs; count++) {
 		primary = igt_output_get_plane_type(hdcp_mst_output[count], DRM_PLANE_TYPE_PRIMARY);
@@ -342,18 +312,17 @@ static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[],
 		igt_plane_set_fb(primary, &data.red);
 		igt_fb_set_size(&data.red, primary, width, height);
 		igt_plane_set_size(primary, width, height);
-		igt_output_set_prop_value(hdcp_mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION,
-					  CP_UNDESIRED);
+		igt_hdcp_set_content_protection_undesired(hdcp_mst_output[count]);
 	}
 
 	igt_display_commit2(display, commit_style);
 
-	ret = wait_for_prop_value(hdcp_mst_output[0], CP_UNDESIRED,
-				  KERNEL_DISABLE_TIME_ALLOWED_MSEC);
+	ret = wait_for_prop_value(hdcp_mst_output[0], IGT_HDCP_UNDESIRED,
+				  IGT_HDCP_KERNEL_DISABLE_TIME_ALLOWED_MSEC);
 	for (count = 1; count < valid_outputs; count++) {
 		val = igt_output_get_prop(hdcp_mst_output[count],
 					  IGT_CONNECTOR_CONTENT_PROTECTION);
-		ret &= (val == CP_UNDESIRED);
+		ret &= (val == IGT_HDCP_UNDESIRED);
 	}
 
 	igt_assert_f(ret, "Content Protection not cleared on all MST outputs\n");
@@ -376,16 +345,15 @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_s
 	 * Even on HDCP enable failed scenario, IGT should exit leaving the
 	 * "content protection" at "UNDESIRED".
 	 */
-	igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION,
-				  CP_UNDESIRED);
+	igt_hdcp_set_content_protection_undesired(output);
 	igt_plane_set_fb(primary, &data.red);
 	igt_plane_set_size(primary, width, height);
 	igt_fb_set_size(&data.red, primary, width, height);
 	igt_display_commit2(display, commit_style);
 
 	/* Wait for HDCP to be disabled, before crtc off */
-	ret = wait_for_prop_value(output, CP_UNDESIRED,
-				  KERNEL_DISABLE_TIME_ALLOWED_MSEC);
+	ret = wait_for_prop_value(output, IGT_HDCP_UNDESIRED,
+				  IGT_HDCP_KERNEL_DISABLE_TIME_ALLOWED_MSEC);
 	igt_assert_f(ret, "Content Protection not cleared\n");
 }
 
@@ -434,18 +402,9 @@ static bool igt_crtc_is_free(igt_crtc_t *crtc)
 static void test_cp_lic(igt_output_t *output)
 {
 	bool ret;
-	uint64_t val;
 
-	/* Wait for 4Secs (min 2 cycles of Link Integrity Check) */
-	ret = wait_for_prop_value(output, CP_DESIRED, LIC_PERIOD_MSEC);
-	val = igt_output_get_prop(output,
-				  IGT_CONNECTOR_CONTENT_PROTECTION);
-	if (val == CP_DESIRED) {
-		igt_debug("Link Integrity Check failed, waiting for reauthentication\n");
-		ret = wait_for_prop_value(output, CP_DESIRED, LIC_PERIOD_MSEC);
-	}
-
-	igt_assert_f(!ret, "Content Protection LIC Failed\n");
+	ret = igt_hdcp_check_lic(&output, 1, 0, IGT_HDCP_LIC_PERIOD_MSEC, true, NULL);
+	igt_assert_f(ret, "Content Protection LIC Failed\n");
 }
 
 static bool write_srm_as_fw(const __u8 *srm, int len)
@@ -453,7 +412,7 @@ static bool write_srm_as_fw(const __u8 *srm, int len)
 	int fd, ret, total = 0;
 
 	fd = open("/lib/firmware/display_hdcp_srm.bin",
-		  O_WRONLY | O_CREAT, S_IRWXU);
+		  O_WRONLY | O_CREAT, 0700);
 	igt_require_f(fd >= 0, "Cannot write SRM binary to /lib/firmware\n");
 
 	do {
@@ -485,7 +444,7 @@ static void test_content_protection_on_output(igt_output_t *output,
 	if (data.cp_tests & CP_TYPE_CHANGE) {
 		/* Type 1 -> Type 0 */
 		test_cp_enable_with_retry(output, commit_style, 3,
-					  HDCP_CONTENT_TYPE_0, false,
+					  IGT_HDCP_CONTENT_TYPE_0, false,
 					  true);
 		/* Type 0 -> Type 1 */
 		test_cp_enable_with_retry(output, commit_style, 3,
@@ -521,8 +480,8 @@ static void test_content_protection_on_output(igt_output_t *output,
 					    IGT_CRTC_ACTIVE, 1);
 		igt_display_commit2(display, commit_style);
 
-		ret = wait_for_prop_value(output, CP_ENABLED,
-					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
+		ret = wait_for_prop_value(output, IGT_HDCP_ENABLED,
+					  IGT_HDCP_KERNEL_AUTH_TIME_ALLOWED_MSEC);
 		if (!ret)
 			test_cp_enable_with_retry(output, commit_style, 2,
 						  content_type, false,
@@ -532,8 +491,8 @@ static void test_content_protection_on_output(igt_output_t *output,
 	if (data.cp_tests & SUSPEND_RESUME) {
 		igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 
-		ret = wait_for_prop_value(output, CP_ENABLED,
-					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
+		ret = wait_for_prop_value(output, IGT_HDCP_ENABLED,
+					  IGT_HDCP_KERNEL_AUTH_TIME_ALLOWED_MSEC);
 		if (!ret)
 			test_cp_enable_with_retry(output, commit_style, 2,
 						  content_type, false,
@@ -541,70 +500,6 @@ static void test_content_protection_on_output(igt_output_t *output,
 	}
 }
 
-static void __debugfs_read(int fd, const char *param, char *buf, int len)
-{
-	len = igt_debugfs_simple_read(fd, param, buf, len);
-	igt_require(len != -ENOENT);
-	if (len < 0)
-		igt_assert_eq(len, -ENODEV);
-}
-
-#define debugfs_read(fd, p, arr) __debugfs_read(fd, p, arr, sizeof(arr))
-
-#define MAX_SINK_HDCP_CAP_BUF_LEN	5000
-
-static bool sink_hdcp_capable(igt_output_t *output)
-{
-	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
-	int fd;
-
-	fd = igt_debugfs_connector_dir(data.drm_fd, output->name, O_RDONLY);
-	if (fd < 0)
-		return false;
-
-	/*
-	 * FIXME: As of now XE's debugfs is using i915 namespace. Once Kernel
-	 * changes got landed, please update this logic to use XE specific
-	 * debugfs.
-	 */
-	if (is_intel_device(data.drm_fd))
-		debugfs_read(fd, "i915_hdcp_sink_capability", buf);
-	else if (is_mtk_device(data.drm_fd))
-		debugfs_read(fd, "mtk_hdcp_sink_capability", buf);
-	else
-		debugfs_read(fd, "hdcp_sink_capability", buf);
-
-	close(fd);
-
-	igt_debug("Sink capability: %s\n", buf);
-
-	return strstr(buf, "HDCP1.4");
-}
-
-static bool sink_hdcp2_capable(igt_output_t *output)
-{
-	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
-	int fd;
-
-	fd = igt_debugfs_connector_dir(data.drm_fd, output->name, O_RDONLY);
-	if (fd < 0)
-		return false;
-
-	/* FIXME: XE specific debugfs as mentioned above. */
-	if (is_intel_device(data.drm_fd))
-		debugfs_read(fd, "i915_hdcp_sink_capability", buf);
-	else if (is_mtk_device(data.drm_fd))
-		debugfs_read(fd, "mtk_hdcp_sink_capability", buf);
-	else
-		debugfs_read(fd, "hdcp_sink_capability", buf);
-
-	close(fd);
-
-	igt_debug("Sink capability: %s\n", buf);
-
-	return strstr(buf, "HDCP2.2");
-}
-
 static void prepare_modeset_on_mst_output(igt_output_t *output, bool is_enabled)
 {
 	drmModeModeInfo *mode;
@@ -623,73 +518,6 @@ static void prepare_modeset_on_mst_output(igt_output_t *output, bool is_enabled)
 	igt_plane_set_size(primary, width, height);
 }
 
-static bool output_hdcp_capable(igt_output_t *output, int content_type)
-{
-		if (!output->props[IGT_CONNECTOR_CONTENT_PROTECTION])
-			return false;
-
-		if (!output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE] &&
-		    content_type)
-			return false;
-
-		if (content_type && !sink_hdcp2_capable(output)) {
-			igt_info("\tSkip %s (Sink has no HDCP2.2 support)\n",
-				 output->name);
-			return false;
-		} else if (!sink_hdcp_capable(output)) {
-			igt_info("\tSkip %s (Sink has no HDCP support)\n",
-				 output->name);
-			return false;
-		}
-
-		return true;
-}
-
-static void set_i915_force_hdcp14(igt_output_t *output)
-{
-	int fd, ret;
-	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
-
-	fd = igt_debugfs_connector_dir(data.drm_fd, output->name, O_RDONLY);
-	igt_require_f(fd >= 0, "Cannot open %s debugfs\n", output->name);
-
-	ret = igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf, sizeof(buf));
-	if (ret <= 0) {
-		igt_info("i915_force_hdcp14 not supported\n");
-		close(fd);
-		return;
-	}
-
-	ret = igt_sysfs_write(fd, "i915_force_hdcp14", "1", 2);
-	igt_require_f(ret > 0, "i915_force_hdcp14 is not enabled\n");
-
-	ret = igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf, sizeof(buf));
-	igt_assert_f(ret > 0 && strstr(buf, "yes"),
-			 "i915_force_hdcp14 is not set to 'yes' on %s debugfs\n",
-			 output->name);
-
-	close(fd);
-}
-
-static void reset_i915_force_hdcp14(igt_output_t *output)
-{
-	int fd, ret;
-	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
-
-	fd = igt_debugfs_connector_dir(data.drm_fd, output->name, O_RDONLY);
-	igt_require_f(fd >= 0, "Cannot open %s debugfs\n", output->name);
-
-	ret = igt_sysfs_write(fd, "i915_force_hdcp14", "0", 2);
-	igt_require_f(ret > 0, "i915_force_hdcp14 is not disabled\n");
-
-	ret = igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf, sizeof(buf));
-	igt_assert_f(ret > 0 && strstr(buf, "no"),
-			 "i915_force_hdcp14 is not set to 'no' on %s debugfs\n",
-			 "i915_force_hdcp14");
-
-	close(fd);
-}
-
 static void
 test_fini(igt_output_t *output, enum igt_commit_style commit_style)
 {
@@ -703,62 +531,6 @@ test_fini(igt_output_t *output, enum igt_commit_style commit_style)
 	igt_display_commit2(&data.display, commit_style);
 }
 
-static bool is_output_hdcp_test_exempt(igt_output_t *output)
-{
-	drmModePropertyBlobPtr edid_blob = NULL;
-	uint64_t edid_blob_id;
-	const struct edid *edid;
-	char edid_vendor[4];
-	char sink_name[20];
-
-	igt_assert(kmstest_get_property(data.drm_fd,
-					output->config.connector->connector_id,
-					DRM_MODE_OBJECT_CONNECTOR, "EDID", NULL,
-					&edid_blob_id, NULL));
-
-	igt_assert(edid_blob = drmModeGetPropertyBlob(data.drm_fd, edid_blob_id));
-
-	edid = (const struct edid *)edid_blob->data;
-	edid_get_mfg(edid, edid_vendor);
-	edid_vendor[3] = '\0';
-
-	edid_get_monitor_name(edid, sink_name, ARRAY_SIZE(sink_name));
-
-	drmModeFreePropertyBlob(edid_blob);
-
-	/* Not all monitors have sink names */
-	if (sink_name[0] == '\0') {
-		igt_debug("no sink name\n");
-		return true;
-	}
-
-	return igt_is_panel_blocked(sink_name, hdcp_blocklist, ARRAY_SIZE(hdcp_blocklist));
-}
-
-static int get_hdcp_outputs(igt_display_t *display, int content_type,
-			    igt_output_t **hdcp_outputs)
-{
-	igt_output_t *output;
-	int count = 0;
-
-	for_each_connected_output(display, output) {
-		if (!output_hdcp_capable(output, content_type))
-			continue;
-
-		if (is_output_hdcp_test_exempt(output)) {
-			igt_info("Skipping HDCP test on %s, as the panel is blocklisted\n",
-				 output->name);
-			continue;
-		}
-
-
-		if (count < MAX_HDCP_OUTPUTS)
-			hdcp_outputs[count++] = output;
-	}
-
-	return count;
-}
-
 static void
 test_content_protection(enum igt_commit_style commit_style, int content_type)
 {
@@ -773,7 +545,12 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 		igt_require_f(igt_kmod_is_loaded("mei_hdcp"),
 			      "mei_hdcp module is not loaded\n");
 
-	hdcp_panel_count = get_hdcp_outputs(display, content_type, hdcp_outputs);
+	hdcp_panel_count = igt_hdcp_get_capable_outputs(display, data.drm_fd,
+							content_type,
+							hdcp_blocklist,
+							ARRAY_SIZE(hdcp_blocklist),
+							hdcp_outputs,
+							MAX_HDCP_OUTPUTS);
 	igt_skip_on_f(hdcp_panel_count == 0, "No connected output with HDCP support found\n");
 
 	if (data.cp_tests & CP_UEVENT) {
@@ -793,7 +570,7 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 
 			modeset_with_fb(output, commit_style);
 			if (data.is_force_hdcp14)
-				set_i915_force_hdcp14(output);
+				igt_hdcp_force_hdcp14(data.drm_fd, output, true);
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      output->name)
@@ -803,7 +580,7 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 								  content_type);
 
 			if (data.is_force_hdcp14)
-				reset_i915_force_hdcp14(output);
+				igt_hdcp_force_hdcp14(data.drm_fd, output, false);
 
 			test_fini(output, commit_style);
 			/*
@@ -819,43 +596,16 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 		igt_cleanup_uevents(data.uevent_monitor);
 }
 
-static bool output_is_dp_mst(igt_output_t *output, int i)
-{
-	int connector_id;
-	static int prev_connector_id;
-
-	connector_id = igt_get_dp_mst_connector_id(output);
-	if (connector_id < 0)
-		return false;
-
-	/*
-	 * Discarding outputs of other DP MST topology.
-	 * Testing only on outputs on the topology we got previously
-	 */
-	if (i == 0) {
-		prev_connector_id = connector_id;
-	} else {
-		if (connector_id != prev_connector_id)
-			return false;
-	}
-
-	return true;
-}
-
 static void test_cp_lic_on_mst(igt_output_t *mst_outputs[], int valid_outputs, int first_output)
 {
-	int ret, count;
-	uint64_t val;
+	bool ret;
+	int failed_index;
 
 	/* Only wait for the first output, this optimizes the test execution time */
-	ret = wait_for_prop_value(mst_outputs[first_output], CP_DESIRED, LIC_PERIOD_MSEC);
-	igt_assert_f(!ret, "Content Protection LIC Failed on %s\n",
-		     mst_outputs[first_output]->name);
-
-	for (count = first_output + 1; count < valid_outputs; count++) {
-		val = igt_output_get_prop(mst_outputs[count], IGT_CONNECTOR_CONTENT_PROTECTION);
-		igt_assert_f(val != CP_DESIRED, "Content Protection LIC Failed on %s\n", mst_outputs[count]->name);
-	}
+	ret = igt_hdcp_check_lic(mst_outputs, valid_outputs, first_output,
+				 IGT_HDCP_LIC_PERIOD_MSEC, false, &failed_index);
+	igt_assert_f(ret, "Content Protection LIC Failed on %s\n",
+		     mst_outputs[failed_index]->name);
 }
 
 static void
@@ -868,30 +618,23 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs
 
 	if (data.is_force_hdcp14) {
 		for (count = 0; count < valid_outputs; count++)
-			set_i915_force_hdcp14(hdcp_mst_output[count]);
+			igt_hdcp_force_hdcp14(data.drm_fd, hdcp_mst_output[count], true);
 	}
 
 	do {
 		if (retry_orig != retries)
 			test_mst_cp_disable(hdcp_mst_output, COMMIT_ATOMIC, valid_outputs);
 
-		for (count = 0; count < valid_outputs; count++) {
-			igt_output_set_prop_value(hdcp_mst_output[count],
-						  IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
-
-			if (hdcp_mst_output[count]->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE])
-				igt_output_set_prop_value(hdcp_mst_output[count],
-							  IGT_CONNECTOR_HDCP_CONTENT_TYPE,
-							  content_type);
-		}
+		for (count = 0; count < valid_outputs; count++)
+			igt_hdcp_set_content_protection_desired(hdcp_mst_output[count],
+								content_type, false);
 
 		igt_display_commit2(display, COMMIT_ATOMIC);
 
-		ret = wait_for_prop_value(hdcp_mst_output[0], CP_ENABLED,
-					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
-		for (count = 1; count < valid_outputs; count++)
-			ret &= wait_for_prop_value(hdcp_mst_output[count], CP_ENABLED,
-						  KERNEL_AUTH_TIME_ADDITIONAL_MSEC);
+		ret = igt_hdcp_wait_for_prop_value_multi(hdcp_mst_output, valid_outputs,
+							 IGT_HDCP_ENABLED,
+							 IGT_HDCP_KERNEL_AUTH_TIME_ALLOWED_MSEC,
+							 IGT_HDCP_KERNEL_AUTH_TIME_ADDITIONAL_MSEC);
 
 		retries -= 1;
 
@@ -906,7 +649,7 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs
 
 	if (data.is_force_hdcp14) {
 		for (count = 0; count < valid_outputs; count++)
-			reset_i915_force_hdcp14(hdcp_mst_output[count]);
+			igt_hdcp_force_hdcp14(data.drm_fd, hdcp_mst_output[count], false);
 	}
 
 	igt_assert_f(ret, "Content Protection not enabled on MST outputs\n");
@@ -918,12 +661,14 @@ test_content_protection_mst(int content_type)
 	igt_display_t *display = &data.display;
 	igt_output_t *output;
 	int valid_outputs = 0, dp_mst_outputs = 0, ret, count, i;
+	int prev_connector_id = -1;
 	igt_crtc_t *crtc;
 	bool pipe_found;
 	igt_output_t *hdcp_mst_output[IGT_MAX_PIPES];
 
 	for_each_connected_output(display, output) {
-		if (!output_is_dp_mst(output, dp_mst_outputs))
+		if (!igt_hdcp_output_is_dp_mst(output, dp_mst_outputs,
+					       &prev_connector_id))
 			continue;
 
 		pipe_found = false;
@@ -940,7 +685,7 @@ test_content_protection_mst(int content_type)
 		igt_output_set_crtc(output, crtc);
 		prepare_modeset_on_mst_output(output, false);
 		dp_mst_outputs++;
-		if (output_hdcp_capable(output, content_type))
+		if (igt_hdcp_output_capable(data.drm_fd, output, content_type))
 			hdcp_mst_output[valid_outputs++] = output;
 	}
 
@@ -969,8 +714,8 @@ test_content_protection_mst(int content_type)
 		igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 
 		ret = wait_for_prop_value(hdcp_mst_output[0],
-						 CP_ENABLED,
-						 KERNEL_AUTH_TIME_ALLOWED_MSEC);
+					  IGT_HDCP_ENABLED,
+					  IGT_HDCP_KERNEL_AUTH_TIME_ALLOWED_MSEC);
 		if (!ret)
 			test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs,
 						      2, content_type);
@@ -988,7 +733,8 @@ test_content_protection_mst(int content_type)
 	/* CP is expected to be still enabled on other outputs*/
 	for (i = 1; i < valid_outputs; i++) {
 		/* Wait for the timeout to verify CP is not disabled */
-		ret = wait_for_prop_value(hdcp_mst_output[i], CP_UNDESIRED, KERNEL_DISABLE_TIME_ALLOWED_MSEC);
+		ret = wait_for_prop_value(hdcp_mst_output[i], IGT_HDCP_UNDESIRED,
+					  IGT_HDCP_KERNEL_DISABLE_TIME_ALLOWED_MSEC);
 		igt_assert_f(!ret, "Content Protection not enabled on %s\n", hdcp_mst_output[i]->name);
 	}
 
@@ -1009,7 +755,7 @@ static void test_content_protection_cleanup(void)
 
 		val = igt_output_get_prop(output,
 					  IGT_CONNECTOR_CONTENT_PROTECTION);
-		if (val == CP_UNDESIRED)
+		if (val == IGT_HDCP_UNDESIRED)
 			continue;
 
 		igt_info("CP Prop being UNDESIRED on %s\n", output->name);
@@ -1052,44 +798,44 @@ static const struct {
 	{ .desc = "Test content protection with atomic modesetting",
 	  .name = "atomic",
 	  .cp_tests = 0,
-	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .content_type = IGT_HDCP_CONTENT_TYPE_0,
 	  .is_force_hdcp14 = false,
 	},
 	{ .desc = "Test for the integrity of link with type 0 content.",
 	  .name = "lic-type-0",
 	  .cp_tests = CP_LIC,
-	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .content_type = IGT_HDCP_CONTENT_TYPE_0,
 	},
 	{ .desc = "Test for the integrity of link with type 1 content",
 	  .name = "lic-type-1",
 	  .cp_tests = CP_LIC,
-	  .content_type = HDCP_CONTENT_TYPE_1,
+	  .content_type = IGT_HDCP_CONTENT_TYPE_1,
 	  .is_force_hdcp14 = false,
 	},
 	{ .desc = "Test content protection with content type 1 "
 		  "that can be handled only through HDCP2.2.",
 	  .name = "type1",
 	  .cp_tests = 0,
-	  .content_type = HDCP_CONTENT_TYPE_1,
+	  .content_type = IGT_HDCP_CONTENT_TYPE_1,
 	  .is_force_hdcp14 = false,
 	},
 	{ .desc = "Test the teardown and rebuild of the interface between "
 		  "Intel and mei hdcp.",
 	  .name = "mei-interface",
 	  .cp_tests = CP_MEI_RELOAD,
-	  .content_type = HDCP_CONTENT_TYPE_1,
+	  .content_type = IGT_HDCP_CONTENT_TYPE_1,
 	  .is_force_hdcp14 = false,
 	},
 	{ .desc = "Test the content type change when the content protection already enabled",
 	  .name = "content-type-change",
 	  .cp_tests = CP_TYPE_CHANGE,
-	  .content_type = HDCP_CONTENT_TYPE_1,
+	  .content_type = IGT_HDCP_CONTENT_TYPE_1,
 	},
 	{ .desc = "Test to detect the HDCP status change when we are reading the uevent "
 		  "sent with the corresponding connector id and property id.",
 	  .name = "uevent",
 	  .cp_tests = CP_UEVENT,
-	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .content_type = IGT_HDCP_CONTENT_TYPE_0,
 	  .is_force_hdcp14 = false,
 	},
 	/*
@@ -1104,45 +850,45 @@ static const struct {
 		  "and check the kernel parsing of it by invoking the hdcp authentication.",
 	  .name = "srm",
 	  .cp_tests = 0,
-	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .content_type = IGT_HDCP_CONTENT_TYPE_0,
 	  .is_force_hdcp14 = false,
 	},
 	{ .desc = "Test content protection with atomic modesetting with HDCP1.4.",
 	  .name = "atomic-hdcp14",
 	  .cp_tests = 0,
-	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .content_type = IGT_HDCP_CONTENT_TYPE_0,
 	  .is_force_hdcp14 = true,
 	},
 	{ .desc = "Test for the integrity of link with type 0 content.",
 	  .name = "lic-type-0-hdcp14",
 	  .cp_tests = CP_LIC,
-	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .content_type = IGT_HDCP_CONTENT_TYPE_0,
 	  .is_force_hdcp14 = true,
 	},
 	{ .desc = "Test to detect the HDCP status change when we are reading the uevent "
 		  "sent with the corresponding connector id and property id.",
 	  .name = "uevent-hdcp14",
 	  .cp_tests = CP_UEVENT,
-	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .content_type = IGT_HDCP_CONTENT_TYPE_0,
 	  .is_force_hdcp14 = true,
 	},
 	{ .desc = "Test content protection with DPMS ON/OFF during "
 		  "atomic modesetting with HDCP1.4.",
 	  .name = "atomic-dpms-hdcp14",
 	  .cp_tests = CP_DPMS,
-	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .content_type = IGT_HDCP_CONTENT_TYPE_0,
 	  .is_force_hdcp14 = true,
 	},
 	{ .desc = "Test content protection with DPMS ON/OFF during atomic modesetting.",
 	  .name = "atomic-dpms",
 	  .cp_tests = CP_DPMS,
-	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .content_type = IGT_HDCP_CONTENT_TYPE_0,
 	  .is_force_hdcp14 = false,
 	},
 	{.desc = "Test to verify the behaviour of HDCP after suspend resume cycles.",
 	 .name = "suspend-resume",
 	 .cp_tests = SUSPEND_RESUME,
-	 .content_type = HDCP_CONTENT_TYPE_0,
+	 .content_type = IGT_HDCP_CONTENT_TYPE_0,
 	}
 };
 
@@ -1156,48 +902,48 @@ static const struct {
 	{ .desc = "Test Content protection(Type 0) over DP MST.",
 	  .name = "dp-mst-type-0",
 	  .cp_tests = 0,
-	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .content_type = IGT_HDCP_CONTENT_TYPE_0,
 	  .is_force_hdcp14 = false,
 	},
 	{ .desc = "Test Content protection(Type 1) over DP MST.",
 	  .name = "dp-mst-type-1",
 	  .cp_tests = 0,
-	  .content_type = HDCP_CONTENT_TYPE_1,
+	  .content_type = IGT_HDCP_CONTENT_TYPE_1,
 	  .is_force_hdcp14 = false,
 	},
 	{ .desc = "Test Content protection(Type 0) over DP MST with LIC.",
 	  .name = "dp-mst-lic-type-0",
 	  .cp_tests = CP_LIC,
-	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .content_type = IGT_HDCP_CONTENT_TYPE_0,
 	  .is_force_hdcp14 = false,
 	},
 	{ .desc = "Test Content protection(Type 1) over DP MST with LIC.",
 	  .name = "dp-mst-lic-type-1",
 	  .cp_tests = CP_LIC,
-	  .content_type = HDCP_CONTENT_TYPE_1,
+	  .content_type = IGT_HDCP_CONTENT_TYPE_1,
 	  .is_force_hdcp14 = false,
 	},
 	{ .desc = "Test Content protection(Type 0) over DP MST with HDCP1.4.",
 	  .name = "dp-mst-type-0-hdcp14",
 	  .cp_tests = 0,
-	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .content_type = IGT_HDCP_CONTENT_TYPE_0,
 	  .is_force_hdcp14 = true,
 	},
 	{ .desc = "Test Content protection(Type 0) over DP MST with LIC.",
 	  .name = "dp-mst-lic-type-0-hdcp14",
 	  .cp_tests = CP_LIC,
-	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .content_type = IGT_HDCP_CONTENT_TYPE_0,
 	  .is_force_hdcp14 = true,
 	},
 	{ .desc = "Test Content protection(Type 0) over DP MST with suspend resume.",
 	  .name = "dp-mst-type-0-suspend-resume",
 	  .cp_tests = SUSPEND_RESUME,
-	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .content_type = IGT_HDCP_CONTENT_TYPE_0,
 	},
 	{ .desc = "Test Content protection(Type 1) over DP MST with suspend resume.",
 	  .name = "dp-mst-type-1-suspend-resume",
 	  .cp_tests = SUSPEND_RESUME,
-	  .content_type = HDCP_CONTENT_TYPE_1,
+	  .content_type = IGT_HDCP_CONTENT_TYPE_1,
 	},
 };
 
@@ -1214,14 +960,14 @@ int igt_main()
 	igt_subtest_with_dynamic("legacy") {
 		data.cp_tests = 0;
 		data.is_force_hdcp14 = false;
-		test_content_protection(COMMIT_LEGACY, HDCP_CONTENT_TYPE_0);
+		test_content_protection(COMMIT_LEGACY, IGT_HDCP_CONTENT_TYPE_0);
 	}
 
 	igt_describe("Test content protection with legacy style commit with HDCP1.4");
 	igt_subtest_with_dynamic("legacy-hdcp14") {
 		data.cp_tests = 0;
 		data.is_force_hdcp14 = true;
-		test_content_protection(COMMIT_LEGACY, HDCP_CONTENT_TYPE_0);
+		test_content_protection(COMMIT_LEGACY, IGT_HDCP_CONTENT_TYPE_0);
 	}
 
 	igt_subtest_group() {
@@ -1239,7 +985,7 @@ int igt_main()
 					bool ret;
 
 					ret = write_srm_as_fw((const __u8 *)facsimile_srm,
-							     sizeof(facsimile_srm));
+							      sizeof(facsimile_srm));
 					igt_assert_f(ret, "SRM update failed");
 				}
 
-- 
2.43.0

