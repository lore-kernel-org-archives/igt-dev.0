Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 10 Feb 2023 09:24:53 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <Y+Z95YFARrUijh1r@orsosgc001.jf.intel.com>
References: <20230209115039.34441-1-janusz.krzysztofik@linux.intel.com>
 <20230209115039.34441-2-janusz.krzysztofik@linux.intel.com>
 <Y+Z82anLvt6+l/5Z@orsosgc001.jf.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <Y+Z82anLvt6+l/5Z@orsosgc001.jf.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/1] tests/gem_ctx_exec: Exercise
 barrier race
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Chris
 Wilson <chris.p.wilson@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 10, 2023 at 09:20:25AM -0800, Umesh Nerlige Ramappa wrote:
>On Thu, Feb 09, 2023 at 12:50:39PM +0100, Janusz Krzysztofik wrote:
>>Users reported oopses on list corruptions when using i915 perf with a
>>number of concurrently running graphics applications.  That indicates we
>>are currently missing some important tests for such scenarios.  Cover
>>that gap.
>>
>>Since root cause analysis pointed out to an issue in barrier processing
>>code, add a new subtest focused on exercising interaction between perf
>>open / close operations, which replace active barriers with perf requests
>>on kernel contexts, and concurrent barrier preallocate / acquire
>>operations performed during context first pin / last unpin.
>>
>>v2: convert to a separate subtest, not a variant of another one (that has
>>   been dropped from the series),
>> - move the subtest out of tests/i915/perf.c (Ashutosh), add it to
>>   tests/i915/gem_ctx_exec.c,
>> - don't touch lib/i915/perf.c (Umesh, Ashutosh), duplicate reused code
>>   from tests/i915/perf.c in tests/i915/gem_ctx_exec.c.
>>
>>References: https://gitlab.freedesktop.org/drm/intel/-/issues/6333
>>Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>>---
>>tests/i915/gem_ctx_exec.c | 123 ++++++++++++++++++++++++++++++++++++++
>>tests/meson.build         |   9 ++-
>>2 files changed, 131 insertions(+), 1 deletion(-)
>>
>>diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
>>index 3d94f01db9..97fbc50e97 100644
>>--- a/tests/i915/gem_ctx_exec.c
>>+++ b/tests/i915/gem_ctx_exec.c
>>@@ -42,6 +42,7 @@
>>
>>#include "i915/gem.h"
>>#include "i915/gem_create.h"
>>+#include "i915/perf.h"
>>#include "igt.h"
>>#include "igt_dummyload.h"
>>#include "igt_rand.h"
>>@@ -448,6 +449,115 @@ static void close_race(int i915)
>>	munmap(ctx_id, 4096);
>>}
>>
>>+static uint64_t timebase_scale(struct intel_perf *intel_perf, uint32_t u32_delta)
>>+{
>>+	return ((uint64_t)u32_delta * NSEC_PER_SEC) / intel_perf->devinfo.timestamp_frequency;
>>+}
>>+
>>+/* Returns: the largest OA exponent that will still result in a sampling period
>>+ * less than or equal to the given @period.
>>+ */
>>+static int max_oa_exponent_for_period_lte(struct intel_perf *intel_perf, uint64_t period)
>>+{
>>+	/* NB: timebase_scale() takes a uint32_t and an exponent of 30
>>+	 * would already represent a period of ~3 minutes so there's
>>+	 * really no need to consider higher exponents.
>>+	 */
>>+	for (int i = 0; i < 30; i++) {
>>+		uint64_t oa_period = timebase_scale(intel_perf, 2 << i);
>>+
>>+		if (oa_period > period)
>>+			return max(0, i - 1);
>>+	}
>>+
>>+	igt_assert(!"reached");
>>+	return -1;
>>+}
>>+
>>+static void perf_open_close_loop(int fd, int *done)
>>+{
>>+	struct intel_perf_metric_set *metric_set = NULL, *metric_set_iter;
>>+	struct intel_perf *intel_perf = intel_perf_for_fd(fd);
>>+	uint64_t properties[] = {
>>+		DRM_I915_PERF_PROP_SAMPLE_OA, true,
>>+		DRM_I915_PERF_PROP_OA_METRICS_SET, 0,
>>+		DRM_I915_PERF_PROP_OA_FORMAT, 0,
>>+		DRM_I915_PERF_PROP_OA_EXPONENT, 0,
>>+	};
>>+	struct drm_i915_perf_open_param param = {
>>+		.flags = I915_PERF_FLAG_FD_CLOEXEC,
>
>nit: If you also add I915_PERF_FLAG_DISABLED here, then OA buffer 
>reports will be disabled. This will make sure that the perf API does 
>not enable the OA unit. It will still run the code that you are 
>targeting.
>
>>+		.num_properties = sizeof(properties) / 16,
>>+		.properties_ptr = to_user_pointer(properties),
>>+	};
>>+	uint32_t devid = intel_get_drm_devid(fd);
>>+
>>+	igt_require(intel_perf);
>>+	intel_perf_load_perf_configs(intel_perf, fd);
>>+
>>+	igt_require(devid);
>>+	igt_list_for_each_entry(metric_set_iter, &intel_perf->metric_sets, link) {
>>+		if (!strcmp(metric_set_iter->symbol_name,
>>+			    IS_HASWELL(devid) ? "RenderBasic" : "TestOa")) {
>>+			metric_set = metric_set_iter;
>>+			break;
>>+		}
>>+	}
>>+	igt_require(metric_set);
>>+	igt_require(metric_set->perf_oa_metrics_set);
>>+	properties[3] = metric_set->perf_oa_metrics_set;
>>+	properties[5] = metric_set->perf_oa_format;
>>+
>>+	igt_require(intel_perf->devinfo.timestamp_frequency);
>>+	properties[7] = max_oa_exponent_for_period_lte(intel_perf, 1000);
>
>nit: The result of max_oa_exponent_for_period_lte() can be hard coded 
>here (likely 1 << 5) and you could remove the additional code added 
>for max_oa_exponent_for_period_lte(). This parameter only controls the 
>frequency at which the OA reports are captured into the OA buffer and 
>it has no relation to the barrier related code in perf.

My bad. The value would likely be 5. Anyways, it's just a nit.

>
>Thanks,
>Umesh
>
>>+
>>+	intel_perf_free(intel_perf);
>...
