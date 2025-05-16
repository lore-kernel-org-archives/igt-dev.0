Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36F6C3ABC9
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 15:57:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BDE10EB06;
	Fri, 16 May 2025 15:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nh4nkHla";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC50810EB06
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 15:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747411045; x=1778947045;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=LAUB5k1C3fS1JkCVTgMTWAlo5Ml9rb0WmfxGzeyAbs0=;
 b=Nh4nkHlaCnaG949FVVFin6HczQ9HyHJkBU4yPYOBZ/c1OMvAKZ04DUc8
 ha3doRPoq1FgwlbLNinqCAvlklI1COKBjAe8VZfsjEAPsRoBRjda8mcOR
 aghLEWJFsOUFp5hh2Wggrw2WnsF8gyzkYV2mjTkZ53AJh8g6mHkAU+nBL
 9Y/vWZjcHkJV+JtDKXe33QgVrZnechGHugdQEfV6wh/p8rrXZIvNOZiOV
 Job8lJNbv320T3kBJ0uHaecfwEXzKoh0LOUUbspX+v9YivuK3ELeemor9
 TmBjq3qfphVNvBP0ISFYpo7guTRePru3TJMvplMlj+h73whpACuxCWDZ4 A==;
X-CSE-ConnectionGUID: Dm6OZIKlQGe8AjFL+x0oQQ==
X-CSE-MsgGUID: o3Nz3tSjQ9KihW2/Sbj6KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49288559"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="49288559"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 08:57:24 -0700
X-CSE-ConnectionGUID: ksYfn6l1StqxbZmAbC6nnA==
X-CSE-MsgGUID: uUBXkWfHT562Ij05atrCzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="169654763"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.245.176])
 ([10.245.245.176])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 08:57:24 -0700
Message-ID: <a16ee76c-a8f2-434b-8af5-3bda50d43936@intel.com>
Date: Fri, 16 May 2025 16:57:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_mmap: Acquire rpm reference for
 pci-membarrier tests
To: Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250516155533.2786246-1-kolanupaka.naveena@intel.com>
 <20250516155533.2786246-2-kolanupaka.naveena@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250516155533.2786246-2-kolanupaka.naveena@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 16/05/2025 16:55, Kolanupaka Naveena wrote:
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

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   tests/intel/xe_mmap.c | 64 +++++++++++++++++++++++++------------------
>   1 file changed, 37 insertions(+), 27 deletions(-)
> 
> diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
> index 5fd641075..9421b8503 100644
> --- a/tests/intel/xe_mmap.c
> +++ b/tests/intel/xe_mmap.c
> @@ -11,6 +11,8 @@
>    * Functionality: mmap
>    */
>   
> +#include <fcntl.h>
> +
>   #include "igt.h"
>   
>   #include "xe_drm.h"
> @@ -419,31 +421,43 @@ igt_main
>   		test_mmap(fd, vram_memory(fd, 0) | system_memory(fd),
>   			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
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
> +			fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +			igt_assert_lte(0, fw_handle);
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
> +			srand(time(0));
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
> +		}
> +
> +		igt_subtest("pci-membarrier-bad-pagesize")
> +			test_bad_pagesize_for_pcimem(fd);
> +
> +		igt_subtest("pci-membarrier-bad-object")
> +			test_bad_object_for_pcimem(fd);
> +
> +		igt_fixture {
> +			close(fw_handle);
> +		}
>   	}
>   
>   	igt_subtest("bad-flags")
> @@ -455,10 +469,6 @@ igt_main
>   	igt_subtest("bad-object")
>   		test_bad_object(fd);
>   
> -	igt_subtest("pci-membarrier-bad-object") {
> -		igt_require(is_pci_membarrier_supported(fd));
> -		test_bad_object_for_pcimem(fd);
> -	}
>   
>   	igt_subtest("small-bar") {
>   		igt_require(xe_visible_vram_size(fd, 0));

