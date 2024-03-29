Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00679CD1283
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 05:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D73410ECB1;
	Fri, 29 Mar 2024 05:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQuVmLvd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3910510EADE
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 05:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711688720; x=1743224720;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Xh0+12gT01Z7/+wfiw7stI7YRcmNTPigUdYVFMfD0dk=;
 b=WQuVmLvd0khbXyQ79hzJFfsZyts3pfaXvHfUL7fa2wrdf3wJ4KtZM8HH
 Ygqb3bb5S8teQBF21VmSRteXNdUhw7WUn3PjeecyLooKsgoNRCEpCOQIC
 ZXtcyEl6vs70sBOC+WZKqhqHd2iKXx2E2DLY4jus0x2DW+cTfMwiBuu10
 elSvAIYY26umcvhTfheiWb//wvKYBvrSLQSLgBC+2AVyRWBdszComjCth
 0qMiQp5549JwnknNYhbWsTSgAZqcfju2ZF0Qj/96SZcC3J3M42mdMwzQp
 Q2rEfIIDIK534Uh/rwF9D1noOhNKwcQQ66FK+AYTefm0NnZ7ap/6DTpf1 A==;
X-CSE-ConnectionGUID: dzRwnrA1TF+ZAY6gkw5Ssg==
X-CSE-MsgGUID: 2wJeCOFVQ2mUoFan81d7Qg==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6730463"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6730463"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 22:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16754968"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.67])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 22:05:18 -0700
Date: Fri, 29 Mar 2024 06:05:15 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.auld@intel.com
Subject: Re: [PATCH i-g-t v2 2/2] tests/xe_ccs: Update compression in config
 based on platform
Message-ID: <20240329050515.q4tqnnxj45onvsgd@zkempczy-mobl2>
References: <cover.1711729399.git.akshata.jahagirdar@intel.com>
 <cb8e514071a09bbcf1492005daaf53083616b1a9.1711729400.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb8e514071a09bbcf1492005daaf53083616b1a9.1711729400.git.akshata.jahagirdar@intel.com>
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

On Fri, Mar 29, 2024 at 09:30:13AM -0700, Akshata Jahagirdar wrote:
> In Xe2+ platforms, we need to run this test regardless of the status of
> flat-ccs. The entore flow of the test should work even in case of flat-ccs
> disabled, Everything should "just work".
> Check if the platform supports compression and has flat ccs enabled, before
> the execution if this test, and if it doesn't, then update to compression
> disabled and proceed with the test.
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>  tests/intel/xe_ccs.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index ad2eeb259..9f427e730 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -116,7 +116,6 @@ static void surf_copy(int xe,
>  	uint16_t cpu_caching = __xe_default_cpu_caching(xe, sysmem, 0);
>  	int result;
>  
> -	igt_assert(mid->compression);
>  	if (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && mid->compression) {
>  		comp_pat_index  = intel_get_pat_idx_uc_comp(xe);
>  		cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
> @@ -193,7 +192,8 @@ static void surf_copy(int xe,
>  	intel_ctx_xe_sync(ctx, true);
>  	WRITE_PNG(xe, run_id, "corrupted", &blt.dst, dst->x2, dst->y2, bpp);
>  	result = memcmp(src->ptr, dst->ptr, src->size);
> -	igt_assert(result != 0);
> +	if(mid->compression)
> +		igt_assert(result != 0);

I'm working on a patch which extract ccs data from the surface and
verifies it is containing non-zero data in case of compression enabled.
I'm going to send it today, so along with your 1/2 patch we'll fix
flat-ccs issue when it is disabled in BIOS.

--
Zbigniew

>  
>  	/* retrieve back ccs */
>  	memcpy(ccsmap, ccscopy, ccssize);
> @@ -747,6 +747,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  	igt_subtest_with_dynamic("block-copy-compressed") {
>  		struct test_config config = { .compression = true };
>  
> +		if(AT_LEAST_GEN(xe, 20) && !blt_platform_supports_compression(xe))
> +			config.compression = false;
> +
>  		block_copy_test(xe, &config, set, BLOCK_COPY);
>  	}
>  
> @@ -756,6 +759,10 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  					      .width_increment = 15,
>  					      .width_steps = 512 };
>  
> +		if(AT_LEAST_GEN(xe, 20) && !blt_platform_supports_compression(xe))
> +			config.compression = false;
> +
> +		igt_info("p1: config.compression:%d\n",config.compression);
>  		block_copy_test(xe, &config, set, BLOCK_COPY);
>  	}
>  
> @@ -763,6 +770,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  	igt_subtest_with_dynamic("block-multicopy-compressed") {
>  		struct test_config config = { .compression = true };
>  
> +		if(AT_LEAST_GEN(xe, 20) && !blt_platform_supports_compression(xe))
> +			config.compression = false;
> +
>  		block_copy_test(xe, &config, set, BLOCK_MULTICOPY);
>  	}
>  
> @@ -771,6 +781,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  		struct test_config config = { .compression = true,
>  					      .inplace = true };
>  
> +		if(AT_LEAST_GEN(xe, 20) && !blt_platform_supports_compression(xe))
> +			config.compression = false;
> +
>  		block_copy_test(xe, &config, set, BLOCK_MULTICOPY);
>  	}
>  
> @@ -779,6 +792,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  		struct test_config config = { .compression = true,
>  					      .surfcopy = true };
>  
> +		if(AT_LEAST_GEN(xe, 20) && !blt_platform_supports_compression(xe))
> +			config.compression = false;
> +
>  		block_copy_test(xe, &config, set, BLOCK_COPY);
>  	}
>  
> @@ -789,6 +805,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  					      .surfcopy = true,
>  					      .new_ctx = true };
>  
> +		if(AT_LEAST_GEN(xe, 20) && !blt_platform_supports_compression(xe))
> +			config.compression = false;
> +
>  		block_copy_test(xe, &config, set, BLOCK_COPY);
>  	}
>  
> @@ -798,6 +817,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  					      .surfcopy = true,
>  					      .suspend_resume = true };
>  
> +		if(AT_LEAST_GEN(xe, 20) && !blt_platform_supports_compression(xe))
> +			config.compression = false;
> +
>  		block_copy_test(xe, &config, set, BLOCK_COPY);
>  	}
>  
> -- 
> 2.34.1
> 
