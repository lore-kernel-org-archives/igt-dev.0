Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8C9EE498F
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 10:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FC210E995;
	Wed, 11 Sep 2024 10:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dxvJzmER";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CB410E995
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 10:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726051833; x=1757587833;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0q6BjNAqn8mAtLV9MzQikU2LPwHWoPkPfnepNXOhO90=;
 b=dxvJzmERhnQENI6btMqq946dxyZtWja51p1RK18X1lS+U19iK0EmdNvn
 yJIAN2+WqdTyeo+X5fO3X7W4KOUYFPj4jyKGRwI21735iXDFW20td1fin
 0mGxY0ZWItZ0X5IbJCekIGzHFraNaPsKJ9bTYXZVvzIk7fuzdMd7LjwNl
 s6C4AoFVTBHZ1yXwdPQ3i/xTt2auJ3iH2fQuJ577ieE2feJWBzyjhUjRB
 /49OAlGoohtKy3YS4OaCcf+6T61NkOV9fuz/5HR5hpZLTDbnTGk1MsQ6Q
 dQzV3SU6HId+TJj0doDAvvmnWO739ae8oB3OoboBqo3FJh0WMNUUqOG5A w==;
X-CSE-ConnectionGUID: y0UI6RnYT0aQhTwl0ykWsg==
X-CSE-MsgGUID: UeceXILnQIyGhUWTWvs1Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="50257170"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="50257170"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 03:50:33 -0700
X-CSE-ConnectionGUID: NsojlvPIT0eLhSyMStOvrA==
X-CSE-MsgGUID: 463gHhJUTNqnaNBYUPOFNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="72106134"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 03:50:31 -0700
Date: Wed, 11 Sep 2024 12:50:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t v5] runner/executor: Detect when child process is
 killed by a signal
Message-ID: <20240911105012.odfxe75ymxqqovci@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>
References: <f7319a46-d6d4-4ea5-9863-99ccd7cea3a5@linux.intel.com>
 <4c126777-6899-407c-911f-27e25ca8191e@linux.intel.com>
 <20240910155814.jq2og45xf7apwb64@kamilkon-DESK.igk.intel.com>
 <da9e03fa-1ecf-49eb-84ef-66aeee6bd99d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <da9e03fa-1ecf-49eb-84ef-66aeee6bd99d@linux.intel.com>
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

Hi Peter,
On 2024-09-11 at 09:06:12 +0200, Peter Senna Tschudin wrote:
> Hi Kamil,
> 
> Thank you for your review.
> 
> On 10.09.2024 17:58, Kamil Konieczny wrote:
> > Hi Peter,
> > On 2024-09-03 at 14:05:05 +0200, Peter Senna Tschudin wrote:
> >> Make igt-runner aware about tests being killed by signals. Before this
> >> patch, manually killing a test process would result in igt-runner silently
> >> marking the test as incomplete.
> >>
> >> Now igt-runner aborts the run verbosely. As an example the following was
> >> extracted from results.json:
> >>  This test caused an abort condition: Test terminated by a signal Killed (-9).
> >>
> >>  v5: do not use sigdescr_np() as it seems to be a fairly new lib function that does
> >>      not compile on older Ubuntu
> >>  v4: improve abort code path to not interfere with igt-runner timeouts
> >>  v3: do not interfere with igt-runner killing tests due to timeout and diskspace
> >>  v2: fix race condition
> >>
> >> Cc: Petri Latvala <adrinael@adrinael.net>
> >> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> >> Signed-off-by: Peter Senna Tschudin <peter.senna@intel.com>
> > 
> > Your signed-off-by is different from your e-mail:
> > Peter Senna Tschudin <peter.senna@linux.intel.com>
> 
> That was a feature, not a bug.
> 

You can have it just place "From: you singned-off-by signature" at begin
of the patch, for example see here:

https://patchwork.freedesktop.org/patch/612712/?series=138273&rev=1

> > 
> > checkpatch.pl script warns:
> > 
> > 100: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Peter Senna Tschudin <peter.senna@linux.intel.com>' != 'Signed-off-by: Peter Senna Tschudin <peter.senna@intel.com>'
> 
> Will fix and not repeat.
> 

