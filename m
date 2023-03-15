Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4F510E068
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Mar 2023 20:40:41 +0000 (UTC)
Date: Wed, 15 Mar 2023 13:40:35 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZBItQ6dZ07v3kxFB@orsosgc001.jf.intel.com>
References: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
 <20230215004648.2100655-15-umesh.nerlige.ramappa@intel.com>
 <87pm9aly83.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87pm9aly83.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 14/31] i915/perf: Test concurrent access
 to OA in different groups
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 14, 2023 at 04:17:16PM -0700, Dixit, Ashutosh wrote:
>On Tue, 14 Feb 2023 16:46:31 -0800, Umesh Nerlige Ramappa wrote:
>>
>> With multiple OA buffers, verify that the perf interface allows
>> concurrent access to the OA buffers in different groups.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tests/i915/perf.c | 135 ++++++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 131 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
>> index 727eaf4e..9c926fd2 100644
>> --- a/tests/i915/perf.c
>> +++ b/tests/i915/perf.c
>> @@ -2248,6 +2248,7 @@ test_blocking(uint64_t requested_oa_period,
>>
>>	int max_iterations = (test_duration_ns / oa_period) + 2;
>>	int n_extra_iterations = 0;
>> +	int perf_fd;
>>
>>	/* It's a bit tricky to put a lower limit here, but we expect a
>>	 * relatively low latency for seeing reports, while we don't currently
>> @@ -2281,7 +2282,7 @@ test_blocking(uint64_t requested_oa_period,
>>	param.num_properties = (idx - props) / 2;
>>	param.properties_ptr = to_user_pointer(props);
>>
>> -	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>> +	perf_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>>
>>	times(&start_times);
>>
>> @@ -2313,14 +2314,14 @@ test_blocking(uint64_t requested_oa_period,
>>	 * the error delta.
>>	 */
>>	start = get_time();
>> -	do_ioctl(stream_fd, I915_PERF_IOCTL_ENABLE, 0);
>> +	do_ioctl(perf_fd, I915_PERF_IOCTL_ENABLE, 0);
>>	for (/* nop */; ((end = get_time()) - start) < test_duration_ns; /* nop */) {
>>		struct drm_i915_perf_record_header *header;
>>		bool timer_report_read = false;
>>		bool non_timer_report_read = false;
>>		int ret;
>>
>> -		while ((ret = read(stream_fd, buf, sizeof(buf))) < 0 &&
>> +		while ((ret = read(perf_fd, buf, sizeof(buf))) < 0 &&
>>		       errno == EINTR)
>>			;
>>
>> @@ -2388,7 +2389,7 @@ test_blocking(uint64_t requested_oa_period,
>>	if (!set_kernel_hrtimer)
>>		igt_assert(kernel_ns <= (test_duration_ns / 100ull));
>>
>> -	__perf_close(stream_fd);
>> +	__perf_close(perf_fd);
>>  }
>>
>>  static void
>> @@ -5476,6 +5477,14 @@ static void put_engine_groups(struct perf_engine_group *groups,
>>	free(groups);
>>  }
>>
>> +static struct i915_engine_class_instance *
>> +random_engine(struct perf_engine_group *group)
>> +{
>> +	srandom(time(NULL));
>> +
>> +	return &group->ci[random() % group->num_engines];
>> +}
>> +
>>  static bool has_class_instance(int i915, uint16_t class, uint16_t instance)
>>  {
>>	int fd;
>> @@ -5498,6 +5507,112 @@ static void set_default_engine(const intel_ctx_t *ctx)
>>			default_e2 = *e;
>>  }
>>
>> +/*
>> + * Test if OA buffer streams can be independently opened on each gt. Once a user
>> + * opens a stream, that gt is exclusive to the user, other users get -EBUSY on
>> + * trying to open a stream. Note that OA metrics are global to the gt and can
>> + * get clobbered if we try to support concurrency.
>
>Little bit confusing since what we are doing below is for each perf group,
>not each gt, though there is one perf group per gt on MTL. Even function
>and test names say gt. Shall we s/gt/grp/ or something like that?

Hmm, looks like the comment wasn't updated when we moved to perf groups.  
I will fix that and the function name accordingly.

>
>> + */
>> +static void
>> +test_gt_exclusive_stream(const intel_ctx_t *ctx, bool exponent)
>> +{
>> +	uint64_t properties[] = {
>> +		DRM_I915_PERF_PROP_SAMPLE_OA, true,
>> +		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
>> +		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
>> +		DRM_I915_PERF_PROP_OA_ENGINE_CLASS, 0,
>> +		DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE, 0,
>> +		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
>> +	};
>> +	struct drm_i915_perf_open_param param = {
>> +		.flags = I915_PERF_FLAG_FD_CLOEXEC,
>> +		/* for gem_context use case, we do no pass exponent */
>> +		.num_properties = exponent ?
>> +				  ARRAY_SIZE(properties) / 2 - 1:
>> +				  ARRAY_SIZE(properties) / 2,
>> +		.properties_ptr = to_user_pointer(properties),
>> +	};
>> +	uint32_t i, j;
>> +
>> +	/* for each group, open one random perf stream with sample OA */
>> +	for (i = 0; i < num_perf_oa_groups; i++) {
>> +		struct perf_engine_group *grp = &perf_oa_groups[i];
>> +		struct i915_engine_class_instance *ci = random_engine(grp);
>> +
>> +		if (!exponent) {
>> +			properties[0] = DRM_I915_PERF_PROP_CTX_HANDLE;
>> +			properties[1] = ctx->id;
>> +		}
>> +
>> +		properties[7] = ci->engine_class;
>> +		properties[9] = ci->engine_instance;
>> +		grp->perf_fd = igt_ioctl(drm_fd,
>> +					 DRM_IOCTL_I915_PERF_OPEN,
>> +					 &param);
>> +		igt_assert(grp->perf_fd >= 0);
>> +		igt_debug("opened OA buffer with c:i %d:%d\n",
>> +			  ci->engine_class, ci->engine_instance);
>> +	}
>> +
>> +	/* for each group make sure no other streams can be opened */
>> +	for (i = 0; i < num_perf_oa_groups; i++) {
>> +		struct perf_engine_group *grp = &perf_oa_groups[i];
>> +		int err;
>> +
>> +		for (j = 0; j < grp->num_engines; j++) {
>> +			struct i915_engine_class_instance *ci = grp->ci + j;
>> +
>> +			/*
>> +			 * case 1:
>> +			 * concurrent access to OAG should fail
>
>I guess here by OAG we means SAMPLE_OA so using the OA buffer?

Correct, SAMPLE_OA means OA buffer is being enabled.
>
>> +			 */
>> +			properties[0] = DRM_I915_PERF_PROP_SAMPLE_OA;
>> +			properties[1] = true;
>> +			properties[7] = ci->engine_class;
>> +			properties[9] = ci->engine_instance;
>> +			/* for SAMPLE OA use case, we must pass exponent */
>> +			param.num_properties = ARRAY_SIZE(properties) / 2;
>> +			do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param,
>> +				     EBUSY);
>> +			igt_debug("try OA buffer with c:i %d:%d\n",
>> +				  ci->engine_class, ci->engine_instance);
>> +
>> +			/*
>> +			 * case 2:
>> +			 * concurrent access to non-OAG unit should fail
>
>Similarly here non-OAG means not using the OA buffer?

non-OAG = OAR/OAC units which are configured by passing 
DRM_I915_PERF_PROP_CTX_HANDLE.
>
>After potentially fixing the function names and comments, this is:
>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks,
Umesh
>
>> +			 */
>> +			properties[0] = DRM_I915_PERF_PROP_CTX_HANDLE;
>> +			properties[1] = gem_context_create(drm_fd);
>> +			/* for gem_context use case, we do no pass exponent */
>> +			param.num_properties = ARRAY_SIZE(properties) / 2 - 1;
>> +			errno = 0;
>> +			err = igt_ioctl(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param);
>> +			igt_assert(err < 0);
>> +			igt_assert(errno == EBUSY || errno == ENODEV);
>> +			igt_debug("try OA ci unit with c:i %d:%d\n",
>> +				  ci->engine_class, ci->engine_instance);
>> +			gem_context_destroy(drm_fd, properties[1]);
>> +		}
>> +
>> +		if (grp->perf_fd >= 0)
>> +			close(grp->perf_fd);
>> +	}
>> +}
>> +
>> +static void
>> +test_gt_concurrent_oa_buffer_read(void)
>> +{
>> +	igt_fork(child, num_perf_oa_groups) {
>> +		struct intel_execution_engine2 e;
>> +
>> +		e.class = perf_oa_groups[child].ci->engine_class;
>> +		e.instance = perf_oa_groups[child].ci->engine_instance;
>> +
>> +		test_blocking(40 * 1000 * 1000, false, 5 * 1000 * 1000, &e);
>> +	}
>> +	igt_waitchildren();
>> +}
>> +
>>  igt_main
>>  {
>>	const intel_ctx_t *ctx;
>> @@ -5723,6 +5838,18 @@ igt_main
>>		igt_describe("Verify invalid class instance");
>>		igt_subtest("gen12-invalid-class-instance")
>>			test_invalid_class_instance();
>> +
>> +		igt_describe("Verify exclusivity of perf streams with sample oa option");
>> +		igt_subtest("gen12-gt-exclusive-stream-sample-oa")
>> +			test_gt_exclusive_stream(ctx, true);
>> +
>> +		igt_describe("Verify exclusivity of perf streams with ctx handle");
>> +		igt_subtest("gen12-gt-exclusive-stream-ctx-handle")
>> +			test_gt_exclusive_stream(ctx, false);
>> +
>> +		igt_describe("Verify concurrent reads from OA buffers in different gts");
>> +		igt_subtest("gen12-gt-concurrent-oa-buffer-read")
>> +			test_gt_concurrent_oa_buffer_read();
>>	}
>>
>>	igt_subtest("rc6-disable")
>> --
>> 2.36.1
>>
