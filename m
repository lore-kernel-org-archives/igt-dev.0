Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EACCCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 14:43:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C9F10E840;
	Wed,  8 Oct 2025 14:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFmEIn/p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A6410E83D
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 14:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759934590; x=1791470590;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9STKSHCKC//vh249J9wcj+T4chWD40J7z1AmfU/IQxA=;
 b=CFmEIn/p+iRo7AciTWGRcX1oHXLKlIjUfshMzYAJEj4himDzGnEPWm8f
 8kY2/6DK9xd73V4aTdg6T8h0YIm78hPHFIJhsTT74aYw4EPstcqLAsajq
 WKh3RDlvnLsiWm6EjQBJhHL2e3m1Do/iu9cNKbTIv7chjL//r1BuzZYxV
 D1waO1Z5eGS/6Dn6/m2+L3L9H4nzIzO3jXxumywj5idMYBXTYrDvBxscH
 nyD7yBE2cbuyIr+X/+5TOu+U86FVS/AeQnqlUPinBti/0kd7IxEHJ3FGt
 eEO1L4Vg5stHPERb3FBHzdxce1qaBQQDAfzNewPyRzB/+FfKcDSN6+poq Q==;
X-CSE-ConnectionGUID: Wk1m/SmqQ5GRAtkzEXgglw==
X-CSE-MsgGUID: +RMqEE4ZSVinIap5Pye99Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="72393111"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="72393111"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 07:43:10 -0700
X-CSE-ConnectionGUID: D42VpQQdRoSx28MjsJd5sA==
X-CSE-MsgGUID: kfPmlwsKQMKXXP7NvzamHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="180868182"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 07:43:08 -0700
Date: Wed, 8 Oct 2025 16:43:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
Subject: Re: [PATCH i-g-t] kms_flip_tiling: reduce exec. time for sim env
Message-ID: <20251008144305.mrox7bkxxunj24hz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org,
 swati2.sharma@intel.com
References: <20251008043107.1536018-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251008043107.1536018-1-jeevan.b@intel.com>
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
On 2025-10-08 at 10:01:07 +0530, Jeevan B wrote:

remove dot from subject:

[PATCH i-g-t] kms_flip_tiling: reduce exec time for sim env

> For simulation environment, we can reduce execution time
> by running test only with basic tiling combincations.
> 
> v2: Add helper to check basic tiling support.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/intel/kms_flip_tiling.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
> index ff9ad1229..72fe01daf 100644
> --- a/tests/intel/kms_flip_tiling.c
> +++ b/tests/intel/kms_flip_tiling.c
> @@ -84,6 +84,13 @@ static int try_commit(igt_display_t *display)
>  				       COMMIT_ATOMIC : COMMIT_LEGACY);
>  }
>  
> +static bool is_allowed_modifier(uint64_t mod)
> +{
> +	return mod == DRM_FORMAT_MOD_LINEAR ||
> +	       mod == I915_FORMAT_MOD_4_TILED ||
> +	       mod == I915_FORMAT_MOD_X_TILED;
> +}
> +
>  static uint64_t pageflip_timeout_us(drmModeModeInfo *mode)
>  {
>  	uint64_t timeout_ns;
> @@ -242,6 +249,15 @@ igt_main
>  					if (plane->formats[j] != data.testformat)
>  						continue;
>  
> +					if (igt_run_in_simulation() &&

Consider using var for it, preferable at function start,
for example:

bool run_in_simulation = igt_run_in_simulation();

so later:
					if (run_in_simulation &&

> +					    !is_allowed_modifier(plane->modifiers[i]))
> +						continue;
> +
> +					if (igt_run_in_simulation() &&
> +					    !is_allowed_modifier(plane->modifiers[j]))
> +						continue;
> +
> +

Remove one newline (there are two).

Regards,
Kamil

>  					igt_dynamic_f("pipe-%s-%s-%s-to-%s",
>  						      kmstest_pipe_name(pipe),
>  						      igt_output_name(output),
> -- 
> 2.43.0
> 
