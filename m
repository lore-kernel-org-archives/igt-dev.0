Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D589F4BB6F
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 18:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78EE10E5F0;
	Tue, 24 Feb 2026 18:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GdPT2Rh4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38A910E5F0
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 18:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771958299; x=1803494299;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VQnP5Un2ne7Y+Eqo0WamPZbE43q8Ta0C9/Xcj8xldJY=;
 b=GdPT2Rh4O8pzXsUNXi9EHMW60FRNc90FBdSS6nCjcurz/5SmmIAqCKl0
 qd9CG4SdPFabK8mWtWmQNSW57Cdmgz58MEaT1J4NYB5RJXQfNAv6RhUPT
 rDFnkhOXbXCazhDigWJ/4MZRPxUuNIHGXL/xb3+36UoM+lKR9MSknNeUr
 tAbzAmI8heG3Ol8BnYxf4b8wWIxIx2es/dYg/vWQEs1fIjxi2z6T2Tm7A
 nICuEEhzMiBY+PnTOf7CyVNyr1reAS6N7tmAaRkLwFcYIkSWoviVAU2cu
 Ecp37Z2tXxjzyEDh71nMNTzX9Z/jvwx6Csd1IONqrvx1SE2Fmkvb1Ll2r Q==;
X-CSE-ConnectionGUID: tcuY0ryERYO6sngQQ98JmQ==
X-CSE-MsgGUID: TCkezQb0QYyCB4YF8bkX2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="73089435"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="73089435"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 10:38:19 -0800
X-CSE-ConnectionGUID: CJVY3NM0TPWCybpkChvD+A==
X-CSE-MsgGUID: 9ShwSackS5eKb1xVoB1hQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="220590358"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 10:38:17 -0800
Date: Tue, 24 Feb 2026 19:38:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2] tools/intel_gpu_top: explicitly reject Xe
 devices and update documentation
Message-ID: <20260224183815.36urswik6pciikrl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <99018033de0f61191bc09464ebe340631ecdfb5f.1771935520.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <99018033de0f61191bc09464ebe340631ecdfb5f.1771935520.git.sebastian.brzezinka@intel.com>
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

Hi Sebastian,
On 2026-02-24 at 13:21:45 +0100, Sebastian Brzezinka wrote:
> Add checks to detect Xe driver devices and report that they are not
> supported by intel_gpu_top, directing users to the gputop tool instead.
> The man page is updated accordingly, and the tool now prints clear error
> messages when Xe hardware is detected.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
> v1 -> v2:
> 	- Reword the manpage message,
> 	- Reorder the messages about the unsupported Xe driver.
> ---
>  man/intel_gpu_top.rst |  2 ++
>  tools/intel_gpu_top.c | 18 +++++++++++++++++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
> index 20204fdcf..25196d7e5 100644
> --- a/man/intel_gpu_top.rst
> +++ b/man/intel_gpu_top.rst
> @@ -102,6 +102,8 @@ JSON output will be correctly terminated when the tool cleanly exits, otherwise
>  LIMITATIONS
>  ===========
>  
> +* Xe driver devices are not supported, please use the **gputop** tool instead.
> +
>  * Not all metrics are supported on all platforms. Where a metric is unsupported it's value will be replaced by a dashed line.
>  
>  * Non-root access to perf counters is controlled by the *perf_event_paranoid* sysctl.
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index ee38829e1..10519998d 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -2734,8 +2734,17 @@ int main(int argc, char **argv)
>  		ret = igt_device_find_first_i915_discrete_card(&card);
>  		if (!ret)
>  			ret = igt_device_find_integrated_card(&card);
> -		if (!ret)
> +		if (!ret) {
> +			struct igt_device_card xe_card;
> +			
>  			fprintf(stderr, "No device filter specified and no discrete/integrated i915 devices found\n");
> +			
> +			if (igt_device_find_first_xe_discrete_card(&xe_card) ||
> +			    igt_device_find_xe_integrated_card(&xe_card)) {
> +				fprintf(stderr, "No i915 devices found. Detected Xe device which is not supported by intel_gpu_top.\n");

Please do not repeat info about i915 here, so:

				fprintf(stderr, "Detected Xe device is not supported by intel_gpu_top.\n");
				fprintf(stderr, "Please use 'gputop' tool for Xe devices.\n");

I am not sure about wording here, so adding Ashutosh to cc.
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>

Regards,
Kamil

> +				fprintf(stderr, "Please use 'gputop' tool for Xe devices instead.\n");
> +			}
> +		}
>  	}
>  
>  	if (!ret) {
> @@ -2743,6 +2752,13 @@ int main(int argc, char **argv)
>  		goto exit;
>  	}
>  
> +	if (!strcmp(card.driver, "xe")) {
> +		fprintf(stderr, "Xe devices are not supported by intel_gpu_top.\n");
> +		fprintf(stderr, "Please use 'gputop' tool for Xe devices instead.\n");
> +		ret = EXIT_FAILURE;
> +		goto exit;
> +	}
> +
>  	if (card.pci_slot_name[0] && !is_igpu_pci(card.pci_slot_name))
>  		pmu_device = tr_pmu_name(&card);
>  	else
> -- 
> 2.52.0
> 
