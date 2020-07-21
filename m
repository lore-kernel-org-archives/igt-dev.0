Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D5F89A5E
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2020 01:57:18 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Mon, 20 Jul 2020 18:57:17 -0700
Message-Id: <20200721015717.46279-2-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200721015717.46279-1-umesh.nerlige.ramappa@intel.com>
References: <20200721015717.46279-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 2/2] i915/perf: Sanity check reports in mapped OA
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

For applications that need a faster way to access reports in the OA
buffer, i915 now provides a way to map the OA buffer to privileged user
space. Add a test to sanity check reports in the mapped OA buffer.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 include/drm-uapi/i915_drm.h |  32 +++++
 tests/i915/perf.c           | 241 ++++++++++++++++++++++++++++++++++++
 2 files changed, 273 insertions(+)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index 2b55af13..f7523d55 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -2048,6 +2048,38 @@ struct drm_i915_perf_open_param {
  */
 #define I915_PERF_IOCTL_CONFIG	_IO('i', 0x2)
 
+/**
+ * Returns OA buffer properties to be used with mmap.
+ *
+ * This ioctl is available in perf revision 6.
+ */
+#define I915_PERF_IOCTL_GET_OA_BUFFER_INFO _IO('i', 0x3)
+
+/**
+ * OA buffer size and offset.
+ */
+struct drm_i915_perf_oa_buffer_info {
+	__u32 size;
+	__u32 offset;
+	__u64 reserved[4];
+};
+
+/**
+ * Returns current position of OA buffer head and tail.
+ *
+ * This ioctl is available in perf revision 6.
+ */
+#define I915_PERF_IOCTL_GET_OA_BUFFER_HEAD_TAIL _IO('i', 0x4)
+
+/**
+ * OA buffer head and tail.
+ */
+struct drm_i915_perf_oa_buffer_head_tail {
+	__u32 head;
+	__u32 tail;
+	__u64 reserved[4];
+};
+
 /**
  * Common to all i915 perf records
  */
diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index eb38ea12..b7aa1596 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -206,6 +206,7 @@ static struct intel_perf *intel_perf = NULL;
 static struct intel_perf_metric_set *test_set = NULL;
 static bool *undefined_a_counters;
 static uint64_t oa_exp_1_millisec;
+struct intel_mmio_data mmio_data;
 
 static igt_render_copyfunc_t render_copy = NULL;
 static uint32_t (*read_report_ticks)(uint32_t *report,
@@ -5011,6 +5012,220 @@ test_whitelisted_registers_userspace_config(void)
 	i915_perf_remove_config(drm_fd, config_id);
 }
 
+#define OA_BUFFER_DATA(tail, head, oa_buffer_size) \
+	(((tail) - (head)) & ((oa_buffer_size) - 1))
+
+#ifndef MAP_FAILED
+#define MAP_FAILED ((void *)-1)
+#endif
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
+static void invalid_map_oa_buffer(void)
+{
+	struct drm_i915_perf_oa_buffer_info oa_buffer;
+	void *oa_vaddr = NULL;
+
+	do_ioctl(stream_fd, I915_PERF_IOCTL_GET_OA_BUFFER_INFO, &oa_buffer);
+
+	igt_debug("size        = %d\n", oa_buffer.size);
+	igt_debug("offset      = %x\n", oa_buffer.offset);
+
+	igt_assert_eq(oa_buffer.size & (oa_buffer.size - 1), 0);
+
+	/* try a couple invalid mmaps */
+	/* bad offsets */
+	oa_vaddr = mmap(0, oa_buffer.size, PROT_READ, MAP_PRIVATE, stream_fd, 0);
+	igt_assert(oa_vaddr == MAP_FAILED);
+
+	oa_vaddr = mmap(0, oa_buffer.size, PROT_READ, MAP_PRIVATE, stream_fd, 8192);
+	igt_assert(oa_vaddr == MAP_FAILED);
+
+	oa_vaddr = mmap(0, oa_buffer.size, PROT_READ, MAP_PRIVATE, stream_fd, 11);
+	igt_assert(oa_vaddr == MAP_FAILED);
+
+	/* bad size */
+	oa_vaddr = mmap(0, oa_buffer.size + 1, PROT_READ, MAP_PRIVATE, stream_fd, oa_buffer.offset);
+	igt_assert(oa_vaddr == MAP_FAILED);
+
+	/* do the right thing */
+	oa_vaddr = mmap(0, oa_buffer.size, PROT_READ, MAP_PRIVATE, stream_fd, oa_buffer.offset);
+	igt_assert(oa_vaddr != NULL);
+
+	munmap(oa_vaddr, oa_buffer.size);
+}
+
+static void *map_oa_buffer(uint32_t *size)
+{
+	struct drm_i915_perf_oa_buffer_info oa_buffer;
+	void *vaddr;
+
+	do_ioctl(stream_fd, I915_PERF_IOCTL_GET_OA_BUFFER_INFO, &oa_buffer);
+
+	igt_debug("size        = %d\n", oa_buffer.size);
+	igt_debug("offset      = %x\n", oa_buffer.offset);
+
+	igt_assert_eq(oa_buffer.size & (oa_buffer.size - 1), 0);
+	igt_assert_eq(oa_status_reg(), 0);
+
+	vaddr = mmap(0, oa_buffer.size, PROT_READ, MAP_PRIVATE, stream_fd, oa_buffer.offset);
+	igt_assert(vaddr != NULL);
+
+	*size = oa_buffer.size;
+
+	return vaddr;
+}
+
+static void unmap_oa_buffer(void *addr, uint32_t size)
+{
+	munmap(addr, size);
+}
+
+static void check_reports(void *oa_vaddr, uint32_t oa_size)
+{
+	struct drm_i915_perf_oa_buffer_head_tail oa_ht;
+	struct oa_format format = get_oa_format(test_set->perf_oa_format);
+	size_t report_size = format.size;
+	uint8_t *reports;
+	uint32_t *report0, *report1;
+	uint32_t num_reports, timer_reports = 0;
+	int i;
+
+	do_ioctl(stream_fd, I915_PERF_IOCTL_GET_OA_BUFFER_HEAD_TAIL, &oa_ht);
+
+	igt_debug("head = %x\n", oa_ht.head);
+	igt_debug("tail = %x\n", oa_ht.tail);
+
+	reports = (uint8_t *) (oa_vaddr + oa_ht.head);
+
+	num_reports = OA_BUFFER_DATA(oa_ht.tail,
+				     oa_ht.head,
+				     oa_size) / report_size;
+
+	for (i = 0; i < num_reports; i++) {
+		report1 = (uint32_t *)(reports + (i * report_size));
+		if (!oa_report_is_periodic(oa_exp_1_millisec, report1))
+			continue;
+
+		timer_reports++;
+		if (timer_reports >= 2)
+			sanity_check_reports(report0, report1,
+					     test_set->perf_oa_format);
+
+		report0 = report1;
+	}
+}
+
+static void check_reports_from_mapped_buffer(void)
+{
+	void *vaddr;
+	uint32_t size;
+	uint32_t period_us = oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
+
+	vaddr = map_oa_buffer(&size);
+
+	/* wait for approx 100 reports */
+	usleep(100 * period_us);
+
+	check_reports(vaddr, size);
+
+	unmap_oa_buffer(vaddr, size);
+}
+
+static void try_to_map_oa_buffer(void)
+{
+	struct drm_i915_perf_oa_buffer_info oa_buffer;
+	struct drm_i915_perf_oa_buffer_head_tail oa_ht;
+	void *oa_vaddr;
+
+	igt_info("Mapping OA buffer as non-privileged user\n");
+
+	do_ioctl_err(stream_fd, I915_PERF_IOCTL_GET_OA_BUFFER_INFO,
+		     &oa_buffer, EACCES);
+
+	do_ioctl_err(stream_fd, I915_PERF_IOCTL_GET_OA_BUFFER_HEAD_TAIL,
+		     &oa_ht, EACCES);
+
+	oa_vaddr = mmap(0, 4096, PROT_READ, MAP_PRIVATE, stream_fd, 4096);
+	igt_assert(oa_vaddr == MAP_FAILED);
+	igt_assert_eq(errno, EACCES);
+
+	igt_info("Access denied to map oa buffer as expected\n");
+}
+
+static void test_unprivileged_map_oa_buffer(void)
+{
+	igt_fork(child, 1) {
+		igt_drop_root();
+		try_to_map_oa_buffer();
+	}
+	igt_waitchildren();
+}
+
+static void test_mapped_oa_buffer(void (*test_with_fd_open)(void))
+{
+	uint64_t properties[] = {
+		DRM_I915_PERF_PROP_SAMPLE_OA, true,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
+
+	};
+	struct drm_i915_perf_open_param param = {
+		.flags = I915_PERF_FLAG_FD_CLOEXEC,
+		.num_properties = sizeof(properties) / 16,
+		.properties_ptr = to_user_pointer(properties),
+	};
+
+	stream_fd = __perf_open(drm_fd, &param, false);
+
+	igt_assert(test_with_fd_open);
+	test_with_fd_open();
+
+	__perf_close(stream_fd);
+}
+
+static void close_fd_and_access_oa_buffer(void)
+{
+	uint64_t properties[] = {
+		DRM_I915_PERF_PROP_SAMPLE_OA, true,
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+		DRM_I915_PERF_PROP_OA_EXPONENT, oa_exp_1_millisec,
+
+	};
+	struct drm_i915_perf_open_param param = {
+		.flags = I915_PERF_FLAG_FD_CLOEXEC,
+		.num_properties = sizeof(properties) / 16,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	void *vaddr;
+	uint32_t size;
+	uint32_t report_id;
+	uint32_t period_us = oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
+
+	stream_fd = __perf_open(drm_fd, &param, false);
+
+	vaddr = map_oa_buffer(&size);
+	/* wait for approx 100 reports */
+	usleep(100 * period_us);
+	check_reports(vaddr, size);
+	unmap_oa_buffer(vaddr, size);
+
+	__perf_close(stream_fd);
+
+	report_id = *((uint32_t *)((uint8_t *)vaddr + 4096));
+
+}
+
 static unsigned
 read_i915_module_ref(void)
 {
@@ -5179,6 +5394,9 @@ igt_main
 
 		render_copy = igt_get_render_copyfunc(devid);
 		igt_require_f(render_copy, "no render-copy function\n");
+
+		intel_register_access_init(&mmio_data, intel_get_pci_device(),
+					   0, drm_fd);
 	}
 
 	igt_subtest("non-system-wide-paranoid")
@@ -5346,6 +5564,28 @@ igt_main
 		test_triggered_oa_reports();
 	}
 
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(i915_perf_revision(drm_fd) >= 8);
+		}
+
+		igt_describe("Verify mapping of oa buffer");
+		igt_subtest("map-oa-buffer")
+			test_mapped_oa_buffer(check_reports_from_mapped_buffer);
+
+		igt_describe("Verify invalid mappings of oa buffer");
+		igt_subtest("invalid-map-oa-buffer")
+			test_mapped_oa_buffer(invalid_map_oa_buffer);
+
+		igt_describe("Verify if non-privileged user can map oa buffer");
+		igt_subtest("non-privileged-map-oa-buffer")
+			test_mapped_oa_buffer(test_unprivileged_map_oa_buffer);
+
+		igt_describe("Close FD and access oa buffer");
+		igt_subtest("close-fd-and-access-oa-buffer")
+			close_fd_and_access_oa_buffer();
+	}
+
 	igt_fixture {
 		/* leave sysctl options in their default state... */
 		write_u64_file("/proc/sys/dev/i915/oa_max_sample_rate", 100000);
@@ -5354,6 +5594,7 @@ igt_main
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
