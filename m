Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F955C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 14:00:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE95B10E050;
	Thu,  9 Jul 2026 14:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrXedt55";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CF310F5EF
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 14:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783605628; x=1815141628;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=60us+oVOXH5vq6d3qeHUvKIme4hiLRKtEsnYMwuVQgg=;
 b=nrXedt55eVI2KheBPDffmKpDYEpZ77gajzusk9nFRWFEbTdP1ukPCfE6
 coGt0z4cO8sFIyn6McVMtHkHmwtqd1H+LSfF+Bn4EFV+sscwxyAxJIZu2
 4Y31QpOaNrJDBoLnzbg31bh7kF7rJqhTdW2pUhIeQAtS4rv63OgfBjwF5
 LRDB7mMH3GANVcM2ypLHDZdPYXVOsBWgEsDyHy2HmUd3OKICPYBWcw44u
 oEP2Vbshw7z6iEgZTPZQeqjm5u0She6mUe4AGyHFhhIcKKEX94glfylMK
 F+weuv9p9ycOtZYUu7DC6RAeLbDyH/SimaIO2d9UVxhL1VW1fIiv/gOoH A==;
X-CSE-ConnectionGUID: Hv1grUfVT4aZ+SZIEBGQ3w==
X-CSE-MsgGUID: TR4NWN38TtatXes2jZkr0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84068177"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84068177"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 07:00:27 -0700
X-CSE-ConnectionGUID: lOeFq0mQTHWtiTrA9QkIWg==
X-CSE-MsgGUID: RiTGsTBgSoOUNI95PX71Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="254102327"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 07:00:26 -0700
Date: Thu, 9 Jul 2026 16:00:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] tests/kms_feature_discovery: Log output count
 on skip
Message-ID: <20260709140023.dwzgfw7nwegz2k4r@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260709065852.3000382-1-swati2.sharma@intel.com>
 <20260709065852.3000382-3-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709065852.3000382-3-swati2.sharma@intel.com>
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

Hi Swati,
On 2026-07-09 at 12:28:52 +0530, Swati Sharma wrote:
> Add a num_outputs counter to feature discovery subtests
> that iterate connected outputs (dp-mst, hdr, vrr, dsc).
> Print the count in the igt_require_f message so it's clear
> how many outputs were checked when a feature is not found.
> 
> Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/kms_feature_discovery.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
> index 4ad2e6a74..97bb25360 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -175,9 +175,11 @@ int igt_main() {
>  			struct kmstest_connector_config config;
>  			igt_output_t *output;
>  			const char *encoder;
> +			int num_outputs = 0;
>  			int ret = -1;
>  
>  			for_each_connected_output(&display, output) {
> +				num_outputs++;
>  				kmstest_get_connector_config(fd, output->config.connector->connector_id, -1, &config);
>  				encoder = kmstest_encoder_type_str(config.encoder->encoder_type);
>  
> @@ -185,16 +187,20 @@ int igt_main() {
>  				if (ret == 0)
>  					break;
>  			}
> -			igt_require_f(ret == 0, "No DP-MST configuration found.\n");
> +			igt_require_f(ret == 0,
> +				      "No DP-MST config found (checked %d outputs).\n",
> +				      num_outputs);
>  		}
>  
>  		igt_describe("Make sure that we have at least one HDR-capable panel.");
>  		igt_subtest("hdr") {
>  			igt_output_t *output;
>  			unsigned int max_bpc;
> +			int num_outputs = 0;
>  			bool found = false;
>  
>  			for_each_connected_output(&display, output) {
> +				num_outputs++;
>  				if (!igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC))
>  					continue;
>  
> @@ -214,15 +220,18 @@ int igt_main() {
>  			}
>  
>  			igt_require_f(found,
> -				      "No HDR-capable panel found with max bpc, HDR metadata, and EDID HDR support.\n");
> +				      "No HDR-capable panel found (checked %d outputs).\n",
> +				      num_outputs);
>  		}
>  
>  		igt_describe("Make sure that we have at least one VRR-capable panel.");
>  		igt_subtest("vrr") {
>  			igt_output_t *output;
> +			int num_outputs = 0;
>  			bool found = false;
>  
>  			for_each_connected_output(&display, output) {
> +				num_outputs++;
>  				if (!igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE))
>  					continue;
>  
> @@ -233,15 +242,19 @@ int igt_main() {
>  				break;
>  			}
>  
> -			igt_require_f(found, "No VRR-capable panel found.\n");
> +			igt_require_f(found,
> +				      "No VRR-capable panel found (checked %d outputs).\n",
> +				      num_outputs);
>  		}
>  
>  		igt_describe("Make sure that we have at least one DSC-capable sink.");
>  		igt_subtest("dsc") {
>  			igt_output_t *output;
> +			int num_outputs = 0;
>  			bool found = false;
>  
>  			for_each_connected_output(&display, output) {
> +				num_outputs++;
>  				if (!igt_is_dsc_supported_by_sink(fd, output->name))
>  					continue;
>  
> @@ -249,7 +262,9 @@ int igt_main() {
>  				break;
>  			}
>  
> -			igt_require_f(found, "No DSC-capable sink found.\n");
> +			igt_require_f(found,
> +				      "No DSC-capable sink found (checked %d outputs).\n",
> +				      num_outputs);

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  		}
>  	}
>  }
> -- 
> 2.25.1
> 
