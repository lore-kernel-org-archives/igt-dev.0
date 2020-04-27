Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <20200427090014.10041-1-tvrtko.ursulin@linux.intel.com>
References: <20200427090014.10041-1-tvrtko.ursulin@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158797832517.17035.11396007512401587276@build.alporthouse.com>
Date: Mon, 27 Apr 2020 10:05:25 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] gem_wsim: Fix preempt period assert
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-04-27 10:00:14)
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Recently added assert in a common helper used for calculating batch
> duration and preemption period is harmful when preemption is disabled on a
> context. Split out into low level and high level helper and use the former
> for preemption period queries.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  benchmarks/gem_wsim.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 81f47b86d619..ad4edb936920 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -1151,7 +1151,7 @@ __get_ctx(struct workload *wrk, const struct w_step *w)
>  }
>  
>  static unsigned long
> -get_bb_sz(const struct w_step *w, unsigned int duration)
> +__get_bb_sz(const struct w_step *w, unsigned int duration)
>  {
>         enum intel_engine_id engine = w->engine;
>         struct ctx *ctx = __get_ctx(w->wrk, w);
> @@ -1165,6 +1165,15 @@ get_bb_sz(const struct w_step *w, unsigned int duration)
>         d = ALIGN(duration * engine_calib_map[engine] * sizeof(uint32_t) /
>                   nop_calibration_us,
>                   sizeof(uint32_t));

Preempt disabled == w->preempt_us = 0 => duration = 0.

Ok, that follows that d is expected to be 0. And the caller expands to
at least a page.

Not really convinced the assert is worth it, but
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
