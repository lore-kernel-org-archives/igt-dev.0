Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8427EC25B74
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 16:31:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079C110ED5C;
	Thu, 16 May 2024 16:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OxMWSI0C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E83210ED81
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2024 16:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715877064; x=1747413064;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FNhrmlqcdHY9JEWslQhTAE7ToxhZ4glT86bMegD9Xrk=;
 b=OxMWSI0CIKmT6DRzbaRKdaZ2rAqWlZ/vay9abE6/zvRGSsZJa35/r2Db
 4GV9aW+X6SF4qt6UPlNBUrjBnN/h8jWSlpEDxVgjzshbS9iL+z0nbsir/
 03ojVq6sTr+TqN7XGX38qzUp983lAA4cL8jO6liihXn0fmJWTFacs/6Ud
 YCkuoy3SRBxQAFaXRGtscpNPfSW0zNhyQSTNO9h5CkIdm57eA2R9sKV0f
 6bZ8jvNx+x0kP5UNtO/n1eg4L/yT0Zph9kZhcW4/JVElsbqxL/B+1Uv5r
 zb3HyWqfA6s7Jwhm55sOZ+ZE4rwlMXOMq5K2vVFwBq8E1TCyKp7VymjBK w==;
X-CSE-ConnectionGUID: QxY1BAAARQqBS0jFfZYEPQ==
X-CSE-MsgGUID: xNgo6THVQsGNxMmXGbPohQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11844947"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="11844947"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 09:31:04 -0700
X-CSE-ConnectionGUID: QsUbZcboSxes7hT9IuH2Yg==
X-CSE-MsgGUID: akI8xs8XSimCZBKIA5+R5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="31490527"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 09:31:01 -0700
Date: Thu, 16 May 2024 18:30:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t 1/3] igt_hook: Add feature
Message-ID: <20240516163047.sjd37ymn34uhsosd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
References: <20240509152442.189166-1-gustavo.sousa@intel.com>
 <20240509152442.189166-2-gustavo.sousa@intel.com>
 <20240515171055.dpqo3uarlappfux6@kamilkon-DESK.igk.intel.com>
 <171579455569.27300.4520939210308457020@gjsousa-mobl2>
 <20240516104058.llfw2vgdtn3txnpo@kamilkon-DESK.igk.intel.com>
 <171586196699.2995.10601085751736261998@gjsousa-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171586196699.2995.10601085751736261998@gjsousa-mobl2>
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
On 2024-05-16 at 09:19:26 -0300, Gustavo Sousa wrote:
> Quoting Kamil Konieczny (2024-05-16 07:40:58-03:00)
> >Hi Gustavo,
> >On 2024-05-15 at 14:35:55 -0300, Gustavo Sousa wrote:
> >> Quoting Kamil Konieczny (2024-05-15 14:10:55-03:00)
> >> >Hi Gustavo,
> >> >On 2024-05-09 at 12:24:29 -0300, Gustavo Sousa wrote:
> >> >> For development purposes, sometimes it is useful to have a way of
> >> >> running custom scripts at certain points of test executions. A
> >> >> real-world example I bumped into recently is to collect information from
> >> >> sysfs before and after running each entry of a testlist.
> >> >> 
> >> >> While it is possible for the user to handcraft a script that calls each
> >> >> test with the correct actions before and after execution, we can provide
> >> >> a better experience by adding built-in support for running hooks during
> >> >> test execution.
> >> >> 
> >> >> That would be even better when adding the same kind of support for
> >> >> igt_runner (which is done in an upcoming change), since the user can
> >> >> also nicely resume with igt_resume with the hook already setup in case a
> >> >> crash happens during execution of the test list.
> >> >> 
> >> >> As such provide implement support for hooks, integrate it into
> >> >> igt_core and expose the functionality via --hook CLI option on test
> >> >> executables.
> >> >
> >> >Hmm, why not just a pre-hook@ and post-hook@ in testlist itself?
> >> >It will be easier to handle - just more parsing.
> >> 
> >> How would that work with respect to filters? The current proposal allows
> >> something filtering the events to be tracked. For example, one can use
> >> `--hook "pre-test,pre-dyn-subtest:echo hello"` to run the command only
> >> before test binary starts and before each dynamic subtest.
> >> 
> >> Also, there are cases where a testlist is not really used. Examples are
> >> calling a test binary directly or calling igt_runner without
> >> --test-list. So, while I believe we could consider support for
> >> describing hooks in testlist, I do not think that would be a substitute
> >> for the --hook option.
> >> 
> >> On a personal note, my current use case for hooks is more towards
> >> debugging, so for me it is more convenient to have a --hook option than
> >> having to make a copy of a testlist only to add the hook instructions
> >> there.
> >> 
> >> --
> >> Gustavo Sousa
> >> 
> >> >
> >> >Added Petri to cc.
> >> >
> >> >Regards,
> >> >Kamil
> >> >
> >
> >Ok, that makes sense, I will look into your patches later (maybe next week).
> 
> Thanks!
> 
> >In meantime please look into GitLab failure here:
> >https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58540606
> 
> Yeah, already tried to take a look at it a few days ago [1], but as I
> mentioned there, I'm not sure how I can get more info (e.g. logs) on the CI
> failure. The test works fine for me locally. I wonder if it is possible
> to setup the container locally so that I get the same test envionment.
> 
> [1] https://lore.kernel.org/all/171527425512.5772.1654105508452706087@gjsousa-mobl2/
> 
> --
> Gustavo Sousa
> 

Command used is in line 29:
meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}

and fail is:
13/30 lib igt_hook_integration FAIL 0.72 s (killed by signal 11 SIGSEGV)

I tested this locally after building (so binaries are already there)
using 'meson test -C build' and it fails:
killed by signal 7 SIGBUS

Regards,
Kamil

> >
> >Regards,
> >Kamil
> >
