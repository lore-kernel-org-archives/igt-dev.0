Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4734310E670
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Sep 2023 14:35:35 +0000 (UTC)
Date: Thu, 28 Sep 2023 10:33:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZRWOtjYmxZ8LkNG6@intel.com>
References: <20230928110516.7-1-francois.dugast@intel.com>
 <20230928110516.7-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230928110516.7-3-francois.dugast@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 02/14] tests/intel/xe_query: Add a test for
 querying engine cycles
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 28, 2023 at 11:05:04AM +0000, Francois Dugast wrote:
> From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> The DRM_XE_QUERY_ENGINE_CYCLES query provides a way for the user to obtain
> CPU and GPU timestamps as close to each other as possible.
> 
> Add a test to query engine cycles and GPU/CPU time correlation as well as
> validate the parameters.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> [Rodrigo rebased after s/cs/engine]

while fixing the naming here and in the kernel side I got confident
that this is the right test for that uapi and patch is correct:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  include/drm-uapi/xe_drm.h | 104 +++++++++++++++-----
>  tests/intel/xe_query.c    | 195 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 275 insertions(+), 24 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 13cd6a73d..8a702e6f4 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -128,6 +128,25 @@ struct xe_user_extension {
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>  
> +/** struct drm_xe_engine_class_instance - instance of an engine class */
> +struct drm_xe_engine_class_instance {
> +#define DRM_XE_ENGINE_CLASS_RENDER		0
> +#define DRM_XE_ENGINE_CLASS_COPY		1
> +#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
> +#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
> +#define DRM_XE_ENGINE_CLASS_COMPUTE		4
> +	/*
> +	 * Kernel only class (not actual hardware engine class). Used for
> +	 * creating ordered queues of VM bind operations.
> +	 */
> +#define DRM_XE_ENGINE_CLASS_VM_BIND		5
> +	__u16 engine_class;
> +
> +	__u16 engine_instance;
> +	__u16 gt_id;
> +	__u16 rsvd;
> +};
> +
>  /**
>   * enum drm_xe_memory_class - Supported memory classes.
>   */
> @@ -219,6 +238,60 @@ struct drm_xe_query_mem_region {
>  	__u64 reserved[6];
>  };
>  
> +/**
> + * struct drm_xe_query_engine_cycles - correlate CPU and GPU timestamps
> + *
> + * If a query is made with a struct drm_xe_device_query where .query is equal to
> + * DRM_XE_DEVICE_QUERY_ENGINE_CYCLES, then the reply uses struct drm_xe_query_engine_cycles
> + * in .data. struct drm_xe_query_engine_cycles is allocated by the user and
> + * .data points to this allocated structure.
> + *
> + * The query returns the engine cycles and the frequency that can
> + * be used to calculate the engine timestamp. In addition the
> + * query returns a set of cpu timestamps that indicate when the command
> + * streamer cycle count was captured.
> + */
> +struct drm_xe_query_engine_cycles {
> +	/**
> +	 * @eci: This is input by the user and is the engine for which command
> +	 * streamer cycles is queried.
> +	 */
> +	struct drm_xe_engine_class_instance eci;
> +
> +	/**
> +	 * @clockid: This is input by the user and is the reference clock id for
> +	 * CPU timestamp. For definition, see clock_gettime(2) and
> +	 * perf_event_open(2). Supported clock ids are CLOCK_MONOTONIC,
> +	 * CLOCK_MONOTONIC_RAW, CLOCK_REALTIME, CLOCK_BOOTTIME, CLOCK_TAI.
> +	 */
> +	__s32 clockid;
> +
> +	/** @width: Width of the engine cycle counter in bits. */
> +	__u32 width;
> +
> +	/**
> +	 * @engine_cycles: Engine cycles as read from its register
> +	 * at 0x358 offset.
> +	 */
> +	__u64 engine_cycles;
> +
> +	/** @engine_frequency: Frequency of the engine cycles in Hz. */
> +	__u64 engine_frequency;
> +
> +	/**
> +	 * @cpu_timestamp: CPU timestamp in ns. The timestamp is captured before
> +	 * reading the engine_cycles register using the reference clockid set by the
> +	 * user.
> +	 */
> +	__u64 cpu_timestamp;
> +
> +	/**
> +	 * @cpu_delta: Time delta in ns captured around reading the lower dword
> +	 * of the engine_cycles register.
> +	 */
> +	__u64 cpu_delta;
> +};
> +
>  /**
>   * struct drm_xe_query_mem_usage - describe memory regions and usage
>   *
> @@ -385,12 +458,13 @@ struct drm_xe_device_query {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -#define DRM_XE_DEVICE_QUERY_ENGINES	0
> -#define DRM_XE_DEVICE_QUERY_MEM_USAGE	1
> -#define DRM_XE_DEVICE_QUERY_CONFIG	2
> -#define DRM_XE_DEVICE_QUERY_GTS		3
> -#define DRM_XE_DEVICE_QUERY_HWCONFIG	4
> -#define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
> +#define DRM_XE_DEVICE_QUERY_ENGINES		0
> +#define DRM_XE_DEVICE_QUERY_MEM_USAGE		1
> +#define DRM_XE_DEVICE_QUERY_CONFIG		2
> +#define DRM_XE_DEVICE_QUERY_GTS			3
> +#define DRM_XE_DEVICE_QUERY_HWCONFIG		4
> +#define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
> +#define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
>  	/** @query: The type of data to query */
>  	__u32 query;
>  
> @@ -732,24 +806,6 @@ struct drm_xe_exec_queue_set_property {
>  	__u64 reserved[2];
>  };
>  
> -/** struct drm_xe_engine_class_instance - instance of an engine class */
> -struct drm_xe_engine_class_instance {
> -#define DRM_XE_ENGINE_CLASS_RENDER		0
> -#define DRM_XE_ENGINE_CLASS_COPY		1
> -#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
> -#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
> -#define DRM_XE_ENGINE_CLASS_COMPUTE		4
> -	/*
> -	 * Kernel only class (not actual hardware engine class). Used for
> -	 * creating ordered queues of VM bind operations.
> -	 */
> -#define DRM_XE_ENGINE_CLASS_VM_BIND		5
> -	__u16 engine_class;
> -
> -	__u16 engine_instance;
> -	__u16 gt_id;
> -};
> -
>  struct drm_xe_exec_queue_create {
>  #define XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
>  	/** @extensions: Pointer to the first extension struct, if any */
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index 5966968d3..3e7460ff4 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -476,6 +476,195 @@ test_query_invalid_extension(int fd)
>  	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
>  }
>  
> +static bool
> +query_engine_cycles_supported(int fd)
> +{
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = DRM_XE_DEVICE_QUERY_ENGINE_CYCLES,
> +		.size = 0,
> +		.data = 0,
> +	};
> +
> +	return igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query) == 0;
> +}
> +
> +static void
> +query_engine_cycles(int fd, struct drm_xe_query_engine_cycles *resp)
> +{
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = DRM_XE_DEVICE_QUERY_ENGINE_CYCLES,
> +		.size = sizeof(*resp),
> +		.data = to_user_pointer(resp),
> +	};
> +
> +	do_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
> +	igt_assert(query.size);
> +}
> +
> +static void
> +__engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
> +{
> +	struct drm_xe_query_engine_cycles ts1 = {};
> +	struct drm_xe_query_engine_cycles ts2 = {};
> +	uint64_t delta_cpu, delta_cs, delta_delta;
> +	unsigned int exec_queue;
> +	int i, usable = 0;
> +	igt_spin_t *spin;
> +	uint64_t ahnd;
> +	uint32_t vm;
> +	struct {
> +		int32_t id;
> +		const char *name;
> +	} clock[] = {
> +		{ CLOCK_MONOTONIC, "CLOCK_MONOTONIC" },
> +		{ CLOCK_MONOTONIC_RAW, "CLOCK_MONOTONIC_RAW" },
> +		{ CLOCK_REALTIME, "CLOCK_REALTIME" },
> +		{ CLOCK_BOOTTIME, "CLOCK_BOOTTIME" },
> +		{ CLOCK_TAI, "CLOCK_TAI" },
> +	};
> +
> +	igt_debug("engine[%u:%u]\n",
> +		  hwe->engine_class,
> +		  hwe->engine_instance);
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +	spin = igt_spin_new(fd, .ahnd = ahnd, .engine = exec_queue, .vm = vm);
> +
> +	/* Try a new clock every 10 iterations. */
> +#define NUM_SNAPSHOTS 10
> +	for (i = 0; i < NUM_SNAPSHOTS * ARRAY_SIZE(clock); i++) {
> +		int index = i / NUM_SNAPSHOTS;
> +
> +		ts1.eci = *hwe;
> +		ts1.clockid = clock[index].id;
> +
> +		ts2.eci = *hwe;
> +		ts2.clockid = clock[index].id;
> +
> +		query_engine_cycles(fd, &ts1);
> +		query_engine_cycles(fd, &ts2);
> +
> +		igt_debug("[1] cpu_ts before %llu, reg read time %llu\n",
> +			  ts1.cpu_timestamp,
> +			  ts1.cpu_delta);
> +		igt_debug("[1] engine_ts %llu, freq %llu Hz, width %u\n",
> +			  ts1.engine_cycles, ts1.engine_frequency, ts1.width);
> +
> +		igt_debug("[2] cpu_ts before %llu, reg read time %llu\n",
> +			  ts2.cpu_timestamp,
> +			  ts2.cpu_delta);
> +		igt_debug("[2] engine_ts %llu, freq %llu Hz, width %u\n",
> +			  ts2.engine_cycles, ts2.engine_frequency, ts2.width);
> +
> +		delta_cpu = ts2.cpu_timestamp - ts1.cpu_timestamp;
> +
> +		if (ts2.engine_cycles >= ts1.engine_cycles)
> +			delta_cs = (ts2.engine_cycles - ts1.engine_cycles) *
> +				   NSEC_PER_SEC / ts1.engine_frequency;
> +		else
> +			delta_cs = (((1 << ts2.width) - ts2.engine_cycles) + ts1.engine_cycles) *
> +				   NSEC_PER_SEC / ts1.engine_frequency;
> +
> +		igt_debug("delta_cpu[%lu], delta_cs[%lu]\n",
> +			  delta_cpu, delta_cs);
> +
> +		delta_delta = delta_cpu > delta_cs ?
> +			       delta_cpu - delta_cs :
> +			       delta_cs - delta_cpu;
> +		igt_debug("delta_delta %lu\n", delta_delta);
> +
> +		if (delta_delta < 5000)
> +			usable++;
> +
> +		/*
> +		 * User needs few good snapshots of the timestamps to
> +		 * synchronize cpu time with cs time. Check if we have enough
> +		 * usable values before moving to the next clockid.
> +		 */
> +		if (!((i + 1) % NUM_SNAPSHOTS)) {
> +			igt_debug("clock %s\n", clock[index].name);
> +			igt_debug("usable %d\n", usable);
> +			igt_assert(usable > 2);
> +			usable = 0;
> +		}
> +	}
> +
> +	igt_spin_free(fd, spin);
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +	put_ahnd(ahnd);
> +}
> +
> +/**
> + * SUBTEST: query-cs-cycles
> + * Description: Query CPU-GPU timestamp correlation
> + */
> +static void test_query_engine_cycles(int fd)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +
> +	igt_require(query_engine_cycles_supported(fd));
> +
> +	xe_for_each_hw_engine(fd, hwe) {
> +		igt_assert(hwe);
> +		__engine_cycles(fd, hwe);
> +	}
> +}
> +
> +/**
> + * SUBTEST: query-invalid-cs-cycles
> + * Description: Check query with invalid arguments returns expected error code.
> + */
> +static void test_engine_cycles_invalid(int fd)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct drm_xe_query_engine_cycles ts = {};
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = DRM_XE_DEVICE_QUERY_ENGINE_CYCLES,
> +		.size = sizeof(ts),
> +		.data = to_user_pointer(&ts),
> +	};
> +
> +	igt_require(query_engine_cycles_supported(fd));
> +
> +	/* get one engine */
> +	xe_for_each_hw_engine(fd, hwe)
> +		break;
> +
> +	/* sanity check engine selection is valid */
> +	ts.eci = *hwe;
> +	query_engine_cycles(fd, &ts);
> +
> +	/* bad instance */
> +	ts.eci = *hwe;
> +	ts.eci.engine_instance = 0xffff;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
> +	ts.eci = *hwe;
> +
> +	/* bad class */
> +	ts.eci.engine_class = 0xffff;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
> +	ts.eci = *hwe;
> +
> +	/* bad gt */
> +	ts.eci.gt_id = 0xffff;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
> +	ts.eci = *hwe;
> +
> +	/* bad clockid */
> +	ts.clockid = -1;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
> +	ts.clockid = 0;
> +
> +	/* sanity check */
> +	query_engine_cycles(fd, &ts);
> +}
> +
>  igt_main
>  {
>  	int xe;
> @@ -501,6 +690,12 @@ igt_main
>  	igt_subtest("query-topology")
>  		test_query_gt_topology(xe);
>  
> +	igt_subtest("query-cs-cycles")
> +		test_query_engine_cycles(xe);
> +
> +	igt_subtest("query-invalid-cs-cycles")
> +		test_engine_cycles_invalid(xe);
> +
>  	igt_subtest("query-invalid-query")
>  		test_query_invalid_query(xe);
>  
> -- 
> 2.34.1
> 
