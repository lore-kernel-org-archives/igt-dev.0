Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED910C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 14:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A97110EC84;
	Fri,  7 Jun 2024 14:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PqCDMFR5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B66F10EC81
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 14:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717771104; x=1749307104;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b1fODSx/Ce7ivi1T5WQ/6C8Il2c0wn17JfEZU5unHLo=;
 b=PqCDMFR5O++Npjb7MtzAZLkXfMkTj/GeZLHZ/D35IUxqEficMpekm1HO
 gghppTLIV4fYwJgIlHZYAUufEfuIygwUZxYvHBEuB49xVOA3uTQaOmJkL
 /hiIkxdD9bE+KeFhqHTWukWeSVy/xzWCFAcyP1pPfMG4fhwQvRZ8JNfCU
 BG/WpOsdsLBX+jEYhXV2y26p8db6pGe0Y+rTj3tQUtkcxTmyRK37KUdf4
 mYEV6U2f7ls9BxrjLNHvmSphisoICVQy74KN+OINgBiPFLGYbBrlREvyj
 wbjGBd1fLGu1wGSRCxDJf2QW3GTJ4wBYROsJXhOakWTgXeC3S1k2GeeOh Q==;
X-CSE-ConnectionGUID: 06rlrOYATTu9zNzmjf2Kfg==
X-CSE-MsgGUID: erGzB7GLSwG2QPduBbT+jA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14329256"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14329256"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 07:38:24 -0700
X-CSE-ConnectionGUID: TMVBXfWHRe+fQHdUQrf+/A==
X-CSE-MsgGUID: YH9khvNQQjO8W+swOh0ZvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38465863"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 07:38:22 -0700
Date: Fri, 7 Jun 2024 16:38:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luca@coelho.fi>, Luca Coelho <luciano.coelho@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Manasi Navare <navaremanasi@chromium.org>
Subject: Re: [PATCH i-g-t v2 1/2] lib/igt_chamelium: check
 drmModeGetConnector() return in wait_for_connected_state()
Message-ID: <20240607143806.n5pxivsbfnt5ugbg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Luca Coelho <luca@coelho.fi>,
 Luca Coelho <luciano.coelho@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Manasi Navare <navaremanasi@chromium.org>
References: <20240528075855.463729-1-luciano.coelho@intel.com>
 <20240528075855.463729-2-luciano.coelho@intel.com>
 <20240529160646.nv6ovnpgw7ttzilz@kamilkon-DESK.igk.intel.com>
 <6815028c4c13d8c2d3c5080389fdfc4067dbd501.camel@coelho.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6815028c4c13d8c2d3c5080389fdfc4067dbd501.camel@coelho.fi>
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

Hi Luca,
On 2024-05-30 at 00:13:24 +0300, Luca Coelho wrote:
> On Wed, 2024-05-29 at 18:06 +0200, Kamil Konieczny wrote:
> > Hi Luca,
> 
> Hi Kamil,
> 
> > On 2024-05-28 at 10:58:54 +0300, Luca Coelho wrote:
> > 
> > change now looks ok but why did you ignored my suggestion
> > about short subject?
> 
> Oh, sorry, but I didn't _ignore_ your suggestion.  I replied to it,
> expressed my opinion and explained why I didn't think it needed to be
> changed.
> 
> 
> > Please see CONTRIBUTING.md about test
> > description:
> > The description should contain the spirit of the test (what is
> > the general idea behind the test) and *not* the letter (C to English
> > translation of the test).
> 
> This is not a new test, so I think this doesn't really apply.  This is
> a very specific fix in a very specific place of an existing test and I
> think getting a general idea of what was wrong in the code and why it
> needs to be changed is the right thing to describe here.
> 
> This text you quoted is about what should be in igt_describe() and not
> in the commit message, right?
> 
> 
> 
> > The same principle apply to your subject description of change,
> > it should be short, not 'translation from C code of a change'.
> > It should also be rather short, up to 75 chars (or maybe even 65)
> > to keep it all in mailing list discussion.
> > You coould also look into:
> > https://patchwork.freedesktop.org/series/134188/
> > 
> > So imho here, instead of:
> > lib/igt_chamelium: check drmModeGetConnector() return in wait_for_connected_state()
> 
> This describes what was fixed and where.
> 

You can read it in patch itself after 'diff --git a/...'

> 
> > imho better:
> > lib/igt_chamelium: Fix NULL dereferencing bug in wait_for_connected_state()
> 
> This describes that something was fixed and where, without specifying
> what was fixed.
> 
> 
> > or even better:
> > lib/igt_chamelium: Fix bug in wait_for_connected_state()
> 
> This is even more generic and there could be several bugfixes in this
> function which would end up with the same commit subject...
> 
> 
> > or maybe:
> > lib/igt_chamelium: check drmModeGetConnector() return value before use
> 
> Conversely,this describes what was fixed but not where.
> 
> 
> > You could propose other subject if you find a better description.
> 
> I generally follow the kernel's coding style.  One important part of
> the subject line, IMHO, is the uniqueness and identifiability of it. 
> Like explained here[1]:
> 
> "[...]the ``summary phrase`` of your email becomes a
> globally-unique identifier for that patch.  It propagates all the way
> into the ``git`` changelog.  The ``summary phrase`` may later be used
> in
> developer discussions which refer to the patch.  People will want to
> google for the ``summary phrase`` to read discussion regarding that
> patch.  It will also be the only thing that people may quickly see
> when, two or three months later, they are going through perhaps
> thousands of patches using tools such as ``gitk`` or ``git log
> --oneline``."
> 
> I admit that the subject is a bit long, but it actually contains only 5
> relevant words.  The function names are rather long and, with about 20
> characters of boilerplate ("lib/igt_chamelium: ") and 47 chars only in
> function names, it's literally impossible to keep the subject line
> inside the 70-75 recommended length while still keeping it descriptive
> and unique...
> 

What will you write if you will make change in a few functions?
Well, I agree that 70-75 is only recomendation, not strict rule.

Regards,
Kamil

> But this is a different project and I'm not a maintainer, so I can do
> whatever you think is right here.  Just tell me which option you prefer
> and I'll resubmit my patch with it.
> 
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n652
> 
> --
> Cheers,
> Luca.
