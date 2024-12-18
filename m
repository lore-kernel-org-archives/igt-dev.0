Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC79E77183
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 05:45:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B2C10E228;
	Wed, 18 Dec 2024 05:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7RViMKv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7186810E228
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 05:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734500729; x=1766036729;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sqdOfwlKd+EE7AK83SPbPNC8plfLewpmtC+CeD9qkR8=;
 b=Y7RViMKvXQqk9+Jzz0kb61bcTrvpn78UU4Ur8PR1LpSA+rz/qqJuaBs8
 O2CFWfcCybCdfjh6w/qzCyM06wbX9XqRlQln7Lb80zfOdeLkzm+NBVTF2
 3yGOQ45+1MU/W8LYhWWUHBWy4fDIT0eU86gz37HGi1U68x9me8w1OgVp3
 /oXCZtCppgo74/nFSSmO745ty6t+2kmfN9yT9P4V12Vj2eeDrYGC7D2lz
 lclWDEKP7BIJTMHUiXjcXMO1zvQ2K5lmPOVC9AMcscZeuOWKH59AHrZOQ
 fydGlBzd2IF49h1GAomJ2qUm2OEkc+7LuEGn1xHO4XzXVGBVW93ESxsaz Q==;
X-CSE-ConnectionGUID: aJH5BPHaRCyQXLghg4SiJQ==
X-CSE-MsgGUID: tKBqsovtR/eZlL0Fl5wwMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="38740943"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="38740943"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:45:28 -0800
X-CSE-ConnectionGUID: u8ywyenzSGyF1hsk34pREQ==
X-CSE-MsgGUID: y/ySKzlXQui172yrf6CmoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="98185659"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.90])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:45:26 -0800
Date: Wed, 18 Dec 2024 06:45:22 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ilia Levi <ilia.levi@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_core: Use suffix for casting to long to
 avoid overflow
Message-ID: <20241218054522.txiqxcaqewehrtab@zkempczy-mobl2>
References: <20241217105807.94489-1-zbigniew.kempczynski@intel.com>
 <epqvxhpjy6fndm5j65rqxsm74qfgotnkpmh3vv7jjab7yllvs7@rumx3g7g27r2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <epqvxhpjy6fndm5j65rqxsm74qfgotnkpmh3vv7jjab7yllvs7@rumx3g7g27r2>
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

On Tue, Dec 17, 2024 at 09:15:06AM -0600, Lucas De Marchi wrote:
> On Tue, Dec 17, 2024 at 11:58:07AM +0100, Zbigniew Kempczyński wrote:
> > Multiplication without using casting to long (long) for at least
> > one argument in expression may cause overflow especially when we're
> > using this for calculating timeouts in nanoseconds precision.
> > 
> > Ensure we're picking valid ul/ull suffix for base definitions for
> > all dependents.
> > 
> > Reported-by: Ilia Levi <ilia.levi@intel.com>
> > Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/163
> > 
> 
> drop this newline so the lines above are also part of the git trailer.

Ok.

> 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Ilia Levi <ilia.levi@intel.com>
> > ---
> > lib/igt_core.h | 10 ++++++++--
> > 1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/lib/igt_core.h b/lib/igt_core.h
> > index 90f57402f0..1b6e70182b 100644
> > --- a/lib/igt_core.h
> > +++ b/lib/igt_core.h
> > @@ -1517,11 +1517,17 @@ void igt_kmsg(const char *format, ...);
> > #define le32_to_cpu(x)  (x)
> > #endif
> > 
> > -#define MSEC_PER_SEC (1000u)
> > +#if __WORDSIZE == 64
> 
> we could just use ull regardless of wordsize

No, we can't. There will be a lot of warnings where PRIx64 is used.

__WORDSIZE is defined in bits/wordsize.h and included in stdint.h
what is included in igt.h.

I'll dare to get your r-b, but I'll adopt commit message as Kamil
suggests.

--
Zbigniew

> 
> but overall lgtm. With those changes: Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> 
> Lucas De Marchi
> 
> > +#define MSEC_PER_SEC (1000ul)
> > +#define USEC_PER_MSEC (1000ul)
> > +#else
> > +#define MSEC_PER_SEC (1000ull)
> > +#define USEC_PER_MSEC (1000ull)
> > +#endif
> > +
> > #define USEC_PER_SEC (1000u * MSEC_PER_SEC)
> > #define USEC_PER_DECISEC (100u * MSEC_PER_SEC)
> > #define NSEC_PER_SEC (1000u * USEC_PER_SEC)
> > -#define USEC_PER_MSEC (1000u)
> > #define NSEC_PER_MSEC (1000u * USEC_PER_MSEC)
> > 
> > #define for_if(expr__) if (!(expr__)) {} else
> > -- 
> > 2.34.1
> > 
