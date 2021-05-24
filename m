Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Mon, 24 May 2021 17:19:04 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YKu12MnURTmD1eHg@platvala-desk.ger.corp.intel.com>
References: <20210524140113.1782804-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210524140113.1782804-1-tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] gem_watchdog: Skip test if
 default request expiry is not compiled in
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 24, 2021 at 03:01:13PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Test incorrectly assumes no modparam means default expiry, while in
> reality no modparam means old kernel / de-selected feature in which
> case test should skip.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  tests/i915/gem_watchdog.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/i915/gem_watchdog.c b/tests/i915/gem_watchdog.c
> index 8f9fb17750fb..89992a3c5099 100644
> --- a/tests/i915/gem_watchdog.c
> +++ b/tests/i915/gem_watchdog.c
> @@ -630,6 +630,7 @@ igt_main
>  
>  	igt_fixture {
>  		struct drm_i915_query_item item;
> +		const unsigned int timeout = 1;
>  		char *tmp;
>  
>  		i915 = drm_open_driver_master(DRIVER_INTEL);
> @@ -639,16 +640,13 @@ igt_main
>  		igt_require_gem(i915);
>  
>  		tmp = __igt_params_get(i915, "request_timeout_ms");
> -		if (tmp) {
> -			const unsigned int timeout = 1;
> +		igt_skip_on_f(!tmp || !atoi(tmp),
> +			      "Request expiry not supported!");

Newline missing at the end.


-- 
Petri Latvala


> +		free(tmp);
>  
> -			igt_params_save_and_set(i915, "request_timeout_ms",
> -						"%u", timeout * 1000);
> -			default_timeout_wait_s = timeout * 5;
> -			free(tmp);
> -		} else {
> -			default_timeout_wait_s = 12;
> -		}
> +		igt_params_save_and_set(i915, "request_timeout_ms", "%u",
> +					timeout * 1000);
> +		default_timeout_wait_s = timeout * 5;
>  
>  		i915 = gem_reopen_driver(i915); /* Apply modparam. */
>  
> -- 
> 2.30.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
