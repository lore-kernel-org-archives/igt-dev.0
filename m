Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65015C46CD2
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 05:49:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A813112DB0;
	Tue, 30 Jan 2024 05:49:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A47112DB0
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2024 05:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706593757; x=1738129757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZeCAB8K3goROLlxDRMs5PUObF5liu8nxst8x/KdEkgQ=;
 b=TYxFc/ymWg4oR0a4RCeJxkJAcO8mL4E87W/W+FeqH/FA10/2osKrvBkL
 IObcYV9QqV7tXOC6JR9B6OiGMcypx0eOw9ppD2p0zpNnxZ7ohFCkAvlkz
 ou6jVtj6o/TMdx3PnM+7jEYxZmHOtOhM3x6jYef9zOW5tP+gs4aVm+Jq+
 RoG3sKjLGXDmo+csd5ryKwVuYIhgNK3z75s1PzAdmJQgSblg931v9Dtys
 spq6xtiQ/cymD7WSs5AuIkre6oPKmDByreJOeNpw0LrtZ+34DDer3jeFg
 Equd5m8oYe/48IPX3W8j/4RKOCDzo9NKhf0ZEaxPJsBiSlt2FDRZ0pAYg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="393609608"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="393609608"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 21:49:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="3603128"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 21:49:15 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v5 2/9] tests/kms_vrr: Move vtest_ns into data_t
Date: Tue, 30 Jan 2024 11:12:28 +0530
Message-ID: <20240130054235.533132-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130054235.533132-1-bhanuprakash.modem@intel.com>
References: <20240130054235.533132-1-bhanuprakash.modem@intel.com>
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
Cc: Sean Paul <seanpaul@chromium.org>
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

