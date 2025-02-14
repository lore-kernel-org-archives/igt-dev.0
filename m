Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D9BC02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 10:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C558B10EC2B;
	Fri, 14 Feb 2025 10:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="biRc0/r9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071F610EC2B
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 10:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739527823; x=1771063823;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FH9+venb4ApO/Dt//KPN/vTbnCXCy8O9imk+W8OjDVg=;
 b=biRc0/r98umhg1T+1m2eB69ffrybn9ff4Y+uJTx+9+laJKIzGpBZeL0p
 sBcPy+avwP8+Hsc0KpgplXMEHJzUZt7e+DIybFEHa+60otiZWQxWx274h
 FlaFYiuiiYahRZWk0WT6rc5Le6Ae5bcEBrtViRg0Tz4FZcpwYrIyYQDW0
 G5KtvB4nS7tFyuP2mHJNWNdP4Z50dqPqgyqWYV3ab6Cll+e/j7cZCQZOw
 iCCvqZ5KyiBWGGeWIsSjTp5kwD90/m1jT+DywR8VpkuVgO6VHumcGt9SO
 4zUr1bHucdUQFm1jezRoiXQVpt3V/w0OKtUZzrGpdAAUJhfY/h5JtQu1Q Q==;
X-CSE-ConnectionGUID: bG8OkSF3T4+7tuTbzTnryQ==
X-CSE-MsgGUID: +kNBOYdrSqGW38QIHscZ5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="43108581"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="43108581"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 02:10:23 -0800
X-CSE-ConnectionGUID: J5ClUG28T3OEO5ENXFtptA==
X-CSE-MsgGUID: H17eOVwPTa+wSrpjSe6oeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="118447425"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.52])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 02:10:21 -0800
Date: Fri, 14 Feb 2025 11:10:18 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] lib/intel_compute_square_kernels: Extend compute test
 for ptl
Message-ID: <20250214101018.mrn3gtvgvn3zecnj@zkempczy-mobl2>
References: <20250214070518.53840-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214070518.53840-1-sai.gowtham.ch@intel.com>
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

