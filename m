Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1148B6EC30
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Mar 2021 19:41:14 +0000 (UTC)
Date: Fri, 5 Mar 2021 11:41:12 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <20210305194112.GB43942@orsosgc001.ra.intel.com>
References: <20210305193708.50364-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210305193708.50364-1-umesh.nerlige.ramappa@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/perf: Add test to query CS
 timestamp
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Mar 05, 2021 at 11:37:08AM -0800, Umesh Nerlige Ramappa wrote:
>Add tests to query CS timestamps for different engines.
>
>v2:
>- remove flag parameter
>- assert for minimum usable values rather than maximum
>
>v3:
>- use clock id for cpu timestamps (Lionel)
>- check if query is supported (Ashutosh)
>- test bad queries
>
>v4: (Chris, Tvrtko)
>- cs_timestamp is a misnomer, use cs_cycles instead
>- use cs cycle frequency returned in the query
>- omit size parameter
>
>v5:
>- use __for_each_physical_engine (Lionel)
>- check for ENODEV (Umesh)
>
>v6: Use 2 cpu timestamps to calculate reg read time (Lionel)
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Missed out the previous R-b from Lionel. The only additional change is 
logs printing time taken to read the register.

Thanks,
Umesh

>---
> include/drm-uapi/i915_drm.h |  48 +++++++++
> tests/i915/i915_query.c     | 189 ++++++++++++++++++++++++++++++++++++
> 2 files changed, 237 insertions(+)
>
>diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
>index bf9ea471..0e50302f 100644
>--- a/include/drm-uapi/i915_drm.h
>+++ b/include/drm-uapi/i915_drm.h
>@@ -2176,6 +2176,10 @@ struct drm_i915_query_item {
> #define DRM_I915_QUERY_TOPOLOGY_INFO    1
> #define DRM_I915_QUERY_ENGINE_INFO	2
> #define DRM_I915_QUERY_PERF_CONFIG      3
>+	/**
>+	 * Query Command Streamer timestamp register.
>+	 */
>+#define DRM_I915_QUERY_CS_CYCLES	4
> /* Must be kept compact -- no holes and well documented */
>
> 	/*
>@@ -2309,6 +2313,50 @@ struct drm_i915_engine_info {
> 	__u64 rsvd1[4];
> };
>
>+/**
>+ * struct drm_i915_query_cs_cycles
>+ *
>+ * The query returns the command streamer cycles and the frequency that can be
>+ * used to calculate the command streamer timestamp. In addition the query
>+ * returns a set of cpu timestamps that indicate when the command streamer cycle
>+ * count was captured.
>+ */
>+struct drm_i915_query_cs_cycles {
>+	/** Engine for which command streamer cycles is queried. */
>+	struct i915_engine_class_instance engine;
>+
>+	/** Must be zero. */
>+	__u32 flags;
>+
>+	/**
>+	 * Command streamer cycles as read from the command streamer
>+	 * register at 0x358 offset.
>+	 */
>+	__u64 cs_cycles;
>+
>+	/** Frequency of the cs cycles in Hz. */
>+	__u64 cs_frequency;
>+
>+	/**
>+	 * CPU timestamps in ns. cpu_timestamp[0] is captured before reading the
>+	 * cs_cycles register using the reference clockid set by the user.
>+	 * cpu_timestamp[1] is the time taken in ns to read the lower dword of
>+	 * the cs_cycles register.
>+	 */
>+	__u64 cpu_timestamp[2];
>+
>+	/**
>+	 * Reference clock id for CPU timestamp. For definition, see
>+	 * clock_gettime(2) and perf_event_open(2). Supported clock ids are
>+	 * CLOCK_MONOTONIC, CLOCK_MONOTONIC_RAW, CLOCK_REALTIME, CLOCK_BOOTTIME,
>+	 * CLOCK_TAI.
>+	 */
>+	__s32 clockid;
>+
>+	/** Must be zero. */
>+	__u32 rsvd;
>+};
>+
> /**
>  * struct drm_i915_query_engine_info
>  *
>diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
>index 29b938e9..2ab3905b 100644
>--- a/tests/i915/i915_query.c
>+++ b/tests/i915/i915_query.c
>@@ -267,6 +267,182 @@ eu_available(const struct drm_i915_query_topology_info *topo_info,
> 				eu / 8] >> (eu % 8)) & 1;
> }
>
>+static bool query_cs_cycles_supported(int fd)
>+{
>+	struct drm_i915_query_item item = {
>+		.query_id = DRM_I915_QUERY_CS_CYCLES,
>+	};
>+
>+	return __i915_query_items(fd, &item, 1) == 0 && item.length > 0;
>+}
>+
>+static void __query_cs_cycles(int i915, void *data, int err)
>+{
>+	struct drm_i915_query_item item = {
>+		.query_id = DRM_I915_QUERY_CS_CYCLES,
>+		.data_ptr = to_user_pointer(data),
>+		.length = sizeof(struct drm_i915_query_cs_cycles),
>+	};
>+
>+	i915_query_items(i915, &item, 1);
>+
>+	if (err)
>+		igt_assert(item.length == -err);
>+}
>+
>+static bool engine_has_cs_cycles(int i915, uint16_t class, uint16_t instance)
>+{
>+	struct drm_i915_query_cs_cycles ts = {};
>+	struct drm_i915_query_item item = {
>+		.query_id = DRM_I915_QUERY_CS_CYCLES,
>+		.data_ptr = to_user_pointer(&ts),
>+		.length = sizeof(struct drm_i915_query_cs_cycles),
>+	};
>+
>+	ts.engine.engine_class = class;
>+	ts.engine.engine_instance = instance;
>+
>+	i915_query_items(i915, &item, 1);
>+
>+	return item.length != -ENODEV;
>+}
>+
>+static void
>+__cs_cycles(int i915, struct i915_engine_class_instance *engine)
>+{
>+	struct drm_i915_query_cs_cycles ts1 = {};
>+	struct drm_i915_query_cs_cycles ts2 = {};
>+	uint64_t delta_cpu, delta_cs, delta_delta;
>+	int i, usable = 0;
>+	struct {
>+		int32_t id;
>+		const char *name;
>+	} clock[] = {
>+		{ CLOCK_MONOTONIC, "CLOCK_MONOTONIC" },
>+		{ CLOCK_MONOTONIC_RAW, "CLOCK_MONOTONIC_RAW" },
>+		{ CLOCK_REALTIME, "CLOCK_REALTIME" },
>+		{ CLOCK_BOOTTIME, "CLOCK_BOOTTIME" },
>+		{ CLOCK_TAI, "CLOCK_TAI" },
>+	};
>+
>+	igt_debug("engine[%u:%u]\n",
>+		  engine->engine_class,
>+		  engine->engine_instance);
>+
>+	/* Try a new clock every 10 iterations. */
>+#define NUM_SNAPSHOTS 10
>+	for (i = 0; i < NUM_SNAPSHOTS * ARRAY_SIZE(clock); i++) {
>+		int index = i / NUM_SNAPSHOTS;
>+
>+		ts1.engine = *engine;
>+		ts1.clockid = clock[index].id;
>+
>+		ts2.engine = *engine;
>+		ts2.clockid = clock[index].id;
>+
>+		__query_cs_cycles(i915, &ts1, 0);
>+		__query_cs_cycles(i915, &ts2, 0);
>+
>+		igt_debug("[1] cpu_ts before %llu, reg read time %llu\n",
>+			  ts1.cpu_timestamp[0],
>+			  ts1.cpu_timestamp[1]);
>+		igt_debug("[1] cs_ts %llu, freq %llu Hz\n",
>+			  ts1.cs_cycles, ts1.cs_frequency);
>+
>+		igt_debug("[2] cpu_ts before %llu, reg read time %llu\n",
>+			  ts2.cpu_timestamp[0],
>+			  ts2.cpu_timestamp[1]);
>+		igt_debug("[2] cs_ts %llu, freq %llu Hz\n",
>+			  ts2.cs_cycles, ts2.cs_frequency);
>+
>+		delta_cpu = ts2.cpu_timestamp[0] - ts1.cpu_timestamp[0];
>+		delta_cs = (ts2.cs_cycles - ts1.cs_cycles) *
>+			   NSEC_PER_SEC / ts1.cs_frequency;
>+
>+		igt_debug("delta_cpu[%lu], delta_cs[%lu]\n",
>+			  delta_cpu, delta_cs);
>+
>+		delta_delta = delta_cpu > delta_cs ?
>+			       delta_cpu - delta_cs :
>+			       delta_cs - delta_cpu;
>+		igt_debug("delta_delta %lu\n", delta_delta);
>+
>+		if (delta_delta < 5000)
>+			usable++;
>+
>+		/*
>+		 * User needs few good snapshots of the timestamps to
>+		 * synchronize cpu time with cs time. Check if we have enough
>+		 * usable values before moving to the next clockid.
>+		 */
>+		if (!((i + 1) % NUM_SNAPSHOTS)) {
>+			igt_debug("clock %s\n", clock[index].name);
>+			igt_debug("usable %d\n", usable);
>+			igt_assert(usable > 2);
>+			usable = 0;
>+		}
>+	}
>+}
>+
>+static void test_cs_cycles(int i915)
>+{
>+	const struct intel_execution_engine2 *e;
>+	struct i915_engine_class_instance engine;
>+
>+	__for_each_physical_engine(i915, e) {
>+		if (engine_has_cs_cycles(i915, e->class, e->instance)) {
>+			engine.engine_class = e->class;
>+			engine.engine_instance = e->instance;
>+			__cs_cycles(i915, &engine);
>+		}
>+	}
>+}
>+
>+static void test_cs_cycles_invalid(int i915)
>+{
>+	struct i915_engine_class_instance engine;
>+	const struct intel_execution_engine2 *e;
>+	struct drm_i915_query_cs_cycles ts = {};
>+
>+	/* get one engine */
>+	__for_each_physical_engine(i915, e)
>+		break;
>+
>+	/* bad engines */
>+	ts.engine.engine_class = e->class;
>+	ts.engine.engine_instance = -1;
>+	__query_cs_cycles(i915, &ts, EINVAL);
>+
>+	ts.engine.engine_class = -1;
>+	ts.engine.engine_instance = e->instance;
>+	__query_cs_cycles(i915, &ts, EINVAL);
>+
>+	ts.engine.engine_class = -1;
>+	ts.engine.engine_instance = -1;
>+	__query_cs_cycles(i915, &ts, EINVAL);
>+
>+	/* non zero flags */
>+	ts.flags = 1;
>+	ts.engine.engine_class = e->class;
>+	ts.engine.engine_instance = e->instance;
>+	__query_cs_cycles(i915, &ts, EINVAL);
>+
>+	/* non zero rsvd field */
>+	ts.flags = 0;
>+	ts.rsvd = 1;
>+	__query_cs_cycles(i915, &ts, EINVAL);
>+
>+	/* bad clockid */
>+	ts.rsvd = 0;
>+	ts.clockid = -1;
>+	__query_cs_cycles(i915, &ts, EINVAL);
>+
>+	/* sanity check */
>+	engine.engine_class = e->class;
>+	engine.engine_instance = e->instance;
>+	__cs_cycles(i915, &engine);
>+}
>+
> /*
>  * Verify that we get coherent values between the legacy getparam slice/subslice
>  * masks and the new topology query.
>@@ -783,6 +959,19 @@ igt_main
> 			engines(fd);
> 	}
>
>+	igt_subtest_group {
>+		igt_fixture {
>+			igt_require(intel_gen(devid) >= 6);
>+			igt_require(query_cs_cycles_supported(fd));
>+		}
>+
>+		igt_subtest("cs-cycles")
>+			test_cs_cycles(fd);
>+
>+		igt_subtest("cs-cycles-invalid")
>+			test_cs_cycles_invalid(fd);
>+	}
>+
> 	igt_fixture {
> 		close(fd);
> 	}
>-- 
>2.20.1
>
>_______________________________________________
>igt-dev mailing list
>igt-dev@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
