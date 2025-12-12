Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B39D49226
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 13:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EDA10E72A;
	Fri, 12 Dec 2025 13:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4jrzQKp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA5E10E72A
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 13:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765546479; x=1797082479;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KDTlFTCa/ofSQ+lDdiKUDky1I04DVX84zLrfH9BaXoA=;
 b=R4jrzQKpkcEoan9pbquxPkXdB5jix7002WX1LVMYV2nRv2yVtknXoknR
 PZSLbPyL94KvkzRvKUdtbKIiD9wgR/RXtdQm38lg2afDPWWWvuOI3FTum
 mIFNqGLrzirIQKj5Gy+NxYc5GLp6o2C74yM1x3gB7ZIZkIkb36ayzIvGk
 GQ1sKztIf22oeg3me8mgVyr5FnxF7mlz4tPqWQ/K/xd09BhVE3F0m5vdc
 bi6NmhOUIswU1bZjMxA/KgQqzwdUFl3jfJDlh9g3/veNQsiwAHSfjFP9a
 Ups3Js+X4pb9/pUI33Efqb9Q+U1dB+doolmzP2bTkJHnrUt4ewh/EUb8U w==;
X-CSE-ConnectionGUID: YG7OB6KSQAafrUrIrQVfpA==
X-CSE-MsgGUID: htnJdgNAREKxkfDhIxTI+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78663304"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="78663304"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 05:34:39 -0800
X-CSE-ConnectionGUID: f5jGF7tnTuS0uE6n4Aly3w==
X-CSE-MsgGUID: bLmLt+jRR56F5rnBDxoRug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="197156361"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 05:34:37 -0800
Date: Fri, 12 Dec 2025 14:34:34 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevaka.badrappan@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t] lib/intel_allocator: Fix Tile-4 format tests crash
 by initializing maps before SysV IPC check
Message-ID: <20251212133434.2c7jqcjwkthrweqg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, igt-dev@lists.freedesktop.org,
 jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com
References: <20251211095233.1172089-1-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251211095233.1172089-1-s.sebinraj@intel.com>
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

Hi S,
On 2025-12-11 at 15:22:33 +0530, S Sebinraj wrote:
> The allocator was incorrectly gating essential map initialization behind
> the SysV IPC availability check. This caused crashes in tests using tiled
> formats like Tile-4 on systems where sysvipc is not accessible.
> 
> Root Cause:
> -----------
> Tile-4 (and other tiled formats) require GPU blitter operations to convert
> between tiled and linear layouts for Cairo drawing. This conversion path
> needs the allocator to provide GPU virtual addresses for blitter commands.
> 
> Linear formats bypass this entirely - Cairo can write directly to CPU-mapped
> memory without GPU operations, so the allocator is never accessed and the
> bug remains hidden.
> 
> intel_allocator_init() checked system_supports_sysvipc() and returned
> early if the check failed, leaving ctx_map and vm_map uninitialized
> when Tile-4 tests triggered blitter operations, the allocator
> tried to search these NULL maps causing SIGSEGV.
> 
> Call stack at crash:
>   - igt_get_cairo_surface(tile4_fb)
>     - blitcopy(tile4 -> linear)
>       - intel_allocator_open()
>        - allocator_find()
>           - igt_map_search(NULL ctx_map) -> SIGSEGV
> 
> Solution:
> ---------
> Initialize allocator maps (handles, ctx_map, vm_map, ahnd_map)
> unconditionally as they are required for single-process GPU operations,
> not just multi-process IPC scenarios.
> 
> Impact:
> - Tile-4 and tiled format tests
> 
> Tested with kms_plane_lowres --run-subtest tiling-4 on PTL/ADL.
> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>

Thank you all for this fix, I merged it with corrections
in description.

Regards,
Kamil

> ---
>  lib/intel_allocator.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
> index fddd0f3b3..55728057a 100644
> --- a/lib/intel_allocator.c
> +++ b/lib/intel_allocator.c
> @@ -1703,12 +1703,6 @@ void intel_allocator_init(void)
>  	__free_maps(vm_map, false);
>  	__free_ahnd_map();
>  
> -	if (!system_supports_sysvipc()) {
> -		alloc_debug("System doesn't support SysV IPC\n");
> -		channel = NULL;
> -		return;
> -	}
> -
>  	atomic_init(&next_handle, 1);
>  	handles = igt_map_create(hash_handles, equal_handles);
>  	ctx_map = igt_map_create(hash_instance, equal_ctx);
> @@ -1717,6 +1711,12 @@ void intel_allocator_init(void)
>  	ahnd_map = igt_map_create(igt_map_hash_64, igt_map_equal_64);
>  	igt_assert(handles && ctx_map && vm_map && ahnd_map);
>  
> +	if (!system_supports_sysvipc()) {
> +		alloc_debug("System doesn't support SysV IPC\n");
> +		channel = NULL;
> +		return;
> +	}
> +
>  	channel = intel_allocator_get_msgchannel(CHANNEL_SYSVIPC_MSGQUEUE);
>  }
>  
> -- 
> 2.43.0
> 
