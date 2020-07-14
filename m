Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E766E929
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2020 07:13:35 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Tue, 14 Jul 2020 00:13:34 -0700
Message-Id: <20200714071334.69883-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] i915/perf: Sanity check reports in mapped OA
 buffer
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
To: Lionel G Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

For applications that need a faster way to access reports in the OA
buffer, i915 now provides a way to map the OA buffer to privileged user
space. Add a test to sanity check reports in the mapped OA buffer.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 include/drm-uapi/i915_drm.h |  19 +++++++
 tests/i915/perf.c           | 100 ++++++++++++++++++++++++++++++++++++
 2 files changed, 119 insertions(+)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index 2b55af13..d03ee5dd 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -2048,6 +2048,25 @@ struct drm_i915_perf_open_param {
  */
 #define I915_PERF_IOCTL_CONFIG	_IO('i', 0x2)
 
+/**
+ * Returns OA buffer properties.
+ *
+ * This ioctl is available in perf revision 6.
+ */
+#define I915_PERF_IOCTL_GET_OA_BUFFER_INFO _IO('i', 0x3)
+
+/**
+ * OA buffer information structure.
+ */
+struct drm_i915_perf_oa_buffer_info {
+	__u32 size;
+	__u32 head;
+	__u32 tail;
+	__u32 gpu_address;
+	__u64 cpu_address;
+	__u64 reserved[4];
+};
+
 /**
  * Common to all i915 perf records
  */
diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 92edc9f1..194569e1 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -204,6 +204,7 @@ static struct intel_perf *intel_perf = NULL;
 static struct intel_perf_metric_set *test_set = NULL;
 static bool *undefined_a_counters;
 static uint64_t oa_exp_1_millisec;
+struct intel_mmio_data mmio_data;
 
 static igt_render_copyfunc_t render_copy = NULL;
 static uint32_t (*read_report_ticks)(uint32_t *report,
@@ -4768,6 +4769,95 @@ test_whitelisted_registers_userspace_config(void)
 	i915_perf_remove_config(drm_fd, config_id);
 }
 
+#define OA_BUFFER_DATA(tail, head, oa_buffer_size) \
+	(((tail) - (head)) & ((oa_buffer_size) - 1))
+
+static void dump_oa_buffer_info(struct drm_i915_perf_oa_buffer_info *oa_buffer)
+{
+	igt_debug("size        = %d\n", oa_buffer->size);
+	igt_debug("head        = %x\n", oa_buffer->head);
+	igt_debug("tail        = %x\n", oa_buffer->tail);
+	igt_debug("gpu_address = %x\n", oa_buffer->gpu_address);
+	igt_debug("cpu_address = %llx\n", oa_buffer->cpu_address);
+}
+
+static uint32_t oa_status_reg(void)
+{
+	if (IS_HASWELL(devid))
+		return intel_register_read(&mmio_data, 0x2346) & 0x7;
+	else if (IS_GEN12(devid))
+		return intel_register_read(&mmio_data, 0xdafc) & 0x7;
+	else
+		return intel_register_read(&mmio_data, 0x2b08) & 0xf;
+}
+
+static void check_reports_from_mapped_buffer(enum drm_i915_oa_format fmt,
+					     int oa_exponent)
+{
+	struct drm_i915_perf_oa_buffer_info oa_buffer;
+	struct oa_format format = get_oa_format(fmt);
+	size_t report_size = format.size;
+	uint8_t *reports;
+	uint32_t *report0, *report1;
+	uint32_t offset, num_reports, timer_reports = 0;
+	uint32_t period_us = oa_exponent_to_ns(oa_exponent) / 1000;
+	int i;
+
+	/* wait for approx 100 reports */
+	usleep(100 * period_us);
+	do_ioctl(stream_fd, I915_PERF_IOCTL_GET_OA_BUFFER_INFO, &oa_buffer);
+	dump_oa_buffer_info(&oa_buffer);
+
+	igt_assert_eq(oa_buffer.size & (oa_buffer.size - 1), 0);
+	igt_assert_neq(oa_buffer.head, 0);
+	igt_assert_neq(oa_buffer.tail, 0);
+	igt_assert_neq(oa_buffer.gpu_address, 0);
+	igt_assert_neq(oa_buffer.cpu_address, 0);
+
+	igt_assert_eq(oa_status_reg(), 0);
+
+	offset = oa_buffer.head - oa_buffer.gpu_address;
+	reports = (uint8_t *) (oa_buffer.cpu_address + offset);
+
+	num_reports = OA_BUFFER_DATA(oa_buffer.tail,
+				     oa_buffer.head,
+				     oa_buffer.size) / report_size;
+
+	for (i = 0; i < num_reports; i++) {
+		report1 = (uint32_t *)(reports + (i * report_size));
+		if (!oa_report_is_periodic(oa_exponent, report1))
+			continue;
+
+		timer_reports++;
+		if (timer_reports >= 2)
+			sanity_check_reports(report0, report1, fmt);
+
+		report0 = report1;
+	}
+}
+
+static void test_mapped_oa_buffer(void)
+{
+	int oa_exponent = max_oa_exponent_for_period_lte(1000000);
+	enum drm_i915_oa_format fmt = test_set->perf_oa_format;
+	uint64_t properties[] = {
+		DRM_I915_PERF_PROP_SAMPLE_OA, true,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, fmt,
+		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
+
+	};
+	struct drm_i915_perf_open_param param = {
+		.flags = I915_PERF_FLAG_FD_CLOEXEC,
+		.num_properties = sizeof(properties) / 16,
+		.properties_ptr = to_user_pointer(properties),
+	};
+
+	stream_fd = __perf_open(drm_fd, &param, false);
+	check_reports_from_mapped_buffer(fmt, oa_exponent);
+	__perf_close(stream_fd);
+}
+
 static unsigned
 read_i915_module_ref(void)
 {
@@ -4936,6 +5026,9 @@ igt_main
 
 		render_copy = igt_get_render_copyfunc(devid);
 		igt_require_f(render_copy, "no render-copy function\n");
+
+		intel_register_access_init(&mmio_data, intel_get_pci_device(),
+					   0, drm_fd);
 	}
 
 	igt_subtest("non-system-wide-paranoid")
@@ -5096,6 +5189,12 @@ igt_main
 	igt_subtest("whitelisted-registers-userspace-config")
 		test_whitelisted_registers_userspace_config();
 
+	igt_describe("Verify mapping of oa buffer to umd");
+	igt_subtest("mapped-oa-buffer") {
+		igt_require(i915_perf_revision(drm_fd) >= 6);
+		test_mapped_oa_buffer();
+	}
+
 	igt_fixture {
 		/* leave sysctl options in their default state... */
 		write_u64_file("/proc/sys/dev/i915/oa_max_sample_rate", 100000);
@@ -5104,6 +5203,7 @@ igt_main
 		if (intel_perf)
 			intel_perf_free(intel_perf);
 
+		intel_register_access_fini(&mmio_data);
 		close(drm_fd);
 	}
 }
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
