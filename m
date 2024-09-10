Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC08EDE99A
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 15:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8C310E877;
	Tue, 10 Sep 2024 15:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cai92Vda";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A719310E877
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 15:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725983914; x=1757519914;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XNDljnvbGi/O6AOE7kJk4OX6+Ktrxgy4Z4B5suUuL4w=;
 b=cai92Vda7AJQIz8YtSO5k7+PMB40KOY810vkyK3GqTutMn8bKyMNIhcB
 9gTjIUoHguPsIs+d/dAJSClieS4AzHUOxB5z7akQ9LD+4uP0ZjJlLVoQN
 dQOQrk656rhMpLyapXFv8vRYe6e7AAoLl3TbHgYeOQ24f8OpggeNjBUV+
 +CKvFhXouXmSICxKrA76cVMl+Yi1UVKjT6Bzd2YbIIR/wWuyNWnLSxTLZ
 kx+IXZrsvt7FdrVoXLZmTCgvDEnG2rpAaA/IPIH3rEvLfbLtjaqFFqS6D
 FeC/o4SPDtff32XVr5ZnTOl75IBw8Vc9meyKGWpt8tqmGiyYCCrzrCHCu A==;
X-CSE-ConnectionGUID: HU/LfWJ9QRSNuH3Yy0Qh7g==
X-CSE-MsgGUID: YqVN9AndQSOK9e5de55nlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24884279"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24884279"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 08:58:34 -0700
X-CSE-ConnectionGUID: css14k6/Ttam0HXEib/A1g==
X-CSE-MsgGUID: Ire4oMuWQw2cZ3qUKKhnbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="71865753"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 08:58:32 -0700
Date: Tue, 10 Sep 2024 17:58:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t v5] runner/executor: Detect when child process is
 killed by a signal
Message-ID: <20240910155814.jq2og45xf7apwb64@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>
References: <f7319a46-d6d4-4ea5-9863-99ccd7cea3a5@linux.intel.com>
 <4c126777-6899-407c-911f-27e25ca8191e@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4c126777-6899-407c-911f-27e25ca8191e@linux.intel.com>
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
On 2024-09-03 at 14:05:05 +0200, Peter Senna Tschudin wrote:
> Make igt-runner aware about tests being killed by signals. Before this
> patch, manually killing a test process would result in igt-runner silently
> marking the test as incomplete.
> 
> Now igt-runner aborts the run verbosely. As an example the following was
> extracted from results.json:
>  This test caused an abort condition: Test terminated by a signal Killed (-9).
> 
>  v5: do not use sigdescr_np() as it seems to be a fairly new lib function that does
>      not compile on older Ubuntu
>  v4: improve abort code path to not interfere with igt-runner timeouts
>  v3: do not interfere with igt-runner killing tests due to timeout and diskspace
>  v2: fix race condition
> 
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@intel.com>

Your signed-off-by is different from your e-mail:
Peter Senna Tschudin <peter.senna@linux.intel.com>

checkpatch.pl script warns:

100: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Peter Senna Tschudin <peter.senna@linux.intel.com>' != 'Signed-off-by: Peter Senna Tschudin <peter.senna@intel.com>'

> ---
>  runner/executor.c | 38 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index ac73e1dde..990d932f3 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -888,6 +888,8 @@ static int monitor_output(pid_t child,
>  	const int interval_length = 1;
>  	int wd_timeout;
>  	int killed = 0; /* 0 if not killed, signal number otherwise */
> +	bool child_reaped = false;
> +	bool child_killed_by_signal = false;
>  	struct timespec time_beg, time_now, time_last_activity, time_last_subtest, time_killed;
>  	unsigned long taints = 0;
>  	bool aborting = false;
> @@ -960,6 +962,25 @@ static int monitor_output(pid_t child,
>  
>  		igt_gettime(&time_now);
>  
> +		/* Testing for !killed to prevent aborting too early after igt-runner
> +		 * decides to kill a process.
> +		 */
> +		if (!killed && (child == waitpid(child, &status, WNOHANG))) {
> +			child_reaped = true;
> +			if (WIFSIGNALED(status)) {
> +				child_killed_by_signal = true;
> +				killed = WTERMSIG(status);
> +
> +				/*
> +				 * Do not abort just yet, because igt-runner can kill the test
> +				 * due to a timeout for example. Aborting here prevents
> +				 * igt-runner from reporting a timeout. The code that aborts
> +				 * the run after the test was killed is at the end of the
> +				 * while() loop.
> +				 */
> +			}
> +		}
> +

Why is it here? Imho better place it at second hunk.

>  		/* TODO: Refactor these handlers to their own functions */
>  		if (outfd >= 0 && FD_ISSET(outfd, &set)) {
>  			char *newline;
> @@ -1241,7 +1262,11 @@ static int monitor_output(pid_t child,
>  				errf("Error reading from signalfd: %m\n");
>  				continue;
>  			} else if (siginfo.ssi_signo == SIGCHLD) {
> -				if (child != waitpid(child, &status, WNOHANG)) {

This code here do what you wrote at first hunk:
	if (child != waitpid(child, &status, WNOHANG)) {
		// fatal err, set status=9999
	} else { // all 'else if' checks 'child == '
	}

The only difference is that your code calls waitpid() unconditionally
before loop. Could you write some testing code in one simple test
and make checks on trybot? e.g. to not rely that your code will
catch such scenarios if they are rarly seen but to test them in
predictable way. You could also add here some debugs.

Regards,
Kamil

> +				if (!child_reaped) {
> +					if (child == waitpid(child, &status, WNOHANG))
> +						child_reaped = true;
> +				}
> +				if (!child_reaped) {
>  					errf("Failed to reap child\n");
>  					status = 9999;
>  				} else if (WIFEXITED(status)) {
> @@ -1483,6 +1508,17 @@ static int monitor_output(pid_t child,
>  				return -1;
>  			time_killed = time_now;
>  		}
> +
> +		if (child_killed_by_signal) {
> +			aborting = true;
> +
> +			sprintf(buf, "Test terminated by a signal %s (%d).\n",
> +					strsignal(killed), -killed);
> +			errf("%s", buf);
> +			*abortreason = strdup(buf);
> +
> +			break;
> +		}
>  	}
>  
>  	dump_dmesg(kmsgfd, outputs[_F_DMESG]);
> -- 
> 2.34.1
> 
