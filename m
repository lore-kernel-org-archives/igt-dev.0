Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD052C3ABC9
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 18:14:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2F910EB64;
	Fri, 16 May 2025 18:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ISjkKYIY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C1110EB64
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 18:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747419255; x=1778955255;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qXdyqSCPDtkfKCK8RAwq1dfkhhbUSOcR871mM7ha6ks=;
 b=ISjkKYIY2cY3dlk37p5IpFOYqjdWm5t/LP+2jqbPdPnUosVp6ILbsSN0
 tt1Ua/eRjmzRGExofm0xRcfIkcyTilHMzHuHEvFflZZhbDGYkGoaUZprd
 rCDfzbLYQB2u71nrWRNSDlytV1GhhmWxbJVYUVWZR7Aal4YBrXhUkA3N3
 mw4IsBQXTmN4ByHQ/LBWU6ha2h3xd3zhOuqjY6mAnWdYo9RPF4IljmqAX
 FQCRM6bAxV/RCCWsinooX1XoNNYlTBFJS4jrckj75p+xV1HW2ViH1Xgms
 Q0bi9Ave4t6tRLflC6f5NoOLxGPXhE2HSGiD0N5ulOrkGSqtgWmvkaegN Q==;
X-CSE-ConnectionGUID: jY7QKZhSQrqLksnltdp9Jw==
X-CSE-MsgGUID: FAFWPh8cQ1mMnFe+qGPDDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="53072977"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="53072977"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 11:14:14 -0700
X-CSE-ConnectionGUID: CZrgJUy4RJWJA3dMInlAWQ==
X-CSE-MsgGUID: 9w25yzjkQ0m9NzAkJNLxaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="169800411"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 11:14:13 -0700
Date: Fri, 16 May 2025 20:14:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_mmap: Acquire rpm reference for
 pci-membarrier tests
Message-ID: <20250516181411.wmgu2xv5g5si3rtk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 igt-dev@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
References: <20250516155533.2786246-1-kolanupaka.naveena@intel.com>
 <20250516155533.2786246-2-kolanupaka.naveena@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250516155533.2786246-2-kolanupaka.naveena@intel.com>
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
On 2025-05-16 at 21:25:32 +0530, Kolanupaka Naveena wrote:
> During the test, the device is entering into runtime suspend, which is
> leading the device to d3hot or d3cold mode. Hence the read is giving
> a special value 0xffffffff.
> 
> To avoid this issue acquired an rpm ref to keep the device awake
> during the access.
> 
> Also created a sub-group for all the pci-membarrier tests to avoid the
> multiple open/close calls to rpm ref.
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
> ---
>  tests/intel/xe_mmap.c | 64 +++++++++++++++++++++++++------------------
>  1 file changed, 37 insertions(+), 27 deletions(-)
> 
> diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
> index 5fd641075..9421b8503 100644
> --- a/tests/intel/xe_mmap.c
> +++ b/tests/intel/xe_mmap.c
> @@ -11,6 +11,8 @@
>   * Functionality: mmap
>   */
>  
> +#include <fcntl.h>
> +
>  #include "igt.h"
>  
>  #include "xe_drm.h"
> @@ -419,31 +421,43 @@ igt_main
>  		test_mmap(fd, vram_memory(fd, 0) | system_memory(fd),
>  			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  
> -	igt_subtest("pci-membarrier") {
> -		igt_require(is_pci_membarrier_supported(fd));
> -		test_pci_membarrier(fd);
> -	}
> +	igt_subtest_group {
> +		int fw_handle = -1;
>  
> -	igt_subtest("pci-membarrier-parallel") {
> -		int xe;
> -		unsigned int i;
> -		uint32_t *ptr;
> -
> -		igt_require(is_pci_membarrier_supported(fd));
> -		xe = drm_open_driver(DRIVER_XE);
> -		srand(time(0));
> -		i = rand() % (PAGE_SIZE / sizeof(*ptr));
> -		igt_fork(child, 1)
> -			test_pci_membarrier_parallel(xe, child, i);
> -		test_pci_membarrier_parallel(fd, -1, i);
> -		igt_waitchildren();
> -
> -		close(xe);
> -	}
> +		igt_fixture {
> +			igt_require(is_pci_membarrier_supported(fd));

This require should be placed at each subtest.

> +			fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +			igt_assert_lte(0, fw_handle);

Please no asserts outside of subtest. Imho both open of fw_handle
and assert should be done in a function, and called at each subtest
which needs them, for example:

void open_forcewake(int fd, int *fw_ptr)
{
	if(fw_ptr > 0)
		return;

	igt_require(is_pci_membarrier_supported(fd));
	*fw_ptr = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
	igt_assert_lte(0, *fw_ptr);
}

and use it at each subtest:
		igt_subtest("pci-membarrier") {
			open_forcewake(fd, &fw_handle);
			test_pci_membarrier(fd);
		}

Btw you could name it as other name, like prepare_pci_membarrier_test()
as this is doing two things, not one.

> +		}
> +
> +		igt_subtest("pci-membarrier")
> +			test_pci_membarrier(fd);
> +
> +		igt_subtest("pci-membarrier-parallel") {
> +			int xe;
> +			unsigned int i;
> +			uint32_t *ptr;
> +
> +			xe = drm_open_driver(DRIVER_XE);

This is new code, so
xe = drm_reopen_driver(fd);

> +			srand(time(0));

Drop srand() from here.

> +			i = rand() % (PAGE_SIZE / sizeof(*ptr));
> +			igt_fork(child, 1)
> +				test_pci_membarrier_parallel(xe, child, i);
> +			test_pci_membarrier_parallel(fd, -1, i);
> +			igt_waitchildren();
>  
> -	igt_subtest("pci-membarrier-bad-pagesize") {
> -		igt_require(is_pci_membarrier_supported(fd));
> -		test_bad_pagesize_for_pcimem(fd);
> +			close(xe);

drm_close_driver(fd);

When you are doing code refactoring please make it clean
from the start.

> +		}
> +
> +		igt_subtest("pci-membarrier-bad-pagesize")

Add open_forcewake(fd, &fw_handle);

> +			test_bad_pagesize_for_pcimem(fd);
> +
> +		igt_subtest("pci-membarrier-bad-object")

Add open_forcewake(fd, &fw_handle);

Regards,
Kamil

> +			test_bad_object_for_pcimem(fd);
> +
> +		igt_fixture {
> +			close(fw_handle);
> +		}
>  	}
>  
>  	igt_subtest("bad-flags")
> @@ -455,10 +469,6 @@ igt_main
>  	igt_subtest("bad-object")
>  		test_bad_object(fd);
>  
> -	igt_subtest("pci-membarrier-bad-object") {
> -		igt_require(is_pci_membarrier_supported(fd));
> -		test_bad_object_for_pcimem(fd);
> -	}
>  
>  	igt_subtest("small-bar") {
>  		igt_require(xe_visible_vram_size(fd, 0));
> -- 
> 2.34.1
> 
