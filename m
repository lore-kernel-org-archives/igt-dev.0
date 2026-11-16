Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1593A606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 15:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hKJH00MV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E7610EA7C;
	Mon, 16 Nov 2026 15:52:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9C910F27D
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 15:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794844273; x=1826380273;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lNgjJyGsoXm4tyLGdhGLN3f6UltC0iNa6xzw9WTJJuo=;
 b=hKJH00MVGRbrbE6fEP8NdAo3Q6sDty9wMru11+1W1v3PL5PKYRppb5dF
 +fCez3a895gieNpNmQXVb3pyiQj2Mn+xw+lv5Xrc0iDkXTFKET8KC2AgU
 QGGblUK+v2qw0VNMI7hdAN+kAtd57CbJBMSvCtws7EYMkDX/dpdWoM+dQ
 w1+vU45fKAUv7cmLoOwQ+57BRELUK+Jmpu37RleI6KB/xmDQAHqNdxPmM
 oX0yJLr1VorkAH5Z0AM2cq1fVZRMYaykAVy6LiUF/O0dC49B+XM31oqJc
 byO38EIpo3QtV1gyP2m+7umLqbfJDEEpkjJYPu9vRk6ng6OpCW8PQ7pNG Q==;
X-CSE-ConnectionGUID: 0zS9k5FVS7+PRSf3l5fhEg==
X-CSE-MsgGUID: X6URrjI8TXKsrR/wor4Cbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3575372"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3575372"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 07:51:12 -0800
X-CSE-ConnectionGUID: nYhsD2WbQDygYMuRNb3NWw==
X-CSE-MsgGUID: hG56VrF7RUSTW4xTA151MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; d="scan'208";a="11489418"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 07:51:11 -0800
Date: Mon, 16 Nov 2026 16:50:48 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniel Stone <daniels@collabora.com>
Cc: igt-dev@lists.freedesktop.org, boris.brezillon@collabora.com, 
 laura.nao@collabora.com, adrian.larumbe@collabora.com,
 daniel.almeida@collabora.com, liviu.dudau@arm.com
Subject: Re: [PATCH 1/4] panthor: Use all available GPU cores
Message-ID: <emffnhkfnwhznt4ul7d57tc2z3zbdtsk5567vpxcp4a2b2n7kw@kdckbwvpuryj>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Daniel Stone <daniels@collabora.com>, igt-dev@lists.freedesktop.org,
 boris.brezillon@collabora.com, 
 laura.nao@collabora.com, adrian.larumbe@collabora.com,
 daniel.almeida@collabora.com, liviu.dudau@arm.com
References: <20261015130837.710795-1-daniels@collabora.com>
 <20261015130837.710795-2-daniels@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015130837.710795-2-daniels@collabora.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Daniel,
On 2026-10-15 at 14:05:46 +0100, Daniel Stone wrote:
> There's no reason to limit ourselves to one arbitrarily-chosen core.
> 
> Signed-off-by: Daniel Stone <daniels@collabora.com>

Applied all 1...4, thanks!

And sorry for asking you for rebase and resent, my tooling
was confused by base-commit in your cover letter. I checked
patches individually and they applied, so no need for any
further action. 

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
