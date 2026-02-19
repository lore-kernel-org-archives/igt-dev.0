Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228C2E9A048
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 14:35:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBED410E194;
	Thu, 19 Feb 2026 14:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J377VCym";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E61A10E6EA
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 14:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771511709; x=1803047709;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AWSuLBKRS/drwBtFgT2N5Qq9vYHJAThlI12mTiiPEsE=;
 b=J377VCym6pGPQeJ5KtWgnA56ipXl4Ts1PvrDjEHOUYK4RkbHwSMU/7wp
 ZIdtWlSBQqki1bsU/vOmy7BAI3hiyNtgMA/HKJhh8MO5gWRmU7E9+YrdR
 op0Zsm5dKLdXe/8eHHG/jpJxEXgeijlFoXOKxoJyUZdtqcdTpIeFidOuR
 /sB1S0AvJkrOcASsN351C4lGa6Vyfw3D9cjeYs3uxfNJXquY0X/zbe0Hj
 jEhFK3CPEuzJMNCP9xc2YcOHMO5Ak+Jvzg4XuoXTtIEDtgeO5hOdYpFUQ
 iwRv44LoKmMiKtLHvU6/a1/f1B1OIV026VK8/B4YddV+CzdT5nLGWQ9bn g==;
X-CSE-ConnectionGUID: z9fOUtQ+SheAqNiEuPc4pQ==
X-CSE-MsgGUID: oF8aQV4tTUmVLCUD9ok/CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="90177234"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="90177234"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 06:35:09 -0800
X-CSE-ConnectionGUID: IhifYBO6Sy2JwJUnSzB0AA==
X-CSE-MsgGUID: GFl8awQQTLeLpDcAD/TRng==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 06:35:08 -0800
Date: Thu, 19 Feb 2026 15:34:52 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: igt-dev@lists.freedesktop.org,
 Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH i-g-t] panthor: Enable compilation on big-endian arch
Message-ID: <20260219143452.u3mz2iczwdo2d7cq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 igt-dev@lists.freedesktop.org,
 Daniel Almeida <daniel.almeida@collabora.com>
References: <20260218153444.80754-1-kamil.konieczny@linux.intel.com>
 <20260218171657.6a4cd753@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260218171657.6a4cd753@fedora>
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

Hi Boris,
On 2026-02-18 at 17:16:57 +0100, Boris Brezillon wrote:
> On Wed, 18 Feb 2026 16:34:44 +0100
> Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> 
> > Compilation of Panthor was broken on big-endian due to a guard in
> > pathor lib against such arch. Fix this and create and use a macro
> > for skipping all panthor tests on such machines.
> > 
> > Also while at it, init fd so it could be safely used at last
> > fixture.
> > 
> > Cc: Daniel Almeida <daniel.almeida@collabora.com>
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/200
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  lib/igt_panthor.c             | 17 +++++++++++++++++
> >  lib/igt_panthor.h             |  6 ++----
> >  tests/panthor/panthor_gem.c   |  3 ++-
> >  tests/panthor/panthor_group.c |  3 ++-
> >  tests/panthor/panthor_query.c |  3 ++-
> >  tests/panthor/panthor_vm.c    |  3 ++-
> >  6 files changed, 27 insertions(+), 8 deletions(-)
> > 
> > diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
> > index 49b427d4f..cf065352d 100644
> > --- a/lib/igt_panthor.c
> > +++ b/lib/igt_panthor.c
> > @@ -6,6 +6,23 @@
> >  #include "ioctl_wrappers.h"
> >  #include "panthor_drm.h"
> >  
> > +/**
> > + * igt_panthor_skip_on_big_endian:
> > + *
> > + * Skip Panthor test on bing-endian machines.
> 
> 			   ^ big-endian
> 
> > + */
> > +void igt_panthor_skip_on_big_endian(void)
> > +{
> > +#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
> > + #define IGT_PANTHOR_ON_BIG_ENDIAN 1
> > +#else
> > + #define IGT_PANTHOR_ON_BIG_ENDIAN 0
> > +#endif
> > +
> > +	igt_skip_on_f(IGT_PANTHOR_ON_BIG_ENDIAN, "Panthor is unsupported on big-endian arch\n");
> > +#undef IGT_PANTHOR_ON_BIG_ENDIAN
> 
> Can't we just go with
> 
> 	igt_skip_on_f(__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__,
> 		      "Panthor is unsupported on big-endian arch\n");
> 
> and drop the IGT_PANTHOR_ON_BIG_ENDIAN definition?
> 

Yes, it is much simpler, thank you for spotting this.
I will send v2 soon.

Regards,
Kamil

> > +}
> 
> The rest looks good to me.
> 
> Regards,
> 
> Boris
