Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333DAC3ABD8
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 11:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BA310E355;
	Mon, 19 May 2025 11:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDLiNkbm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6C010E324
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 11:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747654171; x=1779190171;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4F1f5WhyywboKgLEgL6BQJmGL63JwTTAQ4aVd35mLbI=;
 b=PDLiNkbmWB+oQq0MyuauF0+xVJ15OmOgomSiYDMB4lXbR60zLMOdrzkc
 t2C56jqmr9lQ+gBDUQ5GlZYNdSTQ/IaryYYC+3tKoP1X6GXbmLg9eWqhq
 96NBB/DIFyVuMsRxrIJvnUxLPybNjxrhTQ0o729p3QVb2RNU1nn7DyJKB
 no3yAFUBHSY335KZZMN1+Yx39YPMXhdCDN86NghY3GI+tOQWT7NtvFWeA
 kp6HSw9t+jMxvbEQotfmxxkKwaCrkt47Hw37p1/RTa1ZM6F0e8cDBEJoe
 +5YI6WI5NaHYO811H6OGRPPNIdi/iPkBF+19g9T/9i1trW/hlM7PW+7cV g==;
X-CSE-ConnectionGUID: LrdpDtvRSo6GuhcDnYflHg==
X-CSE-MsgGUID: +zfmSmKhQgOLiHlMK+A/lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="53347309"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="53347309"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 04:29:30 -0700
X-CSE-ConnectionGUID: yi4FGJBqRvWvYsl9WBYI3Q==
X-CSE-MsgGUID: UaVyA/qFQ/qrMsnHR6jzRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="139385799"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 04:29:29 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 George Zhang <george.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH i-g-t v2 2/8] tests/amdgpu: fixup print/scan formatting for
 files in tests
Date: Mon, 19 May 2025 11:30:04 +0000
Message-Id: <20250519113010.125751-3-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519113010.125751-1-jan.sokolowski@intel.com>
References: <20250519113010.125751-1-jan.sokolowski@intel.com>
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

Compiling on other architectures than x86-64 causes a lot
of print/scan formatting warnings.

Fix formatting by using proper formatters, eg. PRIu64.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: George Zhang <george.zhang@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_freesync_video_mode.c | 4 ++--
 tests/amdgpu/amd_info.c                | 2 +-
 tests/amdgpu/amd_ras.c                 | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index 7716598dc..adfc8a810 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -482,7 +482,7 @@ static int prepare_custom_mode(
 	den = refresh_rate * 1000 * (unsigned long long)base_mode->htotal;
 	target_vtotal = num / den;
 	target_vtotal_diff = target_vtotal - base_mode->vtotal;
-	igt_debug("num=%lu, den=%lu, target_vtotal=%lu, target_vtotal_diff=%lu, base_mode->vtotal=%d\n",
+	igt_debug("num=%" PRIu64 ", den=%" PRIu64 ", target_vtotal=%" PRIu64 ", target_vtotal_diff=%" PRIu64 ", base_mode->vtotal=%d\n",
 		num, den, target_vtotal, target_vtotal_diff, base_mode->vtotal);
 
 	/* Check for illegal modes */
@@ -634,7 +634,7 @@ flip_and_measure(
 	do_flip(data);
 	start_ns = last_event_ns = target_ns = get_kernel_event_ns(data,
 							DRM_EVENT_FLIP_COMPLETE);
-	igt_debug("interval_ns=%lu\n", interval_ns);
+	igt_debug("interval_ns=%" PRIu64 "\n", interval_ns);
 
 	for (;;) {
 		uint64_t event_ns, wait_ns;
diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
index 53706003f..ace739da4 100644
--- a/tests/amdgpu/amd_info.c
+++ b/tests/amdgpu/amd_info.c
@@ -73,7 +73,7 @@ query_timestamp_test(amdgpu_device_handle dev, uint32_t sleep_time, int sample_c
 
 		/* make sure the GPU timestamps are ordered */
 		igt_assert_f(gpu_delta > 0,
-			     "The GPU time is not moving or is ticking in the wrong direction (start=%lu, end=%lu, end-start=%lu)\n",
+			     "The GPU time is not moving or is ticking in the wrong direction (start=%" PRIu64 ", end=%" PRIu64 ", end-start=%" PRIu64 "\n",
 			     ts_start, ts_end, gpu_delta);
 
 		igt_stats_push_float(&stats, corrected_gpu_delta / cpu_delta);
diff --git a/tests/amdgpu/amd_ras.c b/tests/amdgpu/amd_ras.c
index c9307395a..fdf1bc27d 100644
--- a/tests/amdgpu/amd_ras.c
+++ b/tests/amdgpu/amd_ras.c
@@ -765,7 +765,7 @@ __amdgpu_ras_ip_inject_test(struct amd_ras_single_test_setup *test,
 			}
 			timeout -= 1;
 		}
-		igt_info("\t%4s: test:%s block:%s sub-block:%d error type:%s address:%ld value:%ld\n",
+		igt_info("\t%4s: test:%s block:%s sub-block:%d error type:%s address:%" PRIu64 " value:%" PRIu64 "\n",
 				pass ? "Pass" : "Fail",
 				ip_test[i].name,
 				ip_test[i].block,
-- 
2.34.1

