Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB49CCD11DD
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 09:40:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B3910E214;
	Fri, 29 Mar 2024 09:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HjONS4ys";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666B610E214
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 09:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711705212; x=1743241212;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CWX3KKxUGRaSOPNqXUIrbPmtSdQFAtn7sV4ITPOxy+M=;
 b=HjONS4ysztxv5O/Zv5OI35+nc/QT3IqBOV3WwhAVlgePvxVPP3rTWk/f
 4h/uSjX/qV273R+bpYeK+xphjj6W8PLK38J/1QIhkCicD4HSNPVBtiHVH
 gF88pxXfGScNTfaie6ySJFPXpmUw+qBTvA+leyqpM8MCi8hKPvhhnM/c8
 hzthJF70+i9YlTYnNeFHV4xKRa2AvFa85YEKFiWfyShfTtgWs1K1LsFyM
 lDoLh69kC468GvQH0LDKW0OzKNK9JKbi19FWVgvMR7X4H1t8zV1awb1kG
 PcozEbmfdkuCfGhhZdxPP7l6JV9QZPYPj6Dnsb3GD+P1Yo5eUpFGJ39NE Q==;
X-CSE-ConnectionGUID: GdVCywm3Q1m8bIbS/vaJNA==
X-CSE-MsgGUID: FVNe95wCRQmoYBWKH9fGIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="7108281"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="7108281"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 02:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; d="scan'208";a="21641003"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.67])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 02:40:10 -0700
Date: Fri, 29 Mar 2024 10:40:06 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.auld@intel.com
Subject: Re: [PATCH i-g-t v3 2/2] tests/xe_ccs: Update compression in config
 based on flat-ccs enablement
Message-ID: <20240329094006.6frg3lxcu32rcgm4@zkempczy-mobl2>
References: <cover.1711733054.git.akshata.jahagirdar@intel.com>
 <f1b977863136bc70c9aae20be72a2fbf1b4b606f.1711733054.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1b977863136bc70c9aae20be72a2fbf1b4b606f.1711733054.git.akshata.jahagirdar@intel.com>
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

On Fri, Mar 29, 2024 at 10:27:01AM -0700, Akshata Jahagirdar wrote:
> In Xe2+ platforms, we need to run this test regardless of the status of
> flat-ccs. Check if the platform supports compression and has flat ccs enabled,
> before the execution and if it doesn't, then update to compression
> disabled and proceed with the test.
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>  tests/intel/xe_ccs.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index ad2eeb259..073eca355 100644
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

Instead of artificially disabling compression in the configuration I
would just skip the check (memcmp() either) if:

	HAS_FLATCCS() == true && !blt_platform_has_flat_ccs_enabled()

I've introduced helper which extracts ccs data from the surface:
https://patchwork.freedesktop.org/patch/585475/?series=131808&rev=1

When it will be merged we need to change xe_ccs.c to replace the
compression check on Xe2 (I mean add use of your helper).

>  
>  	/* retrieve back ccs */
>  	memcpy(ccsmap, ccscopy, ccssize);
> @@ -747,6 +747,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  	igt_subtest_with_dynamic("block-copy-compressed") {
>  		struct test_config config = { .compression = true };
>  
> +		if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))

Hint, use if<space() to conform codestyle rules.

--
Zbigniew

> +			config.compression = false;
> +
>  		block_copy_test(xe, &config, set, BLOCK_COPY);
>  	}
>  
> @@ -756,6 +759,10 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  					      .width_increment = 15,
>  					      .width_steps = 512 };
>  
> +		if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
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
> +		if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
> +			config.compression = false;
> +
>  		block_copy_test(xe, &config, set, BLOCK_MULTICOPY);
>  	}
>  
> @@ -771,6 +781,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  		struct test_config config = { .compression = true,
>  					      .inplace = true };
>  
> +		if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
> +			config.compression = false;
> +
>  		block_copy_test(xe, &config, set, BLOCK_MULTICOPY);
>  	}
>  
> @@ -779,6 +792,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  		struct test_config config = { .compression = true,
>  					      .surfcopy = true };
>  
> +		if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
> +			config.compression = false;
> +
>  		block_copy_test(xe, &config, set, BLOCK_COPY);
>  	}
>  
> @@ -789,6 +805,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  					      .surfcopy = true,
>  					      .new_ctx = true };
>  
> +		if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
> +			config.compression = false;
> +
>  		block_copy_test(xe, &config, set, BLOCK_COPY);
>  	}
>  
> @@ -798,6 +817,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  					      .surfcopy = true,
>  					      .suspend_resume = true };
>  
> +		if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
> +			config.compression = false;
> +
>  		block_copy_test(xe, &config, set, BLOCK_COPY);
>  	}
>  
> -- 
> 2.34.1
> 
