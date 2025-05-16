Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EE4C3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 12:20:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E01710E14B;
	Fri, 16 May 2025 12:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EPnrAMyR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAF810E14B
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 12:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747398050; x=1778934050;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=EIQay7M8WNUMtt0I9m6yGfpka4Tc98RT/FuXiL872Z4=;
 b=EPnrAMyRD1HqPcYr249n0NJwd62auK1Ll8VrhbVeJGNT/7lsEiMC+UCb
 EJGgKyjoLijZxof5S1ne88dQK+vhAmT3t8vXcr/SaG0QXr96EIfIDsMXL
 /9t3pW9GguYEsgbWAhUa5eCr/vWINPBZvLTQmZ/5L5EKkkXGT4m4GTzgX
 GukbmPwLRvqqDRIVAST/JETxLB4em9a3EQsNlX8kpfDnfEvSV3YLzZQbA
 0iRourvzJwbZINHMsW17flO8oiUbamwLjB1N8/H1OLvzCB9bxvh6lSwhN
 8nTrM3gHr+6YJ+VAaYRbom/97qQLs83MMRGNZyvx/YsnoiL3h+yi0vkMF A==;
X-CSE-ConnectionGUID: ZN2V/VNcT6WlPQS5lYrGKw==
X-CSE-MsgGUID: Sx83W8aQSYyKNIoZ5dOYnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60392502"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="60392502"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 05:20:50 -0700
X-CSE-ConnectionGUID: h+KdEdXLSZ+2aW4VPoDnqA==
X-CSE-MsgGUID: Ar9epnIrSa+78SIIrUyibQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="138578366"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.245.176])
 ([10.245.245.176])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 05:20:49 -0700
Message-ID: <fc03b4c5-6179-4319-bedf-d46c51de1fb1@intel.com>
Date: Fri, 16 May 2025 13:20:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_mmap: Acquire rpm ref for all
 other pci-membarrier tests
To: Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250516105149.2783072-1-kolanupaka.naveena@intel.com>
 <20250516105149.2783072-3-kolanupaka.naveena@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250516105149.2783072-3-kolanupaka.naveena@intel.com>
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

On 16/05/2025 11:51, Kolanupaka Naveena wrote:
> To make sure the device is awake during the access. If not the read is
> getting a special value 0xffffffff thus leading to error.
> 

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4784
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Kolanupaka Naveena <kolanupaka.naveena@intel.com>

Probably just squash the patches together?

> ---
>   tests/intel/xe_mmap.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
> index 51c27586f..061b3de0a 100644
> --- a/tests/intel/xe_mmap.c
> +++ b/tests/intel/xe_mmap.c
> @@ -406,6 +406,7 @@ static bool is_pci_membarrier_supported(int fd)
>   igt_main
>   {
>   	int fd;
> +	int fw_handle = -1;
>   
>   	igt_fixture
>   		fd = drm_open_driver(DRIVER_XE);
> @@ -423,14 +424,16 @@ igt_main
>   
>   	igt_subtest("pci-membarrier") {
>   		igt_require(is_pci_membarrier_supported(fd));
> +		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +		igt_assert_lte(0, fw_handle);
>   		test_pci_membarrier(fd);
> +		close(fw_handle);
>   	}
>   
>   	igt_subtest("pci-membarrier-parallel") {
>   		int xe;
>   		unsigned int i;
>   		uint32_t *ptr;
> -		int fw_handle = -1;
>   
>   		igt_require(is_pci_membarrier_supported(fd));
>   		xe = drm_open_driver(DRIVER_XE);
> @@ -449,7 +452,10 @@ igt_main
>   
>   	igt_subtest("pci-membarrier-bad-pagesize") {
>   		igt_require(is_pci_membarrier_supported(fd));
> +		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +		igt_assert_lte(0, fw_handle);
>   		test_bad_pagesize_for_pcimem(fd);
> +		close(fw_handle);
>   	}
>   
>   	igt_subtest("bad-flags")
> @@ -463,7 +469,10 @@ igt_main
>   
>   	igt_subtest("pci-membarrier-bad-object") {
>   		igt_require(is_pci_membarrier_supported(fd));
> +		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +		igt_assert_lte(0, fw_handle);
>   		test_bad_object_for_pcimem(fd);
> +		close(fw_handle);
>   	}

What about something like this, to tidy things up a bit?

+       igt_subtest_group {
+               int fw_handle;
+
+               igt_fixture {
+                       igt_require(is_pci_membarrier_supported(fd));
+                       fw_handle =
+                               igt_debugfs_open(fd, "forcewake_all", 
O_RDONLY);
+                       igt_assert_lte(0, fw_handle);
+               }
+
+               igt_subtest("pci-membarrier")
+                       test_pci_membarrier(fd);
+
+               igt_subtest("pci-membarrier-parallel") {
+                       int xe;
+                       unsigned int i;
+                       uint32_t *ptr;
+
+                       xe = drm_open_driver(DRIVER_XE);
+                       srand(time(0));
+                       i = rand() % (PAGE_SIZE / sizeof(*ptr));
+                       igt_fork(child, 1)
+                               test_pci_membarrier_parallel(xe, child, i);
+                       test_pci_membarrier_parallel(fd, -1, i);
+                       igt_waitchildren();
+
+                       close(xe);
+               }
+
+               igt_subtest("pci-membarrier-bad-pagesize")
+                       test_bad_pagesize_for_pcimem(fd);
+
+               igt_subtest("pci-membarrier-bad-object")
+                       test_bad_object_for_pcimem(fd);
+
+               igt_fixture {
+                       close(fw_handle);
+               }
+       }
+


>   
>   	igt_subtest("small-bar") {

