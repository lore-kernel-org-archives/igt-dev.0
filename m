Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05529C021B8
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 08:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBAA10E875;
	Wed, 26 Feb 2025 08:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QvLEDLb9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E483010E875
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 08:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740557324; x=1772093324;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Ey3bxgp+yIgb88OUXLtvz5ekpA61fmVzuIiPoh1rarw=;
 b=QvLEDLb9P3HhvCiLFgTJb5gM8kvRPmxFsdFJ0PuzqKb7djo4c6Qffixw
 IrrXxymldCI+tqY+h3t7s49s1H1k0H/P6h4VcNmmkXm/+YocA2JnvknPQ
 BwFYUaplWn18SZRvI1/oZjMj4Cg4NsA6E7Cc1zUuYx7gZAOwAVRwJaJTK
 ghmQZitgrh6KEpcfi/TzaHJi0f4+AVSQUN9uecW9nJ3cgCAWBAKYLSR/8
 WJzHTolrBvgn9KOagcPKB/PtmEmS7BRvhgxNaWsbvrqAN6tx7RH/w8URf
 orNoRF4gSVJrALdOtMgnPvckzPcEsYeMQlwetuTA4VgdByFW3rM1JB4hT g==;
X-CSE-ConnectionGUID: MWhUl6eXTvOTGfoVFjpClg==
X-CSE-MsgGUID: 0S1cOEyDTx2Md7C/O/ieQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="44216288"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="44216288"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 00:08:44 -0800
X-CSE-ConnectionGUID: JlVSA9EgSPO2rW9SuhOq7Q==
X-CSE-MsgGUID: 4ys9DBLZQqyntxdeNc+VFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="121566329"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.62])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 00:08:42 -0800
Date: Wed, 26 Feb 2025 09:08:38 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t,v2 5/6] lib/intel_compute: Give option to skip
 results check
Message-ID: <20250226080838.62u74r5owh56ewof@zkempczy-mobl2>
References: <20250224144705.1019940-1-francois.dugast@intel.com>
 <20250224144705.1019940-6-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250224144705.1019940-6-francois.dugast@intel.com>
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

On Mon, Feb 24, 2025 at 03:46:13PM +0100, Francois Dugast wrote:
> This is useful when using a custom compute kernel which produces
> different results than the default one (square) and when those
> results should be ignored because they are not the purpose of the
> test.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/intel_compute.c | 15 ++++++++++-----
>  lib/intel_compute.h |  2 ++
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 04fb83321..4818c0ff7 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -753,7 +753,8 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  		if (output != expected_output)
>  			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
>  				  i, input, output, expected_output);
> -		igt_assert_eq(output, expected_output);
> +		if (!user || (user && !user->skip_results_check))
> +			igt_assert_eq(output, expected_output);
>  	}
>  
>  	bo_execenv_unbind(&execenv, bo_dict, BO_DICT_ENTRIES);
> @@ -1033,7 +1034,8 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  		if (output != expected_output)
>  			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
>  				  i, input, output, expected_output);
> -		igt_assert_eq(output, expected_output);
> +		if (!user || (user && !user->skip_results_check))
> +			igt_assert_eq(output, expected_output);
>  	}
>  
>  	bo_execenv_unbind(&execenv, bo_dict, XEHP_BO_DICT_ENTRIES);
> @@ -1243,7 +1245,8 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  		if (output != expected_output)
>  			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
>  				  i, input, output, expected_output);
> -		igt_assert_eq(output, expected_output);
> +		if (!user || (user && !user->skip_results_check))
> +			igt_assert_eq(output, expected_output);
>  	}
>  
>  	bo_execenv_unbind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
> @@ -1609,7 +1612,8 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  		if (output != expected_output)
>  			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
>  				  i, input, output, expected_output);
> -		igt_assert_eq(output, expected_output);
> +		if (!user || (user && !user->skip_results_check))
> +			igt_assert_eq(output, expected_output);
>  	}
>  
>  	bo_execenv_unbind(&execenv, bo_dict, XELPG_BO_DICT_ENTRIES);
> @@ -1701,7 +1705,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  		if (output != expected_output)
>  			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
>  				  i, input, output, expected_output);
> -		igt_assert_eq(output, expected_output);
> +		if (!user || (user && !user->skip_results_check))
> +			igt_assert_eq(output, expected_output);
>  	}
>  
>  	bo_execenv_unbind(&execenv, bo_dict, XE2_BO_DICT_ENTRIES);
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> index 3f6d0bb1d..dc0fe2ec2 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -53,6 +53,8 @@ struct user_execenv {
>  	const unsigned char *kernel;
>  	/** @kernel_size: size of the custom kernel, if provided */
>  	unsigned int kernel_size;
> +	/** @skip_results_check: do not verify correctness of the results if true */
> +	bool skip_results_check;
>  };
>  
>  extern const struct intel_compute_kernels intel_compute_square_kernels[];
> -- 
> 2.43.0
> 
