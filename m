Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6F0C54FB3
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 08:06:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A0810E295;
	Mon, 26 May 2025 08:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+9SaFk8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29CA10E09C
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 08:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748246809; x=1779782809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4F1f5WhyywboKgLEgL6BQJmGL63JwTTAQ4aVd35mLbI=;
 b=i+9SaFk8QRPgngEJ+eSnD6Z2XVCoPK8mXmqXxwwy6DTQL3tw6bofNRSr
 fVQFfrdqfpoCvtprTGyfeYSHQJ/zKWJV5ybLg0HFhJhY/f9ng+Me0CfCM
 yElEV5mIbRe6tPgcQTp49RlEXwZL6+FmhbtVEslsLAuvr3mmCEAvNESE8
 z93t23Cozr4P3itxqhHpSjsuKSIeUvUezcVD47bnaoVY+k+Gq9pY98nje
 nWZHewesU7aD7/m2zjCbUd1kP4lIwEKSq8ks7IRF2xbCBV65pREG3YHnE
 wDlVtI2hWvisuX6+Lmj9gaf0/qboDCZjdCuzLzLH3yVdlIMswWrMgsgbO Q==;
X-CSE-ConnectionGUID: Gw2DZZj9TYCIMNANwTEiTg==
X-CSE-MsgGUID: cbnudZjFS8S/5e9VhALyFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="67762836"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="67762836"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 01:06:48 -0700
X-CSE-ConnectionGUID: RbG51JXBTwa4q/MpnJjAvA==
X-CSE-MsgGUID: AOi8lomvSv+LAe8RMv6oJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="142208355"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 01:06:47 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 George Zhang <george.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH i-g-t v3 2/8] tests/amdgpu: fixup print/scan formatting for
 files in tests
Date: Mon, 26 May 2025 08:07:34 +0000
Message-Id: <20250526080740.67790-3-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526080740.67790-1-jan.sokolowski@intel.com>
References: <20250526080740.67790-1-jan.sokolowski@intel.com>
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

