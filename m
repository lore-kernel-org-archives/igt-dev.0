Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0CBC36010
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 16:09:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B6510E60A;
	Tue,  1 Apr 2025 16:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JDZgUE1R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5425310E60A
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 16:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743523744; x=1775059744;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NFW+Qbm/SI3jflm+ToPq518KLgK8QTtnd7+tb59kdKY=;
 b=JDZgUE1RcjXiCM4OTdVcU2CrGvZKRbkDQbA7c9KU6Dgn209AjKzdQ5jU
 6/j175NuihGoEVfLSl7rxWzIpSq4KppIVHUOYW0ERub5vX6kCZdw7NQa3
 AibBvAjxeb7e/KwgpbdFGWPQsMRaZtcGmdfx2HnXR6k+6yJr99cdNjScs
 rbccqu8WjfJepuy+6QZLlruCmOS1OtZB6C4UJnZ7+IcWvUmP5+hqSjvNu
 fyGh9IFnFffqrjMD8PMDPse1HKvnfKX7+EJtMHBjvKyEN3hgRymZuGVJV
 0vRLlzG8qaZC21pRV7e/jArsnbK+VWg3+ezGCVGt29qh6LmP8N1sV/93p w==;
X-CSE-ConnectionGUID: XSBh52FJRP62dHVqErOiIw==
X-CSE-MsgGUID: LtAmTf/ZSUK5VkootgS0RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="70214404"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="70214404"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 09:09:04 -0700
X-CSE-ConnectionGUID: UTkEoLYjSkuM1FZONYOylg==
X-CSE-MsgGUID: pKuE4sfDQT2IUuYXWQKCZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126185837"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 09:09:02 -0700
Date: Tue, 1 Apr 2025 18:09:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: igt-dev@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH v3 02/19] drm-uapi/amdgpu: sync with drm-next
Message-ID: <20250401160900.msd3zer4ydzxlvjw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>, igt-dev@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250328082416.1469810-1-sunil.khatri@amd.com>
 <20250328082416.1469810-2-sunil.khatri@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250328082416.1469810-2-sunil.khatri@amd.com>
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

Hi Sunil,
On 2025-03-28 at 13:53:59 +0530, Sunil Khatri wrote:
> Sync with drm-next commit ("866fc4f7e772c4a397f9459754ed1b1872b3a3c6")
> 

This also do not come from drm-tip nor drm-next ?
Am I missing something?

Could you give a link to lore.kernel.org to this patch?

Regards,
Kamil

