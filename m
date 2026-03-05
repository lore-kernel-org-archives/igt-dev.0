Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B97F3D32E
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 16:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BE010EC51;
	Thu,  5 Mar 2026 16:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RcSXKQqb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB34310EC51
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 16:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772728569; x=1804264569;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=B89QV9RhoK78WYIFR6+JIDm6p70tReIDA2K7XDU9W5M=;
 b=RcSXKQqb2wLATRVxsRCAGW9lX3PRt2jswUeMNNsb64BR5Z/6tghiJec5
 zyVVqFZ9kNxSjjuq/MQX/KZupgltKiwti2v5m7aq8lF6diQnv0jauYoyn
 WmVdqTuSDEIJ4KqhIOPC5gwU7K+RB8yLHM9MU29BCQFUdAU3paIn+RGgh
 Rm7y0bAmaV3rkU6+J17Q4GlX6+ds3WZjoRERYzhv+fshCZ/Nm6mthRLRY
 65RFZ2krD0N84gl6O0/OVpewLl/rELhuXY/Lg65W/lpWZ/0Q72o5tGKiG
 FNYI1qBcduUmIEpxjWjReJ9V8HQYjzo8krJGICANLpJaQGESXe17zVyzJ g==;
X-CSE-ConnectionGUID: czT73162TWKMa4ykWyWDfA==
X-CSE-MsgGUID: xUtQgyrYQkS9CX8xOftd4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="76422590"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="76422590"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 08:36:08 -0800
X-CSE-ConnectionGUID: vGo4jLVbSP6+l+ngLAZchA==
X-CSE-MsgGUID: 3of5bhA5SGC5Yza0J019TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="223689624"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 08:36:07 -0800
Date: Thu, 5 Mar 2026 17:36:04 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com
Subject: Re: [PATCH i-g-t v3] tools/intel_gpu_top: explicitly reject Xe
 devices and update documentation
Message-ID: <20260305163604.ne7wbpadt247etum@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com
References: <944742bd9f27945878791856a8a641ffe5e54d0c.1772637555.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <944742bd9f27945878791856a8a641ffe5e54d0c.1772637555.git.sebastian.brzezinka@intel.com>
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
On 2026-03-04 at 16:20:53 +0100, Sebastian Brzezinka wrote:
> Add checks to detect Xe driver devices and report that they are not
> supported by intel_gpu_top, directing users to the gputop tool instead.
> The man page is updated accordingly, and the tool now prints clear error
> messages when Xe hardware is detected.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
> v2 -> v3:
> 	- Reword the message.
> v1 -> v2:
> 	- Reword the manpage message,
> 	- Reorder the messages about the unsupported Xe driver.

Thank you all, I merged it with minor nits corrected and also
added Closes: tag.

Regards,
Kamil

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
> index ee38829e1..bd4191613 100644
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
> +				fprintf(stderr, "Detected Xe device which is not supported by intel_gpu_top.\n");
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
