Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3791BC54E49
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 07:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD9E10EEE2;
	Mon, 26 Feb 2024 07:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AmnR1uT1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3C510EEE1
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 07:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708932396; x=1740468396;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZeCAB8K3goROLlxDRMs5PUObF5liu8nxst8x/KdEkgQ=;
 b=AmnR1uT1leDftoRLzE6DicEN7U6otVw5EcvIdnqjo83aO92Le+K0L5Q9
 TinuKb0bxohMoEllXpcXoyTSKhHfjoEj89jec5jji2V3wUEq4CTMb/oyD
 owokvzQLxFBri7/TxKnJxHEDE1hFLey4vXYwm43mAxSh8rqaP9aN7WSK4
 NLViuFlUdnRSZMFRg45Yq+I5kQQQCZD9a4EMDs4UzLEfEI3EDZ50lV2xm
 sB0Ezsr/uNDAP5SmEfBzLAY0GyuPws729kNcp3xDNufPWVFXCbInhoPv5
 gonwa/H6rkKfhrNBcJygo8/wNcbZAiKIzc8Nk+Rh3u63yLq8izwXnevxA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="6147559"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6147559"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 23:26:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6923236"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 23:26:35 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v6 2/9] tests/kms_vrr: Move vtest_ns into data_t
Date: Mon, 26 Feb 2024 12:50:28 +0530
Message-ID: <20240226072035.2620383-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226072035.2620383-1-bhanuprakash.modem@intel.com>
References: <20240226072035.2620383-1-bhanuprakash.modem@intel.com>
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

From: Sean Paul <seanpaul@chromium.org>

vtest_ns is derived from data->range which is fixed. Move it into data_t
and generate it once in prepare_test().

v2: (Bhanu)
- Rebase

Cc: Mark Yacoub <markyacoub@chromium.org>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index a9fcde821..26e3f257b 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -100,6 +100,12 @@ typedef struct range {
 	unsigned int max;
 } range_t;
 
+typedef struct vtest_ns {
+	uint64_t min;
+	uint64_t mid;
+	uint64_t max;
+} vtest_ns_t;
+
 typedef struct data {
 	igt_display_t display;
 	int drm_fd;
@@ -107,14 +113,9 @@ typedef struct data {
 	igt_fb_t fb[2];
 	range_t range;
 	drmModeModeInfo switch_modes[RR_MODES_COUNT];
+	vtest_ns_t vtest_ns;
 } data_t;
 
-typedef struct vtest_ns {
-	uint64_t min;
-	uint64_t mid;
-	uint64_t max;
-} vtest_ns_t;
-
 typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, uint32_t);
 
 /* Converts a timespec structure to nanoseconds. */
@@ -232,18 +233,6 @@ get_vrr_range(data_t *data, igt_output_t *output)
 	return range;
 }
 
-/* Returns vrr test frequency for min, mid & max range. */
-static vtest_ns_t get_test_rate_ns(range_t range)
-{
-	vtest_ns_t vtest_ns;
-
-	vtest_ns.min = rate_from_refresh(range.min);
-	vtest_ns.mid = rate_from_refresh(((range.max + range.min) / 2));
-	vtest_ns.max = rate_from_refresh(range.max);
-
-	return vtest_ns;
-}
-
 /* Returns true if driver supports VRR. */
 static bool has_vrr(igt_output_t *output)
 {
@@ -276,6 +265,11 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 
 	mode = *igt_output_get_mode(output);
 
+	data->vtest_ns.min = rate_from_refresh(data->range.min);
+	data->vtest_ns.mid = rate_from_refresh(
+				(data->range.min + data->range.max) / 2);
+	data->vtest_ns.max = rate_from_refresh(data->range.max);
+
 	/* Prepare resources */
 	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
 			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
@@ -341,7 +335,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 	uint64_t start_ns, last_event_ns, target_ns, exp_rate_ns;
 	uint32_t total_flip = 0, total_pass = 0;
 	bool front = false;
-	vtest_ns_t vtest_ns = get_test_rate_ns(data->range);
+	vtest_ns_t vtest_ns = data->vtest_ns;
 	uint64_t threshold_hi, threshold_lo;
 
 	if ((rate_ns <= vtest_ns.min) && (rate_ns >= vtest_ns.max))
@@ -423,7 +417,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 	prepare_test(data, output, pipe);
 	range = data->range;
-	vtest_ns = get_test_rate_ns(range);
+	vtest_ns = data->vtest_ns;
 	rate = vtest_ns.mid;
 
 	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
@@ -517,7 +511,7 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
 
 	prepare_test(data, output, pipe);
-	vtest_ns = get_test_rate_ns(data->range);
+	vtest_ns = data->vtest_ns;
 
 	if (vrr)
 		set_vrr_on_pipe(data, pipe, false, true);
-- 
2.43.0

