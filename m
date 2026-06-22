Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DDDCDB46F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 12:02:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37C010E661;
	Mon, 22 Jun 2026 12:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5W0x97n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0036D10E661
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 12:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782129711; x=1813665711;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2x/w9yQNLWtxC3CQd8XGy6iw49LK5Gi6eabSES4CxeE=;
 b=Z5W0x97nepg/d2dWcY1OdjTU+Dw4XkMt1E4WcPM7zvJ7peHAWYSwNH4v
 7mFWcX8QzoJeJcjFWiv2ieU1kJqBRQgo3c+NrzV5rXYeLIbHvva37Qs/C
 nqBn5z33SPM+TUL10rXWMnFCU8FlAPPNc7yTKsezEJFefbHMdiBLxgQOH
 4JQAT08yXiJkeMljRnpXFCDHEW3SgOaO+Y19VByi9J7p+i6iHtNaZd3mU
 xCQDg4AzsXqZD4EMB8r6eHhHuHUkmDFvz19kQ37kwiCPtvIpCJbAkClWT
 S9etuiIn7mAtdl3LI48eOtGnAoOf0BdU1I5hDQ2cE9Y4ZnRS7DyvlBLLy A==;
X-CSE-ConnectionGUID: O3vMNcWlQSm6apEvjPP0uA==
X-CSE-MsgGUID: dgM99OCWRoGHXwSLwSm0eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="93511303"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="93511303"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 05:01:50 -0700
X-CSE-ConnectionGUID: dCaEZSx7TiGSOQ+5Q1Uy2A==
X-CSE-MsgGUID: 3fNMbx+oSYKLumW8QqxLOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="272912057"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 05:01:49 -0700
Date: Mon, 22 Jun 2026 14:01:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org,
 zbigniew.kempczynski@intel.com, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t] lib/igt_core: Distinguish dynamic subtest in
 finished messages
Message-ID: <20260622120133.zgaxa2fvyjc6ex7r@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20260608193807.2616777-1-swati2.sharma@intel.com>
 <20260610152928.yauflzchk2uf7szw@kamilkon-DESK.igk.intel.com>
 <cf3517458599630f209ddd247d8183bb74f509e1.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cf3517458599630f209ddd247d8183bb74f509e1.camel@linux.intel.com>
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

Hi Janusz,
On 2026-06-11 at 10:42:31 +0200, Janusz Krzysztofik wrote:
> On Wed, 2026-06-10 at 17:29 +0200, Kamil Konieczny wrote:
> > Hi Swati,
> > On 2026-06-09 at 01:08:07 +0530, Swati Sharma wrote:
> > > The exit_subtest() function always printed 'finished subtest' in kmsg
> > > and trace output regardless of whether it was a regular subtest or a
> > > dynamic subtest finishing. The 'starting' messages already correctly
> > > distinguish between the two ('starting subtest' vs 'starting dynamic
> > > subtest').
> > > 
> > > Fix the 'finished' messages to print 'finished dynamic subtest' for
> > > dynamic subtests, matching the starting message convention. This makes
> > > syslog parsing and test hang detection more accurate.
> > 
> > Should you add Closes tag here? See
> > https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/198
> > Fix multiple results from one (dynamic) subtest reported
> > 
> > +cc Janusz
> > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > 
> > > 
> > > Assisted-by: GitHub Copilot:Claude Opus 4.6
> > > Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> > > ---
> > >  lib/igt_core.c | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > This could potentailly affect other CI pipelines, so
> > +cc Vitaly.
> > 
> > Regards,
> > Kamil
> > 
> > > 
> > > diff --git a/lib/igt_core.c b/lib/igt_core.c
> > > index dc3ac5304..a0d9c9d7d 100644
> > > --- a/lib/igt_core.c
> > > +++ b/lib/igt_core.c
> > > @@ -1733,10 +1733,12 @@ __noreturn static void exit_subtest(const char *result)
> > >  				*subtest_name,
> > >  				result,
> > >  				igt_time_elapsed(thentime, &now));
> > > -	igt_kmsg(KMSG_INFO "%s: finished subtest %s, %s\n",
> > > -		 command_str, *subtest_name, result);
> > > -	igt_trace("%s: finished subtest %s, %s\n",
> > > -		  command_str, *subtest_name, result);
> > > +	igt_kmsg(KMSG_INFO "%s: finished %s %s, %s\n",
> > > +		 command_str, in_dynamic_subtest ? "dynamic subtest" : "subtest",
> > > +		 *subtest_name, result);
> > > +	igt_trace("%s: finished %s %s, %s\n",
> > > +		  command_str, in_dynamic_subtest ? "dynamic subtest" : "subtest",
> > > +		  *subtest_name, result);
> 
> Isn't igt_runner watching those messages?  Won't it be confused if not
> adjusted to the new message content?

I checked it once again, dmesg processing is done in function
fill_from_dmesg() and it only checks for start of (dyn)subtest,
so I will merge it. Thank you all for review.

Regards,
Kamil

> 
> Thanks,
> Janusz
> 
> > >  
> > >  	igt_terminate_spins();
> > >  
> > > -- 
> > > 2.25.1
> > > 
