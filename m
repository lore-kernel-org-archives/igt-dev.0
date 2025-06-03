Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA46BC61CE5
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 11:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8401110E5C7;
	Tue,  3 Jun 2025 11:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NIYKIzHM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4FC10E5CD
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 11:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748949007; x=1780485007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kCa9o6Vi731l0KIVUgG1syzlXzoMjTo5cVCzT3lhADs=;
 b=NIYKIzHMJafPgPXTGY+hF4ZQNghtVs8W4vIqoHxbC9B7R1seGeWAmvLq
 CYOtoQzrWHXOjCtryuaIKGTuYY0m2QS6RoxAAZDVbHsS6+vxM3UmVWw4G
 INrhMLmkwTxr1NQujs/QIeVlMy7GThZVcErkKCo9hzKEsOqQwuKmEYIo1
 Z2dRSKXWFi44zTC2zPt6/BArSRT7h8tZ1mFTy8HG8vWKub0bpIk9kAFBs
 iwtAJL7qwQj3CcLNx+RPh2c+kKhAqO+A0e3pL9vph+D5SQHfTPtoyLM+R
 CNL55KxOBs0adRqaO6Kh6Xt7mfNHvE5lGR3SOET3dbhFUnPNSY08v7/xY g==;
X-CSE-ConnectionGUID: JSxe1vOnTTe1h+d1XwkWRA==
X-CSE-MsgGUID: o0WxW+zkQceOKigU2CDVxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="61603718"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="61603718"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 04:10:06 -0700
X-CSE-ConnectionGUID: YpsSHVaaSCqlHaTsHSJn5w==
X-CSE-MsgGUID: xb95d9h5RIamBAQ8Otk05g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149598299"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 04:10:04 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 George Zhang <george.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v5 2/9] tests/amdgpu: fix print formatting for 32-bit
 compilation
Date: Tue,  3 Jun 2025 11:11:00 +0000
Message-Id: <20250603111107.3170529-3-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603111107.3170529-1-jan.sokolowski@intel.com>
References: <20250603111107.3170529-1-jan.sokolowski@intel.com>
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
Reviewed-by: Vitaly Prosyak  <vitaly.prosyak@amd.com>
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

