Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C096AF428CD
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 19:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F0410E18F;
	Wed, 15 Apr 2026 19:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FE0YmMCm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D913410E18F
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 19:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776282992; x=1807818992;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WhmNqOGHzS0xkiXtblyMoQbgwVKxGKaXFx3I97MYH54=;
 b=FE0YmMCmrxKeQ+slWQ6eY7KWZHMSMgHxGON3DXlEpnZhQTfVP+yHTA9P
 HS9C0NT7bTGeAn2T7fYQu4ctc/vGeqHmv9rYF1l/NTTT9cvmSMhYX0khW
 tpQk+Am9IS+YyZSiospe3UbquW6L+wPqdnRdcAEEDXSwmufKHIhQYQkF9
 AcZBgyWCgvnVDVUu7oDiWRe1HXaoeSkCQa6FJPnpwIk9BRhQ5md6EExSl
 1WZEQr+K11nvzTsHMiWnP9zwUShjICHcRvrhxF7U+fdEJJ9dPSg7L6mC7
 9i1twK0AGk4/TawY5rXc9by68M8Gj5AtdOEOOOGkw9KxbgdGJWz0XSPGZ w==;
X-CSE-ConnectionGUID: KqJZWMAwTae++77Wn/PnNw==
X-CSE-MsgGUID: Tz/6DVk1SjiwuFN8Tr2FTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88724282"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="88724282"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 12:56:31 -0700
X-CSE-ConnectionGUID: oNwBi4/aRNqKCSO847C8tw==
X-CSE-MsgGUID: ubiO/WfWSbyuhhajYTfxqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="227350814"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.168])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 12:56:29 -0700
Date: Wed, 15 Apr 2026 21:56:27 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v3 5/5] runner/resultgen: Insert attachments list
 into results.json
Message-ID: <so5eiricgthaxs7n7qonvktwhpsbjol4g2qnzsxtlde2sypt4d@umwitlziyivy>
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-12-zbigniew.kempczynski@intel.com>
 <87eckhw7an.fsf@intel.com>
 <h75a4hpy25g4u6tge5kigkm4x33df47z4oj2yoruf3pem4lpe6@nwlnm4fhzofg>
 <87h5pczae6.fsf@intel.com>
 <eq74fj354iicdqvutrsjcf52h2s7lbkfiyn3zunqx7ys6oxblt@3d7wrtjwfted>
 <878qaoyz39.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qaoyz39.fsf@intel.com>
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

On Wed, Apr 15, 2026 at 01:20:42PM -0300, Gustavo Sousa wrote:

<cut>

> >> 
> >> >
> >> > For attachments case imo allowing recursive creation from hooks scripts
> >> > is an overkill.
> >> 
> >> The hook mechanism is not something created for exclusive use by CI. It
> >> is a tool for developers to use are they see fit.  That was my original
> >> intention when I first developed the hooks infrastructure.
> >> 
> >> I don't like the fact that we are making assumptions of how the hooks
> >> will behave here.
> >> 
> >> If CI wants a flat structure, that's fine: let CI provide hooks that
> >> generate files in a flat hierarchy.  I just think that it is not right
> >> to assume that all hooks will behave like that.
> >
> > Executing hooks out of igt_runner won't provide results.json, right?
> > So all that recursive removal / etc doesn't makes sense when you execute
> > tests standalone.
> 
> My comment above is not about running igt_runner vs standalone tests;
> it is about the users having their own custom hook scripts, which could
> be used as part of an igt_runner call.
> 
> By the way, did we reach an agreement about whether we should or not be
> adding the attachments to the results.json?  I remember Ryszard had his
> doubts.  I might have missed some conversation about it.

Yes. We got some offline discussion about this and Ryszard requirement
was we should pack only attachment filenames to results.json. No content
should land into this file because it is already big and adding content
packed via base64 will only make it bigger.

If you don't mind I would like to provide minimalistic solution which
will provide guc logs first. I suppose you have your own setup which
likely uses hooks much, but at the moment I would like to solve problem
with valid guc logs for failing tests. We may try to satisfy your
workflow in a followup series, but I would like not to loose my primary
goal from the radar.

--
Zbigniew


> 
> --
> Gustavo Sousa
> 
> >
> > --
> > Zbigniew
> >
> >
> >> 
> >> --
> >> Gustavo Sousa
> >> 
> >> >
> >> > --
> >> > Zbigniew
> >> >
> >> >> 
> >> >> --
> >> >> Gustavo Sousa
> >> >> 
> >> >> > +	fchdir(dirfd(currdir));
> >> >> > +
> >> >> > +	return ret ? false : true;
> >> >> > +}
> >> >> > +
> >> >> >  static const char *result_from_exitcode(int exitcode)
> >> >> >  {
> >> >> >  	switch (exitcode) {
> >> >> > @@ -2244,6 +2304,9 @@ static bool parse_test_directory(int dirfd,
> >> >> >  		fprintf(stderr, "Error parsing output files (dmesg.txt)\n");
> >> >> >  	}
> >> >> >  
> >> >> > +	if (!fill_from_attachments(dirfd, results->tests))
> >> >> > +		fprintf(stderr, "Error parsing attachments directory\n");
> >> >> > +
> >> >> >  	override_results(entry->binary, &subtests, results->tests);
> >> >> >  	prune_subtests(settings, entry, &subtests, results->tests);
> >> >> >  
> >> >> > -- 
> >> >> > 2.43.0
