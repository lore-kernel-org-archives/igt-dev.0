Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422EFC54E90
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 07:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35BA10E69C;
	Wed, 21 May 2025 07:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WfGTu3TX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC9610E69C
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 07:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747812197; x=1779348197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qlkQgddZxdUNMhV7/e+M7gaXXPliz3DUNOvpRpTAGQo=;
 b=WfGTu3TXDN9BEZrGFN46UmgtskzR32enZKeg+8zPYtNNHJgUy2dDOtyG
 XWdclj14PxvSudxdUpnQtiMSJnQOzIr0W3cnrb7XoSgIB0Xj5NzpNxj47
 6TjNMOr472GwN9K7KsBwQ/tFxUlDge/6npUTFVLfhHFcQ1+LiF+SUff2j
 RjQ/yeacvzK8QJzxt7pBK/1FYdOV6DzeOQiwogNljB8odkQMymXKpOH0O
 ZwS1vaCmVYZGySDe/HBDCZeSplY25dcdG/y61to7scBwNJpqIFKPKJoqY
 RQ+8eQvD8NhpgijE3wgWgRtvYW++vn860AQhrs+MGJ8AwwTBus5SzYmUc g==;
X-CSE-ConnectionGUID: Un9uPohFRYa0QUifOEMPKA==
X-CSE-MsgGUID: 6I+SD6xRTlW+eCn+MNDoHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="53571299"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="53571299"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 00:23:17 -0700
X-CSE-ConnectionGUID: g3tMafL/QmKdQOq2TNTBLw==
X-CSE-MsgGUID: 4AEvgzlXQsmY2xZd4h6w/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="170943843"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 00:23:15 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, imre.deak@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 5/5] tests/intel/kms_dsc: Add dsc-compressed-bpp subtest
Date: Wed, 21 May 2025 12:58:36 +0530
Message-Id: <20250521072836.1400749-6-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521072836.1400749-1-swati2.sharma@intel.com>
References: <20250521072836.1400749-1-swati2.sharma@intel.com>
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

New subtest is added, where we force compressed BPP.
igt_get_dsc_sink_compressed_bpp() returns max compressed BPP
for a given connector/pipe from i915_display_info().
get_compressed_bpp_list() prepares bpp_list depending upon display_ver.
If display_ver < 13 we have const array (min=6 and max=15).
For display_ver > 13 max BPP we will get from igt_get_dsc_sink_compressed_bpp().
Min BPP value is 8 for RGB and YCBCR444 and 6 for YCBCR420.
However, for simplicity 8 BPP is considered as MIN BPP.
Later compressed BPP is forced using intel_force_link_bpp.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc.c | 82 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 79 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 5aedd9576..71a5a191c 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -55,6 +55,7 @@
  * @with-output-formats-with-bpc: DSC with output formats with certain input BPC for the connector
  * @fractional-bpp:               DSC with fractional bpp with default parameters
  * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
+ * @compressed-bpp:               DSC with compressed bpp
  */
 
 IGT_TEST_DESCRIPTION("Test to validate display stream compression");
@@ -62,12 +63,14 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 #define LEN		20
 #define DEFAULT_BPC	0
 #define MIN_DSC_BPC	8
+#define STEP_SIZE	2
 
 #define TEST_DSC_BASIC		(0<<0)
 #define TEST_DSC_BPC		(1<<0)
 #define TEST_DSC_FORMAT		(1<<1)
 #define TEST_DSC_OUTPUT_FORMAT	(1<<2)
 #define TEST_DSC_FRACTIONAL_BPP (1<<3)
+#define TEST_DSC_COMPRESSED_BPP (1<<4)
 
 typedef struct {
 	int drm_fd;
@@ -129,8 +132,59 @@ static void test_cleanup(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->fb_test_pattern);
 }
 