> Added support of UAPI for user queue secure semaphore.
> The semaphore is used to synchronize between the caller and
> the gpu hw and user wait for the semaphore.
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  include/drm-uapi/amdgpu_drm.h | 117 ++++++++++++++++++++++++++++++++++
>  1 file changed, 117 insertions(+)
> 
> diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
> index d780e1f2a..fed39c9b4 100644
> --- a/include/drm-uapi/amdgpu_drm.h
> +++ b/include/drm-uapi/amdgpu_drm.h
> @@ -55,6 +55,8 @@ extern "C" {
>  #define DRM_AMDGPU_FENCE_TO_HANDLE	0x14
>  #define DRM_AMDGPU_SCHED		0x15
>  #define DRM_AMDGPU_USERQ		0x16
> +#define DRM_AMDGPU_USERQ_SIGNAL		0x17
> +#define DRM_AMDGPU_USERQ_WAIT		0x18
>  
>  #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
>  #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
> @@ -73,6 +75,8 @@ extern "C" {
>  #define DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_FENCE_TO_HANDLE, union drm_amdgpu_fence_to_handle)
>  #define DRM_IOCTL_AMDGPU_SCHED		DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_SCHED, union drm_amdgpu_sched)
>  #define DRM_IOCTL_AMDGPU_USERQ		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
> +#define DRM_IOCTL_AMDGPU_USERQ_SIGNAL	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
> +#define DRM_IOCTL_AMDGPU_USERQ_WAIT	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
>  
>  /**
>   * DOC: memory domains
> @@ -442,6 +446,119 @@ struct drm_amdgpu_userq_mqd_compute_gfx11 {
>  	__u64   eop_va;
>  };
>  
> +/* userq signal/wait ioctl */
> +struct drm_amdgpu_userq_signal {
> +	/**
> +	 * @queue_id: Queue handle used by the userq fence creation function
> +	 * to retrieve the WPTR.
> +	 */
> +	__u32	queue_id;
> +	__u32	pad;
> +	/**
> +	 * @syncobj_handles: The list of syncobj handles submitted by the user queue
> +	 * job to be signaled.
> +	 */
> +	__u64	syncobj_handles;
> +	/**
> +	 * @num_syncobj_handles: A count that represents the number of syncobj handles in
> +	 * @syncobj_handles.
> +	 */
> +	__u64	num_syncobj_handles;
> +	/**
> +	 * @bo_read_handles: The list of BO handles that the submitted user queue job
> +	 * is using for read only. This will update BO fences in the kernel.
> +	 */
> +	__u64	bo_read_handles;
> +	/**
> +	 * @bo_write_handles: The list of BO handles that the submitted user queue job
> +	 * is using for write only. This will update BO fences in the kernel.
> +	 */
> +	__u64	bo_write_handles;
> +	/**
> +	 * @num_bo_read_handles: A count that represents the number of read BO handles in
> +	 * @bo_read_handles.
> +	 */
> +	__u32	num_bo_read_handles;
> +	/**
> +	 * @num_bo_write_handles: A count that represents the number of write BO handles in
> +	 * @bo_write_handles.
> +	 */
> +	__u32	num_bo_write_handles;
> +};
> +
> +struct drm_amdgpu_userq_fence_info {
> +	/**
> +	 * @va: A gpu address allocated for each queue which stores the
> +	 * read pointer (RPTR) value.
> +	 */
> +	__u64	va;
> +	/**
> +	 * @value: A 64 bit value represents the write pointer (WPTR) of the
> +	 * queue commands which compared with the RPTR value to signal the
> +	 * fences.
> +	 */
> +	__u64	value;
> +};
> +
> +struct drm_amdgpu_userq_wait {
> +	/**
> +	 * @syncobj_handles: The list of syncobj handles submitted by the user queue
> +	 * job to get the va/value pairs.
> +	 */
> +	__u64	syncobj_handles;
> +	/**
> +	 * @syncobj_timeline_handles: The list of timeline syncobj handles submitted by
> +	 * the user queue job to get the va/value pairs at given @syncobj_timeline_points.
> +	 */
> +	__u64	syncobj_timeline_handles;
> +	/**
> +	 * @syncobj_timeline_points: The list of timeline syncobj points submitted by the
> +	 * user queue job for the corresponding @syncobj_timeline_handles.
> +	 */
> +	__u64	syncobj_timeline_points;
> +	/**
> +	 * @bo_read_handles: The list of read BO handles submitted by the user queue
> +	 * job to get the va/value pairs.
> +	 */
> +	__u64	bo_read_handles;
> +	/**
> +	 * @bo_write_handles: The list of write BO handles submitted by the user queue
> +	 * job to get the va/value pairs.
> +	 */
> +	__u64	bo_write_handles;
> +	/**
> +	 * @num_syncobj_timeline_handles: A count that represents the number of timeline
> +	 * syncobj handles in @syncobj_timeline_handles.
> +	 */
> +	__u16	num_syncobj_timeline_handles;
> +	/**
> +	 * @num_fences: This field can be used both as input and output. As input it defines
> +	 * the maximum number of fences that can be returned and as output it will specify
> +	 * how many fences were actually returned from the ioctl.
> +	 */
> +	__u16	num_fences;
> +	/**
> +	 * @num_syncobj_handles: A count that represents the number of syncobj handles in
> +	 * @syncobj_handles.
> +	 */
> +	__u32	num_syncobj_handles;
> +	/**
> +	 * @num_bo_read_handles: A count that represents the number of read BO handles in
> +	 * @bo_read_handles.
> +	 */
> +	__u32	num_bo_read_handles;
> +	/**
> +	 * @num_bo_write_handles: A count that represents the number of write BO handles in
> +	 * @bo_write_handles.
> +	 */
> +	__u32	num_bo_write_handles;
> +	/**
> +	 * @out_fences: The field is a return value from the ioctl containing the list of
> +	 * address/value pairs to wait for.
> +	 */
> +	__u64	out_fences;
> +};
> +
>  /* vm ioctl */
>  #define AMDGPU_VM_OP_RESERVE_VMID	1
>  #define AMDGPU_VM_OP_UNRESERVE_VMID	2
> -- 
> 2.43.0
> 
