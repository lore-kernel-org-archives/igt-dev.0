Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0632C282EC
	for <igt-dev@archiver.kernel.org>; Tue, 18 Mar 2025 10:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64ACC10E461;
	Tue, 18 Mar 2025 10:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PBCzZwzf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FCE810E461
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Mar 2025 10:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742292969; x=1773828969;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Bb9wT0mvkU3vHgBf08xVx0cu0CHZ+Fj0wx0qq63yW70=;
 b=PBCzZwzfVYfO3UF9mtd9ay6cuVXOrh1HZixIB24r7/oxjXbsIQFo6EB3
 JZSN+e8ZnzHmhsmnb1wsJpuC39hWuBYtYa4YD424TFzWRB3w0GWB48coh
 cirgolriiXJltc415F3M2jOgk/SDu2InHA6JEUyIQwKmsTOtc9qepIL2k
 b1yzEDYX7LklN8L2xYG9ZgtkFU/ViLJKpNcTF/qRXIpZBZMcSJjnrJ0KZ
 HWYe4z7eVIUU6Tp9NGLpfvIsRf84VJ59wnPb6BOnlf0+JSDZLUmWU9n2U
 jAoiX0EEASIKqw09CXmyAT6VGGv6Ck0BBJCmA19HnG/CKI//Qx6Kx5vnY Q==;
X-CSE-ConnectionGUID: tFuI1XnVSzG4y/lne8SUiQ==
X-CSE-MsgGUID: CUx9fOBuRDCQ7snLo6eOUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43339191"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="43339191"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 03:16:08 -0700
X-CSE-ConnectionGUID: sb96OLqESdmzXDGNxhMosw==
X-CSE-MsgGUID: +pPCw1Z6T7yRsuRcqfVXyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="127403447"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.80.52])
 ([10.245.80.52])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 03:16:07 -0700
Message-ID: <6de7d748-d09e-4259-bc44-06d9f3d9f22e@linux.intel.com>
Date: Tue, 18 Mar 2025 11:16:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/2] tests/intel/xe_pm: Add a check for power
 management capability
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250317174134.991555-1-jakub1.kolakowski@intel.com>
 <20250317174134.991555-3-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250317174134.991555-3-jakub1.kolakowski@intel.com>
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



On 3/17/2025 6:41 PM, Jakub Kolakowski wrote:
> Add a check for power management capability of device tested in tests
> related to D3 states. Currently if test is started on configuration
> that does not support the PM capability it doesn't skip, instead
> depending on test it may fail, abort or timeout.
> With this change test will skip with a clear message why it did.
> 
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>   tests/intel/xe_pm.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index c2026474d..f3bfab50e 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -146,6 +146,9 @@ static void vram_d3cold_threshold_restore(int sig)
>   
>   static bool setup_d3(device_t device, enum igt_acpi_d_state state)
>   {
> +	igt_require_f(igt_has_pci_pm_capability(device.pci_root),

Is device.pci_root correct ?

> +		      "PCI power management capability not found\n");
> +
>   	dpms_on_off(device, DRM_MODE_DPMS_OFF);
>   
>   	/*

