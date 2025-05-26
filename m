Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C408C5AD49
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 11:28:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E2A10E34E;
	Mon, 26 May 2025 11:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYJZyB6w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD6F10E34E
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 11:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748258912; x=1779794912;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/VNBQKJULLN3c8/yNORF4vlOZWDfY7h+m5ghlbehQ8Y=;
 b=XYJZyB6wX0pQnvpqszfnEceLVQ8UIBYOYgQgOsfAnsqAy/Vowz20SZMB
 TPE+L/yG6ECR1XbxKWZzIJY/5MftPEDrVHA9UwEqve7yhzY7mPCP2IofT
 jxRfc87lNjUPoggXykguA5bG+uqJvATvRt+8l759hC80sPDk64U2K/1u/
 aijEGeZNXm7GXtTlFov2PkntN3p0HJDPPkE2FmUkyLkc0Y2FtWSQZanui
 76W6jhoiOI+nI0Djl67wjP890FWes+pMv5F7AgFzCcKAu9DIEwOUoQNtK
 oNDJ4UNs06HD5F+k2QY3SBf7cSvc2v4O2PXsJdl4qK2LXRAIC8p6XEYRi A==;
X-CSE-ConnectionGUID: +O4+LYKyTqKDGO61MRxM6Q==
X-CSE-MsgGUID: TgkLJ+I7T5G9V0XE/fWGVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="37855142"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="37855142"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 04:28:32 -0700
X-CSE-ConnectionGUID: WLenD5GwSNuUXk2E4A2msQ==
X-CSE-MsgGUID: E/5XvGnHR5qbdfdh4INvPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="142249507"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 04:28:30 -0700
Date: Mon, 26 May 2025 13:28:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, George Zhang <george.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t v3 2/8] tests/amdgpu: fixup print/scan formatting
 for files in tests
Message-ID: <20250526112828.zvie244utt57y43h@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 igt-dev@lists.freedesktop.org, George Zhang <george.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250526080740.67790-1-jan.sokolowski@intel.com>
 <20250526080740.67790-3-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250526080740.67790-3-jan.sokolowski@intel.com>
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

Hi Jan,
On 2025-05-26 at 08:07:34 +0000, Jan Sokolowski wrote:
> Compiling on other architectures than x86-64 causes a lot
> of print/scan formatting warnings.
> 
> Fix formatting by using proper formatters, eg. PRIu64.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> Cc: George Zhang <george.zhang@amd.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/amdgpu/amd_freesync_video_mode.c | 4 ++--
>  tests/amdgpu/amd_info.c                | 2 +-
>  tests/amdgpu/amd_ras.c                 | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
> index 7716598dc..adfc8a810 100644
> --- a/tests/amdgpu/amd_freesync_video_mode.c
> +++ b/tests/amdgpu/amd_freesync_video_mode.c
> @@ -482,7 +482,7 @@ static int prepare_custom_mode(
>  	den = refresh_rate * 1000 * (unsigned long long)base_mode->htotal;
>  	target_vtotal = num / den;
>  	target_vtotal_diff = target_vtotal - base_mode->vtotal;
> -	igt_debug("num=%lu, den=%lu, target_vtotal=%lu, target_vtotal_diff=%lu, base_mode->vtotal=%d\n",
> +	igt_debug("num=%" PRIu64 ", den=%" PRIu64 ", target_vtotal=%" PRIu64 ", target_vtotal_diff=%" PRIu64 ", base_mode->vtotal=%d\n",
>  		num, den, target_vtotal, target_vtotal_diff, base_mode->vtotal);
>  
>  	/* Check for illegal modes */
> @@ -634,7 +634,7 @@ flip_and_measure(
>  	do_flip(data);
>  	start_ns = last_event_ns = target_ns = get_kernel_event_ns(data,
>  							DRM_EVENT_FLIP_COMPLETE);
> -	igt_debug("interval_ns=%lu\n", interval_ns);
> +	igt_debug("interval_ns=%" PRIu64 "\n", interval_ns);
>  
>  	for (;;) {
>  		uint64_t event_ns, wait_ns;
> diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
> index 53706003f..ace739da4 100644
> --- a/tests/amdgpu/amd_info.c
> +++ b/tests/amdgpu/amd_info.c
> @@ -73,7 +73,7 @@ query_timestamp_test(amdgpu_device_handle dev, uint32_t sleep_time, int sample_c
>  
>  		/* make sure the GPU timestamps are ordered */
>  		igt_assert_f(gpu_delta > 0,
> -			     "The GPU time is not moving or is ticking in the wrong direction (start=%lu, end=%lu, end-start=%lu)\n",
> +			     "The GPU time is not moving or is ticking in the wrong direction (start=%" PRIu64 ", end=%" PRIu64 ", end-start=%" PRIu64 "\n",
>  			     ts_start, ts_end, gpu_delta);
>  
>  		igt_stats_push_float(&stats, corrected_gpu_delta / cpu_delta);
> diff --git a/tests/amdgpu/amd_ras.c b/tests/amdgpu/amd_ras.c
> index c9307395a..fdf1bc27d 100644
> --- a/tests/amdgpu/amd_ras.c
> +++ b/tests/amdgpu/amd_ras.c
> @@ -765,7 +765,7 @@ __amdgpu_ras_ip_inject_test(struct amd_ras_single_test_setup *test,
>  			}
>  			timeout -= 1;
>  		}
> -		igt_info("\t%4s: test:%s block:%s sub-block:%d error type:%s address:%ld value:%ld\n",
> +		igt_info("\t%4s: test:%s block:%s sub-block:%d error type:%s address:%" PRIu64 " value:%" PRIu64 "\n",
>  				pass ? "Pass" : "Fail",
>  				ip_test[i].name,
>  				ip_test[i].block,
> -- 
> 2.34.1
> 
