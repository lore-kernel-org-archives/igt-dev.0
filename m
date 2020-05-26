Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20200526141723.401469-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <3f1bd2ad-f9a2-c6dc-b878-3982eb01f150@linux.intel.com>
Date: Tue, 26 May 2020 16:58:05 +0100
MIME-Version: 1.0
In-Reply-To: <20200526141723.401469-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/perf_pmu: Update
 inter-engine semaphore detection
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 26/05/2020 15:17, Chris Wilson wrote:
> The kernel no longer uses semaphores between engines, unless it can do
> so by preempting them with timeslices. Update the semaphore-busy to only
> run when we expect semaphore usage, i.e. not on bdw/bsw.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/1939
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   tests/perf_pmu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/perf_pmu.c b/tests/perf_pmu.c
> index e54a0d47e..e80f730cf 100644
> --- a/tests/perf_pmu.c
> +++ b/tests/perf_pmu.c
> @@ -822,6 +822,7 @@ sema_busy(int gem_fd,
>   	int fd;
>   
>   	igt_require(gem_scheduler_has_semaphores(gem_fd));
> +	igt_require(gem_scheduler_has_preemption(gem_fd));
>   
>   	fd = open_group(gem_fd,
>   			I915_PMU_ENGINE_SEMA(e->class, e->instance), -1);
> 

Test with perhaps too intimate knowledge of i915..

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
