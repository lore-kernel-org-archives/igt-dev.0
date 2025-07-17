Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC7DC83F22
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 08:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC27510E13F;
	Thu, 17 Jul 2025 08:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UakA74yD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCD110E13F
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 08:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752742308; x=1784278308;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wtSOPqiQmpOFpay4+AeQJ+hvHnGYnf93HMffDtfT2vU=;
 b=UakA74yDXkIpPDs1ejA+QBRdZinuxrW/lqF6P2X4/VQmBzJHUNBO45tZ
 P74/OGUPWI62qZTbcpqmFf43Vog49TLxwli4L/B0Seh1YrWphXz+V5YBj
 0hzELB2JPYJwnJC8sxYFI84YCu3X/Ygom0tJ7e65lNNRVrqbBZcmkYiyJ
 IT1Q+22jqghmcH9GL1BKZSN27WznKUjxbrNPBkw/eMs/uhlfLeDCtuuAO
 Vuh3fmXVL5wmdxPjc4hHQHT4o10gs5hjaOBLH0Gqi+AbB43Hy0MI5DiYi
 20ngWqNVRQ8wKUPtelThUr6QAtUeOAmFpwWzJY4YjVrX4JAQR1ADMCd29 g==;
X-CSE-ConnectionGUID: liRv23dZTf+aCYqansaU2w==
X-CSE-MsgGUID: KiWO+TsbRaK+g7erxsUelg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65578514"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="65578514"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 01:51:48 -0700
X-CSE-ConnectionGUID: ytieLwh2SUe6jTx2bZmMSw==
X-CSE-MsgGUID: cKlhtWk5QyKS62qJlDVzaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="157113896"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 01:51:47 -0700
Date: Thu, 17 Jul 2025 10:51:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.auld@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_vm: Fix skip condition to account
 for padded BO size
Message-ID: <20250717085128.uyd4o5p44mk46cya@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 igt-dev@lists.freedesktop.org, matthew.auld@intel.com
References: <20250611100158.15197-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250611100158.15197-1-lukasz.laguna@intel.com>
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

Hi Lukasz,
On 2025-06-11 at 12:01:58 +0200, Lukasz Laguna wrote:
> Several subtests currently skip when the requested BO size exceeds
> visible VRAM, but they don't take into account the padded size that is
> actually passed to the kernel when creating BO. As a result, subtest may
> attempt to allocate a BO that exceeds the available VRAM, resulting in
> -E2BIG error.
> 
> Fix this by using the prefetch BO size in the skip condition to ensure
> the subtests avoid allocation attempts that are guaranteed to fail.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_vm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 94cca13ba..1a21a6459 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1385,15 +1385,15 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
>  	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>  	vm = xe_vm_create(fd, 0, 0);
>  
> +	bo_size_prefetch = xe_bb_size(fd, bo_size);
> +
>  	if (flags & LARGE_BIND_FLAG_USERPTR) {
> -		bo_size_prefetch = xe_bb_size(fd, bo_size);
>  		map = aligned_alloc(xe_get_default_alignment(fd), bo_size_prefetch);
>  		igt_assert(map);
>  	} else {
> -		igt_skip_on(xe_visible_vram_size(fd, 0) && bo_size >
> +		igt_skip_on(xe_visible_vram_size(fd, 0) && bo_size_prefetch >
>  			    xe_visible_vram_size(fd, 0));
>  
> -		bo_size_prefetch = xe_bb_size(fd, bo_size);
>  		bo = xe_bo_create(fd, vm, bo_size_prefetch,
>  				  vram_if_possible(fd, eci->gt_id),
>  				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -- 
> 2.40.0
> 
