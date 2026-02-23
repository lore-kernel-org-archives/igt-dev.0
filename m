Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCDAEC1113
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 17:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21AB10E203;
	Mon, 23 Feb 2026 17:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7TEsqcW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F58410E203
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 17:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771868413; x=1803404413;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vZQbMuFi5SgxIsKO05++ar8XccK64SoWMbZNRPQuWPw=;
 b=K7TEsqcW28dPnrDnAOMnr7NiBrmbduFdq3IxLZRgbl77FQrvcEA6B+t7
 X9XDCwypIBoFPVNbUPTms8BUFXaALSsLqCXTF0/Nf0YiqWjjUhbW/3bQ2
 cFNfKZECWa9UXbEJQvfiHDSkKpFDNDd0XMtLzVrRK6iAcwX+laRB5rQd8
 7R8MXgMbTTBmFO5+Cdq1kqi9PsNw1XlBO54I1dK8e0gMs/rIpGcXE1nRn
 7tLXtm15b2lf6OuGKrXpj6KfGYqIyck9Xq1vVhJCvmW8msZI0psa56iUS
 2r9Xa143Yp3K+laMBc/PsRDCB3DtV3uBdVJMwcNa+L1dVpdwiMHVFqFhs w==;
X-CSE-ConnectionGUID: tYJR6zzaTlaV7tiByQ8ezQ==
X-CSE-MsgGUID: tsSkTgjPQDahOlu++s2E1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73050558"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="73050558"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 09:40:13 -0800
X-CSE-ConnectionGUID: vTAap1MSQeaz2Tswn0S3dA==
X-CSE-MsgGUID: ORFbty+5TTeUwZzBYTsUrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="214708721"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 09:40:12 -0800
Date: Mon, 23 Feb 2026 18:39:56 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com
Subject: Re: [PATCH i-g-t] tools/intel_gpu_top: explicitly reject Xe devices
 and update documentation
Message-ID: <20260223173956.vud2rzwlbtoodyu2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com
References: <9482ee5a326acdcc88b626112728e6cbcb6e0386.1771854831.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9482ee5a326acdcc88b626112728e6cbcb6e0386.1771854831.git.sebastian.brzezinka@intel.com>
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
On 2026-02-23 at 14:55:06 +0100, Sebastian Brzezinka wrote:
> Add checks to detect Xe driver devices and report that they are not
> supported by intel_gpu_top, directing users to the gputop tool instead.
> The man page is updated accordingly, and the tool now prints clear error
> messages when Xe hardware is detected.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  man/intel_gpu_top.rst |  2 ++
>  tools/intel_gpu_top.c | 23 +++++++++++++++++++++--
>  2 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
> index 20204fdcf..5d29710e9 100644
> --- a/man/intel_gpu_top.rst
> +++ b/man/intel_gpu_top.rst
> @@ -102,6 +102,8 @@ JSON output will be correctly terminated when the tool cleanly exits, otherwise
>  LIMITATIONS
>  ===========
>  
> +* Xe driver devices are not supported. For Xe devices, please use the **gputop** tool instead.

imho could be shorter, no repeating for 'Xe':

 * Xe driver devices are not supported, please use the **gputop** tool instead.

> +
>  * Not all metrics are supported on all platforms. Where a metric is unsupported it's value will be replaced by a dashed line.
>  
>  * Non-root access to perf counters is controlled by the *perf_event_paranoid* sysctl.
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index ee38829e1..b94604232 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -2734,8 +2734,20 @@ int main(int argc, char **argv)
>  		ret = igt_device_find_first_i915_discrete_card(&card);
>  		if (!ret)
>  			ret = igt_device_find_integrated_card(&card);
> -		if (!ret)
> -			fprintf(stderr, "No device filter specified and no discrete/integrated i915 devices found\n");
> +		if (!ret) {
> +			struct igt_device_card xe_card;
> +			bool has_xe = igt_device_find_first_xe_discrete_card(&xe_card);

Please drop this bool var, instead print old info first:
			fprintf(stderr, "No device filter specified and no discrete/integrated i915 devices found\n");

and then check for Xe:
			if (igt_device_find_first_xe_discrete_card(&xe_card))
				fprintf(stderr, "Detected Xe device, use gputop tool instead.\n");

Overall looks good, thank you for taking care of this issue,

Regards,
Kamil

> +
> +			if (!has_xe)
> +				has_xe = igt_device_find_xe_integrated_card(&xe_card);
> +
> +			if (has_xe) {
> +				fprintf(stderr, "No i915 devices found. Detected Xe device which is not supported by intel_gpu_top.\n");
> +				fprintf(stderr, "Please use 'gputop' tool for Xe devices instead.\n");
> +			} else {
> +				fprintf(stderr, "No device filter specified and no discrete/integrated i915 devices found\n");
> +			}
> +		}
>  	}
>  
>  	if (!ret) {
> @@ -2743,6 +2755,13 @@ int main(int argc, char **argv)
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
