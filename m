Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734A3CD4F21
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 19:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CC810F022;
	Wed, 13 May 2026 19:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xn5hrmYX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25FD10F018
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 19:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778699330; x=1810235330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ugK9aqt/qbgSa9A2mWNLu3m4ltOtQhBntZaCFFvHzrM=;
 b=Xn5hrmYX2g0OMd5WhNiSbYvXLVpv2x6peRrVTFk/lym4nb6COCzJwEjK
 fdMvGg6K6ESusMAF8v1AbD2HwGuEDx0Tqgd28JpAql4X22E2Hpgc2DFx6
 VtsR/IH0yTnfl93c8c78viKlwstpgYJiK64BupFCnglmZY7Fu66resko0
 elQ2dXJG1AXnCqop0TRWp27ejePMz65625Zp6tpiYuRSHAmGIuTcPryg7
 x0kmwGIKbStUbxNdqsRHUBt+cOCVINdmuA1P0GqPcG36pfZmRW0QaneZn
 5MUM0aUJulF2thb6gV54rjVJruKfiEZiPLwf0dOeR80KSdaNi5P8OR3rG g==;
X-CSE-ConnectionGUID: mIBpY+yvTxeuxrXTNeo4Tw==
X-CSE-MsgGUID: YFzVwChJSMWinmEix32MIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79350491"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="79350491"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 12:08:50 -0700
X-CSE-ConnectionGUID: TfqGZ6uoS+OnlX2mg3byXQ==
X-CSE-MsgGUID: Gp/F4A6JRJ2RCBuB0kmxjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="242511696"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 12:08:49 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v2 2/3] tests/intel/kms_sharpness_filter: Add CRC comparison for
 positive tests
Date: Thu, 14 May 2026 00:47:31 +0530
Message-Id: <20260513191732.2420879-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260513191732.2420879-1-swati2.sharma@intel.com>
References: <20260513191732.2420879-1-swati2.sharma@intel.com>
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

Restructure CRC logic so that the sharpness effect check (sharp_crc
vs no_sharp_crc) is a common verification path shared by all positive
tests including DPMS and suspend.

For DPMS/suspend tests, reuse sharp_crc as the reference CRC instead
of capturing a separate ref_crc. After the power cycle, verify the CRC
still matches sharp_crc (persistence), then fall through to the common
check that verifies the filter actually had an effect.

v2: Move CRC effect check after suspend/dpms block to have a common
    CRC function for all positive tests (Nemesa).

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 34 ++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 96eec8919..4a7fd6c75 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -418,7 +418,7 @@ static void test_sharpness_filter(data_t *data, enum test_type type)
 {
 	igt_output_t *output = data->output;
 	drmModeModeInfo *mode = data->mode;
-	igt_crc_t ref_crc, crc;
+	igt_crc_t crc, no_sharp_crc, sharp_crc;
 	igt_pipe_crc_t *pipe_crc = NULL;
 	int ret;
 
@@ -438,6 +438,18 @@ static void test_sharpness_filter(data_t *data, enum test_type type)
 	if (needs_extra_planes(type))
 		set_planes(data, type);
 
+	/*
+	 * For positive tests, capture a reference CRC with the sharpness
+	 * filter still disabled before applying the filter. After the filter
+	 * is enabled and committed, the resulting CRC must differ.
+	 */
+	if (!is_invalid_test(type)) {
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		pipe_crc = igt_crtc_crc_new(data->crtc,
+					    IGT_PIPE_CRC_SOURCE_AUTO);
+		igt_pipe_crc_collect_crc(pipe_crc, &no_sharp_crc);
+	}
+
 	set_filter_strength_on_pipe(data);
 
 	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
@@ -460,11 +472,11 @@ static void test_sharpness_filter(data_t *data, enum test_type type)
 		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 	}
 
-	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
-		pipe_crc = igt_crtc_crc_new(data->crtc,
-					    IGT_PIPE_CRC_SOURCE_AUTO);
-		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
+	if (!is_invalid_test(type)) {
+		igt_pipe_crc_collect_crc(pipe_crc, &sharp_crc);
+	}
 
+	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
 		if (type == TEST_FILTER_DPMS) {
 			kmstest_set_connector_dpms(data->drm_fd,
 						   output->config.connector,
@@ -478,10 +490,18 @@ static void test_sharpness_filter(data_t *data, enum test_type type)
 		}
 
 		igt_pipe_crc_collect_crc(pipe_crc, &crc);
-		igt_assert_crc_equal(&crc, &ref_crc);
-		igt_pipe_crc_free(pipe_crc);
+		igt_assert_crc_equal(&crc, &sharp_crc);
 	}
 
+	if (!is_invalid_test(type)) {
+		igt_assert_f(!igt_check_crc_equal(&sharp_crc, &no_sharp_crc),
+			     "Sharpness CRC matches reference CRC; filter had no effect on pipe %s\n",
+			     igt_crtc_name(data->crtc));
+	}
+
+	if (pipe_crc)
+		igt_pipe_crc_free(pipe_crc);
+
 	if (is_invalid_test(type))
 		igt_assert_eq(ret, -EINVAL);
 	else
-- 
2.25.1
