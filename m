Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93251CF9C71
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 06:34:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485B210E1BE;
	Tue, 24 Sep 2024 06:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dd1/fvIG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB3710E1BE
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 06:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727159657; x=1758695657;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uWldS0sCGfgQzbVRNY4gjhh49YMHHqxyPIxMpZACROw=;
 b=dd1/fvIGaDFFPl5NJEZNnODRldY+vpny1S08mtNJNiWwMo/XuQhLojBW
 yht3ctqu0owOmc4txr8VVplpXZ9f/lo5x2UZBUemaioL0JYfBph34TL/X
 LL1YQYPzR+fO40ie7aU6k4iJ0ECyC8wTtg9dDE3uIv+y4hei/SPDl2Qtl
 bid2PwWhn989ssgphfIfEVQ9Z8qu9O8WPvdmWWDTEcjV23Kbv7YPhmy12
 Bs5NhH1Qr89ikh62xBvAXNdCMHi9ZMrj9Xggke/uu9kMo86sfnnFCBCC1
 m3W5jl6n24xrpi8t8y03pAcmq+YbmIkSnQvo8Dqg6xKl6HFk7DPcDmHWu A==;
X-CSE-ConnectionGUID: foHhQiSFRUiIgF20dhpq0Q==
X-CSE-MsgGUID: SGdCQ2SARhufApUMWelPNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25609639"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="25609639"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 23:34:17 -0700
X-CSE-ConnectionGUID: JFo2TA9ATqSBD/8n6HlrGg==
X-CSE-MsgGUID: gSIc1hgPQX+99AsGhZq9Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102054715"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.146])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 23:34:16 -0700
Date: Tue, 24 Sep 2024 08:34:12 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/6] tests/xe_ccs: Use logical && instead of
 bitwise &
Message-ID: <20240924063412.u2wh2spyh4cbnugc@zkempczy-mobl2>
References: <20240923204557.32123-1-ville.syrjala@linux.intel.com>
 <20240923204557.32123-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240923204557.32123-5-ville.syrjala@linux.intel.com>
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

On Mon, Sep 23, 2024 at 11:45:55PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> The code appears to want to use a logical AND instead
> of a bitwise AND. Make it so.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  tests/intel/xe_ccs.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index a55ee5abd5b3..e656e5123841 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -344,8 +344,8 @@ static void block_copy(int xe,
>  	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
>  	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
>  	uint32_t run_id = mid_tiling;
> -	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &
> -							!xe_has_vram(xe)) ? region1 : region2;
> +	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &&
> +			       !xe_has_vram(xe)) ? region1 : region2;

Nice catch. I haven't spotted this on the review. Definitely
I need to be more careful. Thanks for fixing this.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  	uint32_t bb;
>  	enum blt_compression mid_compression = config->compression;
>  	int mid_compression_format = param.compression_format;
> @@ -479,8 +479,8 @@ static void block_multicopy(int xe,
>  	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
>  	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
>  	uint32_t run_id = mid_tiling;
> -	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &
> -							!xe_has_vram(xe)) ? region1 : region2;
> +	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &&
> +			       !xe_has_vram(xe)) ? region1 : region2;
>  	uint32_t bb;
>  	enum blt_compression mid_compression = config->compression;
>  	int mid_compression_format = param.compression_format;
> -- 
> 2.44.2
> 
