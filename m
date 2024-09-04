Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3104ACA0ED3
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 07:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A90C10E691;
	Wed,  4 Sep 2024 07:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izQGiD/0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0401B10E689
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 07:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725434520; x=1756970520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dObhMD5SatcksZByfZQyGDrxeIRi1Iv1/Lus9JRPEBc=;
 b=izQGiD/0/SvHgmTOSS/22wnyzGQ8PI5eESR1rmTsJWMV8JXG8kz9nMlm
 SCzt5KpvpSpeYPqNwbYLzDbCQZCJLn4ftzoQdQrV0Ww3QakPbPfr6/JXN
 HkXzQ0+ctIl6XjupbGU8aYbZkQqiqt9wsz4mnycFU9AqLXkpXGwd7MARb
 1Sq7YDgC1vhbET1B9BGarfFw/70xOJciZb7SoUAU9Y7nrdMIkX6KSoWJ6
 bGrLgVbE1GqfPQm/T9XRM7nSnPpDWv8geXzJpfHQSNHv8uFYHf5i14kF2
 oXlVeyDjlfFnP9gBf/aNst8pKeFMrPeHDAkMz/NTzQaURdIVj4+M4PxIs A==;
X-CSE-ConnectionGUID: i+Zxo4ZTTtqUfF3sMB9CrA==
X-CSE-MsgGUID: Dy2DddIdQMClrSu8PLzmeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23951627"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="23951627"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 00:21:59 -0700
X-CSE-ConnectionGUID: 5LW2KBDxQoiNSLGu3W/hVA==
X-CSE-MsgGUID: K7UZ5KWXQpGp2Fo18mpX0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="65901830"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 00:21:58 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v3,3/3] tests/intel/kms_dsc: add new subtest
Date: Wed,  4 Sep 2024 12:54:25 +0530
Message-Id: <20240904072425.1022100-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240904072425.1022100-1-swati2.sharma@intel.com>
References: <20240904072425.1022100-1-swati2.sharma@intel.com>
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

Add new subtest to validate dsc and big joiner usecase.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index ef4646957..c9e9bf853 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -50,6 +50,7 @@
  * arg[1]:
  *
  * @basic:                        DSC with default parameters
+ * @with-bigjoiner:               DSC with default parameters and big joiner
  * @with-bpc:                     DSC with certain input BPC for the connector
  * @with-bpc-formats:             DSC with certain input BPC for the connector and diff formats
  * @with-formats:                 DSC with default parameters and creating fb with diff formats
@@ -70,6 +71,7 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 #define TEST_DSC_FORMAT		(1<<1)
 #define TEST_DSC_OUTPUT_FORMAT	(1<<2)
 #define TEST_DSC_FRACTIONAL_BPP (1<<3)
+#define TEST_DSC_BIGJOINER	(1<<4)
 
 typedef struct {
 	int drm_fd;
@@ -129,6 +131,7 @@ static void test_reset(data_t *data)
 
 	restore_force_dsc_en();
 	restore_force_dsc_fractional_bpp_en();
+	restore_force_dsc_bigjoiner_en();
 }
 
 static void test_cleanup(data_t *data)
@@ -181,6 +184,12 @@ static void update_display(data_t *data, uint32_t test_type)
 		force_dsc_fractional_bpp_enable(data->drm_fd, data->output);
 	}
 
+	if (test_type & TEST_DSC_BIGJOINER) {
+		igt_debug("DSC big joiner is supported on %s\n", data->output->name);
+		save_force_dsc_bigjoiner_en(data->drm_fd, data->output);
+		force_dsc_bigjoiner_enable(data->drm_fd, data->output);
+	}
+
 	igt_output_set_pipe(output, data->pipe);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
@@ -266,12 +275,16 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	enum pipe pipe;
+	int max_pipes = 0;
 	char name[3][LEN] = {
 				{0},
 				{0},
 				{0},
 			    };
 
+	for_each_pipe(display, pipe)
+		max_pipes++;
+
 	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
@@ -286,6 +299,9 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 		     igt_get_output_max_bpc(data->drm_fd, output->name) < MIN_DSC_BPC)
 			continue;
 
+		if ((test_type & TEST_DSC_BIGJOINER) && data->pipe == max_pipes - 1)
+			continue;
+
 		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
 		    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
 						     data->output, data->output_format)))
@@ -352,6 +368,13 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 			test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
 				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
 
+	igt_describe("Tests basic display stream compression functionality with big joiner "
+		     "if supported by a connector by forcing DSC and big joiner on all connectors "
+		     "that support it with default parameters");
+	igt_subtest_with_dynamic("dsc-with-bigjoiner")
+			test_dsc(&data, TEST_DSC_BASIC | TEST_DSC_BIGJOINER, DEFAULT_BPC,
+				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
+
 	igt_describe("Tests basic display stream compression functionality if supported "
 		     "by a connector by forcing DSC on all connectors that support it "
 		     "with default parameters and creating fb with diff formats");
-- 
2.25.1

