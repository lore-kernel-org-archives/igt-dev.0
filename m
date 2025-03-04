Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A6BC282D6
	for <igt-dev@archiver.kernel.org>; Tue,  4 Mar 2025 16:20:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF0510E08E;
	Tue,  4 Mar 2025 16:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cARBPLad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F5710E08E
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Mar 2025 16:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741105258; x=1772641258;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ynAZXIFxIZVE3Qd7Lt5ZWNmAcXxT19PewEIIqCj35Xg=;
 b=cARBPLadRJSYuzmQU2GWgZ2qlsk/xqyz6k5rf3l/Dy7F6EhN9uFxM8CF
 czEu4IDeswNYqXFB3HQEZnEkonVXxKrlHPRMhjgPDY3Gk7JCSW/YWq7ze
 uXinjdlU9hgKUaCXrneMA9ALTdMESVXfXTFffDNhYy6MzmoiRJLT2OyH2
 s9kuuSr5zg77mP8HkiShlewx+G6FQuTW57VI0lkHhOUywwOk91ZocHSkG
 mv2v4UW+68Pvpgxj7AdDFMH0N2EEhCkR8s9GyAAcA41D2MBq8aLCwhkzF
 FxtEe+eHhoTWRlVasaDQwFByxOZwuLu6kTWHUhhc7zizqNnFEBX5pfMqN w==;
X-CSE-ConnectionGUID: ZJuJkn4BTUyQZZ/d2zL5iA==
X-CSE-MsgGUID: L14oHfMYRI66WnEdN93KVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59444717"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="59444717"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 08:20:57 -0800
X-CSE-ConnectionGUID: vzmyCGMERP+m3QzOu7EWxg==
X-CSE-MsgGUID: jy1NspEPRIyC2p3yjcjXVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="149205919"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 08:20:56 -0800
Date: Tue, 4 Mar 2025 17:20:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] lib/intel_compute: Compare floats with
 igt_assert_eq_double()
Message-ID: <20250304162040.tv4aryzcudeux6zj@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250304113909.279579-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250304113909.279579-1-francois.dugast@intel.com>
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

Hi Francois,
On 2025-03-04 at 12:39:09 +0100, Francois Dugast wrote:
> Using igt_assert_eq() to compare floats was incorrect and led to
> false positives, replace it with the appropriate assert.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/intel_compute.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 4818c0ff7..dd9c83c9c 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -754,7 +754,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
>  				  i, input, output, expected_output);
>  		if (!user || (user && !user->skip_results_check))
> -			igt_assert_eq(output, expected_output);
> +			igt_assert_eq_double(output, expected_output);

Technically they are floats but this should be ok, so

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  	}
>  
>  	bo_execenv_unbind(&execenv, bo_dict, BO_DICT_ENTRIES);
> @@ -1035,7 +1035,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
>  				  i, input, output, expected_output);
>  		if (!user || (user && !user->skip_results_check))
> -			igt_assert_eq(output, expected_output);
> +			igt_assert_eq_double(output, expected_output);
>  	}
>  
>  	bo_execenv_unbind(&execenv, bo_dict, XEHP_BO_DICT_ENTRIES);
> @@ -1246,7 +1246,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
>  				  i, input, output, expected_output);
>  		if (!user || (user && !user->skip_results_check))
> -			igt_assert_eq(output, expected_output);
> +			igt_assert_eq_double(output, expected_output);
>  	}
>  
>  	bo_execenv_unbind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
> @@ -1613,7 +1613,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
>  				  i, input, output, expected_output);
>  		if (!user || (user && !user->skip_results_check))
> -			igt_assert_eq(output, expected_output);
> +			igt_assert_eq_double(output, expected_output);
>  	}
>  
>  	bo_execenv_unbind(&execenv, bo_dict, XELPG_BO_DICT_ENTRIES);
> @@ -1706,7 +1706,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
>  				  i, input, output, expected_output);
>  		if (!user || (user && !user->skip_results_check))
> -			igt_assert_eq(output, expected_output);
> +			igt_assert_eq_double(output, expected_output);
>  	}
>  
>  	bo_execenv_unbind(&execenv, bo_dict, XE2_BO_DICT_ENTRIES);
> @@ -2048,7 +2048,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  		if (output != expected_output)
>  			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
>  				  i, input, output, expected_output);
> -		igt_assert_eq(output, expected_output);
> +		igt_assert_eq_double(output, expected_output);
>  	}
>  
>  	for (int i = 0; i < SIZE_DATA; i++) {
> -- 
> 2.43.0
> 
