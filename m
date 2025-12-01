Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121A0D116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 15:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD94510E406;
	Mon,  1 Dec 2025 15:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TxPsD6Ba";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D7810E406
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 15:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764603234; x=1796139234;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hRgtyPjRA+vwSaJDC4lmD2gbHS+uukzrMO4Oisx22eQ=;
 b=TxPsD6BaQjVnZIhgE9gt1k8sZYi8KpBNohntdhue86d1hPVN6uD3vmKf
 OOpssL8/DVWkcOVZbn37HW+cZY3QwkHTcG1gaqT/nfGnHLH2kGy9mxc3t
 C6ZpYuzwIBdUL8sfGnU2twWK55tide4y89OAUdURbkH5HBHHNmgZr1+am
 HIFih9MHISPLhJVJ9YMr8WuSO+xQHD9RWayZkO6fMR8yKxtJSEc6EvyW7
 3+wnB2cBB51SHzffjWVwxxSB36G5DFsi2GRrys+oNHkfTyUYa3k4F7hCA
 M/P7LCXwCr+aTZ6KHLrYn0lKcl0OZ7f3OREN/pzyb+TsgxUKxY/je/Bv1 A==;
X-CSE-ConnectionGUID: SyX9+id0RImIrn6oqu2yWw==
X-CSE-MsgGUID: T1RDnNqVRtiKD+h+PNb+Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77646989"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="77646989"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 07:33:49 -0800
X-CSE-ConnectionGUID: pR/qAA8QSaSV9hMs/m0jkA==
X-CSE-MsgGUID: LhbWQ27YT+qXEcHpbsLElw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="199040061"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 07:33:47 -0800
Date: Mon, 1 Dec 2025 16:33:45 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH i-g-t v9 01/10] lib/xe: Add instance parameter to
 xe_vm_madvise
Message-ID: <20251201153345.nj3skospdagctf7j@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 pravalika.gurram@intel.com,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20251201090349.326673-1-nishit.sharma@intel.com>
 <20251201090349.326673-2-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251201090349.326673-2-nishit.sharma@intel.com>
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

Hi nishit.sharma,
On 2025-12-01 at 09:03:40 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> tests/intel/xe_exec_system_allocator: Add parameter in madvise call
> 
> Add an 'instance' parameter to __xe_vm_madvise() and xe_vm_madvise() to
> specify which VRAM instance should be targeted for memory advise
> operations.
> Getting compilation issues in xe_exec_system_allocator test after adding
> 'instance' parameters in xe_vm_madvise(). As a fix 0 as instance parameter
> passed in xe_vm_madvise() calls available in xe_exec_system_allocator test.
> 

+cc Thomas

> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  include/drm-uapi/xe_drm.h              |  4 ++--

I said it before - you cannot do it with this commit.
First, drm-uapi change should be splitted into a separate change
and be in sync with drm-next commit.

Without drm-tip counterpart, you can change include/drm-uapi-experimental/intel_drm_local.h
and then you can make it as one commit, in this first patch.
Later on after a upai changes reach drm-next, you can bring them here
and remove stale ones from exeperimental.

For reference look into history:
git log -- include/drm-uapi/xe_drm.h

Regards,
Kamil

