Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB50C54E4A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 05:18:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C881010E380;
	Thu, 29 Feb 2024 05:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cC1mPX+N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD0310E324
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 05:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709183936; x=1740719936;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZeCAB8K3goROLlxDRMs5PUObF5liu8nxst8x/KdEkgQ=;
 b=cC1mPX+Nm4xPyYv4pRoRU+rrVeVMdb5sRNiZSVkHeHDOlPbDuLWuJAc/
 0u3FIOH/EUJq0kVuXrao5Ln2z7kyHtyp2GsCLkprynPQNH8t5Q7k3CY/v
 A3LlLcEHMuV02Qkk1Lhfe7MO0qjIRDOTJd3Ezd9ivOaqIYkRSZIDcqles
 TmYYqJVjvAHpUFoZG2ocxXdAted7eXdAhqLJb+GxO+iAvGrnTj/2vRfiC
 eojgifBsZybk49fB6KqGX49rCarHVAC3d14DH0PMoBQ3AQWYxqLXan1cU
 +sam2n1bhqZKdheD8bq4ObBSBPpNBTTgJtF5E4HJA4SPl3DCs6vKxek0k w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14780745"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; d="scan'208";a="14780745"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 21:18:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; d="scan'208";a="12250004"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 21:18:54 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v7 2/8] tests/kms_vrr: Move vtest_ns into data_t
Date: Thu, 29 Feb 2024 10:42:44 +0530
Message-ID: <20240229051250.2939774-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229051250.2939774-1-bhanuprakash.modem@intel.com>
References: <20240229051250.2939774-1-bhanuprakash.modem@intel.com>
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

