Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Message-ID: <2711b57e2144391febf0e638ed86533f9969c183.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 04 Dec 2020 12:57:29 +0100
In-Reply-To: <20201204115138.6656-1-janusz.krzysztofik@linux.intel.com>
References: <20201204115138.6656-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH i-g-t] runner: Don't kill a test on taint if
 watching timeouts
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Submitted with incorrect address of i915 list out of top of my head in
Cc:, sorry.

Janusz
 

On Fri, 2020-12-04 at 12:51 +0100, Janusz Krzysztofik wrote:
> We may still be interested in results of a test even if it has tainted
> the kernel.  On the other hand, we need to kill the test on taint if no
> other means of killing it on a jam is active.
> 
> If abort on both kernel taint or a timeout is requested, decrease all
> potential timeouts significantly while the taint is detected instead of
> aborting immediately.  However, report the taint as the reason of the
> abort if a timeout decreased by the taint expires.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  runner/executor.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index 1688ae41d..e39d8a73b 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -726,6 +726,8 @@ static const char *need_to_timeout(struct settings *settings,
>  				   double time_since_kill,
>  				   size_t disk_usage)
>  {
> +	int decrease = 1;
> +
>  	if (killed) {
>  		/*
>  		 * Timeout after being killed is a hardcoded amount
> @@ -753,20 +755,32 @@ static const char *need_to_timeout(struct settings *settings,
>  	}
>  
>  	/*
> -	 * If we're configured to care about taints, kill the
> -	 * test if there's a taint.
> +	 * If we're configured to care about taints,
> +	 * decrease timeouts in use if there's a taint,
> +	 * or kill the test if no timeouts have been requested.
>  	 */
>  	if (settings->abort_mask & ABORT_TAINT &&
> -	    is_tainted(taints))
> -		return "Killing the test because the kernel is tainted.\n";
> +	    is_tainted(taints)) {
> +		/* list of timeouts that may postpone immediate kill on taint */
> +		if (settings->per_test_timeout || settings->inactivity_timeout)
> +			decrease = 10;
> +		else
> +			return "Killing the test because the kernel is tainted.\n";
> +	}
>  
>  	if (settings->per_test_timeout != 0 &&
> -	    time_since_subtest > settings->per_test_timeout)
> -		return show_kernel_task_state("Per-test timeout exceeded. Killing the current test with SIGQUIT.\n");
> +	    time_since_subtest > settings->per_test_timeout / decrease) {
> +		if (decrease > 1)
> +			return "Killing the test because the kernel is tainted.\n";
> +		return "Per-test timeout exceeded. Killing the current test with SIGQUIT.\n";
> +	}
>  
>  	if (settings->inactivity_timeout != 0 &&
> -	    time_since_activity > settings->inactivity_timeout)
> -		return show_kernel_task_state("Inactivity timeout exceeded. Killing the current test with SIGQUIT.\n");
> +	    time_since_activity > settings->inactivity_timeout / decrease ) {
> +		if (decrease > 1)
> +			return "Killing the test because the kernel is tainted.\n";
> +		return "Inactivity timeout exceeded. Killing the current test with SIGQUIT.\n";
> +	}
>  
>  	if (disk_usage_limit_exceeded(settings, disk_usage))
>  		return "Disk usage limit exceeded.\n";

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
