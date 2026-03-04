Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897A7EF8FE5
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 13:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DBC10E9FB;
	Wed,  4 Mar 2026 13:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RwnmLM1i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C43D10E9FB
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 13:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772631977; x=1804167977;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uC/WnbeK8m4aA1nUwkTk4JaaGGMiCOrnM3DuZ6jVhag=;
 b=RwnmLM1iLyaVTMDbH3v420U1l6BX/7p2fgPHQjElnz6qrUNkwn57mEcv
 LLIYJag9njWWQNSjMJR9Hei0+z9i5H6tcRpB0aSAa9OY1bxlLkHZMDcFN
 Tfa0XKURDVqN02mQJTA5P5ps66JsGx9OwaXlz885PtXFjpUuX9R8A5+SK
 aZfmTIL0ieu9GD+P4t2VcFWgbq1b11MXLQwtycRfgfgDCxluAbl+GjB0L
 tJTq3ylgHD36XdCLm9iXu4pyuzsctA8aiD120rHtkra/yHjkU4qeEIn1R
 VM5zj1NY+EBcA/aXU6AMUR4yJLkH4LFqd3JD+dfk0fkmOJPQYtV9RLOji Q==;
X-CSE-ConnectionGUID: 7YXkGXunToiQavxkKZ8exQ==
X-CSE-MsgGUID: jJXFbg7XSRyhawv8Af/tAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="96306911"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="96306911"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 05:46:16 -0800
X-CSE-ConnectionGUID: aB0UmxdDSzeV7UYmj7vamw==
X-CSE-MsgGUID: M4jFCQ0wQIeT6gtweNBwWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="223322090"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:46:14 -0800
Date: Wed, 4 Mar 2026 14:45:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: Re: [PATCH v3 i-g-t 1/2] drm-uapi/xe: sync with kernel header
Message-ID: <20260304134553.2wbkeehjydjshdko@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sobin Thomas <sobin.thomas@intel.com>,
 igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
References: <20260304110501.1193980-1-sobin.thomas@intel.com>
 <20260304110501.1193980-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304110501.1193980-2-sobin.thomas@intel.com>
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
On 2026-03-04 at 11:04:59 +0000, Sobin Thomas wrote:
> This commit is for sync with kernel header.
> Align with kernel commit 369cc8804985 ("drm/xe/uapi: Introduce a flag to
> disallow VM overcommit in fault mode").

Please add here, that this will also bring documentation changes
from commit dc90ead44054 ("drm/xe/uapi: update used tracking kernel-doc")

This could be done at merge, unless you will send new version.
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
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
