Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD76D10DCF
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 08:48:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699A710E662;
	Mon,  2 Dec 2024 08:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdcJ+6MB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384CA10E21B
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Dec 2024 08:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733129316; x=1764665316;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m2YdSELRPJV07ddZv4uX9vS8x4tuosG3xRzSC5v+7ms=;
 b=jdcJ+6MBFAMnAqF/6fMbVPRzSAX4Hm1ZbpCYv1KKLp5P2G/hZUUaAmkQ
 EmZsxuoE0kySWEsMtdoIBIGpXpd8Ii1YZrht3Opgbz1BHoXcfgPmdVc68
 +v9hpzHyJ9mJOYlQ2V98j9K7cKjFQ27ri/wsCANGSAb6Kc0cmhFC1Z9il
 4kYktFFjyncMqHDLOkZts/j6G5YoBS4Q3W0g7hUM02/MeJOhzAKJeBMqm
 ccbiK9PKdtmhxDUctt/dZX7oav8SAUfxD7SyCnhUdMluYCnCRvWzCHRcN
 k8DStbW8fminGM71BUUnUe22c8APiqzC0vhJut71y43Yw8vvw4xJ+9EPK w==;
X-CSE-ConnectionGUID: uMAk3wAvSTe1+HVpRHL6XA==
X-CSE-MsgGUID: f7e/lcVcS9+aQcfkrZYnew==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33533040"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; d="scan'208";a="33533040"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 00:48:36 -0800
X-CSE-ConnectionGUID: TLiOgRWMT0uXBVdZjupoTw==
X-CSE-MsgGUID: WZvbynkgTvuAbBzsk0S2sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; d="scan'208";a="130528819"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 00:48:35 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/dsc: Convert debug msg to info msg
Date: Mon,  2 Dec 2024 14:21:26 +0530
Message-Id: <20241202085127.1785594-1-swati2.sharma@intel.com>
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

Convert `igt_debug` to `igt_info` to provide more
context when skipping outputs that doesn't fulfil
dsc constraints.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc_helper.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
index 0de09b8e9..cea4304e4 100644
--- a/tests/intel/kms_dsc_helper.c
+++ b/tests/intel/kms_dsc_helper.c
@@ -69,14 +69,14 @@ bool is_dsc_supported_by_source(int drmfd)
 bool is_dsc_supported_by_sink(int drmfd, igt_output_t *output)
 {
 	if (!igt_is_dsc_supported_by_sink(drmfd, output->name)) {
-		igt_debug("DSC not supported on connector %s\n",
+		igt_info("DSC not supported on connector %s\n",
 			  output->name);
 		return false;
 	}
 
 	if (!output_is_internal_panel(output) &&
 	    !igt_is_fec_supported(drmfd, output->name)) {
-		igt_debug("DSC cannot be enabled without FEC on %s\n",
+		igt_info("DSC cannot be enabled without FEC on %s\n",
 			  output->name);
 		return false;
 	}
@@ -91,7 +91,7 @@ bool check_gen11_dp_constraint(int drmfd, igt_output_t *output, enum pipe pipe)
 
 	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) &&
 	    (pipe == PIPE_A) && IS_GEN11(devid)) {
-		igt_debug("DSC not supported on pipe A on external DP in gen11 platforms\n");
+		igt_info("DSC not supported on pipe %s on %s in gen11 platforms\n", kmstest_pipe_name(pipe), output->name);
 		return false;
 	}
 
@@ -126,7 +126,7 @@ void force_dsc_output_format(int drmfd, igt_output_t *output,
 static bool is_dsc_output_format_supported_by_source(int disp_ver, enum dsc_output_format output_format)
 {
 	if (disp_ver < 14 && output_format == DSC_FORMAT_YCBCR420) {
-		igt_debug("Output format DSC YCBCR420 not supported on D13 and older platforms\n");
+		igt_info("Output format DSC YCBCR420 not supported on D13 and older platforms\n");
 		return false;
 	}
 
@@ -140,7 +140,7 @@ bool is_dsc_output_format_supported(int drmfd, int disp_ver, igt_output_t *outpu
 		return false;
 
 	if (!igt_is_dsc_output_format_supported_by_sink(drmfd, output->name, output_format)) {
-		igt_debug("DSC %s output format not supported on connector %s\n",
+		igt_info("DSC %s output format not supported on connector %s\n",
 			  kmstest_dsc_output_format_str(output_format), output->name);
 		return false;
 	}
@@ -182,7 +182,7 @@ void restore_force_dsc_fractional_bpp_en(void)
 static bool is_dsc_fractional_bpp_supported_by_source(int disp_ver)
 {
 	if (disp_ver < 14) {
-		igt_debug("DSC fractional bpp not supported on D13 and older platforms\n");
+		igt_info("DSC fractional bpp not supported on D13 and older platforms\n");
 		return false;
 	}
 
@@ -195,7 +195,7 @@ bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *outp
 		return false;
 
 	if (!igt_is_dsc_fractional_bpp_supported_by_sink(drmfd, output->name)) {
-		igt_debug("DSC fractional bpp not supported on connector %s\n", output->name);
+		igt_info("DSC fractional bpp not supported on connector %s\n", output->name);
 		return false;
 	}
 
-- 
2.25.1

