Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A04606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 15:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Q/7Z3O+A
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F264410FEC5;
	Wed, 21 Oct 2026 15:53:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EB14A10E021
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 15:51:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50BA6152B
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 08:51:54 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 51B3B3F7D8
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 08:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
 t=1792597917; bh=tuQdMA1ryJQ9WCog9Fe0+QBUHFDVuyY1OUNWtaMYLbo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q/7Z3O+ARn1jIi9LgJjnZqqzwTOLCTgHK28LI9Mwg5kd/+dHiL6PDDd5dzdIYpCk4
 XkmGvpTP1k5Sly6ZUhW+aCSp0fhYfEhHJL8N2mpqpFEuNDYRVsnP5Q7pOKi5pHDdxX
 ijuapy66qdm79Yzff3OaNIeBAvBliQHb2n96IJKM=
Date: Wed, 21 Oct 2026 16:51:55 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Daniel Stone <daniels@collabora.com>
Cc: igt-dev@lists.freedesktop.org, boris.brezillon@collabora.com,
 laura.nao@collabora.com, adrian.larumbe@collabora.com,
 daniel.almeida@collabora.com
Subject: Re: [PATCH 2/4] panthor: Add igt_panthor_get_arch() helper
Message-ID: <atjfmwVoKm9BzHcB@e142607>
References: <20261015130837.710795-1-daniels@collabora.com>
 <20261015130837.710795-3-daniels@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261015130837.710795-3-daniels@collabora.com>
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

On Thu, Oct 15, 2026 at 02:05:47PM +0100, Daniel Stone wrote:
> This will identify the major architecture revision.
> 
> Signed-off-by: Daniel Stone <daniels@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  lib/igt_panthor.c | 17 +++++++++++++++++
>  lib/igt_panthor.h |  1 +
>  2 files changed, 18 insertions(+)
> 
> diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
> index cd6b6b7fd..f5c6859e2 100644
> --- a/lib/igt_panthor.c
> +++ b/lib/igt_panthor.c
> @@ -370,3 +370,20 @@ void igt_panthor_free_bo(int fd, struct panthor_bo *bo)
>  
>  	gem_close(fd, bo->handle);
>  }
> +
> +/**
> + * igt_panthor_get_arch:
> + * @fd: panthor device file descriptor
> + *
> + * Get the architecture major version for this device.
> + *
> + * Returns: The Mali architecture major version
> + */
> +int igt_panthor_get_arch(int fd)
> +{
> +	struct drm_panthor_gpu_info gpu_info = { 0 };
> +
> +	igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO,
> +			  &gpu_info, sizeof(gpu_info), 0);
> +	return DRM_PANTHOR_ARCH_MAJOR(gpu_info.gpu_id);
> +}
> diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
> index 63c4f2bf4..3056ebd75 100644
> --- a/lib/igt_panthor.h
> +++ b/lib/igt_panthor.h
> @@ -36,6 +36,7 @@ void igt_panthor_group_submit_simple(int fd, uint32_t group_handle,
>  				     uint32_t queue_index, uint64_t stream_addr,
>  				     uint32_t stream_size, uint32_t syncobj_handle,
>  				     int err);
> +int igt_panthor_get_arch(int fd);
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
