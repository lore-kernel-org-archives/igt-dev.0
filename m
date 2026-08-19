Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA8DC5DF85
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 16:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E8310E15F;
	Wed, 19 Aug 2026 16:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fuRr3EIe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3747710E15F
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 16:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787156977; x=1818692977;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hNl4SCpfPbeTIwGz70ISOwNkqkpkLozCrFe3vmR+2m8=;
 b=fuRr3EIedjNfBqcTf2coQY2aluoDdGN1tqN8lNqaiSebNdjUrgFbv81e
 HmRbeiebfr9EmGzTU2/6lzfjx2yDkLaJ0fXCK9bxqjwrXKzoN7Dpsope2
 CciOYAIOOX///8+o9B+zwaKsbbSStKQGY2MNIOuvU3TmpNwJxy1gG+dfZ
 o4LjJWbjxdJJlpYZYiX+LXSseoqmPqk1ZdPrBbBJtzXrUcnMWUbT6jtwY
 mQ2PERMJy54E5tZwYxUOtyP7ZQPnmne4pjyidTFhzuD4+mzkxRNcLg00J
 LWImkLXY4iX3r28yfKxSJI+WH/k4Ylr9DnY9Pd+zR7V6dr46SiPTI42KP g==;
X-CSE-ConnectionGUID: XBwkguqqRUOlsWipy1ytxA==
X-CSE-MsgGUID: N53vmjv9R2KotFyf9G4a3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="98273105"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="98273105"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 09:29:37 -0700
X-CSE-ConnectionGUID: 7yVAXGSPRwGkdXl4UFfqkg==
X-CSE-MsgGUID: Edfj/gCeT/2+AYihLWOKdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="269458151"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 09:29:36 -0700
Date: Wed, 19 Aug 2026 18:29:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH v1 1/2] tests/intel/xe_exec_system_allocator: fix
 prefetch-change-attr flow
Message-ID: <20260819162933.kuikehhkzzkyx3sp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com
References: <20260819145302.18068-1-nishit.sharma@intel.com>
 <20260819145302.18068-2-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260819145302.18068-2-nishit.sharma@intel.com>
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
On 2026-08-19 at 14:53:00 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> These changes fixes the prefetch-change-attr test flow so the intended
> prefetch and atomic-attribute transition execute in the correct path.

You should also write about memory leak fixed. Now it looks like
another candidate for a split but as they are located near each other,
let this be in one patch.

> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_exec_system_allocator.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 6ca53aa5f..476470be7 100644
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
> -- 
> 2.43.0
> 
