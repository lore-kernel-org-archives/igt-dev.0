Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F16CCD183
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 16:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C27B10EAAF;
	Thu,  9 Oct 2025 16:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPcH4pnx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E8D10EAAF
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 16:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760027119; x=1791563119;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uaLdmw+0UWZiedSPCKcIZVZilmuS5mhoSPddB8+aEgU=;
 b=DPcH4pnxoei52ZnPaVtyW76UEa1hDJPjCQuQmUL1NO6nw8WZ8GLY9v8Z
 rhYPfaSUQ4fA+M+3O2+X1H7BKRCqXWrg5OzCfySqONQe6oNf2ST9zM5Ly
 bXLWx2zgfu/n3efin75cM0kEpbQLhwM3HsEAxOQ4X4NxNntc4+LK2NBWb
 JDDx3WWlniQt1f6YYxSVS+vAfSxCEh1YAn4ClBSEXsy9KqDLMVVtwSnYH
 N0JibrTmU1W6DY6wx6IBd3FmUG3DsZECBdUWdT+r6SeSq1cDA2e0Lfu+Q
 S7aCUP2BWuIbuJvQUPZ1YTdN52y3yUNLttf7rgistjs1tpajXfRmzpkvt A==;
X-CSE-ConnectionGUID: IQnUiv8YS/+qCwSoeOK2bw==
X-CSE-MsgGUID: QUGOKcgWRmubvXRf+M4fnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="72924915"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="72924915"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 09:25:19 -0700
X-CSE-ConnectionGUID: sS6uZon0Sl6GTPtSTzZl6w==
X-CSE-MsgGUID: owL+QmloRKOPLpVUr2a4eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="181169523"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 09:25:18 -0700
Date: Thu, 9 Oct 2025 18:25:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 pranay.samala@intel.com
Subject: Re: [PATCH i-g-t] kms_flip_tiling: reduce exec time for sim env
Message-ID: <20251009162515.vn34jbz75ftg76wx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org,
 swati2.sharma@intel.com, pranay.samala@intel.com
References: <20251009062932.1559735-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251009062932.1559735-1-jeevan.b@intel.com>
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

Hi Jeevan,
On 2025-10-09 at 11:59:32 +0530, Jeevan B wrote:

small nit, add tests/ prefix to subject:

[PATCH i-g-t] tests/kms_flip_tiling: reduce exec time for sim env

Rest looks good but I will leave r-b for KMS devs.

Regards,
Kamil

> For simulation environment, we can reduce execution time
> by running test only with basic tiling combinations.
> 
> v2: Add helper to check basic tiling support.
> v3: Rename helper to is_basic_tiling_modifier() and add comment.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_flip_tiling.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
> index ff9ad1229..d078653e9 100644
> --- a/tests/intel/kms_flip_tiling.c
> +++ b/tests/intel/kms_flip_tiling.c
> @@ -84,6 +84,16 @@ static int try_commit(igt_display_t *display)
>  				       COMMIT_ATOMIC : COMMIT_LEGACY);
>  }
>  
> +/* This helper is used to restrict tests to commonly supported tiling modes
> + * across platforms for simulation.
> + */
> +static bool is_basic_tiling_modifier(uint64_t mod)
> +{
> +	return mod == DRM_FORMAT_MOD_LINEAR ||
> +	       mod == I915_FORMAT_MOD_4_TILED ||
> +	       mod == I915_FORMAT_MOD_X_TILED;
> +}
> +
>  static uint64_t pageflip_timeout_us(drmModeModeInfo *mode)
>  {
>  	uint64_t timeout_ns;
> @@ -216,6 +226,7 @@ igt_main
>  	igt_describe("Check pageflip between modifiers");
>  	igt_subtest_with_dynamic("flip-change-tiling") {
>  		enum pipe pipe;
> +		bool run_in_simulation = igt_run_in_simulation();
>  
>  		for_each_pipe_with_valid_output(&data.display, pipe, output) {
>  			igt_plane_t *plane;
> @@ -242,6 +253,11 @@ igt_main
>  					if (plane->formats[j] != data.testformat)
>  						continue;
>  
> +					if (run_in_simulation &&
> +					    (!is_basic_tiling_modifier(plane->modifiers[i]) ||
> +					     !is_basic_tiling_modifier(plane->modifiers[j])))
> +						continue;
> +
>  					igt_dynamic_f("pipe-%s-%s-%s-to-%s",
>  						      kmstest_pipe_name(pipe),
>  						      igt_output_name(output),
> -- 
> 2.43.0
> 
