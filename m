Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFAACCD1A5
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 08:52:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F50B10E1A1;
	Fri, 24 Oct 2025 08:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HyQFE9F6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2C910E1A1
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 08:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761295960; x=1792831960;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yAIetTu5SSB/rZvZGNBsYF8/eJ583e3eWayiwD0k4Xs=;
 b=HyQFE9F60QkXuuVvVs4fKGXTcdGVZIrmh4HTkZopQfN08ppPQ4Lr+C3v
 vBaOAELnnUVJDSVO5b6JfGWqOITotYRvcSEkcKVxJOqs7g5tIcP1yXRNl
 cfV+9jDSRua+wWDT6L9tCCMyDN59ba2hE6g49Dvvzj3tDGIlbL6eXP4iw
 JKBpa8NNzf3Khgf7dNP9Bck4k0zMtgsu1uQrdzQ50E8Akbd5eQqTJi3zV
 S0PksTOXvoooWXdd1ptyYHVMdx5/Efs41F3xgen0CYyvE0RmI1Egrc0IF
 SyI6x/rzDPxdDfPB/JaNwBzQtkcZ8RBysjoOimAZRyNm1mbERqULWkQX9 A==;
X-CSE-ConnectionGUID: +krjjXGVS0eDTKEuM6r4FA==
X-CSE-MsgGUID: FVfB5ymtQcCd9BG4vACIrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80910461"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="80910461"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:52:39 -0700
X-CSE-ConnectionGUID: pw0f/PZFRvKbcgCM+Axz9g==
X-CSE-MsgGUID: HwYjUyIjTiWMc6QX9F4w4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="189506488"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.46])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:52:37 -0700
Date: Fri, 24 Oct 2025 10:52:34 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevaka.badrappan@intel.com, 
 kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t v7 1/3] lib/intel_allocator: Add SYSVIPC support
 check
Message-ID: <qi5zts5dskwtgcs64gnitt57ljgotw3xgtvkcd4eadysf5oe55@m27hjejs5ddt>
References: <20251023063113.3485132-1-s.sebinraj@intel.com>
 <20251023063113.3485132-2-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251023063113.3485132-2-s.sebinraj@intel.com>
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

On Thu, Oct 23, 2025 at 12:01:11PM +0530, S Sebinraj wrote:
> Check for System V IPC support in kms_concurrent test to handle
> targets that don't have SYSVIPC enabled in their kernel. Without this
> check, the test would fail with assertion errors when trying to use
> message queues.
> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  lib/intel_allocator.c | 39 ++++++++++++++++++++++++++++++++++++---
>  lib/intel_allocator.h |  4 ++--
>  2 files changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
> index d22c70f1f..6664b004a 100644
> --- a/lib/intel_allocator.c
> +++ b/lib/intel_allocator.c
> @@ -250,6 +250,20 @@ static struct allocator *__allocator_find(int fd, uint32_t ctx, uint32_t vm)
>  	return igt_map_search(map, &al);
>  }
>  
> +/**
> + * Checks if the current system supports SYSVIPC by verifying the existence and accessibility
> + * of the /proc/sysvipc directory.
> + * Returns: true if accessible for read and write, false otherwise.
> + */
> +static bool system_supports_sysvipc(void)
> +{
> +	if (access("/proc/sysvipc", R_OK | W_OK) == 0)
> +		return true;
> +
> +	alloc_debug("SYSVIPC not supported, cannot access /proc/sysvipc\n");
> +	return false;
> +}
> +
>  static struct allocator *__allocator_find_by_handle(uint64_t handle)
>  {
>  	struct handle_entry *h, he = { .handle = handle };
> @@ -803,12 +817,17 @@ static void *allocator_thread_loop(void *data)
>   * How to separate initialization steps take a look into api_intel_allocator.c
>   * fork_simple_stress() function.
>   */
> -void __intel_allocator_multiprocess_prepare(void)
> +bool __intel_allocator_multiprocess_prepare(void)
>  {
>  	intel_allocator_init();
>  
> +	if (!channel) {
> +		return false;
> +	}
> +

Unnecessary curly braces.

>  	multiprocess = true;
>  	channel->init(channel);
> +	return true;
>  }
>  
>  #define START_TIMEOUT_MS 100
> @@ -839,14 +858,21 @@ void __intel_allocator_multiprocess_start(void)
>   *
>   * Note. This destroys all previously created allocators and theirs content.
>   */
> -void intel_allocator_multiprocess_start(void)
> +bool intel_allocator_multiprocess_start(void)
>  {
>  	alloc_info("allocator multiprocess start\n");
>  
>  	igt_assert_f(child_pid == -1,
>  		     "Allocator thread can be spawned only in main IGT process\n");
> -	__intel_allocator_multiprocess_prepare();
> +
> +	if(!__intel_allocator_multiprocess_prepare()) {

Missing space after if.

With nits addressed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +		igt_warn("System does not support multiprocess mode\n");
> +		return false;
> +	}
> +
>  	__intel_allocator_multiprocess_start();
> +
> +	return true;
>  }
>  
>  /**
> @@ -1678,6 +1704,13 @@ void intel_allocator_init(void)
>  	__free_maps(vm_map, false);
>  	__free_ahnd_map();
>  
> +	if (!system_supports_sysvipc()) {
> +		alloc_debug("System doesn't support SysV IPC, "
> +			   "multiprocess mode unsupported\n");
> +		channel = NULL;
> +		return;
> +	}
> +
>  	atomic_init(&next_handle, 1);
>  	handles = igt_map_create(hash_handles, equal_handles);
>  	ctx_map = igt_map_create(hash_instance, equal_ctx);
> diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
> index 4b6292f06..9cd83ea27 100644
> --- a/lib/intel_allocator.h
> +++ b/lib/intel_allocator.h
> @@ -164,9 +164,9 @@ struct intel_allocator {
>  };
>  
>  void intel_allocator_init(void);
> -void __intel_allocator_multiprocess_prepare(void);
> +bool __intel_allocator_multiprocess_prepare(void);
>  void __intel_allocator_multiprocess_start(void);
> -void intel_allocator_multiprocess_start(void);
> +bool intel_allocator_multiprocess_start(void);
>  void intel_allocator_multiprocess_stop(void);
>  
>  uint64_t intel_allocator_open(int fd, uint32_t ctx, uint8_t allocator_type);
> -- 
> 2.43.0
> 
