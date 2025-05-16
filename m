Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6462DC3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 08:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176B210E9F2;
	Fri, 16 May 2025 08:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FS7FcjFN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E919610E9F2
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 08:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747384752; x=1778920752;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=icraUdWN/XANepkhE7IPwVHQGioLmZco8FPPSx8fV88=;
 b=FS7FcjFNAdfZiwDrBiEbcRMQ1D3fLJkYMo5e17Z+ANaWT2nWhd2KAAUh
 eS5RklDYy60X8VRRo4UTji2rI7GMmZCOwvBI21YzETp3VANzcjbrfsgVB
 iVmQ7oCnCCKJ/jgInl4DHOjuXVac/famLQYaGmxnHmhq/uPh1zTqrHHJi
 ty1NZiGWtiBFxNrYFPo+yJwuoE8m1LuyE+DkG741PL5p3LSrIY3gFA9tw
 19zqmC/4+s4ohaV4rnIpjHMFLP3u5VcQpnzaMZ8BCUwv5ExvYRNkqy8G0
 pR6XJyW3K1uugkir5knAIskHUFms0QmdvVNu8lDN/kB5OwaE/W4vTW8Om A==;
X-CSE-ConnectionGUID: lsW8uAHpQ4KQXRkEDYfs4w==
X-CSE-MsgGUID: pWzUc4+7Ro66cH4BfdxuAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="74747371"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="74747371"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 01:39:11 -0700
X-CSE-ConnectionGUID: vZMbLi5uSOyANF2dpx9XIg==
X-CSE-MsgGUID: z7EsP+svSNmWPzEyt0b5mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="143736039"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.245.176])
 ([10.245.245.176])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 01:39:10 -0700
Message-ID: <a2eff00e-9f4b-49b5-b545-9c9663ae5734@intel.com>
Date: Fri, 16 May 2025 09:39:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_mmap: Acquire rpm reference for
 pci-membarrier-paraller test
To: Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250516052429.2780531-1-kolanupaka.naveena@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250516052429.2780531-1-kolanupaka.naveena@intel.com>
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

On 16/05/2025 06:24, Kolanupaka Naveena wrote:
> During the test, the device is entering into runtime suspend, which is
> leading the device to d3hot or d3cold mode. Hence the read is giving
> a special value 0xffffffff.
> 
> To avoid this issue acquired an rpm ref to keep the device awake
> during the access.
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
> ---
>   tests/intel/xe_mmap.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
> index 5fd641075..51c27586f 100644
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
> @@ -428,16 +430,20 @@ igt_main
>   		int xe;
>   		unsigned int i;
>   		uint32_t *ptr;
> +		int fw_handle = -1;
>   
>   		igt_require(is_pci_membarrier_supported(fd));
>   		xe = drm_open_driver(DRIVER_XE);
>   		srand(time(0));
>   		i = rand() % (PAGE_SIZE / sizeof(*ptr));
> +		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);

Probably this needs to be done for all membarrier related tests? It 
might just be in the timing that we have only seen it here.

> +		igt_assert_lte(0, fw_handle);
>   		igt_fork(child, 1)
>   			test_pci_membarrier_parallel(xe, child, i);
>   		test_pci_membarrier_parallel(fd, -1, i);
>   		igt_waitchildren();
>   
> +		close(fw_handle);
>   		close(xe);
>   	}
>   

