Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CF06E8AA
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Aug 2021 20:07:43 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Tue,  3 Aug 2021 13:07:34 -0700
Message-Id: <20210803200737.30843-2-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20210803200737.30843-1-umesh.nerlige.ramappa@intel.com>
References: <20210803200737.30843-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/5] i915/perf: Add tests for mapped OA buffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

For applications that need a faster way to access reports in the OA
buffer, i915 now provides a way to map the OA buffer to privileged user
space. Validate the mapped OA buffer.

v2: Fail on forked-privileged access to mapped oa buffer (Chris)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 include/drm-uapi/i915_drm.h |  33 ++++
 tests/i915/perf.c           | 290 ++++++++++++++++++++++++++++++++++++
 2 files changed, 323 insertions(+)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index a1c0030c..bb7d5e73 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -2151,6 +2151,39 @@ struct drm_i915_perf_open_param {
  */
 #define I915_PERF_IOCTL_CONFIG	_IO('i', 0x2)
 
+/*
+ * Returns OA buffer properties to be used with mmap.
+ *
+ * This ioctl is available in perf revision 8.
+ */
+#define I915_PERF_IOCTL_GET_OA_BUFFER_INFO _IOWR('i', 0x3, struct drm_i915_perf_oa_buffer_info)
+
+/**
+ * OA buffer size and offset.
+ *
+ * OA output buffer
+ *   type: 0
+ *   flags: mbz
+ *
+ *   After querying the info, pass (size,offset) to mmap(),
+ *
+ *   mmap(0, info.size, PROT_READ, MAP_PRIVATE, perf_fd, info.offset).
+ *
+ *   Note that only a private (not shared between processes, or across fork())
+ *   read-only mmapping is allowed.
+ *
+ *   Userspace must treat the incoming data as tainted, but it conforms to the OA
+ *   format as specified by user config. The buffer provides reports that have
+ *   OA counters - A, B and C.
+ */
+struct drm_i915_perf_oa_buffer_info {
+	__u32 type;   /* in */
+	__u32 flags;  /* in */
+	__u64 size;   /* out */
+	__u64 offset; /* out */
+	__u64 rsvd;   /* mbz */
+};
+
 /*
  * Common to all i915 perf records
  */
diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index fa3840eb..4d4808ce 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -5156,6 +5156,266 @@ static void test_oa_regs_whitelist(int paranoid)
 	intel_register_access_fini(&mmio_data);
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
+	uint32_t status;
+
+	intel_register_access_init(&mmio_data, intel_get_pci_device(),
+				   0, drm_fd);
+	if (IS_HASWELL(devid))
+		status = intel_register_read(&mmio_data, 0x2346) & 0x7;
+	else if (IS_GEN12(devid))
+		status = intel_register_read(&mmio_data, 0xdafc) & 0x7;
+	else
+		status = intel_register_read(&mmio_data, 0x2b08) & 0xf;
+
+	intel_register_access_fini(&mmio_data);
+
+	return status;
+}
+
+static jmp_buf jmp;
+static void __attribute__((noreturn)) sigtrap(int sig)
+{
+	siglongjmp(jmp, sig);
+}
+
+static void try_invalid_access(void *vaddr)
+{
+	sighandler_t old_sigsegv;
+	uint32_t dummy;
+
+	old_sigsegv = signal(SIGSEGV, sigtrap);
+	switch (sigsetjmp(jmp, SIGSEGV)) {
+	case SIGSEGV:
+		break;
+	case 0:
+		dummy = READ_ONCE(*((uint32_t *)vaddr + 1));
+		(void) dummy;
+	default:
+		igt_assert(!"reached");
+		break;
+	}
+	signal(SIGSEGV, old_sigsegv);
+}
+
+static void invalid_param_map_oa_buffer(void)
+{
+	struct drm_i915_perf_oa_buffer_info oa_buffer = { 0 };
+	void *oa_vaddr = NULL;
+
+	do_ioctl(stream_fd, I915_PERF_IOCTL_GET_OA_BUFFER_INFO, &oa_buffer);
+
+	igt_debug("size        = %llu\n", oa_buffer.size);
+	igt_debug("offset      = %llx\n", oa_buffer.offset);
+
+	igt_assert_eq(oa_buffer.size & (oa_buffer.size - 1), 0);
+
+	/* try a couple invalid mmaps */
+	/* bad prots */
+	oa_vaddr = mmap(0, oa_buffer.size, PROT_WRITE, MAP_PRIVATE, stream_fd, oa_buffer.offset);
+	igt_assert(oa_vaddr == MAP_FAILED);
+
+	oa_vaddr = mmap(0, oa_buffer.size, PROT_EXEC, MAP_PRIVATE, stream_fd, oa_buffer.offset);
+	igt_assert(oa_vaddr == MAP_FAILED);
+
+	/* bad MAPs */
+	oa_vaddr = mmap(0, oa_buffer.size, PROT_READ, MAP_SHARED, stream_fd, oa_buffer.offset);
+	igt_assert(oa_vaddr == MAP_FAILED);
+
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
+	igt_assert(oa_vaddr != MAP_FAILED && oa_vaddr != NULL);
+
+	munmap(oa_vaddr, oa_buffer.size);
+}
+
+static void *map_oa_buffer(uint32_t *size)
+{
+	struct drm_i915_perf_oa_buffer_info oa_buffer = { 0 };
+	void *vaddr;
+
+	do_ioctl(stream_fd, I915_PERF_IOCTL_GET_OA_BUFFER_INFO, &oa_buffer);
+
+	igt_debug("size        = %llu\n", oa_buffer.size);
+	igt_debug("offset      = %llx\n", oa_buffer.offset);
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
+static void check_reports(void *oa_vaddr, uint32_t oa_size)
+{
+	struct oa_format format = get_oa_format(test_set->perf_oa_format);
+	size_t report_words = format.size >> 2;
+	uint32_t *reports;
+	uint32_t timer_reports = 0;
+
+	for (reports = (uint32_t *)oa_vaddr;
+	     timer_reports < 20 && reports[0] && reports[1];
+	     reports += report_words) {
+		if (!oa_report_is_periodic(oa_exp_1_millisec, reports))
+			continue;
+
+		timer_reports++;
+		if (timer_reports >= 3)
+			sanity_check_reports(reports - 2 * report_words,
+					     reports - report_words,
+					     test_set->perf_oa_format);
+	}
+
+	igt_assert(timer_reports >= 3);
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
+	check_reports(vaddr, size);
+
+	munmap(vaddr, size);
+}
+
+static void unprivileged_try_to_map_oa_buffer(void)
+{
+	struct drm_i915_perf_oa_buffer_info oa_buffer = { 0 };
+	void *oa_vaddr;
+
+	do_ioctl_err(stream_fd, I915_PERF_IOCTL_GET_OA_BUFFER_INFO,
+		     &oa_buffer, EACCES);
+
+	oa_vaddr = mmap(0, 4096, PROT_READ, MAP_PRIVATE, stream_fd, 4096);
+	igt_assert(oa_vaddr == MAP_FAILED);
+	igt_assert_eq(errno, EACCES);
+}
+
+static void unprivileged_map_oa_buffer(void)
+{
+	igt_fork(child, 1) {
+		igt_drop_root();
+		unprivileged_try_to_map_oa_buffer();
+	}
+	igt_waitchildren();
+}
+
+static void map_oa_buffer_unprivilege_access(void)
+{
+	void *vaddr;
+	uint32_t size;
+
+	vaddr = map_oa_buffer(&size);
+
+	igt_fork(child, 1) {
+		igt_drop_root();
+		try_invalid_access(vaddr);
+	}
+	igt_waitchildren();
+
+	munmap(vaddr, size);
+}
+
+static void map_oa_buffer_forked_access(void)
+{
+	void *vaddr;
+	uint32_t size;
+
+	vaddr = map_oa_buffer(&size);
+
+	igt_fork(child, 1) {
+		try_invalid_access(vaddr);
+	}
+	igt_waitchildren();
+
+	munmap(vaddr, size);
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
+static void closed_fd_and_unmapped_access(void)
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
+	uint32_t period_us = oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
+
+	stream_fd = __perf_open(drm_fd, &param, false);
+	vaddr = map_oa_buffer(&size);
+
+	usleep(100 * period_us);
+	check_reports(vaddr, size);
+
+	munmap(vaddr, size);
+	__perf_close(stream_fd);
+
+	try_invalid_access(vaddr);
+}
+
 static unsigned
 read_i915_module_ref(void)
 {
@@ -5506,6 +5766,36 @@ igt_main
 			test_triggered_oa_reports(1);
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
+			test_mapped_oa_buffer(invalid_param_map_oa_buffer);
+
+		igt_describe("Verify if non-privileged user can map oa buffer");
+		igt_subtest("non-privileged-map-oa-buffer")
+			test_mapped_oa_buffer(unprivileged_map_oa_buffer);
+
+		igt_describe("Verify if non-privileged user can map oa buffer");
+		igt_subtest("non-privileged-access-vaddr")
+			test_mapped_oa_buffer(map_oa_buffer_unprivilege_access);
+
+		igt_describe("Verify that forked access to mapped buffer fails");
+		igt_subtest("privileged-forked-access-vaddr")
+			test_mapped_oa_buffer(map_oa_buffer_forked_access);
+
+		igt_describe("Unmap buffer, close fd and try to access");
+		igt_subtest("closed-fd-and-unmapped-access")
+			closed_fd_and_unmapped_access();
+	}
+
 	igt_fixture {
 		/* leave sysctl options in their default state... */
 		write_u64_file("/proc/sys/dev/i915/oa_max_sample_rate", 100000);
-- 
2.20.1
