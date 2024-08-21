Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B60C52D6F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 11:30:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3AC10E17C;
	Wed, 21 Aug 2024 11:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LisQwPaJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9EA10E17C
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 11:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724239804; x=1755775804;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=F7VJcO3oNmDRj6BTqTVLE1Uhb7hR6DarC47zd2Ql0c4=;
 b=LisQwPaJbYeWpVbLVUp/5T8CPdJZztFkptcxPMFnC6vDYha1nc0YGO7p
 YugHftBy2cYk5JFqbQkt1PHT+I/XU0kHDEjvWsMw54HjyIQ4xjhMK57XS
 H1DUwTPlw2ZY33PULj8b1tPmLfRgwhKuao1WjFVZuzxBsnNsFf27sQ5ky
 DSzBzvBTR36FFGjaowcR8pejYGCCMNz1P2yF91QKleEIwOLbcNhiNbe2f
 f2PKcmSn/1KCrDuhUINcX6XHtaAvrPoLSROeUGADh3EWTxsyqd79OjrRu
 xs79IqKkhrSJYSxJPBSohHSp5+6+yW3nrTJK/huUORBYWWWP6Co3sbSnB g==;
X-CSE-ConnectionGUID: EyCuqJ8pTFSC4tAcsfmpyg==
X-CSE-MsgGUID: /JUsFlSdSISTYiyoLOlLpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22743566"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22743566"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 04:30:03 -0700
X-CSE-ConnectionGUID: jl7c4WvaQIS3fNAgrvszbA==
X-CSE-MsgGUID: Bs3CvvDgSmiMEnx1roT/zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61202334"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 04:30:02 -0700
Date: Wed, 21 Aug 2024 13:29:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH i-g-t v2 1/6] tools/intel-gfx-fw-info: Re-format with black
Message-ID: <20240821112945.ecy2tuu36nnih4hd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 igt-dev@lists.freedesktop.org,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20240820232928.458248-1-lucas.demarchi@intel.com>
 <20240820232928.458248-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240820232928.458248-2-lucas.demarchi@intel.com>
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

Hi Lucas,
On 2024-08-20 at 16:29:23 -0700, Lucas De Marchi wrote:
> black tools/intel-gfx-fw-info
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

This looks almost ok, now 

pylint -d C0114,C0103,C0116,C0115 intel-gfx-fw-info

intel-gfx-fw-info:293:4: W0621: Redefining name 'e' from outer scope (line 136) (redefined-outer-name)

Your code has been rated at 9.92/10 (previous run: 7.64/10, +2.28)

Btw running 
./intel-gfx-fw-info -c /lib/firmware/i915/ehl_huc_9.0.0.bin.zst

I got:

header-type: CSS
version: 137.147.184
date: 543-01-b9
checksum: 3aa76ca9f25d916e64a56267338d37993b8e4e7321856de83d98d14e15ace4ad

Is date an encoded date and time?

You can add my acked-by with or without a fix for W0621 warning.

Regards,
Kamil

> ---
>  tools/intel-gfx-fw-info | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
> index b0d41bbae..35555aab5 100755
> --- a/tools/intel-gfx-fw-info
> +++ b/tools/intel-gfx-fw-info
> @@ -150,10 +150,12 @@ def parse_args(argv: typing.List[str]) -> argparse.Namespace:
>      description = "Dump GuC/HuC firmware information"
>      parser = argparse.ArgumentParser(prog="intel-gfx-fw-info", description=description)
>  
> -    parser.add_argument("-x", "--raw", action="store_true",
> -                        help="Also print raw header content")
> -    parser.add_argument("-c", "--checksum", action="store_true",
> -                        help="Also print checksum")
> +    parser.add_argument(
> +        "-x", "--raw", action="store_true", help="Also print raw header content"
> +    )
> +    parser.add_argument(
> +        "-c", "--checksum", action="store_true", help="Also print checksum"
> +    )
>  
>      parser.add_argument("filename", help="GuC/HuC firmware file")
>  
> -- 
> 2.43.0
> 
