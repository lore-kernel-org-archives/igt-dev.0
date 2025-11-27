Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259D7CFD2F6
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 17:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC5910E839;
	Thu, 27 Nov 2025 17:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SY4NL18c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D7610E839
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 17:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764264278; x=1795800278;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cbKgHuRZGYlyJP1zOofJ7M+Y+AlbxfcGY+fDuEVL/k4=;
 b=SY4NL18c3OwtCiSuaoJ2b8FOftJJgJ4C0kpM9IKwItcptboTLeYgvT/v
 swqYPCJZxm2vlM3rBhk+s8l5tV3pNqfoceA0w9lprI3zh0fUkcQcwbdmL
 I9MzNa2IWkUzv3JH8sr6b8ROXpc4Wg4bSNx9XlxCBA7BlpAAwOiRFH/E5
 59G8ixdiOCJj+pVCqv4HfSYeYWPJ6Nd3lJGAuJa3JLxJ06D8aLsGvWYvU
 nRS+musG0tYvErK2l07cD6oN7+xzgFDv7kNthR97GbYH1OxCNT2Vzdaxy
 OGKub1IppfSzCvCOxdBNk9kMlOptHG5iNzg7aKy7mkc7OvVfxPp/QVGPv A==;
X-CSE-ConnectionGUID: yVCuIeCfTsWbwuY/GGsF5w==
X-CSE-MsgGUID: o25VwYpMQYqTJGFSTp2RWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66388043"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="66388043"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 09:24:37 -0800
X-CSE-ConnectionGUID: sa0ZsYN5SFOjIGU2ayX4DQ==
X-CSE-MsgGUID: rfpHZttXTMyHyah4acapKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="197590323"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 09:24:37 -0800
Date: Thu, 27 Nov 2025 18:24:34 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 2/5] drm-uapi/xe: Sync with
 DRM_XE_OA_CAPS_OA_UNIT_GT_ID definition
Message-ID: <20251127172434.4euchbwwsevggjuk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 igt-dev@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20251126035012.12967-1-ashutosh.dixit@intel.com>
 <20251126035012.12967-3-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251126035012.12967-3-ashutosh.dixit@intel.com>
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

Hi Ashutosh,
On 2025-11-25 at 19:50:09 -0800, Ashutosh Dixit wrote:
> This patch will be replaced by the actual kernel commit which defines
> DRM_XE_OA_CAPS_OA_UNIT_GT_ID in xe_drm.h, after that commit is merged into
> the kernel.

Please sync with drm-next commit or use 
include/drm-uapi-experimental/intel_drm_local.h

Regards,
Kamil

> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 89ab549354..b94e03487d 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -771,7 +771,11 @@ struct drm_xe_device_query {
>   *    until the object is either bound to a virtual memory region via
>   *    VM_BIND or accessed by the CPU. As a result, no backing memory is
>   *    reserved at the time of GEM object creation.
> - *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT
> + *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT - Indicates that the GEM object is
> + *    intended for scanout via the display engine. When set, kernel ensures
> + *    that the allocation is placed in a memory region compatible with the
> + *    display engine requirements. This may impose restrictions on tiling,
> + *    alignment, and memory placement to guarantee proper display functionality.
>   *  - %DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM - When using VRAM as a
>   *    possible placement, ensure that the corresponding VRAM allocation
>   *    will always use the CPU accessible part of VRAM. This is important
> @@ -1013,6 +1017,20 @@ struct drm_xe_vm_destroy {
>   *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
>   *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
>   *    handle MBZ, and the BO offset MBZ.
> + *  - %DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET - Can be used in combination with
> + *    %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR to reset madvises when the underlying
> + *    CPU address space range is unmapped (typically with munmap(2) or brk(2)).
> + *    The madvise values set with &DRM_IOCTL_XE_MADVISE are reset to the values
> + *    that were present immediately after the &DRM_IOCTL_XE_VM_BIND.
> + *    The reset GPU virtual address range is the intersection of the range bound
> + *    using &DRM_IOCTL_XE_VM_BIND and the virtual CPU address space range
> + *    unmapped.
> + *    This functionality is present to mimic the behaviour of CPU address space
> + *    madvises set using madvise(2), which are typically reset on unmap.
> + *    Note: free(3) may or may not call munmap(2) and/or brk(2), and may thus
> + *    not invoke autoreset. Neither will stack variables going out of scope.
> + *    Therefore it's recommended to always explicitly reset the madvises when
> + *    freeing the memory backing a region used in a &DRM_IOCTL_XE_MADVISE call.
>   *
>   * The @prefetch_mem_region_instance for %DRM_XE_VM_BIND_OP_PREFETCH can also be:
>   *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures prefetching occurs in
> @@ -1119,6 +1137,7 @@ struct drm_xe_vm_bind_op {
>  #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
>  #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
>  #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
> +#define DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET	(1 << 6)
>  	/** @flags: Bind flags */
>  	__u32 flags;
>  
> @@ -1657,12 +1676,16 @@ struct drm_xe_oa_unit {
>  #define DRM_XE_OA_CAPS_OA_BUFFER_SIZE	(1 << 2)
>  #define DRM_XE_OA_CAPS_WAIT_NUM_REPORTS	(1 << 3)
>  #define DRM_XE_OA_CAPS_OAM		(1 << 4)
> +#define DRM_XE_OA_CAPS_OA_UNIT_GT_ID	(1 << 5)
>  
>  	/** @oa_timestamp_freq: OA timestamp freq */
>  	__u64 oa_timestamp_freq;
>  
> +	/** @gt_id: gt id for this OA unit */
> +	__u64 gt_id;
> +
>  	/** @reserved: MBZ */
> -	__u64 reserved[4];
> +	__u64 reserved[3];
>  
>  	/** @num_engines: number of engines in @eci array */
>  	__u64 num_engines;
> -- 
> 2.48.1
> 
