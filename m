Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF15C2BD09
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 10:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B0910E0FE;
	Wed,  3 Jul 2024 10:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZyjNLo68";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5B210E0D1
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 10:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720001560; x=1751537560;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=A7wC1OVnjpuB3MM5nBbis0yUABYxwj80/jQgoeo73fQ=;
 b=ZyjNLo68jtCf28tyIHT+PXvp8u6vNRD2C/WH7jUNN6JxgcaMWMHYpdIw
 VzIHxf4WPsPgGT7/NTkr4AeaEikbMt8TXIr133CeCBRoMWqR2fOHjH/+W
 V9WQrqaEbEja/QisIE/b7jrCQFmRctELeYdM2b18bAXjCUQ00jI7ywMqs
 IeG/bUGzdyPtSmr9nBAN86LgCXhEwSkwPkvEGZKq9fow/O+RgKwlF6MGy
 3RcPWQPVAA/r/5smRPW/Y2SfvZL0Q/zSFtcGsbZIM3SQFYsvQtnybgXMy
 O9vlqZdXhYHltXuzhf74XUqFMaT0Z9mHflw7pRnJrJQ9x8OaqTdwGDs68 A==;
X-CSE-ConnectionGUID: dN1e5dmnRtawdsrAU0gVWg==
X-CSE-MsgGUID: NJHv0jHCT0u1Tkf+lr5Fmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17356076"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; d="scan'208";a="17356076"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 03:12:40 -0700
X-CSE-ConnectionGUID: 29jgtvzLQgW4mdBj8/3T6w==
X-CSE-MsgGUID: l/2f7bwNQL6k/I/p7YenIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; d="scan'208";a="46955536"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 03:12:39 -0700
Date: Wed, 3 Jul 2024 12:12:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_intel_bb: Reduce render subtest execution
 time
Message-ID: <20240703101222.fmiu5yw672ttl2y2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240703063314.252920-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240703063314.252920-1-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2024-07-03 at 08:33:14 +0200, Zbigniew Kempczyński wrote:
> Test xe_intel_bb verifies intel-bb so it doesn't make sense to perform
> large render operations as those are covered in xe_render_copy test.
> Use 256px surface for render instead 512 and 1024 px.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

I will merge this without waiting for CI as this works on my
test machine and it just reduced number of performed tests.

Regards,
Kamil

> ---
>  tests/intel/xe_intel_bb.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
> index 5dd794b186..647fd64e7e 100644
> --- a/tests/intel/xe_intel_bb.c
> +++ b/tests/intel/xe_intel_bb.c
> @@ -40,6 +40,7 @@
>  #define HEIGHT	64
>  #define STRIDE	(WIDTH * 4)
>  #define SIZE	(HEIGHT * STRIDE)
> +#define RENDER_WIDTH 256
>  
>  #define COLOR_00	0x00
>  #define COLOR_33	0x33
> @@ -1054,11 +1055,11 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
>  			if (!render_supports_tiling(xe, tiling, false))
>  				continue;
>  
> -			for (width = 512; width <= 1024; width += 512)
> -				igt_dynamic_f("render-%s-%u",
> -					      blt_tiling_name(tiling), width)
> -					render(bops, blt_tile_to_i915_tile(tiling),
> -					       width, width);
> +			width = RENDER_WIDTH;
> +			igt_dynamic_f("render-%s-%u",
> +				      blt_tiling_name(tiling), width)
> +				render(bops, blt_tile_to_i915_tile(tiling),
> +				       width, width);
>  		}
>  	}
>  
> -- 
> 2.34.1
> 
