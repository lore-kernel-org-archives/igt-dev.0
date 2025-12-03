Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11354D12D5B
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 13:01:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58F310E129;
	Wed,  3 Dec 2025 13:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i78hHALs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4520E10E129
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 13:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764766880; x=1796302880;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nhyUFT0q0gsGicMtyyHuzjfTDYETKXMfgww5bhqX5Oc=;
 b=i78hHALsVPP19ouRLnRAl1HEfbC0oWTz4a7nZ83PBRHerbY7ftbqSR/U
 vuTIAJGKlGPO/WuT0SLiTGUAWeFccaUIV6wiRMZ6flkj7y8vHPDBjdx80
 ZisrgdIVMlbfBQNrloOK/xA/IPcKSPLBExaAtyG+bQQzv1ohuRV3ntHz2
 SYGGem0SSiK98nh3+j+dgOAq7xeESLAVIvLOuC5x4ID3bt/4yO3m9tjVk
 o/nmRqu8E4AHn4mXIa5bmHCU9+FOYatgOrRj2RzmLdXh3ImBUpvf4C/4D
 aRmZF/C2IFoFOK4G2zD1WKpW28kvaCCxUELErFMO8Wt+vu94InUx3RMx9 A==;
X-CSE-ConnectionGUID: 7W3b29FkS/iDqG9mFWdMew==
X-CSE-MsgGUID: y3lnRmfTS4ClttEN1EYuyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66800362"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66800362"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 05:01:20 -0800
X-CSE-ConnectionGUID: uviEl6qZRJytTY3wsHwwcQ==
X-CSE-MsgGUID: ExG0AmvVSVKJM0Sx6dNVLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="199794791"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 05:01:18 -0800
Date: Wed, 3 Dec 2025 14:01:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, santhosh.reddy.guddati@intel.com
Subject: Re: [PATCH i-g-t v2 1/2] Revert "tests/intel/kms_joiner: Cleanup
 igt_require checks"
Message-ID: <20251203130115.765puexldtruikcc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 santhosh.reddy.guddati@intel.com
References: <20251202084243.2677718-1-karthik.b.s@intel.com>
 <20251202084243.2677718-2-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251202084243.2677718-2-karthik.b.s@intel.com>
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

