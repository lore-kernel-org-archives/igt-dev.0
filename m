Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC9C105A597
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 13:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2BD10E9E2;
	Thu, 12 Mar 2026 13:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="li4lnktW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4C910E9E2
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 13:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773320778; x=1804856778;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4wAI26bP21Mk5uOBQtRz68QAYq6+pWfeiorOm17dW/o=;
 b=li4lnktWIxcEY41V0+xm4xpfLUejNMi/2+9oL0TixkA6VJG1TJw4NPc5
 yrKVq0eee0Ihe3CsY43DUM9C3I5MDMYVvynwYfv8+f2zFT2KCHFevNp8A
 hD+Apkm+gMbjRIgMO7BXK0U14OhGWkVcCGELWUfByWJFW0v33g77E9CW+
 2PxtgAh1ouZlGhAs6l+sJQG3/LzM7lU7pLu/tWSi60blj/JS/3h/8fXb4
 +wtsZwUloI7lD6D4PZmndOPAPwP+t4a5ErRVFn8KJ1ZnFBENCPOPhQKBi
 ZEHew82DkOArzu/vP5vCdcCykrk9xfeO8XyBj4O+fiMmE4t/mAtJ9Ladv w==;
X-CSE-ConnectionGUID: yn4HEEbRSgmuW4t42sxCQQ==
X-CSE-MsgGUID: kFKXuBN2SsCIU2D8IEkGbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74110683"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="74110683"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 06:06:18 -0700
X-CSE-ConnectionGUID: Xbyu7NAjRG++WcQFTMg5oA==
X-CSE-MsgGUID: lhr765VyRVKNEdPJ5NGaAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="258722688"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 06:06:16 -0700
Date: Thu, 12 Mar 2026 14:06:14 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t v3 1/2] lib/xe: Introduce aligned buffer mapping
Message-ID: <20260312130614.qynoeuphnitvnkqu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 thomas.hellstrom@intel.com, kamil.konieczny@intel.com
References: <20260312083731.644793-1-nishit.sharma@intel.com>
 <20260312083731.644793-2-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312083731.644793-2-nishit.sharma@intel.com>
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

Hi Nishit,
On 2026-03-12 at 08:37:30 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Added aligned buffer mapping which is providing an interface for mapping
> buffer objects with a specified alignment. This API improves
> cross-platform compatibility and simplifies batch buffer setup by
> eliminating the need for platform-specific address handling.
> 
> Signed-off-by: Thomas Hellstrom <thomas.hellstrom@intel.com>
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/xe/xe_ioctl.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_ioctl.h |  1 +
>  2 files changed, 43 insertions(+)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 16aae05c9..566a08a8f 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -579,6 +579,48 @@ void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr)
>  	return map;
>  }
>  
> +/**
> + * xe_bo_map_aligned: Maps a buffer object (bo) into
> + * CPU address space with a specified alignment

Please add few more spaces before 'CPU' or just write it in one line.

> + * @fd: The device file-descriptor
> + * @bo: The buffer object
> + * @size: The size of the map
> + * @alignment: The requested map alignment
> + *
> + * Return: pointer to CPU-Mapped BO with requested alignment

Describe also that function will assert on error.

> + */
> +void *xe_bo_map_aligned(int fd, uint32_t bo, size_t size, size_t alignment)
> +{
> +	size_t anon_size = size + alignment;
> +	uint64_t anon_addr;
> +	void *anon_map, *map;
> +	uint64_t map_addr;
> +	size_t hole_size;
> +
> +	/* Reserve a range of virtual space where we can fit an aligned map */
> +	anon_map = mmap(NULL, anon_size, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	igt_assert(anon_map != MAP_FAILED);
> +	anon_addr = to_user_pointer(anon_map);
> +
> +	/* Compute the first aligned address within the virtual space. */
> +	map_addr = ALIGN(anon_addr, alignment);
> +	/* Map the bo there, replacing part of the reserved virtual range. */
> +	map = xe_bo_map_fixed(fd, bo, size, map_addr);
> +	igt_assert(((uintptr_t)map % alignment) == 0);

igt_assert_eq() would be better.

> +
> +	/* Unreserve part of the virtual range (if any) *before* the bo map */

Add this to desciption of this function.

> +	hole_size = map_addr - anon_addr;
> +	if (hole_size)
> +		igt_assert(munmap(anon_map, hole_size) == 0);

Same here.

> +
> +	/* Unreserve part of the virtual range (if any) *after* the bo map */

Add to description.

> +	hole_size = anon_size - hole_size - size;
> +	if (hole_size)
> +		igt_assert(munmap(map + size, hole_size) == 0);

Same here.

Regards,
Kamil

> +
> +	return map;
> +}
> +
>  void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot)
>  {
>  	return __xe_bo_map(fd, bo, size, prot);
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 3ea651063..b62d259fd 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -91,6 +91,7 @@ void xe_exec_queue_destroy(int fd, uint32_t exec_queue);
>  uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
>  void *xe_bo_map(int fd, uint32_t bo, size_t size);
>  void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr);
> +void *xe_bo_map_aligned(int fd, uint32_t bo, size_t size, size_t alignment);
>  void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot);
>  int __xe_exec(int fd, struct drm_xe_exec *exec);
>  void xe_exec(int fd, struct drm_xe_exec *exec);
> -- 
> 2.34.1
> 
