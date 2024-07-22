Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F10C3DA5D
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jul 2024 10:00:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9EB10E4A9;
	Mon, 22 Jul 2024 10:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a4elfznv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663BF10E49A
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jul 2024 10:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721642443; x=1753178443;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zE7VPrRHc7YYxJxjLzpBQG/OjPMkkEAVaI/CWCjop3o=;
 b=a4elfznvkEtK3XEM917fBjdZhkOzbuSgQdy+rT0CFHxYk4eMIcN64Ct+
 3mBVound4kNeu+SJDjJyXeKiY5mrN6nVL0Y+PAHM6OswfOfj8Rhy0u7qM
 p2lSvbcTRFaFWsIroNEVprvGode1g3MNXVU2/DWhGzznQOWJk1mxmmDPw
 4KJMj7q1BSc7JcK+l1MBHw1t2tPfqH2voMIBG1pu0mFqwQUH9dBLYn1Ji
 vdyH3Holke/8/GQbs3NAUJPf9hmIejGCJ3o05ivKX8v3eztpqas906PBN
 ANb+cSAIcVYL73SuhJ/xk/pu2T2dnqKAeUNiDmFaqW10CNYJs0Pbv4q7/ A==;
X-CSE-ConnectionGUID: 1B39t8PbQgahkzHl+kfaXg==
X-CSE-MsgGUID: BmopnTS3S7GtsgwAHIk5UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="19050326"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="19050326"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 03:00:42 -0700
X-CSE-ConnectionGUID: e+Uy8uFgQGCIHaKmlcZ2+w==
X-CSE-MsgGUID: F2bgoG52SDymRkHE5Eu0ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="82851096"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.250.186])
 ([10.94.250.186])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 03:00:40 -0700
Message-ID: <f968325d-bfd6-4ea6-8a89-b3ba18ddde93@linux.intel.com>
Date: Mon, 22 Jul 2024 12:00:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] BMG: lib/intel_compute: Enable compute tests for BMG
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
References: <20240722094500.92690-1-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240722094500.92690-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 7/22/2024 11:45 AM, Zbigniew Kempczyński wrote:
> From: Nirmoy Das <nirmoy.das@intel.com>
>
> BMG is XE2 based so compute tests should run as it is.
>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   lib/intel_compute.c                | 31 ++++++++++++++++++++++++++++++
>   lib/intel_compute_square_kernels.c | 28 +++++++++++++++++++++++++++
>   2 files changed, 59 insertions(+)
>
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 72025a4811..54d1814f38 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1449,6 +1449,21 @@ static const struct {
>   		.compute_exec = xehpc_compute_exec,
>   		.compat = COMPAT_DRIVER_XE,
>   	},
> +	{
> +		.ip_ver = IP_VER(20, 00),
> +		.compute_exec = xe2lpg_compute_exec,
> +		.compat = COMPAT_DRIVER_XE,
> +	},
> +	{
> +		.ip_ver = IP_VER(20, 01),
> +		.compute_exec = xe2lpg_compute_exec,
> +		.compat = COMPAT_DRIVER_XE,
> +	},
> +	{
> +		.ip_ver = IP_VER(20, 02),
> +		.compute_exec = xe2lpg_compute_exec,
> +		.compat = COMPAT_DRIVER_XE,
> +	},
>   	{
>   		.ip_ver = IP_VER(20, 04),
>   		.compute_exec = xe2lpg_compute_exec,
> @@ -1719,11 +1734,27 @@ static const struct {
>   			     bool threadgroup_preemption);
>   	uint32_t compat;
>   } intel_compute_preempt_batches[] = {
> +	{
> +		.ip_ver = IP_VER(20, 00),
> +		.compute_exec = xe2lpg_compute_preempt_exec,
> +		.compat = COMPAT_DRIVER_XE,
> +	},
> +	{
> +		.ip_ver = IP_VER(20, 01),
> +		.compute_exec = xe2lpg_compute_preempt_exec,
> +		.compat = COMPAT_DRIVER_XE,
> +	},
> +	{
> +		.ip_ver = IP_VER(20, 02),
> +		.compute_exec = xe2lpg_compute_preempt_exec,
> +		.compat = COMPAT_DRIVER_XE,
> +	},
>   	{
>   		.ip_ver = IP_VER(20, 04),
>   		.compute_exec = xe2lpg_compute_preempt_exec,
>   		.compat = COMPAT_DRIVER_XE,
>   	},
> +

nit: Unwanted space

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

>   };
>   
>   static bool __run_intel_compute_kernel_preempt(int fd,
> diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
> index efd55da0b9..39c34dc5e0 100644
> --- a/lib/intel_compute_square_kernels.c
> +++ b/lib/intel_compute_square_kernels.c
> @@ -3866,6 +3866,34 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
>   		.size = sizeof(xehpc_kernel_square_bin),
>   		.kernel = xehpc_kernel_square_bin,
>   	},
> +	{
> +		.ip_ver = IP_VER(20, 00),
> +		.size = sizeof(xe2lpg_kernel_square_bin),
> +		.kernel = xe2lpg_kernel_square_bin,
> +		.long_kernel = xe2lpg_kernel_inc_bin,
> +		.long_kernel_size = sizeof(xe2lpg_kernel_inc_bin),
> +		.sip_kernel = xe2lpg_kernel_sip_bin,
> +		.sip_kernel_size = sizeof(xe2lpg_kernel_sip_bin),
> +	},
> +	{
> +		.ip_ver = IP_VER(20, 01),
> +		.size = sizeof(xe2lpg_kernel_square_bin),
> +		.kernel = xe2lpg_kernel_square_bin,
> +		.long_kernel = xe2lpg_kernel_inc_bin,
> +		.long_kernel_size = sizeof(xe2lpg_kernel_inc_bin),
> +		.sip_kernel = xe2lpg_kernel_sip_bin,
> +		.sip_kernel_size = sizeof(xe2lpg_kernel_sip_bin),
> +	},
> +	{
> +		.ip_ver = IP_VER(20, 02),
> +		.size = sizeof(xe2lpg_kernel_square_bin),
> +		.kernel = xe2lpg_kernel_square_bin,
> +		.long_kernel = xe2lpg_kernel_inc_bin,
> +		.long_kernel_size = sizeof(xe2lpg_kernel_inc_bin),
> +		.sip_kernel = xe2lpg_kernel_sip_bin,
> +		.sip_kernel_size = sizeof(xe2lpg_kernel_sip_bin),
> +	},
> +
>   	{
>   		.ip_ver = IP_VER(20, 04),
>   		.size = sizeof(xe2lpg_kernel_square_bin),
