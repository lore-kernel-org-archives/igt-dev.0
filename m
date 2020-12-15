Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20201214204430.677828-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <4cd49f52-efe8-9367-c56b-d1f5382a4580@linux.intel.com>
Date: Tue, 15 Dec 2020 09:41:09 +0000
MIME-Version: 1.0
In-Reply-To: <20201214204430.677828-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_schedule: Measure
 timeslice distribution when oversaturated
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
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 14/12/2020 20:44, Chris Wilson wrote:
> Check that timeslices for an oversaturated system (where there is more
> work than can be supported by a single engine) are evenly distributed
> between the clients.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   tests/i915/gem_exec_schedule.c | 179 +++++++++++++++++++++++++++++++++
>   1 file changed, 179 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
> index f23d63ac3..263f1dd78 100644
> --- a/tests/i915/gem_exec_schedule.c
> +++ b/tests/i915/gem_exec_schedule.c
> @@ -2516,6 +2516,154 @@ static void measure_semaphore_power(int i915)
>   	rapl_close(&pkg);
>   }
>   
> +static int read_timestamp_frequency(int i915)
> +{
> +	int value = 0;
> +	drm_i915_getparam_t gp = {
> +		.value = &value,
> +		.param = I915_PARAM_CS_TIMESTAMP_FREQUENCY,
> +	};
> +	ioctl(i915, DRM_IOCTL_I915_GETPARAM, &gp);
> +	return value;
> +}
> +
> +static uint64_t div64_u64_round_up(uint64_t x, uint64_t y)
> +{
> +	return (x + y - 1) / y;
> +}
> +
> +static uint64_t ticks_to_ns(int i915, uint64_t ticks)
> +{
> +	return div64_u64_round_up(ticks * NSEC_PER_SEC,
> +				  read_timestamp_frequency(i915));
> +}
> +
> +static int cmp_u32(const void *A, const void *B)
> +{
> +	const uint32_t *a = A, *b = B;
> +
> +	if (*a < *b)
> +		return -1;
> +	else if (*a > *b)
> +		return 1;
> +	else
> +		return 0;
> +}
> +
> +static uint32_t read_ctx_timestamp(int i915,
> +				   uint32_t ctx,
> +				   const struct intel_execution_engine2 *e)
> +{
> +	const int use_64b = intel_gen(intel_get_drm_devid(i915)) >= 8;
> +	const uint32_t base = gem_engine_mmio_base(i915, e->name);
> +	struct drm_i915_gem_relocation_entry reloc;
> +	struct drm_i915_gem_exec_object2 obj = {
> +		.handle = gem_create(i915, 4096),
> +		.offset = 32 << 20,
> +		.relocs_ptr = to_user_pointer(&reloc),
> +		.relocation_count = 1,
> +	};
> +	struct drm_i915_gem_execbuffer2 execbuf = {
> +		.buffers_ptr = to_user_pointer(&obj),
> +		.buffer_count = 1,
> +		.flags = e->flags,
> +		.rsvd1 = ctx,
> +	};
> +#define RUNTIME (base + 0x3a8)
> +	uint32_t *map, *cs;
> +	uint32_t ts;
> +
> +	igt_require(base);
> +
> +	cs = map = gem_mmap__device_coherent(i915, obj.handle,
> +					     0, 4096, PROT_WRITE);
> +
> +	*cs++ = 0x24 << 23 | (1 + use_64b); /* SRM */
> +	*cs++ = RUNTIME;
> +	memset(&reloc, 0, sizeof(reloc));
> +	reloc.target_handle = obj.handle;
> +	reloc.presumed_offset = obj.offset;
> +	reloc.offset = offset_in_page(cs);
> +	reloc.delta = 4000;
> +	*cs++ = obj.offset + 4000;
> +	*cs++ = obj.offset >> 32;
> +
> +	*cs++ = MI_BATCH_BUFFER_END;
> +
> +	gem_execbuf(i915, &execbuf);
> +	gem_sync(i915, obj.handle);
> +	gem_close(i915, obj.handle);
> +
> +	ts = map[1000];
> +	munmap(map, 4096);
> +
> +	return ts;
> +}
> +
> +static void fairslice(int i915,
> +		      const struct intel_execution_engine2 *e,
> +		      unsigned long flags,
> +		      int duration)
> +{
> +	const double timeslice_duration_ns = 1e6;
> +	igt_spin_t *spin = NULL;
> +	double threshold;
> +	uint32_t ctx[3];
> +	uint32_t ts[3];
> +
> +	for (int i = 0; i < ARRAY_SIZE(ctx); i++) {
> +		ctx[i] = gem_context_clone_with_engines(i915, 0);
> +		if (spin == NULL) {
> +			spin = __igt_spin_new(i915,
> +					      .ctx = ctx[i],
> +					      .engine = e->flags,
> +					      .flags = flags);
> +		} else {
> +			struct drm_i915_gem_execbuffer2 eb = {
> +				.buffer_count = 1,
> +				.buffers_ptr = to_user_pointer(&spin->obj[IGT_SPIN_BATCH]),
> +				.flags = e->flags,
> +				.rsvd1 = ctx[i],
> +			};
> +			gem_execbuf(i915, &eb);
> +		}
> +	}
> +
> +	sleep(duration); /* over the course of many timeslices */
> +
> +	igt_assert(gem_bo_busy(i915, spin->handle));
> +	igt_spin_end(spin);
> +	for (int i = 0; i < ARRAY_SIZE(ctx); i++)
> +		ts[i] = read_ctx_timestamp(i915, ctx[i], e);
> +
> +	for (int i = 0; i < ARRAY_SIZE(ctx); i++)
> +		gem_context_destroy(i915, ctx[i]);
> +	igt_spin_free(i915, spin);
> +
> +	/*
> +	 * If we imagine that the timeslices are randomly distributed to
> +	 * the virtual engines, we would expect the variation to be modelled
> +	 * by a drunken walk; ergo sqrt(num_timeslices).
> +	 */
> +	threshold = sqrt(1e9 * duration / timeslice_duration_ns);
> +	threshold *= timeslice_duration_ns;
> +	threshold *= 2; /* CI safety factor before crying wolf */
> +
> +	qsort(ts, 3, sizeof(*ts), cmp_u32);
> +	igt_info("%s: [%.1f, %.1f, %.1f] ms, expect %1.f +- %.1fms\n", e->name,
> +		 1e-6 * ticks_to_ns(i915, ts[0]),
> +		 1e-6 * ticks_to_ns(i915, ts[1]),
> +		 1e-6 * ticks_to_ns(i915, ts[2]),
> +		 1e3 * duration / 3,
> +		 1e-6 * threshold);
> +
> +	igt_assert_f(ts[2], "CTX_TIMESTAMP not reported!\n");
> +	igt_assert_f(ticks_to_ns(i915, ts[2] - ts[0]) < 2 * threshold,

Is this second threshold x2 by accident?

> +		     "Range of timeslices greater than tolerable: %.2fms > %.2fms; unfair!\n",
> +		     1e-6 * ticks_to_ns(i915, ts[2] - ts[0]),
> +		     1e-6 * threshold * 2);

* 2 as well.

> +}
> +
>   #define test_each_engine(T, i915, e) \
>   	igt_subtest_with_dynamic(T) __for_each_physical_engine(i915, e) \
>   		igt_dynamic_f("%s", e->name)
> @@ -2582,6 +2730,37 @@ igt_main
>   		test_each_engine("lateslice", fd, e)
>   			lateslice(fd, e->flags);
>   
> +		igt_subtest_group {
> +			igt_fixture {
> +				igt_require(gem_scheduler_has_semaphores(fd));
> +				igt_require(gem_scheduler_has_preemption(fd));
> +				igt_require(intel_gen(intel_get_drm_devid(fd)) >= 8);
> +			}
> +
> +			test_each_engine("fairslice", fd, e)
> +				fairslice(fd, e, 0, 2);
> +
> +			test_each_engine("u-fairslice", fd, e)
> +				fairslice(fd, e, IGT_SPIN_USERPTR, 2);
> +
> +			igt_subtest("fairslice-all")  {
> +				__for_each_physical_engine(fd, e) {
> +					igt_fork(child, 1)
> +						fairslice(fd, e, 0, 2);
> +				}
> +				igt_waitchildren();
> +			}
> +			igt_subtest("u-fairslice-all")  {
> +				__for_each_physical_engine(fd, e) {
> +					igt_fork(child, 1)
> +						fairslice(fd, e,
> +							  IGT_SPIN_USERPTR,
> +							  2);
> +				}
> +				igt_waitchildren();
> +			}
> +		}
> +
>   		test_each_engine("submit-early-slice", fd, e)
>   			submit_slice(fd, e, EARLY_SUBMIT);
>   		test_each_engine("submit-golden-slice", fd, e)
> 

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
