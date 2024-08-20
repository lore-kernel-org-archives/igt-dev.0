Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2516EC3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 17:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42F710E802;
	Tue, 20 Aug 2024 17:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZROG69gy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A211B10E802
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 17:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724175349; x=1755711349;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NcJ6iVbuChgZg+Ri7Xvc6Kbd9Bg7kITRuOj6tSGHUsA=;
 b=ZROG69gy8tfGn9iYdiGpUhLsMf8IdDZ4Bwd9azmBTpa8xK4VZxBYAKxJ
 Tee8JWt7CprAgdEmUUeC7RfVoIB1Grzde0tfPwSxJjKpITwWAxpA21UWw
 U/b6V9b6IzC5yLcgNbqH0n0CTsjYVP36BE2YeYbXJE7j0eEm+3ngKfxEb
 Q+mj95UbCnCTCGoyZF00/CXk1tcUtoOsj1UxNhhFqJLSaGX/8RC6rmdkY
 z4V3/4GKkfp1/lU+PwypzlBCTjfXqwrsVKmnGh9lD3nOVKL40rza/93R2
 kVR+LTJGpFzJUmOJTfNIeozlzoHC2C35iB0c6eF1wzt/pZVUA1q7Ei3B+ A==;
X-CSE-ConnectionGUID: AYjUsFS9TK2NQHGezqrEIQ==
X-CSE-MsgGUID: 9UOvAvsmTBqVCW7oslgcqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22680626"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22680626"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:35:47 -0700
X-CSE-ConnectionGUID: iNd1nUcWQ8+f0op9DM+agg==
X-CSE-MsgGUID: Rk3UnErDT3+moEjkNlrA0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="60859427"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 10:35:46 -0700
Date: Tue, 20 Aug 2024 19:35:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH i-g-t 1/4] tools/intel-gfx-fw-info: Annotate abstract
 method
Message-ID: <20240820173543.5mtjfoc73kh2sihz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20240819195600.242767-1-lucas.demarchi@intel.com>
 <20240819195600.242767-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819195600.242767-2-lucas.demarchi@intel.com>
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
On 2024-08-19 at 12:55:57 -0700, Lucas De Marchi wrote:
> Make the FW an abstract class and annotate the decode() method.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Please use pylint and address few issues like Unnecessary semicolon
or Unused variable 'i' (unused-variable)

Last line from pylint:
Your code has been rated at 6.75/10 (previous run: 6.75/10, +0.00)

I am not python expert so feel free to ignore this.

Regards,
Kamil

> ---
>  tools/intel-gfx-fw-info | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
> index b0d41bbae..5156c724c 100755
> --- a/tools/intel-gfx-fw-info
> +++ b/tools/intel-gfx-fw-info
> @@ -4,6 +4,7 @@
>  #
>  # Copyright (C) 2023 Intel Corporation
>  
> +import abc
>  import argparse
>  import logging
>  import hashlib
> @@ -103,10 +104,14 @@ def FIELD_GET(mask: int, value: int) -> int:
>      return (value & mask) >> ffs(mask)
>  
>  
> -class Fw:
> +class Fw(abc.ABC):
>      def __init__(self, fw):
>          self.fw = fw
>  
> +    @abc.abstractmethod
> +    def decode(self):
> +        raise NotImplementedError()
> +
>  
>  class FwCss(Fw):
>      def decode(self):
> -- 
> 2.43.0
> 
