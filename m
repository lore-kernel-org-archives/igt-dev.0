Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D08FC27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 08:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FAE10F0DF;
	Fri, 21 Jun 2024 08:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzb4yvdX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8639010F0DF
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 08:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718960124; x=1750496124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YZc59ptspheW2KpP8Hx86MoOIVX4my75cIt0z4F6+0g=;
 b=bzb4yvdXKtdt6LwLVAAvyVYfXt+jsyi1gqXy9oG30/FD//su6JnH3aZq
 Q8L9RHpi7rI/TJrpCuN6vfHwGgVaWjhXM+A0wjgsRGsoPo/MZ6RKWRLHY
 eoME5aeOsTfooC/ZwJTT84KJPd9CRrGJzKr1ydwMUYkpIvmcySdyYAz0V
 8M7ZyrwK3n4s6QpcOf4y8uayB9gpwmEEb77z3RRXMw8DrdDlICbiF3uRi
 O5DPzryHBHd+OA2XpnECmOkppXUnmLdfESsvpWI0nElsGusVPBFK9OqDd
 c+JO5eHa/jcR3owwZ/Kk5qLgnMSeQu9/hbXL0n84esV87Y2PRyXwYlpEK w==;
X-CSE-ConnectionGUID: r1qUUnsRQ6+roSOqMItnYA==
X-CSE-MsgGUID: 9tRTWVmZSrGAlYFkUzSgSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="41387673"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="41387673"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 01:55:24 -0700
X-CSE-ConnectionGUID: 8p1T/fu2SfKp5TSwYxjxfQ==
X-CSE-MsgGUID: NrzRLOmPT3SZT8YBfv5g/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="42609065"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 01:55:22 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Manasi Navare <navaremanasi@chromium.org>,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [i-g-t 3/4] tests/kms_vrr: Cleanup in creating the virtual mode
Date: Fri, 21 Jun 2024 14:17:10 +0530
Message-ID: <20240621084711.68444-4-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240621084711.68444-1-bhanuprakash.modem@intel.com>
References: <20240621084711.68444-1-bhanuprakash.modem@intel.com>
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

Cc: Manasi Navare <navaremanasi@chromium.org>
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 2ea90cd8e..6f90f4729 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -229,16 +229,13 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
 	return mode;
 }
 
-static drmModeModeInfo
-virtual_rr_vrr_range_mode(igt_output_t *output, unsigned int virtual_refresh_rate)
+static void
+virtual_rr_vrr_range_mode(drmModeModeInfo *mode, unsigned int virtual_refresh_rate)
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

