Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B76C35FF8
	for <igt-dev@archiver.kernel.org>; Mon, 17 Mar 2025 09:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0036B10E3D5;
	Mon, 17 Mar 2025 09:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5Yt9hQw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8643A10E3D2
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Mar 2025 09:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742203076; x=1773739076;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=n3xgfX58ybAUIIaMnsUBK19PQD76FxoD4xYMFXsK3mY=;
 b=k5Yt9hQwlZUh6vqfw+1vPtdaPw+whkC7SGBGlzxFZJivQa/S0RJVz2VF
 F5cgb3e/Quqqd/L471fN+nlD+mE1jyG/fu5ZAZcDIGaXBof0zrUvlLnSx
 GeGkiV3S+a3r1LUtk2UYem1l+vkPiw7T8CwO0fGsejHqb2VGJ3rXgI6Jk
 l53Uf0rOhg/TFF+Wxw7wRHfkWvkOzc2jNzVJaK2moXpWKFjfkNS0oeELE
 vzI36PS+hir9CQXVUdSYvDTdVCUqOTD6BvmDctpo2k03G8QcYqFKsf/Hh
 QN5KRWX9iiBzUmWhkcY95L8fORb/mhazUoWhhJMyOaR0d+WduBMxuAQ12 g==;
X-CSE-ConnectionGUID: OZlf7icTT9GbpPtOvF92iQ==
X-CSE-MsgGUID: d4weqMDVR3OppDpRfJSKxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="46932006"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="46932006"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 02:17:56 -0700
X-CSE-ConnectionGUID: rXR/jsZvSbiGntIZk3RcuQ==
X-CSE-MsgGUID: xxKDAzTmS6uZzDNoCZl0/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="145062973"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.101.99])
 ([10.245.101.99])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 02:17:55 -0700
Message-ID: <66d1d97a-9d73-4d87-91dd-00ab59a4a2d3@linux.intel.com>
Date: Mon, 17 Mar 2025 10:17:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/xe_pm: Add a check for power
 management capability
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250314112732.795523-1-jakub1.kolakowski@intel.com>
 <20250314112732.795523-3-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250314112732.795523-3-jakub1.kolakowski@intel.com>
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



On 3/14/2025 12:27 PM, Jakub Kolakowski wrote:
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
>   tests/intel/xe_pm.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index c2026474d..53792e1c6 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -146,6 +146,10 @@ static void vram_d3cold_threshold_restore(int sig)
>   
>   static bool setup_d3(device_t device, enum igt_acpi_d_state state)
>   {
> +	

trailing whitespace

> +	igt_require_f(igt_has_pci_pm_capability(device.pci_root),
> +					"PCI power management capability not found\n");

Alignment should match open parenthesis

please run checkpatch

> +
>   	dpms_on_off(device, DRM_MODE_DPMS_OFF);
>   
>   	/*

