Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E0A106703C
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 14:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A9F10EA2D;
	Thu, 12 Mar 2026 14:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C9JAbceL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D39A10EA2D
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 14:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773326473; x=1804862473;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zWJNz4DirCLz8WRjDPF/gB7PCVYwN2CR5slwDTF0H3U=;
 b=C9JAbceLUBHrbVyRpF9DOrdyB3/zvzszA33b7Bpvs4t0TJUZGlmyOl0p
 to9ObIW6NIFhshtPRSQgM4DoLYGXvNYRvPGa+QCJvjPtuuznOkkO2PbOt
 jz8dve6ZI0iog7gsTfywq9PHnAfsLhiGZhUHhTT/AqKgakc03QGC8/f5K
 C+FGIg4KxboL+8dzE7ClIuP+OFPihk1tnmkDumnVtSb0HdpTx4tSBfVLJ
 G+QoPdNX29bNkD2fBG9uxWstyUwZq+pwsbyfnGWw/xsl4n1AmLbN4eF2p
 6g58qeW3397H7YFMsVXEoUn2RHqjrAgqmT2i3Tg/RXMFXVYwuY1L4l0p3 w==;
X-CSE-ConnectionGUID: graqISeLRpiK0NyWB/e+iA==
X-CSE-MsgGUID: 9OgKWG1MQ/e8c0VyxnqBNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74120428"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="74120428"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 07:41:13 -0700
X-CSE-ConnectionGUID: LEou7ALSQ0Wdo304XaY56A==
X-CSE-MsgGUID: uTvsi2+7TiCFrDu4jSz/Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="215892890"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 07:41:12 -0700
Date: Thu, 12 Mar 2026 15:40:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t v4 1/2] lib/xe: Introduce aligned buffer mapping
Message-ID: <20260312144054.al5kffbygjtoiz5s@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 thomas.hellstrom@intel.com, kamil.konieczny@intel.com
References: <20260312134851.647568-1-nishit.sharma@intel.com>
 <20260312134851.647568-2-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312134851.647568-2-nishit.sharma@intel.com>
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
On 2026-03-12 at 13:48:50 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Added aligned buffer mapping which is providing an interface for mapping
> buffer objects with a specified alignment. This API improves
> cross-platform compatibility and simplifies batch buffer setup by
> eliminating the need for platform-specific address handling.
> 
> Signed-off-by: Thomas Hellstrom <thomas.hellstrom@intel.com>
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/xe/xe_ioctl.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_ioctl.h |  1 +
>  2 files changed, 47 insertions(+)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 16aae05c9..ea3f2fcaa 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -579,6 +579,52 @@ void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr)
>  	return map;
>  }
>  
> +/**
> + * xe_bo_map_aligned: Maps a buffer object (bo) into CPU address space with a specified alignment
> + * @fd: The device file-descriptor
> + * @bo: The buffer object
> + * @size: The size of the map
> + * @alignment: The requested map alignment
> + *
> + * This function reserves a virtual memory range, computes the first aligned address,
> + * maps the buffer object at that address, and asserts on errors. It unmaps any unused
> + * regions before and after the mapped buffer, freeing up memory and leaving only the
> + * aligned mapping.
> + *
> + * Return: Pointer to CPU-Mapped BO with requested alignment
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
> +	igt_assert_eq((uintptr_t)map % alignment, 0);
> +
> +	/* Unreserve part of the virtual range (if any) *before* the bo map */
> +	hole_size = map_addr - anon_addr;
> +	if (hole_size)
> +		igt_assert_eq(munmap(anon_map, hole_size), 0);
> +
> +	/* Unreserve part of the virtual range (if any) *after* the bo map */
> +	hole_size = anon_size - hole_size - size;
> +	if (hole_size)
> +		igt_assert_eq(munmap(map + size, hole_size), 0);
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
