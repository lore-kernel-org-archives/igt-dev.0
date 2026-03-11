Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E63FD0651
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 14:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5752010E928;
	Wed, 11 Mar 2026 14:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQO/SXl/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D2510E928
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 14:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773239282; x=1804775282;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YyUgnIBbXIR9sd0KYsy83uTlmZnQQnPCk8mcfkEzwtk=;
 b=HQO/SXl/vYJEvAus45yF16oDp8Xii0dN7+lpR8bfAhymRYCDy5PC+It2
 7KFC8CzxQyhiVz5knE0Mt1iADnnBaQpQOvERnU7EblfT+/WKFEE4uqmui
 70FbrBZCnaQhvozsK/fjd0gk6UuNeqQ6wfYT97MC7UX1MyJFBY60cj5Qx
 t9Gx6eRL53BA+x+FxrYHcTfxZ0HBCFFLvV0IUGs89TmPetEwY+Fn6/R54
 Oyt0XYd203axmA8SkA4mhZ7q9yhqeGZO4eKbsaBQbFQF/Acw3PLa/MLtF
 h2ZVTeXzWAspZZ6PuNRVfBNUY6VfQOGrjSkVtD9buOBEKezjwnfHwCcLh g==;
X-CSE-ConnectionGUID: P1dj6SpZQ766wVafKgLpSQ==
X-CSE-MsgGUID: ENhHqp4UQ8CYctzx0fZHjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="91878973"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="91878973"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 07:27:59 -0700
X-CSE-ConnectionGUID: FbfHVAQaS7WCmf+8lyppjQ==
X-CSE-MsgGUID: Mpi/INnCTc6NFFSjlw9KcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="224640464"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 07:27:58 -0700
Date: Wed, 11 Mar 2026 15:27:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: Re: [PATCH v4 i-g-t 1/2] drm-uapi/xe: sync with kernel header
Message-ID: <20260311142741.6hzgybzgvfsnjhiy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
References: <20260311060843.2133964-1-sobin.thomas@intel.com>
 <20260311060843.2133964-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260311060843.2133964-2-sobin.thomas@intel.com>
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

Hi Sobin,
On 2026-03-11 at 06:08:37 +0000, Sobin Thomas wrote:
> This commit is for sync with kernel header.
> Align with kernel commit 369cc8804985 ("drm/xe/uapi: Introduce a flag to
> disallow VM overcommit in fault mode").

I asked you to add also here:

This will also bring documentation changes from commit dc90ead44054
("drm/xe/uapi: update used tracking kernel-doc")

You could also note that it fixes verbatim copy versus copy
after using kernel header install, as documented in README.md

> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  include/drm-uapi/xe_drm.h | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 077e66a68..fc71a6cd1 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -3,8 +3,8 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> -#ifndef _UAPI_XE_DRM_H_
> -#define _UAPI_XE_DRM_H_
> +#ifndef _XE_DRM_H_
> +#define _XE_DRM_H_

This fixes prev commit.

With above my r-b still holds.

Regards,
Kamil

>  
>  #include "drm.h"
>  
> @@ -142,7 +142,7 @@ extern "C" {
>   * redefine the interface more easily than an ever growing struct of
>   * increasing complexity, and for large parts of that interface to be
>   * entirely optional. The downside is more pointer chasing; chasing across
> - * the __user boundary with pointers encapsulated inside u64.
> + * the boundary with pointers encapsulated inside u64.
>   *
>   * Example chaining:
>   *
> @@ -335,10 +335,6 @@ struct drm_xe_mem_region {
>  	__u64 total_size;
>  	/**
>  	 * @used: Estimate of the memory used in bytes for this region.
> -	 *
> -	 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
> -	 * accounting.  Without this the value here will always equal
> -	 * zero.
>  	 */
>  	__u64 used;
>  	/**
> @@ -363,9 +359,7 @@ struct drm_xe_mem_region {
>  	 * @cpu_visible_used: Estimate of CPU visible memory used, in
>  	 * bytes.
>  	 *
> -	 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
> -	 * accounting. Without this the value here will always equal
> -	 * zero.  Note this is only currently tracked for
> +	 * Note this is only currently tracked for
>  	 * DRM_XE_MEM_REGION_CLASS_VRAM regions (for other types the value
>  	 * here will always be zero).
>  	 */
> @@ -975,6 +969,11 @@ struct drm_xe_gem_mmap_offset {
>   *    demand when accessed, and also allows per-VM overcommit of memory.
>   *    The xe driver internally uses recoverable pagefaults to implement
>   *    this.
> + *  - %DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT - Requires also
> + *    DRM_XE_VM_CREATE_FLAG_FAULT_MODE. This disallows per-VM overcommit
> + *    but only during a &DRM_IOCTL_XE_VM_BIND operation with the
> + *    %DRM_XE_VM_BIND_FLAG_IMMEDIATE flag set. This may be useful for
> + *    user-space naively probing the amount of available memory.
>   */
>  struct drm_xe_vm_create {
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -983,6 +982,7 @@ struct drm_xe_vm_create {
>  #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
>  #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
>  #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
> +#define DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT  (1 << 3)
>  	/** @flags: Flags */
>  	__u32 flags;
>  
> @@ -2361,4 +2361,4 @@ struct drm_xe_exec_queue_set_property {
>  }
>  #endif
>  
> -#endif /* _UAPI_XE_DRM_H_ */
> +#endif /* _XE_DRM_H_ */
> -- 
> 2.52.0
> 
