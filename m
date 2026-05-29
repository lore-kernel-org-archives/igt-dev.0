Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A19CD6E49
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 21:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B403F112517;
	Fri, 29 May 2026 21:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LEo8uPJ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52541112517
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 21:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780088848; x=1811624848;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uuSSpXHh3Sg5vanPRbFrOiUZqTPFUMheXojlvTAj/Io=;
 b=LEo8uPJ8G8POoZMP7Z0n0SDMcm2pV8XXzN8Nwwrc8TljTkJLFbRZEOrt
 CcKzNWOWsP8J4RWaz/l609wPphyF9zlxPbGl2Btt1nAFwAzDzxPaHLkZG
 NT9eIGwQpDkzbviwkl1RyKEMFKoMgZfMWNSp+jZyuKsBVTC76WZpzzv9M
 QtQN7w76+vXo76NNmnK7gcBybf+06egf9s1m5tsRGiy5AGTNhXAWLNPiv
 7Iob/BGwOPTACxBBVTh16gi7nE968KvtB26toVXDEQvVMrlYii/EQBNSU
 8GqNHUSxQtfxuLeJC0wlrDoZjx4/nXRhUqy7zzbpjMulxhCgrQv52lJRk Q==;
X-CSE-ConnectionGUID: WUaluzpMT++SmnooOCqEIA==
X-CSE-MsgGUID: KKwSVrkOSxSBMT+S2C3dgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80090073"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; d="scan'208";a="80090073"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 14:07:28 -0700
X-CSE-ConnectionGUID: j9w8ln8pS/Cwa0/CV5xvBA==
X-CSE-MsgGUID: rLiOcLBfREu84asnZQhnhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; d="scan'208";a="236603532"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 14:07:26 -0700
Date: Fri, 29 May 2026 23:07:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>,
 "Knop, Ryszard" <ryszard.knop@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "Thomas, Sobin" <sobin.thomas@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Subject: Re: [PATCH i-g-t v1 0/4] RFC: Create smaller dmesg reports for a test
Message-ID: <20260529210724.xk3qcglf62cox4we@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 "Knop, Ryszard" <ryszard.knop@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "Thomas, Sobin" <sobin.thomas@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
References: <20260520154947.116726-1-kamil.konieczny@linux.intel.com>
 <5a9494611b1644f3113d6972e55103e3aeead1fa.camel@intel.com>
 <425e70c4ff7133d6101ed0e52902aa3d73dc3dc1@intel.com>
 <ahmsKpVfFj3G8DP9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ahmsKpVfFj3G8DP9@intel.com>
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

Hi Ville,
On 2026-05-29 at 18:09:30 +0300, Ville Syrjälä wrote:
> On Fri, May 29, 2026 at 03:52:13PM +0300, Jani Nikula wrote:
> > On Fri, 29 May 2026, "Knop, Ryszard" <ryszard.knop@intel.com> wrote:
> > > IMO this is going to end up either unused, and people will keep
> > > complaining they want a higher limit anyways, or overused, and people
> > > will complain why some of their logs are randomly missing from CI logs.
> > >
> > > In general it seems like this does not break the CI infra directly, so
> > > I won't say no to anything here, but it's one of those things that dial
> > > up the magic and we seem to have lots of that in disk limits recently.
> > 
> > Overall seems like there are a number of hacky approaches being added,
> > e.g. tweaking of the drm.debug parameter value, and filtering parts of
> > the dmesg.
> > 
> > Debugging issues is often seriously difficult even with the full
> > dmesg. Having an imcomplete dmesg makes everything more difficult. And
> > it's the worst if you don't even know that when looking at the dmesg.
> > 
> > We could *maybe* discuss reducing the stored dmesgs for tests that
> > passed. Or reduce the time the dmesgs are stored for passed dmesgs. But
> > even then it's often useful to see the passed results when debugging
> > failed results.
> > 
> > But no matter what, full dmesgs should be the standard for failed tests,
> > and nothing less is acceptable.
> 
> If disk space is the issue then just compress the damn logs.
> 

It was tried but failed in CI pipe, where plain text is
expected. +J-P

Regards,
Kamil

> -- 
> Ville Syrjälä
> Intel
