Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4888CCEDD9E
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 14:46:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB6F10E762;
	Wed,  9 Oct 2024 14:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lgn3fzFU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2026D10E762
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Oct 2024 14:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728485212; x=1760021212;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lGSzUueLb3Czo/XZwXNjVx/fk9PQ6I1amY+evAGLw44=;
 b=Lgn3fzFUnUkKOCHIKRosNWy7eyRjBJVpHKEQ1OAkcj1D+wtJH9tCB5OM
 nH/0cVxiM2kmA2ibhrgyjKLqLbwCtNMkQmLn5EmpvB+5fRm5xKEHyAWtx
 jngc+5xBhj/D2NVFZsMouuxXq6Ptogw7ui/nYbd+S7Ivk+VFz4WdR+Ocv
 MOtBAFZhI9OpP0naDVGK1euJylE2+ShT5GBU5BL5x66VrGyu9aEeRmd63
 oqZPerT/0OOMifI6GPBtG+40Xfaf3LZOMpXTHCD4QVBfH+l0e6fmoprT3
 AlWbCsswelJO5CVchF+d7+dnBt+2pjPv6HIJr0kKS3Lk4Ml8WL/XnOcv4 w==;
X-CSE-ConnectionGUID: 56ujaxacSnqV3DNXr36YZw==
X-CSE-MsgGUID: 9zxdg54oQ9moHAk8bDha1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31488996"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="31488996"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 07:46:50 -0700
X-CSE-ConnectionGUID: OFUG8Q2CR1SO5j1L9WNlNw==
X-CSE-MsgGUID: Dv0EhRkfRzCyTuIrUmU86g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="80262085"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 07:46:48 -0700
Date: Wed, 9 Oct 2024 16:46:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t v6] runner/executor: Abort when child process is
 killed by a signal
Message-ID: <20241009144636.ukalnhlwzzk2enzp@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>
References: <f7319a46-d6d4-4ea5-9863-99ccd7cea3a5@linux.intel.com>
 <999b078d-4338-4158-915e-3bc83338f4e1@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <999b078d-4338-4158-915e-3bc83338f4e1@linux.intel.com>
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
On 2024-10-03 at 15:27:37 +0200, Peter Senna Tschudin wrote:
> Manually killing a test process results in igt-runner silently marking the
> test as incomplete. Change the behavior to abort verbosely when a test is
> killed.
> 
> In order for the new behavior to work, child termination is probed on
> every iteration of the while loop inside monitor_output(). Add the
> bool test_timed_out to track when igt_runner is intentionally terminating
> a test, and do not interfere with it.
> 

imho you could have that behaviour also in place checking for a signal,
you do not need separate waitpid() call.

> Tested by:
>  - using the --per-test-timeout flag and checking that results.json labels
>    the test as a timeout.
>  - manually killing a test process and checking that results.json labels
>    the test as an abort with a message stating the test was killed.
> 
>  v6: - clear code comments
>      - move child termination probing closer to where sigfd is handled
>      - add a bool test_timed_out to ensure we will not interfere with
>        igt_runner intentionally killing tests.
>      - move the aborting code to outside the while loop
> 
>  v5: do not use sigdescr_np() as it seems to be a fairly new lib function
>      that does not compile on older Ubuntu
>  v4: improve abort code path to not interfere with igt-runner timeouts
>  v3: do not interfere with igt-runner killing tests due to timeout and
>      diskspace
>  v2: fix race condition
> 
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  runner/executor.c | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index ac73e1dde..69b4ed939 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -888,12 +888,15 @@ static int monitor_output(pid_t child,
>  	const int interval_length = 1;
>  	int wd_timeout;
>  	int killed = 0; /* 0 if not killed, signal number otherwise */
> +	bool child_reaped = false;
> +	bool child_killed_by_signal = false;
>  	struct timespec time_beg, time_now, time_last_activity, time_last_subtest, time_killed;
>  	unsigned long taints = 0;
>  	bool aborting = false;
>  	size_t disk_usage = 0;
>  	bool socket_comms_used = false; /* whether the test actually uses comms */
>  	bool results_received = false; /* whether we already have test results that might need overriding if we detect an abort condition */
> +	bool test_timed_out = false;
>  
>  	igt_gettime(&time_beg);
>  	time_last_activity = time_last_subtest = time_killed = time_beg;
> @@ -1233,6 +1236,14 @@ static int monitor_output(pid_t child,
>  			}
>  		}
>  
> +		/* Always check for abort conditions */
> +		if (child == waitpid(child, &status, WNOHANG)) {
> +			child_reaped = true;
> +			if (WIFSIGNALED(status)) {
> +				child_killed_by_signal = true;
> +				killed = WTERMSIG(status);
> +			}
> +		}

imho this waitpid() above makes a child logic based on sigfd superflous
or at least racy, I am not sure it is correct.

Petri do you remember if igt had a problems with runner waiting
for already killed test? Or that timeout triggered after a test
was killed long ago?

>  		if (sigfd >= 0 && FD_ISSET(sigfd, &set)) {
>  			double time;
>  
> @@ -1241,7 +1252,12 @@ static int monitor_output(pid_t child,
>  				errf("Error reading from signalfd: %m\n");
>  				continue;
>  			} else if (siginfo.ssi_signo == SIGCHLD) {
> -				if (child != waitpid(child, &status, WNOHANG)) {
> +				if (!child_reaped) {
> +					/* Was child killed since we last checked? */
> +					if (child == waitpid(child, &status, WNOHANG))
> +						child_reaped = true;
> +				}
> +				if (!child_reaped) {
>  					errf("Failed to reap child\n");
>  					status = 9999;
>  				} else if (WIFEXITED(status)) {

Here code is checking status and one of if-else checks for signal,
you could use it for the same purpose without hunk /* Always check for...*/
so it will be just enough to add here:

	} else if (WIFSIGNALED(status)) {
		status = -WTERMSIG(status);
		child_killed_by_signal = true;
	}

and make a change based on this. Or just check status (avoid new var)
for being less than zero?

In summary, I am not convinced your change go in good direction.
Instead of manually observing a bahaviour it would be better to
write new test for igt_runner which will demonstrate why old runner
cannot cope with incoming signals, that will prove that your patch
solves a problem.

Regards,
Kamil

> @@ -1303,7 +1319,6 @@ static int monitor_output(pid_t child,
>  							fdatasync(outputs[_F_JOURNAL]);
>  					}
>  				}
> -
>  				aborting = true;
>  				killed = SIGQUIT;
>  				if (!kill_child(killed, child))
> @@ -1447,6 +1462,7 @@ static int monitor_output(pid_t child,
>  						 disk_usage);
>  
>  		if (timeout_reason) {
> +			test_timed_out = true;
>  			if (killed == SIGKILL) {
>  				/* Nothing that can be done, really. Let's tell the caller we want to abort. */
>  
> @@ -1485,6 +1501,15 @@ static int monitor_output(pid_t child,
>  		}
>  	}
>  
> +	if (!test_timed_out && child_killed_by_signal) {
> +		sprintf(buf, "Test terminated by a signal %s (%d).\n",
> +				strsignal(killed), -killed);
> +		errf("%s", buf);
> +
> +		*abortreason = strdup(buf);
> +		aborting = true;
> +	}
> +
>  	dump_dmesg(kmsgfd, outputs[_F_DMESG]);
>  	if (settings->sync)
>  		fdatasync(outputs[_F_DMESG]);
> -- 
> 2.34.1
> 
