Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563626E3AC
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 09:39:25 +0000 (UTC)
References: <20200302103152.1780202-1-lionel.g.landwerlin@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <8a16bed0-713e-d8d4-9a00-b542db32b470@linux.intel.com>
Date: Mon, 16 Mar 2020 09:39:20 +0000
MIME-Version: 1.0
In-Reply-To: <20200302103152.1780202-1-lionel.g.landwerlin@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/perf: add global sseu
 parameter tests
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 02/03/2020 10:31, Lionel Landwerlin wrote:
> This new parameter allows the performance recording application to
> specify what should be the sseu configurations of all contexts on the
> system.
> 
> v2: require appropriate perf version
>      check privileged operation
> 
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>   include/drm-uapi/i915_drm.h |  11 ++
>   tests/perf.c                | 204 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 215 insertions(+)
> 
> diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
> index 3794e768..db12ddd4 100644
> --- a/include/drm-uapi/i915_drm.h
> +++ b/include/drm-uapi/i915_drm.h
> @@ -1969,6 +1969,17 @@ enum drm_i915_perf_property_id {
>   	 */
>   	DRM_I915_PERF_PROP_HOLD_PREEMPTION,
>   
> +	/**
> +	 * Specifying this pins all contexts to the specified SSEU power
> +	 * configuration for the duration of the recording.
> +	 *
> +	 * This parameter's value is a pointer to a struct
> +	 * drm_i915_gem_context_param_sseu.
> +	 *
> +	 * This property is available in perf revision 4.
> +	 */
> +	DRM_I915_PERF_PROP_GLOBAL_SSEU,
> +
>   	DRM_I915_PERF_PROP_MAX /* non-ABI */
>   };
>   
> diff --git a/tests/perf.c b/tests/perf.c
> index 5e818030..a33af4d3 100644
> --- a/tests/perf.c
> +++ b/tests/perf.c
> @@ -4035,6 +4035,183 @@ test_stress_open_close(void)
>   	load_helper_fini();
>   }
>   
> +static uint64_t mask_minus_one(uint64_t mask)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < (sizeof(mask) * 8 - 1); i++) {
> +		if ((1ULL << i) & mask)
> +			return mask & ~(1ULL << i);
> +	}
> +
> +	igt_assert(0);
> +	return 0;
> +}
> +
> +static uint64_t mask_plus_one(uint64_t mask)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < (sizeof(mask) * 8 - 1); i++) {
> +		if (((1ULL << i) & mask) == 0)
> +			return mask | (1ULL << i);
> +	}
> +
> +	igt_assert(0);
> +	return 0;
> +}
> +
> +static void
> +test_global_sseu_config_invalid(void)
> +{
> +	struct drm_i915_gem_context_param_sseu default_sseu;
> +	struct drm_i915_gem_context_param_sseu sseu_param;
> +	struct drm_i915_gem_context_param ctx_gp = {
> +		.param = I915_CONTEXT_PARAM_SSEU,
> +		.size = sizeof(default_sseu),
> +		.value = to_user_pointer(&default_sseu),
> +	};
> +	uint64_t properties[] = {
> +		/* XXX: even without periodic sampling we have to
> +		 * specify at least one sample layout property...
> +		 */
> +		DRM_I915_PERF_PROP_SAMPLE_OA, true,
> +
> +		/* OA unit configuration */
> +		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
> +		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
> +		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
> +		DRM_I915_PERF_PROP_GLOBAL_SSEU, to_user_pointer(&sseu_param),
> +	};
> +	struct drm_i915_perf_open_param param = {
> +		.flags = I915_PERF_FLAG_FD_CLOEXEC |
> +		I915_PERF_FLAG_DISABLED, /* XXX: open disabled */
> +		.num_properties = NUM_PROPERTIES(properties),
> +			.properties_ptr = to_user_pointer(properties),
> +	};
> +
> +	memset(&default_sseu, 0, sizeof(default_sseu));
> +	igt_require(__gem_context_get_param(drm_fd, &ctx_gp) == 0);
> +
> +	igt_debug("Default context sseu:\n");
> +	igt_debug("   engine class/instance=%hu:%hu\n",
> +		  default_sseu.engine.engine_class,
> +		  default_sseu.engine.engine_instance);
> +	igt_debug("   slice_mask=0x%llx\n", default_sseu.slice_mask);
> +	igt_debug("   subslice_mask=0x%llx\n", default_sseu.subslice_mask);
> +	igt_debug("   eu min/max=%hu/%hu\n",
> +		  default_sseu.min_eus_per_subslice,
> +		  default_sseu.max_eus_per_subslice);
> +
> +	/* Invalid engine class */
> +	sseu_param = default_sseu;
> +	sseu_param.engine.engine_class = -1;
> +	do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EINVAL);
> +
> +	/* Invalid engine instance */
> +	sseu_param = default_sseu;
> +	sseu_param.engine.engine_instance = -1;
> +	do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EINVAL);
> +
> +	/* Invalid slice mask */
> +	sseu_param = default_sseu;
> +	sseu_param.slice_mask = 0;
> +	do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EINVAL);
> +
> +	sseu_param = default_sseu;
> +	sseu_param.slice_mask = mask_plus_one(sseu_param.slice_mask);
> +	do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EINVAL);
> +
> +	/* Invalid subslice mask */
> +	sseu_param = default_sseu;
> +	sseu_param.subslice_mask = 0;
> +	do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EINVAL);
> +
> +	sseu_param = default_sseu;
> +	sseu_param.subslice_mask = mask_plus_one(sseu_param.subslice_mask);
> +	do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EINVAL);
> +
> +	/* Privileged operation */
> +	if (__builtin_popcount(default_sseu.subslice_mask) > 1) {
> +		igt_fork(child, 1) {
> +			igt_drop_root();
> +
> +			sseu_param = default_sseu;
> +			sseu_param.subslice_mask = mask_minus_one(sseu_param.subslice_mask);
> +			do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EACCES);
> +		}
> +		igt_waitchildren();
> +	}
> +}
> +
> +static void
> +test_global_sseu_config(void)
> +{
> +	struct drm_i915_gem_context_param_sseu default_sseu;
> +	struct drm_i915_gem_context_param_sseu sseu_param;
> +	struct drm_i915_gem_context_param ctx_gp = {
> +		.param = I915_CONTEXT_PARAM_SSEU,
> +		.size = sizeof(default_sseu),
> +		.value = to_user_pointer(&default_sseu),
> +	};
> +	uint64_t properties[] = {
> +		/* XXX: even without periodic sampling we have to
> +		 * specify at least one sample layout property...
> +		 */
> +		DRM_I915_PERF_PROP_SAMPLE_OA, true,
> +
> +		/* OA unit configuration */
> +		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
> +		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
> +		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
> +		DRM_I915_PERF_PROP_GLOBAL_SSEU, to_user_pointer(&sseu_param),
> +	};
> +	struct drm_i915_perf_open_param param = {
> +		.flags = I915_PERF_FLAG_FD_CLOEXEC |
> +		I915_PERF_FLAG_DISABLED, /* XXX: open disabled */
> +		.num_properties = NUM_PROPERTIES(properties),
> +			.properties_ptr = to_user_pointer(properties),
> +	};
> +
> +	memset(&default_sseu, 0, sizeof(default_sseu));
> +	igt_require(__gem_context_get_param(drm_fd, &ctx_gp) == 0);
> +
> +	igt_debug("Default context sseu:\n");
> +	igt_debug("   engine class/instance=%hu:%hu\n",
> +		  default_sseu.engine.engine_class,
> +		  default_sseu.engine.engine_instance);
> +	igt_debug("   slice_mask=0x%llx\n", default_sseu.slice_mask);
> +	igt_debug("   subslice_mask=0x%llx\n", default_sseu.subslice_mask);
> +	igt_debug("   eu min/max=%hu/%hu\n",
> +		  default_sseu.min_eus_per_subslice,
> +		  default_sseu.max_eus_per_subslice);

Could pull to helper.

> +
> +	igt_require(__builtin_popcount(default_sseu.subslice_mask) > 1);
> +
> +	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 0);
> +
> +	igt_fork(child, 1) {
> +		igt_drop_root();
> +
> +		sseu_param = default_sseu;
> +		sseu_param.subslice_mask = mask_minus_one(sseu_param.subslice_mask);
> +
> +		stream_fd = __perf_open(drm_fd, &param, false);
> +		__perf_close(stream_fd);
> +	}
> +
> +	igt_waitchildren();
> +
> +	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
> +
> +
> +	sseu_param = default_sseu;
> +	sseu_param.subslice_mask = mask_minus_one(sseu_param.subslice_mask);
> +
> +	stream_fd = __perf_open(drm_fd, &param, false);
> +	__perf_close(stream_fd);
> +}
> +
>   static int __i915_perf_add_config(int fd, struct drm_i915_perf_oa_config *config)
>   {
>   	int ret = igt_ioctl(fd, DRM_IOCTL_I915_PERF_ADD_CONFIG, config);
> @@ -4502,6 +4679,19 @@ test_sysctl_defaults(void)
>   	igt_assert_eq(max_freq, 100000);
>   }
>   
> +static int i915_perf_version(int fd)
> +{
> +	struct drm_i915_getparam gp;
> +	int perf_version = -1;
> +
> +	memset(&gp, 0, sizeof(gp));
> +	gp.param = I915_PARAM_PERF_REVISION;
> +	gp.value = &perf_version;
> +	igt_ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp);
> +
> +	return perf_version;
> +}
> +
>   igt_main
>   {
>   	igt_fixture {
> @@ -4635,6 +4825,20 @@ igt_main
>   	igt_subtest("stress-open-close")
>   		test_stress_open_close();
>   
> +	igt_subtest_group {
> +		igt_fixture {
> +			igt_require(i915_perf_version(drm_fd) >= 4);
> +		}
> +
> +		igt_describe("Verify invalid SSEU opening parameters");
> +		igt_subtest("global-sseu-config-invalid")
> +			test_global_sseu_config_invalid();
> +
> +		igt_describe("Verify specifying SSEU opening parameters");
> +		igt_subtest("global-sseu-config")
> +			test_global_sseu_config();
> +	}
> +
>   	igt_subtest("invalid-create-userspace-config")
>   		test_invalid_create_userspace_config();
>   
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
