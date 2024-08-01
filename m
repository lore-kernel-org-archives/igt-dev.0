Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3093C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 05:42:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A381610E6AB;
	Thu,  1 Aug 2024 05:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jcBrIvQl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C95210E6AB
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 05:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722490975; x=1754026975;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IuYXI+CzFwX183FzVNw6BWsgs77scsz+5Onl/kIKpBI=;
 b=jcBrIvQlQo1O0Od2pCR3scVEx88B9CTFwXS1wG+cWl5gUwPxD4n5+BY3
 S0IOCT5X8KZ2pQXhrVOgAoWAzK3VTuPB7UaihdCS3KXh2aQuQ3AMPF3Gr
 QIzRohBcTG9HL2r80T82kGBLi2UXq141E7mVeGngkksukxTpfj+DEKmGd
 +a4ncormz59M4AcA0/jFAuTVVHfIVmf9CV9LqWBbvxP8Y7eFohUf01oJA
 sCpSf8poLpMZqZLaBGHtQSZjU1TzhkhXR/avO8Rt6cd8McpqWP3sZyWQZ
 A4SZ51/Le9EjFyHtkGoojfx+BWUdlLfPDsX7ZjLYneOlqJaxtHOZOen1e g==;
X-CSE-ConnectionGUID: LGkDNs1jQcaCUPI3MkCPBA==
X-CSE-MsgGUID: k8nVMRUMT9CYJQ2rHDAdXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20306924"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="20306924"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 22:42:55 -0700
X-CSE-ConnectionGUID: az4aYh1YSe2FB4bX+ANUXw==
X-CSE-MsgGUID: M9OzfsN/S6i0jKWEbHuhIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="78206759"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.212])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 22:42:53 -0700
Date: Thu, 1 Aug 2024 07:42:54 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t 2/3] lib/xe_spin: Fix xe_spin_wait_started()
Message-ID: <20240801054254.eycl66ikumhryetf@zkempczy-mobl2>
References: <20240731033504.1426640-1-lucas.demarchi@intel.com>
 <20240731033504.1426640-3-lucas.demarchi@intel.com>
 <20240731060652.w3zpciijmu3myvdn@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240731060652.w3zpciijmu3myvdn@zkempczy-mobl2>
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

On Wed, Jul 31, 2024 at 08:06:52AM +0200, Zbigniew Kempczyński wrote:
> On Tue, Jul 30, 2024 at 08:35:03PM -0700, Lucas De Marchi wrote:
> > Use READ_ONCE() to guarantee we are actually reading the memory written
> > by the GPU and compiler can't optimize it away.
> > 
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  lib/xe/xe_spin.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> > index 3adacc3a8..43a7a43c2 100644
> > --- a/lib/xe/xe_spin.c
> > +++ b/lib/xe/xe_spin.c
> > @@ -166,7 +166,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
> >   */
> >  bool xe_spin_started(struct xe_spin *spin)
> >  {
> > -	return spin->start != 0;
> > +	return READ_ONCE(spin->start) != 0;
> >  }
> >  
> >  /**
> > -- 
> > 2.43.0
> > 
> 
> Hmm, function is exported and would expect compiler will always
> read the memory before return. This is part of .so and I don't
> think this will be inlined to the caller. Where do you observe
> gpu memory write is not reflected to the cpu?
> 
> --
> Zbigniew
> 

I wondered about local inlining the function or optimizing which
will prevent from looping the read (endless loop after single read)
and I got this when code is optimized but not position independent.
I mean -O2 produces:

xe_spin_wait_started:
	cmp     DWORD PTR [rdi], 1
	jne     .L6
        ret
.L6:
        jmp     .L6

Only -fpic prevents from this optimization.

As Jonathan gave you r-b I'm not going to block this series,
it is just not necessary imo in this particular case.

--
Zbigniew
