Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355EDCFD2F6
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 13:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3F310E63D;
	Tue,  2 Dec 2025 13:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V8Hp88bt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B9610E63D
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 13:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764682580; x=1796218580;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RlAlInslZ4CZB0UPw/X03c6Shk7h86hoaGwQFuNLzP0=;
 b=V8Hp88btCMWFEoHASAYVIv9phJiaQe0Wxr2S2DDmfGmYHm5u7Qe8sKAR
 aYH2+4wBXMAcNirfyO6w0POGmw8l/neeyRLDzPIrKR0xki9Gm4XbC0RD9
 r6pmX3xtEu1rXKynFpXEGoCY0GW9hlCpg65tjkbHGcxR8WPkeruo+te7H
 a1wI36o/FFOkhKXyu5aiTZ8VhWj/vgELINwZuM53yzeo3zVsckICaw6gt
 6R+FfcF376MgwaiAc0ua9VKgwZrpUzqjKMiwASt4Dj+QYRnUvggqcEFgN
 gKQyjvsW8f6PelaKKzTinOD5ysZ5il/F0cn6nWvCw/QXgv+/86+zmssEL g==;
X-CSE-ConnectionGUID: nZGjwxfDSwCuMwN6K3m3Ig==
X-CSE-MsgGUID: MRDFno73Tt2JsNryeUp4yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66722623"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66722623"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:36:20 -0800
X-CSE-ConnectionGUID: LnjjX0gnTRugLLyLE5dnrw==
X-CSE-MsgGUID: UPjLqX6TTIW/kb2qANOFaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="231693588"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 05:36:19 -0800
Date: Tue, 2 Dec 2025 14:36:03 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm-uapi/xe: Sync with exec queue replay interface
Message-ID: <20251202133603.kaylodfn6qot7gea@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20251201223126.863042-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251201223126.863042-1-matthew.brost@intel.com>
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

Hi Matthew,
On 2025-12-01 at 14:31:25 -0800, Matthew Brost wrote:
> Align with kernel commit  b80961a86b40 ("drm/xe/uapi: Add

That hash is not from drm-next, so please write from which repo
it is, also link to lore.kernel.org could help.

Regards,
Kamil

> DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE"). This is to bring in exec
> queue replay interface changes from KMD.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 89ab549354..e56b77542e 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -210,8 +210,12 @@ struct drm_xe_ext_set_property {
>  	/** @pad: MBZ */
>  	__u32 pad;
>  
> -	/** @value: property value */
> -	__u64 value;
> +	union {
> +		/** @value: property value */
> +		__u64 value;
> +		/** @ptr: pointer to user value */
> +		__u64 ptr;
> +	};
>  
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
> @@ -771,7 +775,11 @@ struct drm_xe_device_query {
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
> @@ -1013,6 +1021,20 @@ struct drm_xe_vm_destroy {
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
> @@ -1119,6 +1141,7 @@ struct drm_xe_vm_bind_op {
>  #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
>  #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
>  #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
> +#define DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET	(1 << 6)
>  	/** @flags: Bind flags */
>  	__u32 flags;
>  
> @@ -1273,6 +1296,7 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
> +#define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -- 
> 2.34.1
> 