>  lib/xe/xe_ioctl.c                      | 13 +++++++++----
>  lib/xe/xe_ioctl.h                      |  9 +++++++--
>  tests/intel/xe_exec_system_allocator.c |  8 ++++----
>  4 files changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 89ab54935..3472efa58 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -2060,8 +2060,8 @@ struct drm_xe_madvise {
>  			/** @preferred_mem_loc.migration_policy: Page migration policy */
>  			__u16 migration_policy;
>  
> -			/** @preferred_mem_loc.pad : MBZ */
> -			__u16 pad;
> +			/** @preferred_mem_loc.region_instance: Region instance */
> +			__u16 region_instance;
>  
>  			/** @preferred_mem_loc.reserved : Reserved */
>  			__u64 reserved;
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 39c4667a1..221fd7c62 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -687,7 +687,8 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  }
>  
>  int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> -		    uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy)
> +		    uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy,
> +		    uint16_t instance)
>  {
>  	struct drm_xe_madvise madvise = {
>  		.type = type,
> @@ -704,6 +705,7 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
>  	case DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC:
>  		madvise.preferred_mem_loc.devmem_fd = op_val;
>  		madvise.preferred_mem_loc.migration_policy = policy;
> +		madvise.preferred_mem_loc.region_instance = instance;
>  		igt_debug("madvise.preferred_mem_loc.devmem_fd = %d\n",
>  			  madvise.preferred_mem_loc.devmem_fd);
>  		break;
> @@ -731,14 +733,17 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
>   * @type: type of attribute
>   * @op_val: fd/atomic value/pat index, depending upon type of operation
>   * @policy: Page migration policy
> + * @instance: vram instance
>   *
>   * Function initializes different members of struct drm_xe_madvise and calls
>   * MADVISE IOCTL .
>   *
> - * Asserts in case of error returned by DRM_IOCTL_XE_MADVISE.
> + * Asserts in case of error returned by DRM_IOCTL_XE_MADVISE
>   */
>  void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> -		   uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy)
> +		   uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy,
> +		   uint16_t instance)
>  {
> -	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext, type, op_val, policy), 0);
> +	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext, type, op_val, policy,
> +				      instance), 0);
>  }
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index ae8a23a54..bbee06a9d 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -100,13 +100,18 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		       uint32_t exec_queue, int64_t timeout);
>  int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_t ext,
> -		    uint32_t type, uint32_t op_val, uint16_t policy);
> +		    uint32_t type, uint32_t op_val, uint16_t policy, uint16_t instance);
>  void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_t ext,
> -		   uint32_t type, uint32_t op_val, uint16_t policy);
> +		   uint32_t type, uint32_t op_val, uint16_t policy, uint16_t instance);
>  int xe_vm_number_vmas_in_range(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr);
>  int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr,
>  		    struct drm_xe_mem_range_attr *mem_attr);
>  struct drm_xe_mem_range_attr
>  *xe_vm_get_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start,
>  				    uint64_t range, uint32_t *num_ranges);
> +void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo,
> +			uint64_t offset, uint64_t addr,
> +			uint64_t size, uint32_t flags);
> +void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
> +			  uint64_t addr, uint64_t size);
>  #endif /* XE_IOCTL_H */
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index b88967e58..1e7175061 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -1164,7 +1164,7 @@ madvise_swizzle_op_exec(int fd, uint32_t vm, struct test_exec_data *data,
>  	xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
>  		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
>  		      preferred_loc,
> -		      0);
> +		      0, 0);
>  }
>  
>  static void
> @@ -1172,7 +1172,7 @@ xe_vm_madvixe_pat_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
>  		       int pat_index)
>  {
>  	xe_vm_madvise(fd, vm, addr, range, 0,
> -		      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0);
> +		      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0, 0);
>  }
>  
>  static void
> @@ -1181,7 +1181,7 @@ xe_vm_madvise_atomic_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
>  {
>  	xe_vm_madvise(fd, vm, addr, range, 0,
>  		      DRM_XE_MEM_RANGE_ATTR_ATOMIC,
> -		      mem_attr, 0);
> +		      mem_attr, 0, 0);
>  }
>  
>  static void
> @@ -1190,7 +1190,7 @@ xe_vm_madvise_migrate_pages(int fd, uint32_t vm, uint64_t addr, uint64_t range)
>  	xe_vm_madvise(fd, vm, addr, range, 0,
>  		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
>  		      DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM,
> -		      DRM_XE_MIGRATE_ALL_PAGES);
> +		      DRM_XE_MIGRATE_ALL_PAGES, 0);
>  }
>  
>  static void
> -- 
> 2.48.1
> 
