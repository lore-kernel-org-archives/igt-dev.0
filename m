Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <424dc6ab699ae64e7f0d3f9e20532a232c0fdc3f.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu, 21 May 2020 17:23:20 +0200
In-Reply-To: <20200512171947.730859-1-chris@chris-wilson.co.uk>
References: <20200512102447.9249-1-janusz.krzysztofik@linux.intel.com>
 <20200512171947.730859-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_nop: Specify timeout in
 milliseconds
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
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 2020-05-12 at 18:19 +0100, Chris Wilson wrote:
> Our 'headless' subtest requires fairly precise measurements to determine
> the impact of the dmc upon request latency. The test cannot be effective
> if we cannot execute requests quickly, so add a very short pre-pass to
> check the test requirements. For this we want to specify the baseline
> measurement timeout in milliseconds, allowing us to speed up our other
> baseline measurements elsewhere as well.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Thanks,
Janusz

> ---
>  tests/i915/gem_exec_nop.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
> index 4051e0fd7..21a937c83 100644
> --- a/tests/i915/gem_exec_nop.c
> +++ b/tests/i915/gem_exec_nop.c
> @@ -64,7 +64,7 @@ static double elapsed(const struct timespec *start, const struct timespec *end)
>  
>  static double nop_on_ring(int fd, uint32_t handle,
>  			  const struct intel_execution_engine2 *e,
> -			  int timeout,
> +			  int timeout_ms,
>  			  unsigned long *out)
>  {
>  	struct drm_i915_gem_execbuffer2 execbuf;
> @@ -94,7 +94,7 @@ static double nop_on_ring(int fd, uint32_t handle,
>  		count++;
>  
>  		clock_gettime(CLOCK_MONOTONIC, &now);
> -	} while (elapsed(&start, &now) < timeout);
> +	} while (elapsed(&start, &now) < timeout_ms * 1e-3);
>  	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
>  
>  	*out = count;
> @@ -348,14 +348,15 @@ static void single(int fd, uint32_t handle,
>  	double time;
>  	unsigned long count;
>  
> -	time = nop_on_ring(fd, handle, e, 20, &count);
> +	time = nop_on_ring(fd, handle, e, 20000, &count);
>  	igt_info("%s: %'lu cycles: %.3fus\n",
>  		  e->name, count, time*1e6 / count);
>  }
>  
>  static double
>  stable_nop_on_ring(int fd, uint32_t handle,
> -		   const struct intel_execution_engine2 *e, int timeout,
> +		   const struct intel_execution_engine2 *e,
> +		   int timeout_ms,
>  		   int reps)
>  {
>  	igt_stats_t s;
> @@ -370,7 +371,7 @@ stable_nop_on_ring(int fd, uint32_t handle,
>  		unsigned long count;
>  		double time;
>  
> -		time = nop_on_ring(fd, handle, e, timeout, &count);
> +		time = nop_on_ring(fd, handle, e, timeout_ms, &count);
>  		igt_stats_push_float(&s, time / count);
>  	}
>  
> @@ -390,9 +391,10 @@ static void headless(int fd, uint32_t handle,
>  		     const struct intel_execution_engine2 *e)
>  {
>  	unsigned int nr_connected = 0;
> +	double n_display, n_headless;
>  	drmModeConnector *connector;
> +	unsigned long count;
>  	drmModeRes *res;
> -	double n_display, n_headless;
>  
>  	res = drmModeGetResources(fd);
>  	igt_require(res);
> @@ -409,8 +411,11 @@ static void headless(int fd, uint32_t handle,
>  	/* set graphics mode to prevent blanking */
>  	kmstest_set_vt_graphics_mode();
>  
> +	nop_on_ring(fd, handle, e, 10, &count);
> +	igt_require_f(count > 100, "submillisecond precision required\n");
> +
>  	/* benchmark nops */
> -	n_display = stable_nop_on_ring(fd, handle, e, 1, 5);
> +	n_display = stable_nop_on_ring(fd, handle, e, 500, 5);
>  	igt_info("With one display connected: %.2fus\n",
>  		 n_display * 1e6);
>  
> @@ -418,7 +423,7 @@ static void headless(int fd, uint32_t handle,
>  	kmstest_unset_all_crtcs(fd, res);
>  
>  	/* benchmark nops again */
> -	n_headless = stable_nop_on_ring(fd, handle, e, 1, 5);
> +	n_headless = stable_nop_on_ring(fd, handle, e, 500, 5);
>  	igt_info("Without a display connected (headless): %.2fus\n",
>  		 n_headless * 1e6);
>  
> @@ -444,7 +449,7 @@ static void parallel(int fd, uint32_t handle, int timeout)
>  		engines[nengine] = e->flags;
>  		names[nengine++] = strdup(e->name);
>  
> -		time = nop_on_ring(fd, handle, e, 1, &count) / count;
> +		time = nop_on_ring(fd, handle, e, 250, &count) / count;
>  		sum += time;
>  		igt_debug("%s: %.3fus\n", e->name, 1e6*time);
>  	}
> @@ -506,7 +511,7 @@ static void independent(int fd, uint32_t handle, int timeout)
>  		engines[nengine] = e->flags;
>  		names[nengine++] = strdup(e->name);
>  
> -		time = nop_on_ring(fd, handle, e, 1, &count) / count;
> +		time = nop_on_ring(fd, handle, e, 250, &count) / count;
>  		sum += time;
>  		igt_debug("%s: %.3fus\n", e->name, 1e6*time);
>  	}
> @@ -626,7 +631,7 @@ static void series(int fd, uint32_t handle, int timeout)
>  
>  	nengine = 0;
>  	__for_each_physical_engine(fd, e) {
> -		time = nop_on_ring(fd, handle, e, 1, &count) / count;
> +		time = nop_on_ring(fd, handle, e, 250, &count) / count;
>  		if (time > max) {
>  			name = e->name;
>  			max = time;
> @@ -705,7 +710,7 @@ static void sequential(int fd, uint32_t handle, unsigned flags, int timeout)
>  	__for_each_physical_engine(fd, e) {
>  		unsigned long count;
>  
> -		time = nop_on_ring(fd, handle, e, 1, &count) / count;
> +		time = nop_on_ring(fd, handle, e, 250, &count) / count;
>  		sum += time;
>  		igt_debug("%s: %.3fus\n", e->name, 1e6*time);
>  

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
