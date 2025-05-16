Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362C9C3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 15:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD2610EAFB;
	Fri, 16 May 2025 15:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SGZh+ZTj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5638210EAFB
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 15:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747408959; x=1778944959;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=M94CqELhiLvd/TShOM41xKvCSBrbWLBZUKLGdmSnnDg=;
 b=SGZh+ZTjJgABG8HAsLZbz6MThdJ1QQaSdGFb18/9n+kU8Xxr6roRLX6T
 5p11pGCghRURQbNIBsC9X+gIOyaB8DBwDa2KnLgBlIJvG/4fSme0Fp/iL
 ewUzx+7senZ030R7ADTT9PaTDgTakYThczx1FIETobPUW7NFfxsaPMFVZ
 cuEQUEbFB+UTlT+9zphPZKEqB+S9L/9yPWPgd1iETQ+IVGJ9wn2b0gb5Q
 FclECWv8xRMKpeJ6OM1DX4RMN9VqhUCg12Y1VXxSY6lhI2nYOHIXqIQu9
 WL91ZG5Idog/Q9OJi/I+UjG6D9clbK9FXcxHFkq7pcHps4Wo3YLa1lZUH g==;
X-CSE-ConnectionGUID: GzC14EAtQbGU5wOYoscZgA==
X-CSE-MsgGUID: 89gk5TbVRmyig8DSArakVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="66936586"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="66936586"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 08:22:37 -0700
X-CSE-ConnectionGUID: PmpF5BpVQmCN5X1LkVUJiQ==
X-CSE-MsgGUID: CUY4mXvDRECoLqm0WzYwEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="138763193"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 08:22:36 -0700
Date: Fri, 16 May 2025 17:22:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_mmap: Use appropriate drm APIs
Message-ID: <20250516152233.h4vkdrotsiphxmsc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250516135819.2784676-1-kolanupaka.naveena@intel.com>
 <20250516135819.2784676-3-kolanupaka.naveena@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250516135819.2784676-3-kolanupaka.naveena@intel.com>
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

Hi Kolanupaka,
On 2025-05-16 at 19:28:19 +0530, Kolanupaka Naveena wrote:

imho subject should rather read about fixing open/close:

[PATCH i-g-t 2/2] tests/intel/xe_mmap: Fix open/close calls

> Instead of using the standard drm_open and close APIs for driver
> open and close operations, use the appropriate drm_reopen and
> drm_close APIs to ensure the driver is opened and closed correctly.
> 

Also describe srand() removal here, for example:

Also while at this, drop srand() call as this is done by
igt_core.

With this fixed
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
> ---
>  tests/intel/xe_mmap.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
> index 061b3de0a..abd144ac0 100644
> --- a/tests/intel/xe_mmap.c
> +++ b/tests/intel/xe_mmap.c
> @@ -436,8 +436,7 @@ igt_main
>  		uint32_t *ptr;
>  
>  		igt_require(is_pci_membarrier_supported(fd));
> -		xe = drm_open_driver(DRIVER_XE);
> -		srand(time(0));
> +		xe = drm_reopen_driver(fd);
>  		i = rand() % (PAGE_SIZE / sizeof(*ptr));
>  		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
>  		igt_assert_lte(0, fw_handle);
> @@ -447,7 +446,7 @@ igt_main
>  		igt_waitchildren();
>  
>  		close(fw_handle);
> -		close(xe);
> +		drm_close_driver(xe);
>  	}
>  
>  	igt_subtest("pci-membarrier-bad-pagesize") {
> -- 
> 2.34.1
> 
