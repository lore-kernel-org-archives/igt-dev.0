Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6D4C43458
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jul 2026 10:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB0310E8E4;
	Mon,  6 Jul 2026 10:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LlweqhNM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6014410E357
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2026 10:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783335512; x=1814871512;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FtZsFXqa7Qz19E08wL2xK/xuw8Lthn1tgEy74kCx1mM=;
 b=LlweqhNMFsYYMNDGB2g+jMivSIb5z3ThZFaU95N/NHDAAMCHeSkovFme
 dTl8LwwVcvLm56yvnool4w2BOqUBjWWdSUJkwM8dgbnhZcaA1EHd7OG4U
 6VnCCmSvFPhJtAcbSb5Yjkj7TPjrn3sujY6mPdUx+OrHYUbUA/UtZTsXA
 A5zHZwMoVVTLE3VHDGWQkQoZssYxYJ/HfOM/pU6LQ7d6G79ZBlEY8paGs
 3M/pm3t77drpsAxFD9mSHhqqGltVSz4swfh9eQi2ChwoTpe+odmUVDtwe
 paypUjfZrjOqqNwNamIryAjLfM6p8qHV3nDvhkpJQyUzUedqhiY4F5vad g==;
X-CSE-ConnectionGUID: Cta/fkOpQdi4I7fY1ns2Tw==
X-CSE-MsgGUID: TxQwEgYBRruwFi9vqlpmIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="94570858"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="94570858"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 03:58:32 -0700
X-CSE-ConnectionGUID: 1WiYrnHlTRqWJoo2ei0esg==
X-CSE-MsgGUID: RG7GcSBLR2SvXheJcmbLXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="283778671"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 03:58:30 -0700
Date: Mon, 6 Jul 2026 12:58:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 10/31] lib/i915/intel_decode: introduce static
 sub-library for tools
Message-ID: <20260706105828.tqwzbc3a6wyx4s52@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <4bee48342f508ec461801a10f25f850e8a908473.1783088106.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4bee48342f508ec461801a10f25f850e8a908473.1783088106.git.sebastian.brzezinka@intel.com>
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

Hi Sebastian,
On 2026-07-03 at 16:28:44 +0200, Sebastian Brzezinka wrote:
> Add lib_i915_decode built from i915/intel_decode.c and instdone.c.
> This lets tools like intel_error_decode link only the decode logic
> without pulling in the full libigt.so.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Please make sure your series will compile patch after patch,
so bisetion will work. Here, this patch breaks it:

./lib/igt_fb.h:32:10: fatal error: cairo.h: No such file or directory
   32 | #include <cairo.h>
         |          ^~~~~~~~~
	 compilation terminated.

One way to do it: git rebase -i origin -x 'ninja -C build'
but when you introduce changes in meson.build it is better to have
a script which will delete build folder first and then builds:
git rebase -i origin -x ./compile.sh

Regards,
Kamil

> ---
>  lib/meson.build | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index 93db217f8..ba4ece3a2 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -423,6 +423,18 @@ lib_igt_halffloat = declare_dependency(link_with : lib_igt_halffloat_build,
>  				       dependencies : [math],
>  				       include_directories : inc)
>  
> +lib_i915_decode_build = static_library('i915_decode',
> +	['i915/intel_decode.c',
> +	 'instdone.c',
> +	],
> +	dependencies : [lib_igt_chipset],
> +	include_directories : inc)
> +
> +lib_i915_decode = declare_dependency(link_with : lib_i915_decode_build,
> +				     dependencies : [lib_igt_chipset,
> +				                     lib_igt_tools_stub],
> +				     include_directories : inc)
> +
>  i915_perf_files = [
>    'igt_list.c',
>    'i915/perf.c',
> -- 
> 2.53.0
> 
