Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8BDC2BD09
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 04:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877DA10E326;
	Mon, 24 Jun 2024 04:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UuPPH6AS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6125410E326
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 04:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719202460; x=1750738460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Q99NiXfhVwOl9FWbEYma8J0UAMwwZcEThHO/pphSx4=;
 b=UuPPH6ASoFmx7V2WLfjpPcCTEbp9CJ/i5Gc6+jZBLRAN7+7hUwoB78he
 hiwXsYMAEZeJxa+1tqup0f3/WEPE/UmEhHoQbHh9nk7k9Du5cR15IICPw
 DzMmYU2NNYO3qCtUCc/lyFpw6FO1vniQwI3qrMnyiq7ZBmD/iioR4C81y
 lDMN5E0Qs1IN7cso63O+g7BjYDb2tq+T0fsYAevyHR5X+yh/Cxzr1+9on
 tgw6ALVYLZvnA5dXWxqWRmBJwyfDxe4uzJQcw9y8WsJ030yqbrBpDEOja
 M4xo+TgrpNrXEuGn23+CR56xtPbtbhz3uj2uoj5wJIfLwa2Ja2CucJatM Q==;
X-CSE-ConnectionGUID: ANYepG9PTVmJNpXJ59maUA==
X-CSE-MsgGUID: Ljgo/r06THOJ7pv9dVB6AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="41559542"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="41559542"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2024 21:14:19 -0700
X-CSE-ConnectionGUID: 6EcwF6BxS4C/fI6gqxKpQg==
X-CSE-MsgGUID: AJpxqdfeTymQv0W8kmWjkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="48121151"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2024 21:14:17 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Manasi Navare <navaremanasi@chromium.org>,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [i-g-t V2 3/4] tests/kms_vrr: Cleanup in creating the virtual mode
Date: Mon, 24 Jun 2024 09:36:11 +0530
Message-ID: <20240624040611.172063-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240621084711.68444-4-bhanuprakash.modem@intel.com>
References: <20240621084711.68444-4-bhanuprakash.modem@intel.com>
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

Cleanup the function to create the virtual mode, so
that it could be re-used.

V2: - Fix argument type (Bhanu)

Cc: Manasi Navare <navaremanasi@chromium.org>
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 2ea90cd8e..7e8885f16 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -229,16 +229,13 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
 	return mode;
 }
 
-static drmModeModeInfo
-virtual_rr_vrr_range_mode(igt_output_t *output, unsigned int virtual_refresh_rate)
+static void
+virtual_rr_vrr_range_mode(drmModeModeInfo *mode, float virtual_refresh_rate)
 {
-	drmModeModeInfo mode = *igt_output_get_mode(output);
-	uint64_t clock_hz = mode.clock * 1000;
+	uint64_t clock_hz = mode->clock * 1000;
 
-	mode.vtotal = clock_hz / (mode.htotal * virtual_refresh_rate);
-	mode.vrefresh = virtual_refresh_rate;
-
-	return mode;
+	mode->vtotal = clock_hz / (mode->htotal * virtual_refresh_rate);
+	mode->vrefresh = virtual_refresh_rate;
 }
 
 static bool
@@ -741,6 +738,7 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 	unsigned int vrefresh;
 	uint64_t rate[] = {0};
 	uint32_t step_size;
+	drmModeModeInfo virtual_mode;
 
 	igt_info("Use HIGH_RR Mode as default\n");
 	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
@@ -767,8 +765,10 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 	step_size = (data->range.max - data->range.min) / 5;
 
 	/* Switch to Virtual RR */
+	virtual_mode = *igt_output_get_mode(output);
+
 	for (vrefresh = data->range.min + step_size; vrefresh < data->range.max; vrefresh += step_size) {
-		drmModeModeInfo virtual_mode = virtual_rr_vrr_range_mode(output, vrefresh);
+		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
 
 		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
 		kmstest_dump_mode(&virtual_mode);
-- 
2.43.2

