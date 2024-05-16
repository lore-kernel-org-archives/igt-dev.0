Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E266EC25B74
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 10:41:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BB810EC50;
	Thu, 16 May 2024 10:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iwhdx2Tz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2B210EC50
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2024 10:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715856076; x=1747392076;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X6xuZqiWvdAwqChNTeBnAofs6PZm0hc3Ya5KXZ3Vyns=;
 b=iwhdx2Tzbi28kZ4FUZMtg8Feywo47dVLOZzgu99YEFcigR7viPWCsrQR
 e4+E6NiYVsOesuX8Ja91A2r0aZWBqYT/utDV59h2jIGildSwEojLBuTMz
 XlCam/zrQBawXB9uUHC87zSib7QIEjqcbw/+qNz8jIjxXwZ8R3oSNxb86
 WS+1zZGYuJ5OzcbjO43SLYzlNcVaZL+oLH1CgsU49YzNGEAD180L4joS0
 yyiQENMFyOEz39sRhYxomjMCc0DgMZ0xCmIlorKF664/mVBjaQ7SpotD8
 obdeTbUN/Z02TDkfMD/UeN3+rJtrnh2CpKbUvU3oWnK9W8hVGt2D3sfgg A==;
X-CSE-ConnectionGUID: Ide6UprSSbykhZZQveMElQ==
X-CSE-MsgGUID: 1LdZk7WMRvmU1HFlupTMKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22560920"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="22560920"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 03:41:15 -0700
X-CSE-ConnectionGUID: CP2qRXzSRj+ze9lcdssuzQ==
X-CSE-MsgGUID: rp3owqhhR3SwvG35RAYqBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="36267680"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 03:41:14 -0700
Date: Thu, 16 May 2024 12:40:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t 1/3] igt_hook: Add feature
Message-ID: <20240516104058.llfw2vgdtn3txnpo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
References: <20240509152442.189166-1-gustavo.sousa@intel.com>
 <20240509152442.189166-2-gustavo.sousa@intel.com>
 <20240515171055.dpqo3uarlappfux6@kamilkon-DESK.igk.intel.com>
 <171579455569.27300.4520939210308457020@gjsousa-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171579455569.27300.4520939210308457020@gjsousa-mobl2>
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

Hi Gustavo,
On 2024-05-15 at 14:35:55 -0300, Gustavo Sousa wrote:
> Quoting Kamil Konieczny (2024-05-15 14:10:55-03:00)
> >Hi Gustavo,
> >On 2024-05-09 at 12:24:29 -0300, Gustavo Sousa wrote:
> >> For development purposes, sometimes it is useful to have a way of
> >> running custom scripts at certain points of test executions. A
> >> real-world example I bumped into recently is to collect information from
> >> sysfs before and after running each entry of a testlist.
> >> 
> >> While it is possible for the user to handcraft a script that calls each
> >> test with the correct actions before and after execution, we can provide
> >> a better experience by adding built-in support for running hooks during
> >> test execution.
> >> 
> >> That would be even better when adding the same kind of support for
> >> igt_runner (which is done in an upcoming change), since the user can
> >> also nicely resume with igt_resume with the hook already setup in case a
> >> crash happens during execution of the test list.
> >> 
> >> As such provide implement support for hooks, integrate it into
> >> igt_core and expose the functionality via --hook CLI option on test
> >> executables.
> >
> >Hmm, why not just a pre-hook@ and post-hook@ in testlist itself?
> >It will be easier to handle - just more parsing.
> 
> How would that work with respect to filters? The current proposal allows
> something filtering the events to be tracked. For example, one can use
> `--hook "pre-test,pre-dyn-subtest:echo hello"` to run the command only
> before test binary starts and before each dynamic subtest.
> 
> Also, there are cases where a testlist is not really used. Examples are
> calling a test binary directly or calling igt_runner without
> --test-list. So, while I believe we could consider support for
> describing hooks in testlist, I do not think that would be a substitute
> for the --hook option.
> 
> On a personal note, my current use case for hooks is more towards
> debugging, so for me it is more convenient to have a --hook option than
> having to make a copy of a testlist only to add the hook instructions
> there.
> 
> --
> Gustavo Sousa
> 
> >
> >Added Petri to cc.
> >
> >Regards,
> >Kamil
> >

Ok, that makes sense, I will look into your patches later (maybe next week).
In meantime please look into GitLab failure here:
https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58540606

Regards,
Kamil

