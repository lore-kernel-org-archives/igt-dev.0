Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBCAC54F30
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 12:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A79A10E4AC;
	Tue, 27 May 2025 12:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPiJUpe4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FC810E4C7
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 12:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748347408; x=1779883408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6QKVBUZKnoal4ybnxmUlAfDoSPRfkAhHh7PcPcA3+78=;
 b=LPiJUpe4/Tj9gU/yrJ29P9FKaAghFb9RO4yH09NpD630C7Yd2zMqxsBe
 VdW1lQCGeTXJQK1Naba9IoHqxMNvIIqNTgC2cv4kxp3qvQTOdA8M3+WAx
 C1nePvX0/Ahj6IuvKi7eVdh7bUTrvA4OYNkReuvsbBuGk0q/vp/H/O3aq
 osBBgPt9YaIVBnyrV6AkHdpXpZCx3xj0N3iegVuwl6XM07V4Pcwbh2JgD
 CDJhP/4B/0Q45HgQJXULnTkqvF5TM/mOvFVkpow2Zfk7l2yW+RZiSk+P/
 Q6WG406GKwnBqxGcAJU618A2zOMdMItGOrMzuuMGxDbV0oV/twlY6oiEu Q==;
X-CSE-ConnectionGUID: 6ImBA0UKReuAsv0qB1p5zg==
X-CSE-MsgGUID: t+1TT83LSdqP/rCm2YV0jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="61687788"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="61687788"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:03:28 -0700
X-CSE-ConnectionGUID: kHRyW8glRYmG6mUOPqtbTg==
X-CSE-MsgGUID: lrxHNUodTYeYG6NYSkOAVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147558000"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:03:26 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 George Zhang <george.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v4 2/9] tests/amdgpu: fixup print formatting for files
 in tests
Date: Tue, 27 May 2025 12:04:14 +0000
Message-Id: <20250527120421.79026-3-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527120421.79026-1-jan.sokolowski@intel.com>
References: <20250527120421.79026-1-jan.sokolowski@intel.com>
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
of print formatting warnings.

Fix formatting by using proper formatters, eg. PRIu64.

Cc: George Zhang <george.zhang@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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

