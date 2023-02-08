Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2DC10E6C0
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Feb 2023 18:23:12 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Zbigniew =?utf-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>, "Dixit,
 Ashutosh" <ashutosh.dixit@intel.com>
Date: Wed, 08 Feb 2023 19:23:07 +0100
Message-ID: <2132872.irdbgypaU6@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <87ttzwm4c8.wl-ashutosh.dixit@intel.com>
References: <20230207101121.104559-1-janusz.krzysztofik@linux.intel.com>
 <20230208143547.jf63d62za5auajh3@kamilkon-desk1>
 <87ttzwm4c8.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [PATCH i-g-t] i915/perf: Make __perf_open() and
 friends public
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wednesday, 8 February 2023 18:53:11 CET Dixit, Ashutosh wrote:
> On Wed, 08 Feb 2023 06:35:47 -0800, Kamil Konieczny wrote:
> >
> > Hi Umesh,
> >
> > On 2023-02-07 at 11:33:50 -0800, Umesh Nerlige Ramappa wrote:
> > > On Tue, Feb 07, 2023 at 11:25:00AM -0800, Umesh Nerlige Ramappa wrote:
> > > > I wouldn't do this. Please keep the changes local to the specific test
> > > > that you implemented in your first rev. While it is a good idea to have
> > > > the some of the perf capabilities in the library, this is way too much
> > > > churn to implement a specific test for the original failure. Unless
> > > > multiple IGT subsytems area already dependent on perf APIs to implement
> > > > multiple tests, let's not do this.
> > > >
> > >
> > > Also note that the perf library implemented in IGT is not entirely used by
> > > IGT tests alone. The library is also linked to GPUvis software. Only a few
> > > pieces of reusable code in the perf library is used by IGT tests.
> >
> > May you give http(s) link(s) to this software ?
> >
> > I checked https://github.com/mikesart/gpuvis
> > and there is no note about intel igt dependancy.
> 
> Hi Kamil,
> 
> The connection between IGT and gpuvis is via this:
> 
> tools/i915-perf/i915_perf_recorder.c
> 
> So the recorder records the metrics/counters in a file and these are then
> fed to gpuvis.

How are those few proposed functions, required by IGT tests, supposed to break 
that functionality?

> >
> > imho we can have separate i915_perf lib with functions needed by
> > new test but if you are concerned about it we can start with code
> > duplication and refactor later.
> 
> Thanks Kamil and Janusz!

Please understand that's still a negative choice, selected only because of no 
answer from you (I mean Umesh and you) to questions like the one above.  We 
simply can't afford delays in adding new required subtests because you don't 
like us touching tests/i915/perf.c and lib/i915/perf.c for some reason still 
not clear to me.  That's why we are forced to use a solution which seem sub-
optimal from our (IGT) POV.

Thanks,
Janusz

