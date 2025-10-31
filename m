Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0989CCCF9EE
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 07:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA03410EAC1;
	Fri, 31 Oct 2025 07:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TD3FHkrd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A414E10EABF
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 07:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761897545; x=1793433545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i6k5AgL7uo4cVaEkbtCsMVUMOA5xROelCJYaJOOe224=;
 b=TD3FHkrd85KBtMJ+Ac3tH6ZLWgt1mkKnPRpY1rMkaPvKLmPRjpwREckH
 Y4VQ2fmmbPCYmQKNS+nWbdin1kRrfjEafg624U+azYSefLCTWY2743NVw
 mHhhvKomv0VetTaB5dAPV/85xGTHcDU9uWuRpZ6MR2ijFeI9NnhvwqhNL
 mNUWjrehzXg3wrMcAzOcYIzfA8WLuAVDDTUDdVFxfTCBpjDjDnqPtFPdK
 eA7Ydp49SV8mqUSqc2Hw0G7oCaeMtNENNKMelnxAN9yif8v/D61ubSl6U
 XTTbR/YIjFMwljDtlEZp+3hP5+jjVzxjcLOkOiBHeDwIE36xX2QdW7sDP g==;
X-CSE-ConnectionGUID: 4cwsZLUjRFigHGBfUM+Xpg==
X-CSE-MsgGUID: FRD81EWHSaWMdsx/CWUPbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75169897"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="75169897"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 00:59:05 -0700
X-CSE-ConnectionGUID: M/c03RyMTai57g+CRmpy5Q==
X-CSE-MsgGUID: uG8NhcdZTe6ZZrqaeFo9jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="186287385"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 00:59:04 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t,
 v3 06/10] tests/kms_sharpness_filter: Add dpms/suspend subtests
Date: Fri, 31 Oct 2025 13:35:30 +0530
Message-Id: <20251031080534.880321-7-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251031080534.880321-1-swati2.sharma@intel.com>
References: <20251031080534.880321-1-swati2.sharma@intel.com>
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

Add subtests to verify CASF with DPMS and suspend.

v2: -Added CRC based verification (Ankit)
v3: -Update documentation

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_sharpness_filter.c | 65 ++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
index 3cdd40d75..80971904d 100644
--- a/tests/kms_sharpness_filter.c
+++ b/tests/kms_sharpness_filter.c
@@ -36,6 +36,12 @@
  * SUBTEST: filter-tap
  * Description: Verify content adaptive sharpness filter with resolution change, resolution change
  * 		will lead to selection of distinct taps.
+ *
+ * SUBTEST: filter-dpms
+ * Description: Verify content adaptive sharpness filter with DPMS.
+ *
+ * SUBTEST: filter-suspend
+ * Description: Verify content adaptive sharpness filter with suspend.
 */
 
 IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
@@ -65,6 +71,8 @@ enum test_type {
 	TEST_FILTER_STRENGTH,
 	TEST_FILTER_TOGGLE,
 	TEST_FILTER_TAP,
+	TEST_FILTER_DPMS,
+	TEST_FILTER_SUSPEND,
 };
 
 const int filter_strength_list[] = {
@@ -207,9 +215,12 @@ static int test_filter_toggle(data_t *data)
 
 static void test_sharpness_filter(data_t *data,  enum test_type type)
 {
+	igt_output_t *output = data->output;
 	drmModeModeInfo *mode = data->mode;
 	int height = mode->hdisplay;
 	int width =  mode->vdisplay;
+	igt_crc_t ref_crc, crc;
+	igt_pipe_crc_t *pipe_crc = NULL;
 	int ret;
 
 	data->plane[0] = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
@@ -233,11 +244,37 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 
 	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 
+	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
+		pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id,
+					    IGT_PIPE_CRC_SOURCE_AUTO);
+		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
+	}
+
+	if (type == TEST_FILTER_DPMS) {
+		kmstest_set_connector_dpms(data->drm_fd,
+					   output->config.connector,
+					   DRM_MODE_DPMS_OFF);
+		kmstest_set_connector_dpms(data->drm_fd,
+					   output->config.connector,
+					   DRM_MODE_DPMS_ON);
+	}
+
+	if (type == TEST_FILTER_SUSPEND)
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+					      SUSPEND_TEST_NONE);
+
+	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
+		igt_pipe_crc_collect_crc(pipe_crc, &crc);
+		igt_assert_crc_equal(&crc, &ref_crc);
+	}
+
 	if (type == TEST_FILTER_TOGGLE)
 		ret |= test_filter_toggle(data);
 
 	igt_assert_eq(ret, 0);
 
+	/* clean-up */
+	igt_pipe_crc_free(pipe_crc);
 	cleanup(data);
 }
 
@@ -323,6 +360,12 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 			case TEST_FILTER_TOGGLE:
 				snprintf(name, sizeof(name), "-toggle");
 				break;
+			case TEST_FILTER_DPMS:
+				snprintf(name, sizeof(name), "-dpms");
+				break;
+			case TEST_FILTER_SUSPEND:
+				snprintf(name, sizeof(name), "-suspend");
+				break;
 			default:
 				igt_assert(0);
 			}
@@ -457,6 +500,28 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 		run_sharpness_filter_test(&data, TEST_FILTER_TAP);
 	}
 
+	igt_describe("Verify content adaptive sharpness filter "
+		     "with DPMS.");
+	igt_subtest_with_dynamic("filter-dpms") {
+		data.modifier = DRM_FORMAT_MOD_LINEAR;
+		data.rotation = IGT_ROTATION_0;
+		data.format = DRM_FORMAT_XRGB8888;
+		data.filter_strength = MID_FILTER_STRENGTH;
+
+		run_sharpness_filter_test(&data, TEST_FILTER_DPMS);
+	}
+
+	igt_describe("Verify content adaptive sharpness filter "
+		     "with suspend.");
+	igt_subtest_with_dynamic("filter-suspend") {
+		data.modifier = DRM_FORMAT_MOD_LINEAR;
+		data.rotation = IGT_ROTATION_0;
+		data.format = DRM_FORMAT_XRGB8888;
+		data.filter_strength = MID_FILTER_STRENGTH;
+
+		run_sharpness_filter_test(&data, TEST_FILTER_SUSPEND);
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.25.1