+static void
+force_dsc_with_modeset(int drm_fd, int disp_ver, igt_display_t *display,
+		       igt_output_t *output, enum pipe pipe)
+{
+	drmModeModeInfo *mode;
+
+	igt_display_reset(display);
+	igt_display_commit(display);
+
+	igt_output_set_pipe(output, pipe);
+
+        mode = igt_output_get_highres_mode(output);
+	igt_output_override_mode(output, mode);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	force_dsc_enable(drm_fd, output);
+
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	igt_output_set_pipe(output, pipe);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+}
+
+static int
+get_compressed_bpp_list(int drm_fd, int disp_ver, igt_display_t *display,
+			igt_output_t *output, enum pipe pipe, float *bpp_list,
+			int max_entries)
+{
+	int count = 0;
+	float max_bpp = 0.0f;
+
+	if (disp_ver < 13) {
+		const int fixed_bpp[] = {6, 8, 10, 12, 15};
+		for (int i = 0; i < ARRAY_SIZE(fixed_bpp) && count < max_entries; i++)
+			bpp_list[count++] = fixed_bpp[i];
+	} else {
+		force_dsc_with_modeset(drm_fd, disp_ver, display, output, pipe);
+		max_bpp = igt_get_dsc_sink_compressed_bpp(drm_fd, pipe);
+
+		/* FIXME: MIN compressed BPP value is 8 for RGB and
+		 * 6 for YCBCR420 output formats. For simplicity lets
+		 * consider 8 for time being.
+		 */
+		for (int bpp = 8; bpp <= max_bpp && count < max_entries; bpp += STEP_SIZE)
+			bpp_list[count++] = bpp;
+	}
+
+	return count;
+}
+
 /* re-probe connectors and do a modeset with DSC */
-static void update_display(data_t *data, uint32_t test_type)
+static void update_display(data_t *data, float compressed_bpp, uint32_t test_type)
 {
 	int ret;
 	bool enabled;
@@ -184,6 +238,11 @@ static void update_display(data_t *data, uint32_t test_type)
 
 		igt_output_override_mode(output, mode);
 
+		if (test_type & TEST_DSC_COMPRESSED_BPP) {
+			igt_debug("Trying to set compressed BPP to %.2f\n", compressed_bpp);
+			force_dsc_enable_compressed_bpp(data->drm_fd, data->output, compressed_bpp);
+		}
+
 		if (!intel_pipe_output_combo_valid(display)) {
 			if (data->output_format == DSC_FORMAT_RGB) {
 				igt_info("No valid pipe/output/mode found.\n");
@@ -251,11 +310,14 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 		     unsigned int plane_format,
 		     enum dsc_output_format output_format)
 {
+	igt_display_t *display = &data->display;
 	char name[3][LEN] = {
 				{0},
 				{0},
 				{0},
 			    };
+	int bpp_count = 1;
+	float bpp_list[32];
 
 	igt_require_f(data->count > 0, "No dsc output found that meets all constraints\n");
 	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
@@ -284,9 +346,15 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 		if (test_type & TEST_DSC_BPC)
 			snprintf(&name[2][0], LEN, "-%dbpc", data->input_bpc);
 
+		if (test_type & TEST_DSC_COMPRESSED_BPP)
+			bpp_count = get_compressed_bpp_list(data->drm_fd, data->disp_ver, display,
+							    data->output, data->pipe, bpp_list, ARRAY_SIZE(bpp_list));
+
 		igt_dynamic_f("pipe-%s-%s%s%s%s",  kmstest_pipe_name(data->pipe), data->output->name,
-			      &name[0][0], &name[1][0], &name[2][0])
-			update_display(data, test_type);
+			      &name[0][0], &name[1][0], &name[2][0]) {
+			for (int j = 0; j < bpp_count; j++)
+				update_display(data, bpp_list[j], test_type);
+		}
 
 		if (data->limited)
 			break;
@@ -426,6 +494,14 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 				 DSC_FORMAT_RGB);
 	}
 
+	igt_describe("Tests basic display stream compression functionality if supported "
+		     "by a connector by forcing DSC and compressed bpp on all connectors "
+		     "that support it.");
+	igt_subtest_with_dynamic("dsc-compressed-bpp")
+			test_dsc(&data, TEST_DSC_COMPRESSED_BPP,
+				 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
+				 DSC_FORMAT_RGB);
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.25.1

