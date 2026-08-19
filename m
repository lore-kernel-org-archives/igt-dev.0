Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C028FC5DF86
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 11:14:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBFD10EDE6;
	Wed, 19 Aug 2026 11:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GrHAvk/n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8343810EDE7
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 11:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787138041; x=1818674041;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b+nCJWbVjC8cAm9otVTWLlBuw3jYLxVvMILI6yEZK1Q=;
 b=GrHAvk/nv1eYVkL5pXTZB1Mb53Aiwexm3aHhjNDwBIesAxJva7QkCUuN
 rDUB2Ln6jCZoFIw1hgEEQYcO6o2hQxennf1p++KNvMScSQbR3nm6Bjt7D
 2qJgoB0j+ooIpCbO6YI5YkkPpTJzxhuf6SHzIHCEAIAf/2/j9RsNHsoWR
 uZaeKmAgJfi0hsqioWCydH6nkI7umVljIg6A1yJuZGrhiMd1CQxwE/laF
 SziAbV2XqIMvR1I3cv0oImu8vfGyW9fLLbUl3o+8T1rwGR9ouxa197+JO
 KMgflEwIkEARFFgOliLQEQgt483RBFHoKGEt8wgtGZIs5ennymWtQcFLM Q==;
X-CSE-ConnectionGUID: OueBMsM3ShepysnufxvvCw==
X-CSE-MsgGUID: qJJa/lOkQmSwr+yvu2yh7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87665064"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87665064"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 04:14:01 -0700
X-CSE-ConnectionGUID: pQanyXPUQUiftwGRL1lpjQ==
X-CSE-MsgGUID: xbGmjVoYROSKBdnubv7EYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="270736137"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 04:13:59 -0700
Date: Wed, 19 Aug 2026 13:13:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH] tests/intel/xe_exec_system_allocator: fix
 prefetch-change-attr and DONTNEED flag handling
Message-ID: <20260819111352.ini5pywzhim4a4kw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com
References: <20260818142956.577956-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260818142956.577956-1-nishit.sharma@intel.com>
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
On 2026-08-18 at 14:29:56 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> These changes fixes the prefetch-change-attr test flow so the intended
> prefetch and atomic-attribute transition execute in the correct path,
> and it also switches the skip-results condition to use the proper internal
> test flag (USE_MADV_DONTNEED) instead of the libc MADV_DONTNEED constant.
> Together, these updates remove dead-path behavior, make the intent explicit
> and improve reliability of the affected system-allocator IGT coverage
> across platforms.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>

These two fixes seems unrelated, please split them into two
separate patches. Also, can you find any work items on GitLab
which they resolves? If yes, please add Closes: tags.



Regards,
Kamil

> ---
>  tests/intel/xe_exec_system_allocator.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 6ca53aa5f..305512dfd 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -1395,6 +1395,9 @@ madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
>  
>  		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size / 2);
>  
> +		/* free 1st allocation in mem_attrs */
> +		free(mem_attrs);
> +
>  		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
>  		if (!mem_attrs) {
>  			igt_info("Failed to get memory attributes\n");
> @@ -1426,13 +1429,14 @@ madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
>  		if (!mem_attrs) {
>  			igt_info("Failed to get memory attributes\n");
>  			return;
> +		}
>  
>  		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0,
>  				     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
>  
>  		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
>  					  DRM_XE_ATOMIC_DEVICE);
> -		}
> +
>  		free(mem_attrs);
>  	}
>  }
> @@ -2333,7 +2337,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
>  	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
>  
>  	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
> -	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST) || (flags & MADV_DONTNEED);
> +	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST) || (flags & USE_MADV_DONTNEED);
>  	env.vm = vm;
>  
>  	read_gt_stats_snapshot(fd, eci, &stats_before);
> -- 
> 2.43.0
> 
