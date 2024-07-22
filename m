Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B363C3DA5D
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jul 2024 10:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C280B10E4C3;
	Mon, 22 Jul 2024 10:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YaueYxAF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2407A10E4C3
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jul 2024 10:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721645844; x=1753181844;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZKneOBl8kUfRj0ZcKns7XjpaSMX4UEHKn6v86dokjIY=;
 b=YaueYxAFTRSbJbe09swnYfu/MMpGU1ffu/7s+6u0PIpLgsKcAxORu3V8
 WZPn1Tu4RVXUG/BZtAkbM8Rzmyc4GTmUMh9DNlf/EUz9C7KeGqqEBHimN
 MYACzq/zwbUWdmwF8IjQwn/KUk08kXGXFUxk8TG8NdkoOShA17fHS32bJ
 7PxA0ezHNcJexKadA+FEJ0gSN5PCQyB7t01WGrhXBaAABOXbu3AM2OzeB
 HPI426eE+lWvRojs/0Dcmu6dkjcAbwckkjssTKVIyN0Cbk6pGBS+nS3v/
 nZBF0oBwg9VGJmKnLk8ToIV7a15fyiNWNWyTp58i4l39xJ8pd5Zm6/u9m A==;
X-CSE-ConnectionGUID: R/y6MFOsSaqcz8lXxZrLEg==
X-CSE-MsgGUID: JC/O4L4VTpCzTCABOa2UQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="22109164"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="22109164"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 03:57:23 -0700
X-CSE-ConnectionGUID: jainUfptRsedxZnN5+hhag==
X-CSE-MsgGUID: sJflitc2S1WwFQCxfV9xkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="52110727"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 03:57:18 -0700
Date: Mon, 22 Jul 2024 12:56:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH i-g-t v2] lib/intel_compute: Enable compute tests for BMG
Message-ID: <20240722105659.nxq4vgihudnfjnld@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20240722102219.109909-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240722102219.109909-1-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2024-07-22 at 12:22:19 +0200, Zbigniew Kempczyński wrote:
> From: Nirmoy Das <nirmoy.das@intel.com>
> 
> BMG is XE2 based so compute tests should run as it is.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
> v2: Keep pciids which were released in the kernel
>     Drop BMG prefix in commit msg

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/intel_compute.c                | 10 ++++++++++
>  lib/intel_compute_square_kernels.c |  9 +++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 72025a4811..6458f539c6 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1449,6 +1449,11 @@ static const struct {
>  		.compute_exec = xehpc_compute_exec,
>  		.compat = COMPAT_DRIVER_XE,
>  	},
> +	{
> +		.ip_ver = IP_VER(20, 01),
> +		.compute_exec = xe2lpg_compute_exec,
> +		.compat = COMPAT_DRIVER_XE,
> +	},
>  	{
>  		.ip_ver = IP_VER(20, 04),
>  		.compute_exec = xe2lpg_compute_exec,
> @@ -1719,6 +1724,11 @@ static const struct {
>  			     bool threadgroup_preemption);
>  	uint32_t compat;
>  } intel_compute_preempt_batches[] = {
> +	{
> +		.ip_ver = IP_VER(20, 01),
> +		.compute_exec = xe2lpg_compute_preempt_exec,
> +		.compat = COMPAT_DRIVER_XE,
> +	},
>  	{
>  		.ip_ver = IP_VER(20, 04),
>  		.compute_exec = xe2lpg_compute_preempt_exec,
> diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
> index efd55da0b9..a1f3b46da5 100644
> --- a/lib/intel_compute_square_kernels.c
> +++ b/lib/intel_compute_square_kernels.c
> @@ -3866,6 +3866,15 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
>  		.size = sizeof(xehpc_kernel_square_bin),
>  		.kernel = xehpc_kernel_square_bin,
>  	},
> +	{
> +		.ip_ver = IP_VER(20, 01),
> +		.size = sizeof(xe2lpg_kernel_square_bin),
> +		.kernel = xe2lpg_kernel_square_bin,
> +		.long_kernel = xe2lpg_kernel_inc_bin,
> +		.long_kernel_size = sizeof(xe2lpg_kernel_inc_bin),
> +		.sip_kernel = xe2lpg_kernel_sip_bin,
> +		.sip_kernel_size = sizeof(xe2lpg_kernel_sip_bin),
> +	},
>  	{
>  		.ip_ver = IP_VER(20, 04),
>  		.size = sizeof(xe2lpg_kernel_square_bin),
> -- 
> 2.34.1
> 