Hi Karthik,
On 2025-12-02 at 14:12:42 +0530, Karthik B S wrote:
> This reverts commit 3f90f16d1233a9d7ea75e41c83aaa0e34750764f.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/kms_joiner.c | 225 ++++++++++++++++++++-------------------
>  1 file changed, 117 insertions(+), 108 deletions(-)
> 
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index 276170229..55bdef9fa 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -627,151 +627,160 @@ igt_main
>  		}
>  	}
>  
> -	igt_subtest_group {
> -		igt_fixture {
> -			igt_require(data.big_joiner_output_count > 0);
> -			igt_require(data.n_pipes > 1);
> -		}
> -
> -		igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> -		igt_subtest_with_dynamic("basic-big-joiner") {
> +	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> +	igt_subtest_with_dynamic("basic-big-joiner") {
> +			igt_require_f(data.big_joiner_output_count > 0,
> +				      "No bigjoiner output found\n");
> +			igt_require_f(data.n_pipes > 1,
> +				      "Minimum 2 pipes required\n");
>  			igt_dynamic_f("single-joiner")
>  				test_single_joiner(&data, data.big_joiner_output_count, false);
>  			if (data.big_joiner_output_count > 1)
>  				igt_dynamic_f("multi-joiner")
>  					test_multi_joiner(&data, data.big_joiner_output_count, false);
> -		}
> +	}
>  
> -		igt_describe("Verify if the modeset on the adjoining pipe is rejected "
> -			     "when the pipe is active with a big joiner modeset");
> -		igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
> -			if (data.big_joiner_output_count >= 1)
> -				igt_dynamic_f("big_joiner_on_last_pipe")
> -					test_joiner_on_last_pipe(&data, false);
> -			if (data.big_joiner_output_count > 1)
> -				igt_dynamic_f("invalid_combinations")
> -					test_invalid_modeset_two_joiner(&data, false, false);
> -			if (data.mixed_output_count)
> -				igt_dynamic_f("mixed_output")
> -					test_invalid_modeset_two_joiner(&data, true, false);
> -		}
> +	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
> +	igt_subtest_with_dynamic("basic-ultra-joiner") {
> +			igt_require_f(data.ultra_joiner_output_count > 0,
> +				      "No ultrajoiner output found\n");
> +			igt_require_f(data.n_pipes > 3,
> +				      "Minimum 4 pipes required\n");
> +			igt_dynamic_f("single-joiner")
> +				test_ultra_joiner(&data, false, false, false);
> +	}
> +
> +	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
> +		     "when the pipe is active with a big joiner modeset");
> +	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
> +		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner output not found\n");
> +		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
> +		if (data.big_joiner_output_count >= 1)
> +			igt_dynamic_f("big_joiner_on_last_pipe")
> +				test_joiner_on_last_pipe(&data, false);
> +		if (data.big_joiner_output_count > 1)
> +			igt_dynamic_f("invalid_combinations")
> +				test_invalid_modeset_two_joiner(&data, false, false);
> +		if (data.mixed_output_count)
> +			igt_dynamic_f("mixed_output")
> +				test_invalid_modeset_two_joiner(&data, true, false);
>  	}
>  
> -	igt_subtest_group {
> -		igt_fixture {
> -			igt_require(data.non_big_joiner_output_count > 0);
> -			igt_require(data.n_pipes > 1);
> +	igt_describe("Verify if the modeset on the other pipes are rejected "
> +		     "when the pipe A is active with a ultra joiner modeset");
> +	igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
> +		igt_require_f(data.ultra_joiner_output_count > 0, "Ultra joiner output not found\n");
> +		igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are required\n");
> +
> +		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
> +			test_ultra_joiner(&data, true, false, false);
> +		if (data.non_ultra_joiner_output_count > 0) {
> +			igt_dynamic_f("2x")
> +				test_ultra_joiner(&data, false, true, false);
>  		}
> +	}
>  
> -		igt_describe("Verify the basic modeset on force big joiner mode on all pipes");
> -		igt_subtest_with_dynamic("basic-force-big-joiner") {
> -			igt_dynamic_f("single") {
> +	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> +	igt_subtest_with_dynamic("basic-force-big-joiner") {
> +		igt_require_f(data.non_big_joiner_output_count > 0,
> +			      "No non big joiner output found\n");
> +		igt_require_f(data.n_pipes > 1,
> +			      "Minimum 2 pipes required\n");
> +		igt_dynamic_f("single") {
> +			enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> +			test_single_joiner(&data, data.non_big_joiner_output_count, true);
> +			igt_reset_connectors();
> +		}
> +		if (data.non_big_joiner_output_count > 1) {
> +			igt_dynamic_f("multi") {
>  				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> -				test_single_joiner(&data, data.non_big_joiner_output_count, true);
> +				test_multi_joiner(&data, data.non_big_joiner_output_count, true);
>  				igt_reset_connectors();
>  			}
> -
> -			if (data.non_big_joiner_output_count > 1) {
> -				igt_dynamic_f("multi") {
> -					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> -					test_multi_joiner(&data, data.non_big_joiner_output_count, true);
> -					igt_reset_connectors();
> -				}
> -			}
>  		}
> +	}
>  
> -		igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
> -			if (data.non_big_joiner_output_count >= 1) {
> -				igt_dynamic_f("big_joiner_on_last_pipe") {
> -					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> -					test_joiner_on_last_pipe(&data, true);
> -					igt_reset_connectors();
> -				}
> +	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
> +		igt_require_f(data.non_big_joiner_output_count > 0,
> +			      "Non big joiner output not found\n");
> +		igt_require_f(data.n_pipes > 1,
> +			      "Minimum of 2 pipes are required\n");
> +		if (data.non_big_joiner_output_count >= 1) {
> +			igt_dynamic_f("big_joiner_on_last_pipe") {
> +				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> +				test_joiner_on_last_pipe(&data, true);
> +				igt_reset_connectors();
>  			}
> -
> -			if (data.non_big_joiner_output_count > 1) {
> -				igt_dynamic_f("invalid_combinations") {
> -					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> -					test_invalid_modeset_two_joiner(&data, false, true);
> -					igt_reset_connectors();
> -				}
> +		}
> +		if (data.non_big_joiner_output_count > 1) {
> +			igt_dynamic_f("invalid_combinations") {
> +				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> +				test_invalid_modeset_two_joiner(&data, false, true);
> +				igt_reset_connectors();
>  			}
>  		}
>  	}
>  
> -	igt_subtest_group {
> -		igt_fixture {
> -			igt_require(data.ultra_joiner_output_count > 0);
> -			igt_require(data.n_pipes > 3);
> +	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
> +	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
> +		igt_require_f(ultra_joiner_supported,
> +			      "Ultra joiner not supported on this platform\n");
> +		igt_require_f(data.non_ultra_joiner_output_count > 0,
> +			      "No non ultra joiner output found\n");
> +		igt_require_f(data.n_pipes > 3,
> +			      "Minimum 4 pipes required\n");
> +		igt_dynamic_f("single") {
> +			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> +			test_ultra_joiner(&data, false, false, true);
> +			igt_reset_connectors();
>  		}
> +	}
>  
> -		igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
> -		igt_subtest_with_dynamic("basic-ultra-joiner") {
> -			igt_dynamic_f("single-joiner")
> -				test_ultra_joiner(&data, false, false, false);
> -		}
> +	igt_describe("Verify modeset switch between ultra joiner and big joiner");
> +	igt_subtest_with_dynamic("switch-modeset-ultra-joiner-big-joiner") {
> +		igt_require_f(ultra_joiner_supported,
> +			      "Ultra joiner not supported on this platform\n");
> +		igt_require_f(data.ultra_joiner_output_count > 0 ||
> +			      data.non_ultra_joiner_output_count > 0,
> +				  "No ultra joiner or force ultra joiner output found\n");
> +		igt_require_f(data.n_pipes > 3,
> +			      "Minimum 4 pipes required\n");
>  
> -		igt_describe("Verify if the modeset on the other pipes are rejected "
> -			     "when the pipe A is active with a ultra joiner modeset");
> -		igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
> -			igt_dynamic_f("ultra_joiner_on_invalid_pipe")
> -				test_ultra_joiner(&data, true, false, false);
> -			if (data.non_ultra_joiner_output_count > 0) {
> -				igt_dynamic_f("2x")
> -					test_ultra_joiner(&data, false, true, false);
> -			}
> +		for_each_connected_output(&data.display, output) {
> +			switch_modeset_ultra_joiner_big_joiner(&data, output);
>  		}
>  	}
>  
> -	igt_subtest_group {
> -		igt_fixture {
> -			igt_require(ultra_joiner_supported);
> -			igt_require(data.non_ultra_joiner_output_count > 0);
> -			igt_require(data.n_pipes > 3);
> +	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
> +		igt_require_f(ultra_joiner_supported,
> +			      "Ultra joiner not supported on this platform\n");
> +		igt_require_f(data.non_ultra_joiner_output_count > 0,
> +			      "Non ultra joiner output not found\n");
> +		igt_require_f(data.n_pipes > 3,
> +			      "Minimum of 3 pipes are required\n");
> +
> +		igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
> +			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> +			test_ultra_joiner(&data, true, false, true);
> +			igt_reset_connectors();
>  		}
>  
> -		igt_describe("Verify the basic modeset on force ultra joiner mode on all pipes");
> -		igt_subtest_with_dynamic("basic-force-ultra-joiner") {
> -			igt_dynamic_f("single") {
> +		if (data.non_ultra_joiner_output_count >= 1 && data.output_count > 1) {
> +			igt_dynamic_f("2x") {
>  				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> -				test_ultra_joiner(&data, false, false, true);
> +				test_ultra_joiner(&data, false, true, true);
>  				igt_reset_connectors();
>  			}
>  		}
> -
> -		igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
> -			igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
> -				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> -				test_ultra_joiner(&data, true, false, true);
> -				igt_reset_connectors();
> -			}
> -
> -			if (data.non_ultra_joiner_output_count >= 1 && data.output_count > 1) {
> -				igt_dynamic_f("2x") {
> -					enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> -					test_ultra_joiner(&data, false, true, true);
> -					igt_reset_connectors();
> -				}
> -			}
> -		}
> -	}
> -
> -	igt_describe("Verify modeset switch between ultra joiner and big joiner");
> -	igt_subtest_with_dynamic("switch-modeset-ultra-joiner-big-joiner") {
> -		igt_require(ultra_joiner_supported);
> -		igt_require(data.ultra_joiner_output_count > 0 ||
> -			    data.non_ultra_joiner_output_count > 0);
> -		igt_require(data.n_pipes > 3);
> -
> -		for_each_connected_output(&data.display, output)
> -			switch_modeset_ultra_joiner_big_joiner(&data, output);
>  	}
>  
>  	igt_describe("Verify the basic modeset on the maximum non-joiner mode across "
>  		     "all pipes");
>  	igt_subtest_with_dynamic("basic-max-non-joiner") {
> -		igt_require(data.n_pipes >= 1);
> -		igt_require(data.non_joiner_output_count  > 0);
> +		igt_require_f(data.n_pipes >= 1,
> +			      "At least one pipe is required.\n");
> +		igt_require_f(data.non_joiner_output_count  > 0,
> +			      "No suitable non-joiner mode found\n");
>  			test_basic_max_non_joiner(&data);
>  	}
>  
> -- 
> 2.43.0
> 
