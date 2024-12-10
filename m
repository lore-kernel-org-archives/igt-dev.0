Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D36CE77180
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 11:14:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8AD10E5C9;
	Tue, 10 Dec 2024 11:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hkf8rEro";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C454910E5C9
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 11:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733829256; x=1765365256;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=a6k0hrmKoE1MwCj6VGUqLCh4spHHRnH2zJlvX9ibLac=;
 b=Hkf8rErouSR7qkZMcUzSD5O2cfJ9ZKccwZxTBRP2mY/CPI/fJXHLC3C8
 nNgGxqW2YkjLsr16UUybXEABFcJBuEv4jAjEIcN2WtlPo6k/ZuIuo94LX
 vuYZUMSxVW8khNYku8rxVaG1o9FdXmW6DPnbbTenmCJhMl4FrQ/rkqBTn
 LIbeNYM6IUwNbQroKM0x/fLicI8oA/0G14X30VBSejZ9hlsh7OMJ2nDlx
 91jPB4f8gV2M97a5L6NbmGGAlL70fc4LBcVLzlLMwOgjlatjvgJEmLeg7
 GMfS2DxF67ZhdZ4tJ4NTRV/bHrmTR9U2ej1nGdN7ZzPAeHKxp4P8cexTE Q==;
X-CSE-ConnectionGUID: SOBVy9wCTHGBQjbJ2XDaDg==
X-CSE-MsgGUID: PUdy4jL2QW2oaE0XvpQp1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33897756"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="33897756"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 03:14:16 -0800
X-CSE-ConnectionGUID: mJjAvLr/R/iuYPxN7TVZdQ==
X-CSE-MsgGUID: 3XM9FovfQZK7uEtDSXg6gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="95848855"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 03:14:14 -0800
Date: Tue, 10 Dec 2024 12:14:12 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 2/3] Revert "tests/xe_oa: Drop TestOa from
 metric_set()"
Message-ID: <20241210111412.x7s2qhudufc6tvsp@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 igt-dev@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20241210020812.1513475-1-ashutosh.dixit@intel.com>
 <20241210020812.1513475-2-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210020812.1513475-2-ashutosh.dixit@intel.com>
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

Hi Ashutosh,
On 2024-12-09 at 18:08:11 -0800, Ashutosh Dixit wrote:
> This reverts commit d226604a63fbd5c37c9f5d60b6fc23acffc49f0a.
> 
> Re-instate TestOa metric set. IGT needs to work with TestOa since it has
> special properties which help with OA data validation. Remaining parts of
> d226604a63fb were already reverted in 4942fc57c20f ("lib/xe/oa: Re-instate
> TestOa metric sets in LNL/BMG XML's").
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_oa.c | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 9e7c2ae1e6..c660720ea0 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -310,20 +310,15 @@ static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_cl
>  	struct intel_xe_perf_metric_set *metric_set_iter;
>  	struct intel_xe_perf_metric_set *test_set = NULL;
>  
> -	switch (hwe->engine_class) {
> -	case DRM_XE_ENGINE_CLASS_RENDER:
> -		test_set_name = "RenderBasic";
> -		break;
> -	case DRM_XE_ENGINE_CLASS_COMPUTE:
> -		test_set_name = "ComputeBasic";
> -		break;
> -	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> -	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> -		if (HAS_OAM(devid))
> -			test_set_name = "MediaSet1";
> -	default:
> -		igt_assert(!"missing");
> -	}
> +	if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
> +	    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
> +		test_set_name = "TestOa";
> +	else if ((hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ||
> +		  hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE) &&
> +		 HAS_OAM(devid))
> +		test_set_name = "MediaSet1";
> +	else
> +		igt_assert(!"reached");
>  
>  	igt_list_for_each_entry(metric_set_iter, &intel_xe_perf->metric_sets, link) {
>  		if (strcmp(metric_set_iter->symbol_name, test_set_name) == 0) {
> -- 
> 2.47.1
> 
