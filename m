Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D7189220
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 09:08:35 +0000 (UTC)
Received: from platvala by thrakatuluk with local (Exim 4.92)
 (envelope-from <petri.latvala@intel.com>) id 1j3yrp-0003qd-7Q
 for igt-dev@lists.freedesktop.org; Tue, 18 Feb 2020 11:08:33 +0200
Date: Tue, 18 Feb 2020 11:08:33 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200218090833.GN25209@platvala-desk.ger.corp.intel.com>
References: <20200217145042.829-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217145042.829-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] runner: Refactor timeouting
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 17, 2020 at 04:50:41PM +0200, Petri Latvala wrote:
> Instead of aiming for inactivity_timeout and splitting that into
> suitable intervals for watchdog pinging, replace the whole logic with
> one-second select() timeouts and checking if we're reaching a timeout
> condition based on current time and the time passed since a particular
> event, be it the last activity or the time of signaling the child
> processes.
> 
> With the refactoring, we gain a couple of new features for free:
> 
> - use-watchdog now makes sense even without
> inactivity-timeout. Previously use-watchdog was silently ignored if
> inactivity-timeout was not set. Now, watchdogs will be used always if
> configured so, effectively ensuring the device gets rebooted if
> userspace dies without other timeout tracking.
> 
> - Killing tests early on kernel taint now happens even
> earlier. Previously on an inactive system we possibly waited for some
> tens of seconds before checking kernel taints.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> ---
>  runner/executor.c | 224 +++++++++++++++++++++++-----------------------
>  1 file changed, 113 insertions(+), 111 deletions(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index 3ea5d167..33610c9e 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -93,7 +93,7 @@ static void init_watchdogs(struct settings *settings)
>  
>  	memset(&watchdogs, 0, sizeof(watchdogs));
>  
> -	if (!settings->use_watchdog || settings->inactivity_timeout <= 0)
> +	if (!settings->use_watchdog)
>  		return;
>  
>  	if (settings->log_level >= LOG_LEVEL_VERBOSE) {
> @@ -672,6 +672,69 @@ static void show_kernel_task_state(void)
>  	sysrq('t');
>  }
>  
> +static const char *need_to_timeout(struct settings *settings,
> +				   int killed,
> +				   unsigned long taints,
> +				   double time_since_activity,
> +				   double time_since_kill)
> +{
> +	if (killed) {
> +		/*
> +		 * Timeout after being killed is a hardcoded amount
> +		 * depending on which signal we already used. The
> +		 * exception is SIGKILL which just immediately bails
> +		 * out if the kernel is tainted, because there's
> +		 * little to no hope of the process dying gracefully
> +		 * or at all.
> +		 *
> +		 * Note that if killed == SIGKILL, the caller needs
> +		 * special handling anyway and should ignore the
> +		 * actual string returned.
> +		 */
> +		const double kill_timeout = killed == SIGKILL ? 20.0 : 120.0;


Executing this code in my head a few times I realized that before this
patch, while we did have the exact same values for the timeout, we
waited forever for a killed test to die as long as it (or the kernel)
produced output within that time. Now we don't. I consider that a
bugfix.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