Check with checkpatch.pl script before sending.

> > 
> >> ---
> >>  runner/executor.c | 38 +++++++++++++++++++++++++++++++++++++-
> >>  1 file changed, 37 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/runner/executor.c b/runner/executor.c
> >> index ac73e1dde..990d932f3 100644
> >> --- a/runner/executor.c
> >> +++ b/runner/executor.c
> >> @@ -888,6 +888,8 @@ static int monitor_output(pid_t child,
> >>  	const int interval_length = 1;
> >>  	int wd_timeout;
> >>  	int killed = 0; /* 0 if not killed, signal number otherwise */
> >> +	bool child_reaped = false;
> >> +	bool child_killed_by_signal = false;
> >>  	struct timespec time_beg, time_now, time_last_activity, time_last_subtest, time_killed;
> >>  	unsigned long taints = 0;
> >>  	bool aborting = false;
> >> @@ -960,6 +962,25 @@ static int monitor_output(pid_t child,
> >>  
> >>  		igt_gettime(&time_now);
> >>  
> >> +		/* Testing for !killed to prevent aborting too early after igt-runner
> >> +		 * decides to kill a process.
> >> +		 */
> >> +		if (!killed && (child == waitpid(child, &status, WNOHANG))) {
> >> +			child_reaped = true;
> >> +			if (WIFSIGNALED(status)) {
> >> +				child_killed_by_signal = true;
> >> +				killed = WTERMSIG(status);
> >> +
> >> +				/*
> >> +				 * Do not abort just yet, because igt-runner can kill the test
> >> +				 * due to a timeout for example. Aborting here prevents
> >> +				 * igt-runner from reporting a timeout. The code that aborts
> >> +				 * the run after the test was killed is at the end of the
> >> +				 * while() loop.
> >> +				 */
> >> +			}
> >> +		}
> >> +
> > 
> > Why is it here? Imho better place it at second hunk.
> 
> Please notice that the problem is that igt-runner does not check if a child ended due to a signal,
> but it notices when a child ends. The problem with your suggestion is that the loop _may_ decide
> to exercise the old behavior and simply mark the test as incomplete.
> 
> My proposal is to always check for child termination due to a signal, and hence unconditional
> detection before all other logic inside the loop. However there are corner cases, such as
> excessive disk space consumption by a test, in which igt-runner will signal a test, and will
> check for the child being signaled. To not interfere with these corner cases, the detection of
> a signal and taking the action of aborting the run are at different places.

Could you place that detection _after_ a second hunk, maybe just before
loop end? That way you could decide to end a loop there?

Also I am not convinced we should abort runner, thats why I asked
for some predictable tests, possibly with some adjusted test which
will simulate a problem.

> 
> > 
> >>  		/* TODO: Refactor these handlers to their own functions */
> >>  		if (outfd >= 0 && FD_ISSET(outfd, &set)) {
> >>  			char *newline;
> >> @@ -1241,7 +1262,11 @@ static int monitor_output(pid_t child,
> >>  				errf("Error reading from signalfd: %m\n");
> >>  				continue;
> >>  			} else if (siginfo.ssi_signo == SIGCHLD) {
> >> -				if (child != waitpid(child, &status, WNOHANG)) {
> > 
> > This code here do what you wrote at first hunk:
> > 	if (child != waitpid(child, &status, WNOHANG)) {
> > 		// fatal err, set status=9999
> > 	} else { // all 'else if' checks 'child == '
> > 	}
> > 
> > The only difference is that your code calls waitpid() unconditionally
> > before loop. Could you write some testing code in one simple test
> 
> Exactly. Calling waitpid() unconditionally, and early enough to catch all signals.
> 

imho better to do this _after_ siginfo checks

> > and make checks on trybot? e.g. to not rely that your code will
> > catch such scenarios if they are rarly seen but to test them in
> > predictable way. You could also add here some debugs.
> 
> I did not understand what you want to test. The "condition" here is igt-runner itself killing a test due to excessive disk space consumption for example.
> 
> Please let me know how to proceed.

One idea would be to write a HAX test to simulate error conditions
which you are trying to catch.

Regards,
Kamil

> 
> Thank you!
> 
> [...]
