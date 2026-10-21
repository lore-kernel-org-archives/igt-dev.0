Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D25B606A328
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 15:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tWDYdVqE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5738A10E31E;
	Wed, 21 Oct 2026 15:52:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E25610E31E
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 15:51:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E4C4152B
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 08:51:22 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 210443F7D8
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 08:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
 t=1792597885; bh=xf3W7AWQUrqU7+LNTwFLXctd0bR4xGcLeirmI3fXF0w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tWDYdVqEKv8LCdGjLye5+G7N9GzzYEy5uF0u6fWmnsVo8e2fP796BgnPvbKE/rbCs
 L8U2IawIDu1kOtXyPbNOgTv6iFfGfErNPpoEagUZ5GHrPFrjw6tVlJRRj2x04vAcNO
 qMuH8Kk7OiFHmeJ9BeML2W4SJIs8Sy0ClB5rJPFw=
Date: Wed, 21 Oct 2026 16:51:22 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Daniel Stone <daniels@collabora.com>
Cc: igt-dev@lists.freedesktop.org, boris.brezillon@collabora.com,
 laura.nao@collabora.com, adrian.larumbe@collabora.com,
 daniel.almeida@collabora.com
Subject: Re: [PATCH 1/4] panthor: Use all available GPU cores
Message-ID: <atjfepzxX_1CFQOQ@e142607>
References: <20261015130837.710795-1-daniels@collabora.com>
 <20261015130837.710795-2-daniels@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 15, 2026 at 02:05:46PM +0100, Daniel Stone wrote:
> There's no reason to limit ourselves to one arbitrarily-chosen core.
> 
> Signed-off-by: Daniel Stone <daniels@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

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

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
