Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69E7CC6B39
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 15:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5108C10F3A6;
	Thu, 15 Oct 2026 15:51:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF6E10E5CA
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 15:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792079451; x=1823615451;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cnuPpjNmh/FxAVJeepPuRQbb7HROAjnlwz3Uka1K344=;
 b=f7BFtIwc//8dvhKA5gBMH0QRtT3fIdCFfvIu5VpkUAWlqxDF18xMHTJR
 tEK4560ajNFeCj9p0/p5x6gPqxIFQCgmp1ThkaA/WriibrfN9WLsk+FpT
 jZ+36PPc7ZSfXrVppe5o3A9f95fKqAu1zS/vFhBtndrkBOy1GtMd3nJoN
 M9yyY43eZwEcRDZt640jVQSeV6mIpNc4ZSZO1xGg8c730Smh8zNPpjk/5
 iBHddoTRsbRJRxC6wyC+7JI7clrzuCkN6Pe+NUz4iLYqKrTO9IjF+V/re
 ctb23OvhJ46wOG+b2OfQFvZWwSr5z5DuuCUoc4aJeZ2wwE5JiMXpyXfoX g==;
X-CSE-ConnectionGUID: qVdFFC6gSASInP/u8dA6PQ==
X-CSE-MsgGUID: 7bWt2jy+T2qUxewfpuwghQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="854710"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="854710"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:50:44 -0700
X-CSE-ConnectionGUID: oo8SEu0MTFy29yG7CyFSrQ==
X-CSE-MsgGUID: +kHb+mosQRmFkpg05v5Aag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="3475268"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:50:43 -0700
Date: Thu, 15 Oct 2026 17:50:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniel Stone <daniels@collabora.com>
Cc: igt-dev@lists.freedesktop.org, boris.brezillon@collabora.com,
 laura.nao@collabora.com, adrian.larumbe@collabora.com,
 daniel.almeida@collabora.com, liviu.dudau@arm.com
Subject: Re: [PATCH 1/4] panthor: Use all available GPU cores
Message-ID: <20261015155040.sjfklacavytwwrtp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniel Stone <daniels@collabora.com>, igt-dev@lists.freedesktop.org,
 boris.brezillon@collabora.com, laura.nao@collabora.com,
 adrian.larumbe@collabora.com, daniel.almeida@collabora.com,
 liviu.dudau@arm.com
References: <20261015130837.710795-1-daniels@collabora.com>
 <20261015130837.710795-2-daniels@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015130837.710795-2-daniels@collabora.com>
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

Hi Daniel,
On 2026-10-15 at 14:05:46 +0100, Daniel Stone wrote:
> There's no reason to limit ourselves to one arbitrarily-chosen core.
> 
> Signed-off-by: Daniel Stone <daniels@collabora.com>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/igt_panthor.c | 29 +++++++----------------------
>  lib/igt_panthor.h |  1 -
>  2 files changed, 7 insertions(+), 23 deletions(-)
> 
> diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
> index 11d8ec342..cd6b6b7fd 100644
> --- a/lib/igt_panthor.c
> +++ b/lib/igt_panthor.c
> @@ -2,6 +2,7 @@
>  // SPDX-FileCopyrightText: Copyright (C) 2025 Collabora Ltd.
>  
>  #include "drmtest.h"
> +#include "igt_aux.h"
>  #include "igt_panthor.h"
>  #include "ioctl_wrappers.h"
>  #include "panthor_drm.h"
> @@ -69,22 +70,6 @@ void igt_panthor_group_submit(int fd, struct drm_panthor_group_submit *group_sub
>  		do_ioctl(fd, DRM_IOCTL_PANTHOR_GROUP_SUBMIT, group_submit);
>  }
>  
> -/**
> - * igt_panthor_get_first_core:
> - * @cores_present: bitmask of available cores
> - *
> - * Get a mask with only the first available core bit set.
> - *
> - * Returns: core mask with first available core, or 0 if no cores available
> - */
> -uint64_t igt_panthor_get_first_core(uint64_t cores_present)
> -{
> -	if (cores_present == 0)
> -		return 0;
> -
> -	return 1ULL << (ffs(cores_present) - 1);
> -}
> -
>  /**
>   * igt_panthor_group_create_simple:
>   * @fd: device file descriptor
> @@ -109,13 +94,13 @@ uint32_t igt_panthor_group_create_simple(int fd, uint32_t vm_id, int err)
>  	queues = (struct drm_panthor_obj_array)DRM_PANTHOR_OBJ_ARRAY(1, &queue);
>  
>  	group_create.queues = queues;
> -	group_create.max_compute_cores = 1;
> -	group_create.max_fragment_cores = 1;
> -	group_create.max_tiler_cores = 1;
> +	group_create.max_compute_cores = igt_hweight(gpu_info.shader_present);
> +	group_create.max_fragment_cores = igt_hweight(gpu_info.shader_present);
> +	group_create.max_tiler_cores = igt_hweight(gpu_info.tiler_present);
>  	group_create.priority = PANTHOR_GROUP_PRIORITY_MEDIUM;
> -	group_create.compute_core_mask = igt_panthor_get_first_core(gpu_info.shader_present);
> -	group_create.fragment_core_mask = igt_panthor_get_first_core(gpu_info.shader_present);
> -	group_create.tiler_core_mask = igt_panthor_get_first_core(gpu_info.tiler_present);
> +	group_create.compute_core_mask = gpu_info.shader_present;
> +	group_create.fragment_core_mask = gpu_info.shader_present;
> +	group_create.tiler_core_mask = gpu_info.tiler_present;
>  	group_create.vm_id = vm_id;
>  
>  	igt_panthor_group_create(fd, &group_create, err);
> diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
> index ba4a9bf1e..63c4f2bf4 100644
> --- a/lib/igt_panthor.h
> +++ b/lib/igt_panthor.h
> @@ -36,7 +36,6 @@ void igt_panthor_group_submit_simple(int fd, uint32_t group_handle,
>  				     uint32_t queue_index, uint64_t stream_addr,
>  				     uint32_t stream_size, uint32_t syncobj_handle,
>  				     int err);
> -uint64_t igt_panthor_get_first_core(uint64_t cores_present);
>  
>  static inline void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handle,
>  				       uint64_t va, uint64_t size, uint32_t flags, int err)
> -- 
> 2.47.3
> 
