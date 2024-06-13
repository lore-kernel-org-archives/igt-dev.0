Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4234C27C4F
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 10:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693F510EA12;
	Thu, 13 Jun 2024 10:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PmGuF7r0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB23810EA04
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 10:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718274266; x=1749810266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LBjrET4hBLb+kdD2f2IJ3XrD8uc4x5Qk3ogJL9LywrE=;
 b=PmGuF7r0T8GmqVTBYCE5Tz8tt6qakQJj9TeGDAZkd60F7JaCKRFgc8mk
 L/ycRIYVRWkY+EYhpUOM32sfbhOfqrbH5e9ru3DmgdrhCoE7npZzWkx/B
 PHymFnFlqDTAyOTrEzkfV2ph53uszTk2j9GPcsDjYFixvcDcKUpQeCpOM
 cjqMypJksLr2EQENTxv0QI+XeGPmTs1knC2auSpSYSCNdobpbxp3t9h8c
 YnOW35QyFySAuUKG0cuUBBO56rKw26y/g4SmuCmTdt1oUTh7OszZlVylA
 bQgCMGMDKopVkwziobWScAc4NV3uorvlOUBctR14Ze7903hkOV4HjrIla g==;
X-CSE-ConnectionGUID: Uk0KDOchRsqoA/ZFh6vOVQ==
X-CSE-MsgGUID: IHzFITqoQa+XSi62mZ9bNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18011151"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="18011151"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 03:24:25 -0700
X-CSE-ConnectionGUID: Nh8rPtGVT1KC5VvR+1tbLg==
X-CSE-MsgGUID: oC8bBAiSQ8msDIxBm1L0zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40214991"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 03:24:24 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	mitulkumar.ajitkumar.golani@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Manasi Navare <navaremanasi@chromium.org>
Subject: [i-g-t V2 2/4] tests/kms_vrr: Fix hardcoded step size
Date: Thu, 13 Jun 2024 15:46:31 +0530
Message-ID: <20240613101633.3804434-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240613101633.3804434-1-bhanuprakash.modem@intel.com>
References: <20240613101633.3804434-1-bhanuprakash.modem@intel.com>
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

In seamless-virtual subtest we are trying different Vrefresh
values between Vmin & Vmax by incrementing the Vrefresh by
by 10 Hz (hardcoded).

With this approach:
- We'll achieve less no. of refresh rates if VRR range is low
    Ex: We can achieve only 1 step between 40 to 60 Hz.
- Execution time will increase in case of high VRR range.
    Ex: We need 30 steps to reach 60 Hz to 360 Hz.

Instead of hardcoding the step size (10 Hz), allow test to
execute fixed number of steps (say 5 steps to reach Vmin to
Vmax) will guarantee to test (5) different refresh rates
between Vmin & Vmax irrespective of the VRR range.

Cc: Manasi Navare <navaremanasi@chromium.org>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 9245305f8..dec49eb12 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -665,6 +665,7 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 	uint32_t result;
 	unsigned int vrefresh;
 	uint64_t rate[] = {0};
+	uint32_t step_size;
 
 	igt_info("Use HIGH_RR Mode as default\n");
 	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
@@ -684,8 +685,14 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
 		     data->switch_modes[HIGH_RR_MODE].vrefresh, rate[0], result);
 
+	/*
+	 * Calculate step size by considering the no. of steps required to
+	 * reach Vmin to Vmax as 5.
+	 */
+	step_size = (data->range.max - data->range.min) / 5;
+
 	/* Switch to Virtual RR */
-	for (vrefresh = data->range.min + 10; vrefresh < data->range.max; vrefresh += 10) {
+	for (vrefresh = data->range.min + step_size; vrefresh < data->range.max; vrefresh += step_size) {
 		drmModeModeInfo virtual_mode = virtual_rr_vrr_range_mode(output, vrefresh);
 
 		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
-- 
2.43.2

