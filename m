Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0201AC3ABC3
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 09:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA78F10E01F;
	Mon, 12 May 2025 09:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tis3aJrx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30A810E01F
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 09:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747040659; x=1778576659;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1ujn9q7UabKq+UrQMewXO2sLQ7Bt6Ft6fXFtSAbHm8M=;
 b=Tis3aJrxFz7SrZoZ8KMR4LBwX6ds+8rShQRqIm+E5ijwvirdiixnkkVj
 yZnc9hNqaFmrb7I7kTVgF3BdjGkU0PYm1UeXv6Z32NS9qaNxdavzA0gf5
 3U1khM7XvuRTMLm1hWBzDYS7IBEa8u0UQOUjowXVnUQGKhOyrFOBUte3e
 +wPvI1ToRHMpPEjYgik7nTirQKPjqUVRGH+5+bZZG8/rbAOnQmkeMa4RJ
 1Uvzegn8IefJ3LgP/5qT01EiGKu5x6dRMMwLAKu+wbw60cTN+SzmNNnsa
 iEzI1MdmT6RMhUJkcaKBZwDWuOnqRJPtjKXE4j+4etqXzH+i2vC6GhGyt g==;
X-CSE-ConnectionGUID: JOJOJ3DDSZaaXWqfuvzepQ==
X-CSE-MsgGUID: fh2g5ofHTYSwJxnnMN3V4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="52637082"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="52637082"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 02:04:13 -0700
X-CSE-ConnectionGUID: aYW1GffPQ3O9jngslgyB8w==
X-CSE-MsgGUID: ElNf6bVxR6WISXAKYTUmsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="137329446"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 02:04:12 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v3] tests/intel/kms_dsc: Store valid DSC outputs
Date: Mon, 12 May 2025 14:39:42 +0530
Message-Id: <20250512090942.1340266-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Instead of repeatedly checking debugfs to determine if a panel
supports DSC, perform the check once and store valid outputs (those
that support DSC and meet the required constraints) in an array.

v2: -store pipe as well in array
v3: -store only valid output
    -no need to store pipe
    -modify constraints accordingly

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc.c | 71 ++++++++++++++++++++++++-------------------
 1 file changed, 39 insertions(+), 32 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 7f0745370..9b1b3e8dc 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -71,12 +71,14 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
 typedef struct {
 	int drm_fd;
+	int count;
 	uint32_t devid;
 	igt_display_t display;
 	struct igt_fb fb_test_pattern;
 	enum dsc_output_format output_format;
 	unsigned int plane_format;
 	igt_output_t *output;
+	igt_output_t *valid_output[IGT_MAX_PIPES];
 	int input_bpc;
 	int disp_ver;
 	enum pipe pipe;
@@ -249,7 +251,6 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 		     enum dsc_output_format output_format)
 {
 	igt_display_t *display = &data->display;
-	igt_output_t *output;
 	enum pipe pipe;
 	char name[3][LEN] = {
 				{0},
@@ -257,47 +258,44 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 				{0},
 			    };
 
+	igt_require_f(data->count > 0, "No valid output found, either sink doesn't support dsc or min 8bpc\n");
 	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
 
-	for_each_pipe_with_valid_output(display, pipe, output) {
-		data->output_format = output_format;
-		data->plane_format = plane_format;
-		data->input_bpc = bpc;
-		data->output = output;
-		data->pipe = pipe;
-
-		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
-		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe))
-			continue;
+	for_each_pipe(display, pipe) {
+		for (int i = 0; i < data->count; i++) {
+			data->output_format = output_format;
+			data->plane_format = plane_format;
+			data->input_bpc = bpc;
+			data->output = data->valid_output[i];
+			data->pipe = pipe;
 
-		if (igt_get_output_max_bpc(data->drm_fd, output->name) < MIN_DSC_BPC) {
-			igt_info("Output %s doesn't support min %d-bpc\n", igt_output_name(data->output), MIN_DSC_BPC);
-			continue;
-		}
+			if (!check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe))
+				continue;
 
-		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
-		    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
+			if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
+			    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
 						     data->output, data->output_format)))
-			continue;
+				continue;
 
-		if ((test_type & TEST_DSC_FRACTIONAL_BPP) &&
-		    (!is_dsc_fractional_bpp_supported(data->disp_ver,
+			if ((test_type & TEST_DSC_FRACTIONAL_BPP) &&
+			    (!is_dsc_fractional_bpp_supported(data->disp_ver,
 						      data->drm_fd, data->output)))
-			continue;
+				continue;
 
-		if (test_type & TEST_DSC_OUTPUT_FORMAT)
-			snprintf(&name[0][0], LEN, "-%s", kmstest_dsc_output_format_str(data->output_format));
-		if (test_type & TEST_DSC_FORMAT)
-			snprintf(&name[1][0], LEN, "-%s", igt_format_str(data->plane_format));
-		if (test_type & TEST_DSC_BPC)
-			snprintf(&name[2][0], LEN, "-%dbpc", data->input_bpc);
+			if (test_type & TEST_DSC_OUTPUT_FORMAT)
+				snprintf(&name[0][0], LEN, "-%s", kmstest_dsc_output_format_str(data->output_format));
+			if (test_type & TEST_DSC_FORMAT)
+				snprintf(&name[1][0], LEN, "-%s", igt_format_str(data->plane_format));
+			if (test_type & TEST_DSC_BPC)
+				snprintf(&name[2][0], LEN, "-%dbpc", data->input_bpc);
 
-		igt_dynamic_f("pipe-%s-%s%s%s%s",  kmstest_pipe_name(data->pipe), data->output->name,
-			      &name[0][0], &name[1][0], &name[2][0])
-			update_display(data, test_type);
+			igt_dynamic_f("pipe-%s-%s%s%s%s",  kmstest_pipe_name(data->pipe), data->output->name,
+				       &name[0][0], &name[1][0], &name[2][0])
+				update_display(data, test_type);
 
-		if (data->limited)
-			break;
+			if (data->limited)
+				break;
+		}
 	}
 }
 
@@ -323,15 +321,24 @@ data_t data = {};
 
 igt_main_args("l", NULL, help_str, opt_handler, &data)
 {
+	igt_output_t *output;
+
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		data.disp_ver = intel_display_ver(data.devid);
+		data.count = 0;
 		kmstest_set_vt_graphics_mode();
 		igt_install_exit_handler(kms_dsc_exit_handler);
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
 		igt_require(is_dsc_supported_by_source(data.drm_fd));
+
+		for_each_connected_output(&data.display, output) {
+			if (is_dsc_supported_by_sink(data.drm_fd, output) &&
+		            igt_get_output_max_bpc(data.drm_fd, output->name) > MIN_DSC_BPC)
+					data.valid_output[data.count++] = output;
+		}
 	}
 
 	igt_describe("Tests basic display stream compression functionality if supported "
-- 
2.25.1

