Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FEB606A31F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 17:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oGok/Jex
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C018C10F020;
	Mon, 23 Nov 2026 17:15:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F48110EC09
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 17:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795454038; x=1826990038;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OwbE/k4y2lVGMM/AJOZxHKWMyiNyyq4TKvh4MwZ8vVI=;
 b=oGok/Jex946RQsg22HmzBnUJYcTtmev/X8ScXSsm/ZqqqdB46W2zCNy7
 8nWn/aZBnVVDEpdnTDJE5SeRxYJJCF84YVBhEN6uTsHVKXlqbisNdBNS5
 DWvTzRbotgnjZ7MB9A5rOw2QSsrxjwQulpfDwCUHtkTFUslWiolLxtbTf
 F7QTbeedesoO48LqrEhr8z8F8CcpM3fycncMDTrTKbsAwt6QKXn5LeRfl
 87R0QOqrtjU7pS79jzvhthFaMd8AREC9twkQZS6/4Ozrozc0rKyFJ0R8F
 vux757lmCq2u9329GnwKNqjR+L8Tv1SpcfAp21CpzqTVlQ16CUxMkwMpd g==;
X-CSE-ConnectionGUID: 9SIqoMJCRjOCWIlWXQ62bg==
X-CSE-MsgGUID: TGe0xHIzSOSvbAVq5BoyTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4269142"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4269142"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 09:02:25 -0800
X-CSE-ConnectionGUID: i2TDGyOcT6KQUXDTA4DwOA==
X-CSE-MsgGUID: 9iVfb6dEQTuuaf184xrFXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="13045875"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 09:02:23 -0800
Date: Mon, 23 Nov 2026 18:01:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Cc: "Knop, Ryszard" <ryszard.knop@intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nikula,
 Jani" <jani.nikula@intel.com>, 
 "B S, Karthik" <karthik.b.s@intel.com>, "Sharma,
 Swati2" <swati2.sharma@intel.com>, 
 "gildekel@google.com" <gildekel@google.com>,
 "markyacoub@google.com" <markyacoub@google.com>
Subject: Re: [PATCH] lib/igt_hdr: switch to libdisplay-info for EDID parsing
Message-ID: <6mp3fkbdjc7dv275kuxt4r2mjblqres2tmt22z3bi5zmudrctf@uiijq7irlodj>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Simon Ser <contact@emersion.fr>, "Knop, Ryszard" <ryszard.knop@intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nikula,
 Jani" <jani.nikula@intel.com>, 
 "B S, Karthik" <karthik.b.s@intel.com>, "Sharma,
 Swati2" <swati2.sharma@intel.com>, 
 "gildekel@google.com" <gildekel@google.com>,
 "markyacoub@google.com" <markyacoub@google.com>
References: <20261121115236.124211-1-contact@emersion.fr>
 <no3gurwcnsisfnjvfezh4xub7a6b3jw4wyxjyl4h5wr5rraq6p@gfmxhhez5xm2>
 <6369f30cf5d7dc9346589d34fe3e3c6bcaa41cbd.camel@intel.com>
 <_AyHlId1OFTsoV5vKPYws3tD9Eby8_rd9Jho0Sqiae49jcQKNbgWnkdSdJKbzix-27LaZzQMdQR3hHeLo0ICb9ZQXnuR6M8f9yVmDxDA66s=@emersion.fr>
 <d513043d046bcf2b2d7bbd788aee4caa350a1156.camel@intel.com>
 <XzEMWGkYBNYIocNS9OH9POwFuhngAbGWhJ5VwFbO27k5cJTvUeQUv2BZXTF323SkL2KMDfcZezEHPXsnkIZs0cSFIbZTkh-oZ_oJPhmf0TA=@emersion.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <XzEMWGkYBNYIocNS9OH9POwFuhngAbGWhJ5VwFbO27k5cJTvUeQUv2BZXTF323SkL2KMDfcZezEHPXsnkIZs0cSFIbZTkh-oZ_oJPhmf0TA=@emersion.fr>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Simon,
On 2026-11-23 at 16:36:31 +0000, Simon Ser wrote:
> On Monday, November 23rd, 2026 at 17:07, Knop, Ryszard <ryszard.knop@intel.com> wrote:
> 
> > On Mon, 2026-11-23 at 15:06 +0000, Simon Ser wrote:
> > > On Monday, November 23rd, 2026 at 16:03, Knop, Ryszard <ryszard.knop@intel.com> wrote:
> > >
> > > > > Please wait with merging as now it will not build in CI
> > > > > on Ubuntu 20.04 and 22.04.
> > > >
> > > > Hey Simon. Intel CI still runs on Ubuntu 20/22.04 and RHEL 8 where we
> > > > don't have these libs in the repo - could you make this lib optional
> > > > for now (old impl and new ifdefed with HAVE_LIBDISPLAY_INFO)?
> > > >
> > > > We will likely drop distros older than 24.04/RHEL 9 in the near future,
> > > > but it's a pain to maintain a single external lib for those distros :<
> > >
> > > Maintaining two codepaths is a bit of a pain. Could we instead use Meson
> > > subprojects for these old distros?
> > 
> > That and a Git submodule? Works for me, although maintaining that is
> > also a bit painful.
> 
> Not a Git submodule, but just a matter of dropping this into a
> subprojects/libdisplay-info.wrap file:
> 
>     [wrap-git]
>     url = https://gitlab.freedesktop.org/emersion/libdisplay-info.git
>     revision = 0.4.0
> 
> Then Meson will automatically download it at build time if the system
> version isn't available (or new enough according to the dependency
> version requirements, which might be useful if IGT needs a recent
> libdisplay-info in the future).
> 


There are some distros which disable downloading during build,
so this will not work for them.

Regards,
Kamil

> > If you can give me a day or two, I'm trying to
> > figure out if there's anyone who still really needs that 20.04 build,
> > maybe it can be avoided entirely.
> 
> I'm perfectly fine waiting for a bit (but maybe Gil Dekel has a
> deadline?).