On Fri, Feb 14, 2025 at 07:05:18AM +0000, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Current compute square kernel tests dosen't support on PTL, this enables
> tests to work on PTL.
> 
> CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  lib/intel_compute.c                | 10 +++++++
>  lib/intel_compute_square_kernels.c | 42 ++++++++++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 233835c6c..5350389df 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1729,6 +1729,16 @@ static const struct {
>  		.compute_exec = xe2lpg_compute_exec,
>  		.compat = COMPAT_DRIVER_XE,
>  	},
> +	{
> +		.ip_ver = IP_VER(30, 00),
> +		.compute_exec = xe2lpg_compute_exec,
> +		.compat = COMPAT_DRIVER_XE,
> +	},
> +	{
> +		.ip_ver = IP_VER(30, 01),
> +		.compute_exec = xe2lpg_compute_exec,
> +		.compat = COMPAT_DRIVER_XE,

This entry seems to be unused at the moment.

> +	},
>  };
>  
>  static bool __run_intel_compute_kernel(int fd,
> diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
> index b0912e7e4..18f90c4fe 100644
> --- a/lib/intel_compute_square_kernels.c
> +++ b/lib/intel_compute_square_kernels.c
> @@ -3889,6 +3889,38 @@ unsigned char xelpg_kernel_square_bin[] = {
>  	0x00, 0x00, 0x00, 0x00
>  };
>  
> +static const unsigned char ptl_kernel_square_bin[] = {
> +	0x65, 0xa0, 0x00, 0x80, 0x20, 0x82, 0x05, 0x1f, 0x04, 0x00, 0x00,
> +	0x02, 0xc0, 0xff, 0xff, 0xff, 0x40, 0x19, 0x00, 0x80, 0x20, 0x82,
> +	0x05, 0x1f, 0x04, 0x1f, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x31,
> +	0x22, 0x03, 0x80, 0x00, 0x00, 0x0c, 0x05, 0x8f, 0x1f, 0x00, 0xfa,
> +	0x03, 0x00, 0x70, 0xf6, 0x61, 0x80, 0x24, 0x2c, 0x02, 0x00, 0x10,
> +	0x00, 0x66, 0x09, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80, 0x00, 0x80,
> +	0x00, 0x02, 0xc0, 0x04, 0x00, 0x40, 0x41, 0x22, 0x03, 0x80, 0x60,
> +	0x06, 0x01, 0x20, 0x54, 0x05, 0x00, 0x01, 0x14, 0x02, 0x00, 0x00,
> +	0x53, 0x81, 0x00, 0x80, 0x60, 0x06, 0x05, 0x03, 0x54, 0x05, 0x00,
> +	0x06, 0x14, 0x02, 0x00, 0x00, 0x52, 0x19, 0x14, 0x00, 0x60, 0x06,
> +	0x04, 0x06, 0x04, 0x03, 0x0e, 0x01, 0x04, 0x01, 0x04, 0x04, 0x70,
> +	0x19, 0x14, 0x00, 0x20, 0x02, 0x01, 0x00, 0x04, 0x06, 0x10, 0x52,
> +	0x44, 0x05, 0x00, 0x00, 0x2e, 0x00, 0x14, 0x14, 0x00, 0xc0, 0x00,
> +	0x00, 0x88, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x61, 0x00,
> +	0x00, 0xb4, 0x15, 0x06, 0x10, 0x00, 0x61, 0x00, 0x08, 0xb4, 0x17,
> +	0x07, 0x10, 0x00, 0x69, 0x1a, 0x10, 0x00, 0x70, 0x86, 0x05, 0x19,
> +	0x04, 0x15, 0x20, 0x05, 0x02, 0x00, 0x02, 0x00, 0x69, 0x1a, 0x10,
> +	0x02, 0x70, 0x86, 0x05, 0x1b, 0x04, 0x17, 0x20, 0x05, 0x02, 0x00,
> +	0x02, 0x00, 0x40, 0x1a, 0x00, 0x38, 0x08, 0x19, 0x10, 0x05, 0x40,
> +	0x1a, 0x08, 0x38, 0x0a, 0x1b, 0x10, 0x05, 0x31, 0x23, 0x17, 0x00,
> +	0x00, 0x00, 0x14, 0x0c, 0x24, 0x08, 0x00, 0xfb, 0x00, 0x00, 0x00,
> +	0x00, 0x40, 0x00, 0x00, 0x38, 0x10, 0x19, 0x30, 0x05, 0x40, 0x00,
> +	0x08, 0x38, 0x12, 0x1b, 0x30, 0x05, 0x41, 0x83, 0x20, 0x20, 0x0e,
> +	0x0c, 0x00, 0x0c, 0x31, 0x24, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x24, 0x10, 0x08, 0xfb, 0x14, 0x0e, 0x00, 0x00, 0x2f, 0x00, 0x14,
> +	0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00,
> +	0x00, 0x00, 0x61, 0x00, 0x10, 0x28, 0x14, 0x02, 0x10, 0x00, 0x31,
> +	0x20, 0x02, 0x80, 0x04, 0x00, 0x00, 0x00, 0x0c, 0x14, 0x20, 0x30,
> +	0x00, 0x00, 0x00, 0x00
> +};

Shader looks correct.

> +
>  const struct intel_compute_kernels intel_compute_square_kernels[] = {
>  	{
>  		.ip_ver = IP_VER(12, 0),
> @@ -3933,5 +3965,15 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
>  		.sip_kernel = xe2lpg_kernel_sip_bin,
>  		.sip_kernel_size = sizeof(xe2lpg_kernel_sip_bin),
>  	},
> +	{
> +		.ip_ver = IP_VER(30, 00),
> +		.size = sizeof(ptl_kernel_square_bin),
> +		.kernel = ptl_kernel_square_bin,
> +	},
> +	{
> +		.ip_ver = IP_VER(30, 01),
> +		.size = sizeof(ptl_kernel_square_bin),
> +		.kernel = ptl_kernel_square_bin,

Same as first comment, there's no rel = 1 for PTL defined
(good argument to start rework for getting ver/rel from hw).

--
Zbigniew

> +	},
>  	{}
>  };
> -- 
> 2.43.0
> 