> 
> >
> > Regards,
> > Kamil
> >
> > >
> > > > Thanks,
> > > > Umesh
> > > >
> > > > On Tue, Feb 07, 2023 at 11:11:21AM +0100, Janusz Krzysztofik wrote:
> > > > > We need new subtests that exercise interaction between i915 perf open/
> > > > > close and other i915 subsystems from the point of view of those other
> > > > > subsystems.  Allow other tests to reuse __perf_open/close() family of
> > > > > functions, now inside i915/perf test, by moving (sharable parts of)
> > > > > them to i915/perf library.
> > > > >
> > > > > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > > > > ---
> > > > > lib/i915/perf.c   | 130 ++++++++++++++++++++++++++++++++++++++++++++++
> > > > > lib/i915/perf.h   |  15 ++++++
> > > > > lib/meson.build   |   1 +
> > > > > tests/i915/perf.c | 121 ++++++++++--------------------------------
> > > > > 4 files changed, 174 insertions(+), 93 deletions(-)
> > > > >
> > > > > diff --git a/lib/i915/perf.c b/lib/i915/perf.c
> > > > > index 6c7a192558..e71d637eb5 100644
> > > > > --- a/lib/i915/perf.c
> > > > > +++ b/lib/i915/perf.c
> > > > > @@ -39,7 +39,9 @@
> > > > >
> > > > > #include "i915_pciids.h"
> > > > >
> > > > > +#include "igt_aux.h"
> > > > > #include "intel_chipset.h"
> > > > > +#include "ioctl_wrappers.h"
> > > > > #include "perf.h"
> > > > >
> > > > > #include "i915_perf_metrics_hsw.h"
> > > > > @@ -1008,3 +1010,131 @@ const char *intel_perf_read_report_reason(const struct intel_perf *perf,
> > > > >
> > > > >		return "unknown";
> > > > > }
> > > > > +
> > > > > +uint64_t i915_perf_timebase_scale(struct intel_perf *intel_perf, uint32_t u32_delta)
> > > > > +{
> > > > > +	return ((uint64_t)u32_delta * NSEC_PER_SEC) / intel_perf->devinfo.timestamp_frequency;
> > > > > +}
> > > > > +
> > > > > +/* Returns: the largest OA exponent that will still result in a sampling period
> > > > > + * less than or equal to the given @period.
> > > > > + */
> > > > > +int i915_perf_max_oa_exponent_for_period_lte(struct intel_perf *intel_perf, uint64_t period)
> > > > > +{
> > > > > +	/* NB: timebase_scale() takes a uint32_t and an exponent of 30
> > > > > +	 * would already represent a period of ~3 minutes so there's
> > > > > +	 * really no need to consider higher exponents.
> > > > > +	 */
> > > > > +	for (int i = 0; i < 30; i++) {
> > > > > +		uint64_t oa_period = i915_perf_timebase_scale(intel_perf, 2 << i);
> > > > > +
> > > > > +		if (oa_period > period)
> > > > > +			return max(0, i - 1);
> > > > > +	}
> > > > > +
> > > > > +	igt_assert(!"reached");
> > > > > +	return -1;
> > > > > +}
> > > > > +
> > > > > +struct intel_perf_metric_set *i915_perf_default_set(struct intel_perf *intel_perf, uint32_t devid)
> > > > > +{
> > > > > +	struct intel_perf_metric_set *metric_set = NULL, *metric_set_iter;
> > > > > +	const char *metric_set_name = NULL;
> > > > > +
> > > > > +	igt_assert_neq(devid, 0);
> > > > > +
> > > > > +	/*
> > > > > +	 * We don't have a TestOa metric set for Haswell so use
> > > > > +	 * RenderBasic
> > > > > +	 */
> > > > > +	if (IS_HASWELL(devid))
> > > > > +		metric_set_name = "RenderBasic";
> > > > > +	else
> > > > > +		metric_set_name = "TestOa";
> > > > > +
> > > > > +	igt_list_for_each_entry(metric_set_iter, &intel_perf->metric_sets, link) {
> > > > > +		if (strcmp(metric_set_iter->symbol_name, metric_set_name) == 0) {
> > > > > +			metric_set = metric_set_iter;
> > > > > +			break;
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > > +	return metric_set;
> > > > > +}
> > > > > +
> > > > > +struct intel_perf *i915_perf_init_sys_info(int drm_fd)
> > > > > +{
> > > > > +	struct intel_perf *intel_perf;
> > > > > +
> > > > > +	intel_perf = intel_perf_for_fd(drm_fd);
> > > > > +	if (!intel_perf)
> > > > > +		return NULL;
> > > > > +
> > > > > +	igt_debug("n_eu_slices: %"PRIu64"\n", intel_perf->devinfo.n_eu_slices);
> > > > > +	igt_debug("n_eu_sub_slices: %"PRIu64"\n", intel_perf->devinfo.n_eu_sub_slices);
> > > > > +	igt_debug("n_eus: %"PRIu64"\n", intel_perf->devinfo.n_eus);
> > > > > +	igt_debug("timestamp_frequency = %"PRIu64"\n",
> > > > > +		  intel_perf->devinfo.timestamp_frequency);
> > > > > +	igt_assert_neq(intel_perf->devinfo.timestamp_frequency, 0);
> > > > > +
> > > > > +	intel_perf_load_perf_configs(intel_perf, drm_fd);
> > > > > +
> > > > > +	return intel_perf;
> > > > > +}
> > > > > +
> > > > > +int i915_perf_open(int drm_fd, struct drm_i915_perf_open_param *param, int *pm_fd)
> > > > > +{
> > > > > +	int32_t pm_value = 0;
> > > > > +	int ret;
> > > > > +
> > > > > +	ret = perf_ioctl(drm_fd, DRM_IOCTL_I915_PERF_OPEN, param);
> > > > > +
> > > > > +	igt_assert(ret >= 0);
> > > > > +	errno = 0;
> > > > > +
> > > > > +	if (pm_fd) {
> > > > > +		*pm_fd = open("/dev/cpu_dma_latency", O_RDWR);
> > > > > +		igt_assert(*pm_fd >= 0);
> > > > > +
> > > > > +		igt_assert_eq(write(*pm_fd, &pm_value, sizeof(pm_value)), sizeof(pm_value));
> > > > > +	}
> > > > > +
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +int i915_perf_open_for_devid(int drm_fd, uint32_t devid, struct intel_perf *intel_perf, int *pm_fd)
> > > > > +{
> > > > > +	struct intel_perf_metric_set *metric_set = i915_perf_default_set(intel_perf, devid);
> > > > > +	uint64_t oa_exp = i915_perf_max_oa_exponent_for_period_lte(intel_perf, 1000000);
> > > > > +	uint64_t properties[] = {
> > > > > +		DRM_I915_PERF_PROP_SAMPLE_OA, true,
> > > > > +		DRM_I915_PERF_PROP_OA_METRICS_SET, 0,
> > > > > +		DRM_I915_PERF_PROP_OA_FORMAT, 0,
> > > > > +		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp,
> > > > > +	};
> > > > > +	struct drm_i915_perf_open_param param = {
> > > > > +		.flags = I915_PERF_FLAG_FD_CLOEXEC,
> > > > > +		.num_properties = sizeof(properties) / 16,
> > > > > +		.properties_ptr = to_user_pointer(properties),
> > > > > +	};
> > > > > +
> > > > > +	igt_assert(metric_set);
> > > > > +	igt_assert(metric_set->perf_oa_metrics_set);
> > > > > +	igt_assert(oa_exp >= 0);
> > > > > +
> > > > > +	igt_debug("%s metric set UUID = %s\n",
> > > > > +		  metric_set->symbol_name,
> > > > > +		  metric_set->hw_config_guid);
> > > > > +
> > > > > +	properties[3] = metric_set->perf_oa_metrics_set;
> > > > > +	properties[5] = metric_set->perf_oa_format;
> > > > > +
> > > > > +	return i915_perf_open(drm_fd, &param, pm_fd);
> > > > > +}
> > > > > +
> > > > > +void i915_perf_close(int stream_fd, int pm_fd)
> > > > > +{
> > > > > +	close(stream_fd);
> > > > > +	if (pm_fd >= 0)
> > > > > +		close(pm_fd);
> > > > > +}
> > > > > diff --git a/lib/i915/perf.h b/lib/i915/perf.h
> > > > > index e6e60dc997..c9cd28be47 100644
> > > > > --- a/lib/i915/perf.h
> > > > > +++ b/lib/i915/perf.h
> > > > > @@ -351,6 +351,21 @@ uint64_t intel_perf_read_record_timestamp_raw(const struct intel_perf *perf,
> > > > > const char *intel_perf_read_report_reason(const struct intel_perf *perf,
> > > > >						  const struct drm_i915_perf_record_header *record);
> > > > >
> > > > > +uint64_t i915_perf_timebase_scale(struct intel_perf *intel_perf, uint32_t u32_delta);
> > > > > +
> > > > > +int i915_perf_max_oa_exponent_for_period_lte(struct intel_perf *intel_perf, uint64_t period);
> > > > > +
> > > > > +struct intel_perf_metric_set *i915_perf_default_set(struct intel_perf *intel_perf, uint32_t devid);
> > > > > +
> > > > > +struct intel_perf *i915_perf_init_sys_info(int drm_fd);
> > > > > +
> > > > > +struct drm_i915_perf_open_param;
> > > > > +int i915_perf_open(int drm_fd, struct drm_i915_perf_open_param *param, int *pm_fd);
> > > > > +
> > > > > +int i915_perf_open_for_devid(int drm_fd, uint32_t devid, struct intel_perf *intel_perf, int *pm_fd);
> > > > > +
> > > > > +void i915_perf_close(int drm_fd, int pm_fd);
> > > > > +
> > > > > #ifdef __cplusplus
> > > > > };
> > > > > #endif
> > > > > diff --git a/lib/meson.build b/lib/meson.build
> > > > > index d49b78ca1a..e79b31090b 100644
> > > > > --- a/lib/meson.build
> > > > > +++ b/lib/meson.build
> > > > > @@ -258,6 +258,7 @@ lib_igt_drm_fdinfo = declare_dependency(link_with : lib_igt_drm_fdinfo_build,
> > > > >					  include_directories : inc)
> > > > > i915_perf_files = [
> > > > >  'igt_list.c',
> > > > > +  'igt_tools_stub.c',
> > > > >  'i915/perf.c',
> > > > >  'i915/perf_data_reader.c',
> > > > > ]
> > > > > diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> > > > > index dd1f1ac399..a3f59d143b 100644
> > > > > --- a/tests/i915/perf.c
> > > > > +++ b/tests/i915/perf.c
> > > > > @@ -287,21 +287,16 @@ pretty_print_oa_period(uint64_t oa_period_ns)
> > > > > static void
> > > > > __perf_close(int fd)
> > > > > {
> > > > > -	close(fd);
> > > > > +	i915_perf_close(fd, pm_fd);
> > > > >		stream_fd = -1;
> > > > >
> > > > > -	if (pm_fd >= 0) {
> > > > > -		close(pm_fd);
> > > > > +	if (pm_fd >= 0)
> > > > >			pm_fd = -1;
> > > > > -	}
> > > > > }
> > > > >
> > > > > static int
> > > > > __perf_open(int fd, struct drm_i915_perf_open_param *param, bool prevent_pm)
> > > > > {
> > > > > -	int ret;
> > > > > -	int32_t pm_value = 0;
> > > > > -
> > > > >		if (stream_fd >= 0)
> > > > >			__perf_close(stream_fd);
> > > > >		if (pm_fd >= 0) {
> > > > > @@ -309,19 +304,7 @@ __perf_open(int fd, struct drm_i915_perf_open_param *param, bool prevent_pm)
> > > > >			pm_fd = -1;
> > > > >		}
> > > > >
> > > > > -	ret = igt_ioctl(fd, DRM_IOCTL_I915_PERF_OPEN, param);
> > > > > -
> > > > > -	igt_assert(ret >= 0);
> > > > > -	errno = 0;
> > > > > -
> > > > > -	if (prevent_pm) {
> > > > > -		pm_fd = open("/dev/cpu_dma_latency", O_RDWR);
> > > > > -		igt_assert(pm_fd >= 0);
> > > > > -
> > > > > -		igt_assert_eq(write(pm_fd, &pm_value, sizeof(pm_value)), sizeof(pm_value));
> > > > > -	}
> > > > > -
> > > > > -	return ret;
> > > > > +	return i915_perf_open(fd, param, prevent_pm ? &pm_fd : NULL);
> > > > > }
> > > > >
> > > > > static int
> > > > > @@ -465,33 +448,6 @@ cs_timebase_scale(uint32_t u32_delta)
> > > > >		return ((uint64_t)u32_delta * NSEC_PER_SEC) / cs_timestamp_frequency(drm_fd);
> > > > > }
> > > > >
> > > > > -static uint64_t
> > > > > -timebase_scale(uint32_t u32_delta)
> > > > > -{
> > > > > -	return ((uint64_t)u32_delta * NSEC_PER_SEC) / intel_perf->devinfo.timestamp_frequency;
> > > > > -}
> > > > > -
> > > > > -/* Returns: the largest OA exponent that will still result in a sampling period
> > > > > - * less than or equal to the given @period.
> > > > > - */
> > > > > -static int
> > > > > -max_oa_exponent_for_period_lte(uint64_t period)
> > > > > -{
> > > > > -	/* NB: timebase_scale() takes a uint32_t and an exponent of 30
> > > > > -	 * would already represent a period of ~3 minutes so there's
> > > > > -	 * really no need to consider higher exponents.
> > > > > -	 */
> > > > > -	for (int i = 0; i < 30; i++) {
> > > > > -		uint64_t oa_period = timebase_scale(2 << i);
> > > > > -
> > > > > -		if (oa_period > period)
> > > > > -			return max(0, i - 1);
> > > > > -	}
> > > > > -
> > > > > -	igt_assert(!"reached");
> > > > > -	return -1;
> > > > > -}
> > > > > -
> > > > > /* Return: the largest OA exponent that will still result in a sampling
> > > > > * frequency greater than the given @frequency.
> > > > > */
> > > > > @@ -502,7 +458,7 @@ max_oa_exponent_for_freq_gt(uint64_t frequency)
> > > > >
> > > > >		igt_assert_neq(period, 0);
> > > > >
> > > > > -	return max_oa_exponent_for_period_lte(period - 1);
> > > > > +	return i915_perf_max_oa_exponent_for_period_lte(intel_perf, period - 1);
> > > > > }
> > > > >
> > > > > static uint64_t
> > > > > @@ -626,7 +582,7 @@ hsw_sanity_check_render_basic_reports(const uint32_t *oa_report0,
> > > > >					      const uint32_t *oa_report1,
> > > > >					      enum drm_i915_oa_format fmt)
> > > > > {
> > > > > -	uint32_t time_delta = timebase_scale(oa_report1[1] - oa_report0[1]);
> > > > > +	uint32_t time_delta = i915_perf_timebase_scale(intel_perf, oa_report1[1] - oa_report0[1]);
> > > > >		uint32_t clock_delta;
> > > > >		uint32_t max_delta;
> > > > >		struct oa_format format = get_oa_format(fmt);
> > > > > @@ -832,7 +788,7 @@ gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
> > > > >					  enum drm_i915_oa_format fmt)
> > > > > {
> > > > >		struct oa_format format = get_oa_format(fmt);
> > > > > -	uint32_t time_delta = timebase_scale(oa_report1[1] - oa_report0[1]);
> > > > > +	uint32_t time_delta = i915_perf_timebase_scale(intel_perf, oa_report1[1] - oa_report0[1]);
> > > > >		uint32_t ticks0 = read_report_ticks(oa_report0, fmt);
> > > > >		uint32_t ticks1 = read_report_ticks(oa_report1, fmt);
> > > > >		uint32_t clock_delta = ticks1 - ticks0;
> > > > > @@ -950,43 +906,22 @@ gen8_sanity_check_test_oa_reports(const uint32_t *oa_report0,
> > > > > static bool
> > > > > init_sys_info(void)
> > > > > {
> > > > > -	const char *test_set_name = NULL;
> > > > > -	struct intel_perf_metric_set *metric_set_iter;
> > > > > -
> > > > >		igt_assert_neq(devid, 0);
> > > > >
> > > > > -	intel_perf = intel_perf_for_fd(drm_fd);
> > > > > +	intel_perf = i915_perf_init_sys_info(drm_fd);
> > > > >		igt_require(intel_perf);
> > > > >
> > > > > -	igt_debug("n_eu_slices: %"PRIu64"\n", intel_perf->devinfo.n_eu_slices);
> > > > > -	igt_debug("n_eu_sub_slices: %"PRIu64"\n", intel_perf->devinfo.n_eu_sub_slices);
> > > > > -	igt_debug("n_eus: %"PRIu64"\n", intel_perf->devinfo.n_eus);
> > > > > -	igt_debug("timestamp_frequency = %"PRIu64"\n",
> > > > > -		  intel_perf->devinfo.timestamp_frequency);
> > > > > -	igt_assert_neq(intel_perf->devinfo.timestamp_frequency, 0);
> > > > > -
> > > > > -	/* We don't have a TestOa metric set for Haswell so use
> > > > > -	 * RenderBasic
> > > > > -	 */
> > > > >		if (IS_HASWELL(devid)) {
> > > > > -		test_set_name = "RenderBasic";
> > > > >			read_report_ticks = hsw_read_report_ticks;
> > > > >			sanity_check_reports = hsw_sanity_check_render_basic_reports;
> > > > >			undefined_a_counters = hsw_undefined_a_counters;
> > > > >		} else {
> > > > > -		test_set_name = "TestOa";
> > > > >			read_report_ticks = gen8_read_report_ticks;
> > > > >			sanity_check_reports = gen8_sanity_check_test_oa_reports;
> > > > >			undefined_a_counters = gen8_undefined_a_counters;
> > > > >		}
> > > > >
> > > > > -	igt_list_for_each_entry(metric_set_iter, &intel_perf->metric_sets, link) {
> > > > > -		if (strcmp(metric_set_iter->symbol_name, test_set_name) == 0) {
> > > > > -			test_set = metric_set_iter;
> > > > > -			break;
> > > > > -		}
> > > > > -	}
> > > > > -
> > > > > +	test_set = i915_perf_default_set(intel_perf, devid);
> > > > >		if (!test_set)
> > > > >			return false;
> > > > >
> > > > > @@ -994,14 +929,12 @@ init_sys_info(void)
> > > > >			  test_set->symbol_name,
> > > > >			  test_set->hw_config_guid);
> > > > >
> > > > > -	intel_perf_load_perf_configs(intel_perf, drm_fd);
> > > > > -
> > > > >		if (test_set->perf_oa_metrics_set == 0) {
> > > > >			igt_debug("Unable to load configurations\n");
> > > > >			return false;
> > > > >		}
> > > > >
> > > > > -	oa_exp_1_millisec = max_oa_exponent_for_period_lte(1000000);
> > > > > +	oa_exp_1_millisec = i915_perf_max_oa_exponent_for_period_lte(intel_perf, 1000000);
> > > > >
> > > > >		return true;
> > > > > }
> > > > > @@ -1911,7 +1844,7 @@ test_low_oa_exponent_permissions(void)
> > > > >
> > > > >		igt_waitchildren();
> > > > >
> > > > > -	oa_period = timebase_scale(2 << ok_exponent);
> > > > > +	oa_period = i915_perf_timebase_scale(intel_perf, 2 << ok_exponent);
> > > > >		oa_freq = NSEC_PER_SEC / oa_period;
> > > > >		write_u64_file("/proc/sys/dev/i915/oa_max_sample_rate", oa_freq - 100);
> > > > >
> > > > > @@ -2003,7 +1936,7 @@ get_time(void)
> > > > > static void
> > > > > test_blocking(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t kernel_hrtimer)
> > > > > {
> > > > > -	int oa_exponent = max_oa_exponent_for_period_lte(requested_oa_period);
> > > > > +	int oa_exponent = i915_perf_max_oa_exponent_for_period_lte(intel_perf, requested_oa_period);
> > > > >		uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
> > > > >		uint64_t properties[] = {
> > > > >			/* Include OA reports in samples */
> > > > > @@ -2162,7 +2095,7 @@ test_blocking(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ke
> > > > > static void
> > > > > test_polling(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t kernel_hrtimer)
> > > > > {
> > > > > -	int oa_exponent = max_oa_exponent_for_period_lte(requested_oa_period);
> > > > > +	int oa_exponent = i915_perf_max_oa_exponent_for_period_lte(intel_perf, requested_oa_period);
> > > > >		uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
> > > > >		uint64_t properties[] = {
> > > > >			/* Include OA reports in samples */
> > > > > @@ -2358,7 +2291,7 @@ test_polling(uint64_t requested_oa_period, bool set_kernel_hrtimer, uint64_t ker
> > > > >
> > > > > static void test_polling_small_buf(void)
> > > > > {
> > > > > -	int oa_exponent = max_oa_exponent_for_period_lte(40 * 1000); /* 40us */
> > > > > +	int oa_exponent = i915_perf_max_oa_exponent_for_period_lte(intel_perf, 40 * 1000); /* 40us */
> > > > >		uint64_t properties[] = {
> > > > >			/* Include OA reports in samples */
> > > > >			DRM_I915_PERF_PROP_SAMPLE_OA, true,
> > > > > @@ -2461,7 +2394,7 @@ num_valid_reports_captured(struct drm_i915_perf_open_param *param,
> > > > > static void
> > > > > gen12_test_oa_tlb_invalidate(void)
> > > > > {
> > > > > -	int oa_exponent = max_oa_exponent_for_period_lte(30000000);
> > > > > +	int oa_exponent = i915_perf_max_oa_exponent_for_period_lte(intel_perf, 30000000);
> > > > >		uint64_t properties[] = {
> > > > >			DRM_I915_PERF_PROP_SAMPLE_OA, true,
> > > > >
> > > > > @@ -2503,7 +2436,7 @@ static void
> > > > > test_buffer_fill(void)
> > > > > {
> > > > >		/* ~5 micro second period */
> > > > > -	int oa_exponent = max_oa_exponent_for_period_lte(5000);
> > > > > +	int oa_exponent = i915_perf_max_oa_exponent_for_period_lte(intel_perf, 5000);
> > > > >		uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
> > > > >		uint64_t properties[] = {
> > > > >			/* Include OA reports in samples */
> > > > > @@ -2651,7 +2584,7 @@ static void
> > > > > test_non_zero_reason(void)
> > > > > {
> > > > >		/* ~20 micro second period */
> > > > > -	int oa_exponent = max_oa_exponent_for_period_lte(20000);
> > > > > +	int oa_exponent = i915_perf_max_oa_exponent_for_period_lte(intel_perf, 20000);
> > > > >		uint64_t properties[] = {
> > > > >			/* Include OA reports in samples */
> > > > >			DRM_I915_PERF_PROP_SAMPLE_OA, true,
> > > > > @@ -2734,7 +2667,7 @@ static void
> > > > > test_enable_disable(void)
> > > > > {
> > > > >		/* ~5 micro second period */
> > > > > -	int oa_exponent = max_oa_exponent_for_period_lte(5000);
> > > > > +	int oa_exponent = i915_perf_max_oa_exponent_for_period_lte(intel_perf, 5000);
> > > > >		uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
> > > > >		uint64_t properties[] = {
> > > > >			/* Include OA reports in samples */
> > > > > @@ -2885,7 +2818,7 @@ test_enable_disable(void)
> > > > > static void
> > > > > test_short_reads(void)
> > > > > {
> > > > > -	int oa_exponent = max_oa_exponent_for_period_lte(5000);
> > > > > +	int oa_exponent = i915_perf_max_oa_exponent_for_period_lte(intel_perf, 5000);
> > > > >		uint64_t properties[] = {
> > > > >			/* Include OA reports in samples */
> > > > >			DRM_I915_PERF_PROP_SAMPLE_OA, true,
> > > > > @@ -3447,8 +3380,8 @@ hsw_test_single_ctx_counters(void)
> > > > >
> > > > >			/* sanity check that we can pass the delta to timebase_scale */
> > > > >			igt_assert(delta_ts64 < UINT32_MAX);
> > > > > -		delta_oa32_ns = timebase_scale(delta_oa32);
> > > > > -		delta_ts64_ns = timebase_scale(delta_ts64);
> > > > > +		delta_oa32_ns = i915_perf_timebase_scale(intel_perf, delta_oa32);
> > > > > +		delta_ts64_ns = i915_perf_timebase_scale(intel_perf, delta_ts64);
> > > > >
> > > > >			igt_debug("ts32 delta = %u, = %uns\n",
> > > > >				  delta_oa32, (unsigned)delta_oa32_ns);
> > > > > @@ -3498,7 +3431,7 @@ hsw_test_single_ctx_counters(void)
> > > > > static void
> > > > > gen8_test_single_ctx_render_target_writes_a_counter(void)
> > > > > {
> > > > > -	int oa_exponent = max_oa_exponent_for_period_lte(1000000);
> > > > > +	int oa_exponent = i915_perf_max_oa_exponent_for_period_lte(intel_perf, 1000000);
> > > > >		uint64_t properties[] = {
> > > > >			DRM_I915_PERF_PROP_CTX_HANDLE, UINT64_MAX, /* updated below */
> > > > >
> > > > > @@ -3700,8 +3633,8 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
> > > > >
> > > > >				/* sanity check that we can pass the delta to timebase_scale */
> > > > >				igt_assert(delta_ts64 < UINT32_MAX);
> > > > > -			delta_oa32_ns = timebase_scale(delta_oa32);
> > > > > -			delta_ts64_ns = timebase_scale(delta_ts64);
> > > > > +			delta_oa32_ns = i915_perf_timebase_scale(intel_perf, delta_oa32);
> > > > > +			delta_ts64_ns = i915_perf_timebase_scale(intel_perf, delta_ts64);
> > > > >
> > > > >				igt_debug("oa32 delta = %u, = %uns\n",
> > > > >					  delta_oa32, (unsigned)delta_oa32_ns);
> > > > > @@ -3783,7 +3716,8 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
> > > > >					{
> > > > >						uint32_t time_delta = report[1] - report0_32[1];
> > > > >
> > > > > -					if (timebase_scale(time_delta) > 1000000000) {
> > > > > +					if (i915_perf_timebase_scale(intel_perf,
> > > > > +								     time_delta) > 1000000000) {
> > > > >							skip_reason = "prior first mi-rpc";
> > > > >						}
> > > > >					}
> > > > > @@ -3791,7 +3725,8 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
> > > > >					{
> > > > >						uint32_t time_delta = report[1] - report1_32[1];
> > > > >
> > > > > -					if (timebase_scale(time_delta) <= 1000000000) {
> > > > > +					if (i915_perf_timebase_scale(intel_perf,
> > > > > +								     time_delta) <= 1000000000) {
> > > > >							igt_debug("    comes after last MI_RPC (%u)\n",
> > > > >								  report1_32[1]);
> > > > >							report = report1_32;
> > > > > @@ -4164,7 +4099,7 @@ static void gen12_single_ctx_helper(void)
> > > > >
> > > > >		/* Sanity check that we can pass the delta to timebase_scale */
> > > > >		igt_assert(delta_ts64 < UINT32_MAX);
> > > > > -	delta_oa32_ns = timebase_scale(delta_oa32);
> > > > > +	delta_oa32_ns = i915_perf_timebase_scale(intel_perf, delta_oa32);
> > > > >		delta_ts64_ns = cs_timebase_scale(delta_ts64);
> > > > >
> > > > >		igt_debug("oa32 delta = %u, = %uns\n",
> > > > > --
> > > > > 2.25.1
> > > > >
> 



