Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BEAF9D0E2
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 16:09:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AC910E637;
	Tue, 14 Apr 2026 16:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cue77dV7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A515B10E0AE
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 16:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776182976; x=1807718976;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8aXRvWI0rSejh+6+klFASYVsXlv2m8LRmWYxASlrAj4=;
 b=Cue77dV78DBHruu6nFblrkaxYQs9vXNqY+aYtXULekTJ5YoAI0fJRN45
 W8SYCr7AiEPUGWw5ayge9kq357htaCC9BeTPu+Nh3qltULW4AFsjkG+N3
 CuIR21++4SP7bbqKfx64oD38XdwWveuB8porcelyPh2v+y3h8w2/+/2ws
 wVxypSwMLwr8y8RabfaNJhhY8JdNaRB8cUYltr34f70NSoxraVDsRmLsN
 xE06S2+wzb/HNxaMewlKtam+8dG3szH9xYOdCQWvRTiyG8FQYQV3W3xaL
 8apiiWUmwtE6HNC0CufMH8MwHyptFhZ5LMSMs5WaXJfJYJhuXAnJNC7KA Q==;
X-CSE-ConnectionGUID: xX0tJUOAQY6PhYQEjRFUng==
X-CSE-MsgGUID: z3Aug7f6TNutXg5B5hotBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="64684665"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="64684665"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 09:09:36 -0700
X-CSE-ConnectionGUID: XPh1tGELTFKt/cIdHYDSOA==
X-CSE-MsgGUID: Qk6Lj5C7S5GUHhz5uMrDtA==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 09:09:35 -0700
Date: Tue, 14 Apr 2026 19:09:32 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 00/16] igt: clean up typedef usage, use
 for_each_output() more
Message-ID: <ad5mvKQeTMCkgSI_@intel.com>
References: <cover.1776150714.git.jani.nikula@intel.com>
 <ad5KbvOAgWfOiyG6@intel.com>
 <cd012ba649468272cbd655b47c98b108ebb38efd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd012ba649468272cbd655b47c98b108ebb38efd@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Tue, Apr 14, 2026 at 06:51:39PM +0300, Jani Nikula wrote:
> On Tue, 14 Apr 2026, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Tue, Apr 14, 2026 at 10:14:20AM +0300, Jani Nikula wrote:
> >> This series spiraled into a few things:
> >> 
> >> - use typedefs like igt_foo_t more consistently instead of struct
> >>   igt_foo
> >
> > I'm not a huge fan of the typedefs but getting rid of them now
> > would involve a gargantuan patch. So best to just accept them
> > I guess.
> 
> Yeah, in general I'd reserve typedefs for opaque types that you really
> aren't supposed to look at. It feels weird to have some foo_t and then
> go on to access its members implicitly assuming it's a struct.

Even for opaque types the non-typedef seems a bit better to me
because you can't really forward declare typedefs without
mentioning the struct anyway.

typdefs aren't even proper types in C, more like aliases. You
can typedef the same underlying type multiple times and then
use any of the typdefs (or the actual type) interchangeably.
The compiler will not even tell you that you're being silly.

> 
> But I think that ship has sailed, and we're better off focusing on
> consistency here.
> 
> And we're just a couple of brainwashed kernel developers avoiding
> typedefs. ;)
> 
> > Series is
> > Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Thanks, pushed the lot.
> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
