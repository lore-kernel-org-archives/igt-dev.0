Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BC710E3E8
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 13:01:27 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Sep 2023 13:00:46 +0000
Message-Id: <20230926130054.6-17-francois.dugast@intel.com>
In-Reply-To: <20230926130054.6-1-francois.dugast@intel.com>
References: <20230926130054.6-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 16/24] drm-uapi/xe: Align with Crystal
 Reference Clock updates
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

This patch only aims the simplest update as possible to get rid
of the ref_clock in favor of the cs_reference_clock, aligning
with the uapi changes on commit
b53c288afe30 ("drm/xe/uapi: Crystal Reference Clock updates")

This is a non-functional change since the values are exactly
the same. Any issues with current tests would still be present.
Any further update to xe_spin should be done in follow-up updates.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 10 ++++------
 lib/xe/xe_query.c         | 21 +++++++++++++++++++++
 lib/xe/xe_query.h         |  1 +
 lib/xe/xe_spin.c          | 11 +++++------
 tests/intel/xe_query.c    | 31 ++++++++-----------------------
 5 files changed, 39 insertions(+), 35 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index df0455450..8e59b98e5 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -249,8 +249,8 @@ struct drm_xe_query_mem_region {
  * relevant GPU timestamp. clockid is used to return the specific CPU
  * timestamp.
  *
- * The query returns the command streamer cycles and the frequency that can
- * be used to calculate the command streamer timestamp. In addition the
+ * The query returns the command streamer cycles and the reference clock that
+ * can be used to calculate the command streamer timestamp. In addition the
  * query returns a set of cpu timestamps that indicate when the command
  * streamer cycle count was captured.
  */
@@ -267,8 +267,8 @@ struct drm_xe_query_cs_cycles {
 	 */
 	__u64 cs_cycles;
 
-	/** Frequency of the cs cycles in Hz. */
-	__u64 cs_frequency;
+	/** Reference Clock of the cs cycles in Hz. */
+	__u64 cs_reference_clock;
 
 	/**
 	 * CPU timestamp in ns. The timestamp is captured before reading the
@@ -382,8 +382,6 @@ struct drm_xe_query_gt {
 	__u16 type;
 	/** @gt_id: Unique ID of this GT within the PCI Device */
 	__u16 gt_id;
-	/** @clock_freq: A clock frequency for timestamp */
-	__u32 clock_freq;
 	/**
 	 * @native_mem_regions: Bit mask of instances from
 	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 986a3a0c1..61d71ef26 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -328,6 +328,27 @@ bool xe_supports_faults(int fd)
 	return supports_faults;
 }
 
+/**
+ * xe_query_cs_cycles:
+ * @fd: xe device fd
+ * @resp: A pointer to a drm_xe_query_cs_cycles to get the output of the query
+ *
+ * Full DRM_XE_QUERY_CS_CYCLES returning the response on the
+ * struct drm_xe_query_cs_cycles pointer argument.
+ */
+void xe_query_cs_cycles(int fd, struct drm_xe_query_cs_cycles *resp)
+{
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_QUERY_CS_CYCLES,
+		.size = sizeof(*resp),
+		.data = to_user_pointer(resp),
+	};
+
+	do_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
+	igt_assert(query.size);
+}
+
 static void xe_device_destroy_cache(void)
 {
 	pthread_mutex_lock(&cache.cache_mutex);
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index da7deaf4c..da4461306 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -102,6 +102,7 @@ uint32_t xe_get_default_alignment(int fd);
 uint32_t xe_va_bits(int fd);
 uint16_t xe_dev_id(int fd);
 bool xe_supports_faults(int fd);
+void xe_query_cs_cycles(int fd, struct drm_xe_query_cs_cycles *resp);
 const char *xe_engine_class_string(uint32_t engine_class);
 bool xe_has_engine_class(int fd, uint16_t engine_class);
 
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index b05b38829..986d63cb4 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -16,14 +16,13 @@
 #include "xe_ioctl.h"
 #include "xe_spin.h"
 
-static uint32_t read_timestamp_frequency(int fd, int gt_id)
+static uint32_t read_timestamp_frequency(int fd)
 {
-	struct xe_device *dev = xe_device_get(fd);
+	struct drm_xe_query_cs_cycles ts = {};
 
-	igt_assert(dev && dev->gt_list && dev->gt_list->num_gt);
-	igt_assert(gt_id >= 0 && gt_id <= dev->gt_list->num_gt);
+	xe_query_cs_cycles(fd, &ts);
 
-	return dev->gt_list->gt_list[gt_id].clock_freq;
+	return ts.cs_reference_clock;
 }
 
 static uint64_t div64_u64_round_up(const uint64_t x, const uint64_t y)
@@ -43,7 +42,7 @@ static uint64_t div64_u64_round_up(const uint64_t x, const uint64_t y)
  */
 uint32_t duration_to_ctx_ticks(int fd, int gt_id, uint64_t duration_ns)
 {
-	uint32_t f = read_timestamp_frequency(fd, gt_id);
+	uint32_t f = read_timestamp_frequency(fd);
 	uint64_t ctx_ticks = div64_u64_round_up(duration_ns * f, NSEC_PER_SEC);
 
 	igt_assert_lt_u64(ctx_ticks, XE_SPIN_MAX_CTX_TICKS);
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 17215fd72..872b889f9 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -280,7 +280,6 @@ test_query_gt_list(int fd)
 	for (i = 0; i < gt_list->num_gt; i++) {
 		igt_info("type: %d\n", gt_list->gt_list[i].type);
 		igt_info("gt_id: %d\n", gt_list->gt_list[i].gt_id);
-		igt_info("clock_freq: %u\n", gt_list->gt_list[i].clock_freq);
 		igt_info("native_mem_regions: 0x%016llx\n",
 		       gt_list->gt_list[i].native_mem_regions);
 		igt_info("slow_mem_regions: 0x%016llx\n",
@@ -488,20 +487,6 @@ query_cs_cycles_supported(int fd)
 	return igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query) == 0;
 }
 
-static void
-query_cs_cycles(int fd, struct drm_xe_query_cs_cycles *resp)
-{
-	struct drm_xe_device_query query = {
-		.extensions = 0,
-		.query = DRM_XE_QUERY_CS_CYCLES,
-		.size = sizeof(*resp),
-		.data = to_user_pointer(resp),
-	};
-
-	do_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
-	igt_assert(query.size);
-}
-
 static void
 __cs_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
 {
@@ -544,29 +529,29 @@ __cs_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
 		ts2.eci = *hwe;
 		ts2.clockid = clock[index].id;
 
-		query_cs_cycles(fd, &ts1);
-		query_cs_cycles(fd, &ts2);
+		xe_query_cs_cycles(fd, &ts1);
+		xe_query_cs_cycles(fd, &ts2);
 
 		igt_debug("[1] cpu_ts before %llu, reg read time %llu\n",
 			  ts1.cpu_timestamp,
 			  ts1.cpu_delta);
 		igt_debug("[1] cs_ts %llu, freq %llu Hz, width %u\n",
-			  ts1.cs_cycles, ts1.cs_frequency, ts1.width);
+			  ts1.cs_cycles, ts1.cs_reference_clock, ts1.width);
 
 		igt_debug("[2] cpu_ts before %llu, reg read time %llu\n",
 			  ts2.cpu_timestamp,
 			  ts2.cpu_delta);
 		igt_debug("[2] cs_ts %llu, freq %llu Hz, width %u\n",
-			  ts2.cs_cycles, ts2.cs_frequency, ts2.width);
+			  ts2.cs_cycles, ts2.cs_reference_clock, ts2.width);
 
 		delta_cpu = ts2.cpu_timestamp - ts1.cpu_timestamp;
 
 		if (ts2.cs_cycles >= ts1.cs_cycles)
 			delta_cs = (ts2.cs_cycles - ts1.cs_cycles) *
-				   NSEC_PER_SEC / ts1.cs_frequency;
+				   NSEC_PER_SEC / ts1.cs_reference_clock;
 		else
 			delta_cs = (((1 << ts2.width) - ts2.cs_cycles) + ts1.cs_cycles) *
-				   NSEC_PER_SEC / ts1.cs_frequency;
+				   NSEC_PER_SEC / ts1.cs_reference_clock;
 
 		igt_debug("delta_cpu[%lu], delta_cs[%lu]\n",
 			  delta_cpu, delta_cs);
@@ -637,7 +622,7 @@ static void test_cs_cycles_invalid(int fd)
 
 	/* sanity check engine selection is valid */
 	ts.eci = *hwe;
-	query_cs_cycles(fd, &ts);
+	xe_query_cs_cycles(fd, &ts);
 
 	/* bad instance */
 	ts.eci = *hwe;
@@ -666,7 +651,7 @@ static void test_cs_cycles_invalid(int fd)
 	ts.clockid = 0;
 
 	/* sanity check */
-	query_cs_cycles(fd, &ts);
+	xe_query_cs_cycles(fd, &ts);
 }
 
 igt_main
-- 
2.34.1
