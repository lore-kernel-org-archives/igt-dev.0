Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C657606AFE6
	for <igt-dev@archiver.kernel.org>; Fri, 13 Nov 2026 16:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d4l9W8Hy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C06F10E3A8;
	Fri, 13 Nov 2026 16:50:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1356D10E3A8
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2026 16:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794588558; x=1826124558;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JnZmW8r0usjC0WmYIK1HlyCchoizQa0TvkX2q9LmycE=;
 b=d4l9W8HyGZtSttG6HjAoGY/6bU6TRHOdXKyz/DI5/1bpW9X3RIsI6slD
 kh1fWKGdJCjSTfSmXMfXn1qJIxC2OvTliUvMYRgMLmF2tjvTLSJdH9k6z
 RRX3edDl3lTDtUokVlgwShH4al9M8F0FOc7KMeNV2oWEhkVxi6gbjlzJI
 nlYGNNZ+yMHOL5COi2MZivOB35SyZRMWODIYRMOm+5F0cXfaSLIhhJb9n
 eUdOkQb45cFT4QPhEtb7TBf1b60bHZ/Xhm+Bq2nLG5FRWU3IwLbBuZCoU
 ITTlHFaCG/xtblUXwfkUPLR9sBQ4SkPo4b8fNZG3W7Qrz7fKp6I+WL5JW Q==;
X-CSE-ConnectionGUID: FlcurMPrT+CbbtYnCccQdw==
X-CSE-MsgGUID: mJxWlxF7Rq2CfFa0aAy3og==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3403676"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3403676"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 08:49:18 -0800
X-CSE-ConnectionGUID: RAXHZguIS4+LnpcSUOuILQ==
X-CSE-MsgGUID: Nk09dZN5SNm+XMNBWfvoVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; d="scan'208";a="10681871"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 08:49:16 -0800
Date: Fri, 13 Nov 2026 17:49:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniel Stone <daniels@collabora.com>
Cc: igt-dev@lists.freedesktop.org, boris.brezillon@collabora.com, 
 laura.nao@collabora.com, adrian.larumbe@collabora.com,
 daniel.almeida@collabora.com, liviu.dudau@arm.com
Subject: Re: [PATCH 1/4] panthor: Use all available GPU cores
Message-ID: <ga5ivyi2wenx2mqyqbuf4tgylqydpfjvelma34be6xdbf6h7rk@qimfpiqhiqn4>
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

Please rebase your series on current top, resolve conflicts
and resend.

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
