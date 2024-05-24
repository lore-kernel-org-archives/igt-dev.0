Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29A1C25B7F
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 03:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1BA10E36D;
	Fri, 24 May 2024 03:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q+rv87yu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9411110E0F6
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 03:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716520492; x=1748056492;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=c7s47SGDGvOipU8Nax8ouzCD3oPHYg2h4mly9wexiy8=;
 b=Q+rv87yuNGjvtZrS+O0F/P2psgSTSFt3tPqQyiXORBu1qGQ/Q72MpErD
 nLXeXse10BhYXY3TYgJQukJU8HR5SXImiR8GFEvWxu02fBppULAsegd9l
 JqPp7+B9uh5coo102eec0Y+p1atoZMvaMottWnLJDMQti4d36hmf1YEAk
 O95UY99pxEaemsv87vFCU1x4orQax1NnOYCxxBh/JmPF52EY606AsRMh4
 qtIsrV/J9tWqHCE8kW1kW+wyNq4Y2YA658b8ZbUR7rsXzc5OOI/VcB/Fz
 rS/2/YBhiFtcL0HGnFTPUkkEcBmxYAl9x1rbVPWojYRlJ5Lm4WZENoCac g==;
X-CSE-ConnectionGUID: PxLSer2xTbuWUSx/mfkBOQ==
X-CSE-MsgGUID: 0Y/6z6GHTneBL2efve9JFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="30384643"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="30384643"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 20:14:49 -0700
X-CSE-ConnectionGUID: 2orHk6EzTOKhPrgMx9O/TQ==
X-CSE-MsgGUID: 1oLCPomLSvKQi3zQWORsOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="34413534"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 20:14:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 20/23] tests/intel/xe_oa: Register whitelisting and MMIO
 trigger tests
Date: Thu, 23 May 2024 20:14:36 -0700
Message-ID: <20240524031439.106332-21-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240524031439.106332-1-ashutosh.dixit@intel.com>
References: <20240524031439.106332-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add the following tests:
	* "oa-regs-whitelisted"
	* "mmio-triggered-reports"

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 327 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 327 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 30d1ed329f..ec486c3a80 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -3896,6 +3896,317 @@ test_whitelisted_registers_userspace_config(void)
 	xe_oa_remove_config(drm_fd, config_id);
 }
 
+#define OAG_OASTATUS (0xdafc)
+#define OAG_MMIOTRIGGER (0xdb1c)
+
+static const uint32_t oa_wl[] = {
+	OAG_MMIOTRIGGER,
+	OAG_OASTATUS,
+};
+
+static const uint32_t nonpriv_slot_offsets[] = {
+	0x4d0, 0x4d4, 0x4d8, 0x4dc, 0x4e0, 0x4e4, 0x4e8, 0x4ec,
+	0x4f0, 0x4f4, 0x4f8, 0x4fc, 0x010, 0x014, 0x018, 0x01c,
+	0x1e0, 0x1e4, 0x1e8, 0x1ec,
+};
+
+struct test_perf {
+	const uint32_t *slots;
+	uint32_t num_slots;
+	const uint32_t *wl;
+	uint32_t num_wl;
+} perf;
+
+#define HAS_OA_MMIO_TRIGGER(__d) \
+	(IS_DG2(__d) || IS_PONTEVECCHIO(__d) || IS_METEORLAKE(__d) || \
+	 intel_graphics_ver(devid) >= IP_VER(20, 0))
+
+static void perf_init_whitelist(void)
+{
+	perf.slots = nonpriv_slot_offsets;
+	perf.num_slots = 20;
+	perf.wl = oa_wl;
+	perf.num_wl = ARRAY_SIZE(oa_wl);
+}
+
+static void
+emit_oa_reg_read(struct intel_bb *ibb, struct intel_buf *dst, uint32_t offset,
+		 uint32_t reg)
+{
+	intel_bb_add_intel_buf(ibb, dst, true);
+
+	intel_bb_out(ibb, MI_STORE_REGISTER_MEM | 2);
+	intel_bb_out(ibb, reg);
+	intel_bb_emit_reloc(ibb, dst->handle,
+			    I915_GEM_DOMAIN_INSTRUCTION,
+			    I915_GEM_DOMAIN_INSTRUCTION,
+			    offset, dst->addr.offset);
+	intel_bb_out(ibb, lower_32_bits(offset));
+	intel_bb_out(ibb, upper_32_bits(offset));
+}
+
+static void
+emit_mmio_triggered_report(struct intel_bb *ibb, uint32_t value)
+{
+	intel_bb_out(ibb, MI_LOAD_REGISTER_IMM(1));
+	intel_bb_out(ibb, OAG_MMIOTRIGGER);
+	intel_bb_out(ibb, value);
+}
+
+static void dump_whitelist(uint32_t mmio_base, const char *msg)
+{
+	int i;
+
+	igt_debug("%s\n", msg);
+
+	for (i = 0; i < perf.num_slots; i++)
+		igt_debug("FORCE_TO_NON_PRIV_%02d = %08x\n",
+			  i, intel_register_read(&mmio_data,
+						 mmio_base + perf.slots[i]));
+}
+
+static bool in_whitelist(uint32_t mmio_base, uint32_t reg)
+{
+	int i;
+
+	if (reg & MMIO_BASE_OFFSET)
+		reg = (reg & ~MMIO_BASE_OFFSET) + mmio_base;
+
+	for (i = 0; i < perf.num_slots; i++) {
+		uint32_t fpriv = intel_register_read(&mmio_data,
+						     mmio_base + perf.slots[i]);
+
+		if ((fpriv & RING_FORCE_TO_NONPRIV_ADDRESS_MASK) == reg)
+			return true;
+	}
+
+	return false;
+}
+
+static void oa_regs_in_whitelist(uint32_t mmio_base, bool are_present)
+{
+	int i;
+
+	if (are_present) {
+		for (i = 0; i < perf.num_wl; i++)
+			igt_assert(in_whitelist(mmio_base, perf.wl[i]));
+	} else {
+		for (i = 0; i < perf.num_wl; i++)
+			igt_assert(!in_whitelist(mmio_base, perf.wl[i]));
+	}
+}
+
+static u32 oa_get_mmio_base(const struct drm_xe_engine_class_instance *hwe)
+{
+	u32 mmio_base = 0x2000;
+
+	switch (hwe->engine_class) {
+	case DRM_XE_ENGINE_CLASS_RENDER:
+		mmio_base = 0x2000;
+		break;
+	case DRM_XE_ENGINE_CLASS_COMPUTE:
+		switch (hwe->engine_instance) {
+		case 0:
+			mmio_base = 0x1a000;
+			break;
+		case 1:
+			mmio_base = 0x1c000;
+			break;
+		case 2:
+			mmio_base = 0x1e000;
+			break;
+		case 3:
+			mmio_base = 0x26000;
+			break;
+		}
+	}
+
+	return mmio_base;
+}
+
+/**
+ * SUBTEST: oa-regs-whitelisted
+ * Description: Verify that OA registers are whitelisted
+ */
+static void test_oa_regs_whitelist(const struct drm_xe_engine_class_instance *hwe)
+{
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = sizeof(properties) / 16,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	// uint32_t mmio_base = gem_engine_mmio_base(drm_fd, e->name);
+	u32 mmio_base;
+
+	/* FIXME: Add support for OAM whitelist testing */
+	if (hwe->engine_class != DRM_XE_ENGINE_CLASS_RENDER &&
+	    hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+		return;
+
+	mmio_base = oa_get_mmio_base(hwe);
+
+	intel_register_access_init(&mmio_data,
+				   igt_device_get_pci_device(drm_fd),
+				   0, drm_fd);
+	stream_fd = __perf_open(drm_fd, &param, false);
+
+	dump_whitelist(mmio_base, "oa whitelisted");
+
+	oa_regs_in_whitelist(mmio_base, true);
+
+	__perf_close(stream_fd);
+
+	dump_whitelist(mmio_base, "oa remove whitelist");
+
+	/*
+	 * after perf close, check that registers are removed from the nonpriv
+	 * slots
+	 * FIXME if needed: currently regs remain added forever
+	 */
+	// oa_regs_in_whitelist(mmio_base, false);
+
+	intel_register_access_fini(&mmio_data);
+}
+
+static void
+__test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
+{
+	struct intel_xe_perf_metric_set *test_set = default_test_set;
+	int oa_exponent = max_oa_exponent_for_period_lte(2 * NSEC_PER_SEC);
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = sizeof(properties) / 16,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	size_t format_size = get_oa_format(test_set->perf_oa_format).size;
+	uint32_t oa_buffer, offset_tail1, offset_tail2;
+	struct intel_buf src, dst, *dst_buf;
+	uint32_t mmio_triggered_reports = 0;
+	uint32_t *start, *end;
+	struct buf_ops *bops;
+	struct intel_bb *ibb;
+	uint32_t context, vm;
+	int height = 600;
+	int width = 800;
+	uint8_t *buf;
+
+	bops = buf_ops_create(drm_fd);
+
+	dst_buf = intel_buf_create(bops, 4096, 1, 8, 64,
+				   I915_TILING_NONE,
+				   I915_COMPRESSION_NONE);
+	buf_map(drm_fd, dst_buf, true);
+	memset(dst_buf->ptr, 0, 4096);
+	intel_buf_unmap(dst_buf);
+
+	scratch_buf_init(bops, &src, width, height, 0xff0000ff);
+	scratch_buf_init(bops, &dst, width, height, 0x00ff00ff);
+
+	vm = xe_vm_create(drm_fd, 0, 0);
+	context = xe_exec_queue_create(drm_fd, vm, hwe, 0);
+	igt_assert(context);
+	ibb = intel_bb_create_with_context(drm_fd, context, vm, NULL, BATCH_SZ);
+
+	stream_fd = __perf_open(drm_fd, &param, false);
+        set_fd_flags(stream_fd, O_CLOEXEC);
+
+	buf = mmap(0, OA_BUFFER_SIZE, PROT_READ, MAP_PRIVATE, stream_fd, 0);
+	igt_assert(buf != NULL);
+
+	emit_oa_reg_read(ibb, dst_buf, 0, OAG_OABUFFER);
+	emit_oa_reg_read(ibb, dst_buf, 4, OAG_OATAILPTR);
+	emit_mmio_triggered_report(ibb, 0xc0ffee11);
+
+	if (render_copy)
+		render_copy(ibb,
+			    &src, 0, 0, width, height,
+			    &dst, 0, 0);
+
+	emit_mmio_triggered_report(ibb, 0xc0ffee22);
+
+	emit_oa_reg_read(ibb, dst_buf, 8, OAG_OATAILPTR);
+
+	intel_bb_flush_render(ibb);
+	intel_bb_sync(ibb);
+
+	buf_map(drm_fd, dst_buf, false);
+
+	oa_buffer = dst_buf->ptr[0] & OAG_OATAILPTR_MASK;
+	offset_tail1 = (dst_buf->ptr[1] & OAG_OATAILPTR_MASK) - oa_buffer;
+	offset_tail2 = (dst_buf->ptr[2] & OAG_OATAILPTR_MASK) - oa_buffer;
+
+	igt_debug("oa_buffer = %08x, tail1 = %08x, tail2 = %08x\n",
+		  oa_buffer, offset_tail1, offset_tail2);
+
+	start = (uint32_t *)(buf + offset_tail1);
+	end = (uint32_t *)(buf + offset_tail2);
+	while (start < end) {
+		if (!report_reason(start))
+			mmio_triggered_reports++;
+
+		if (get_oa_format(test_set->perf_oa_format).report_hdr_64bit) {
+			u64 *start64 = (u64 *)start;
+
+			igt_debug("hdr: %016lx %016lx %016lx %016lx\n",
+				  start64[0], start64[1], start64[2], start64[3]);
+		} else {
+			igt_debug("hdr: %08x %08x %08x %08x\n",
+				  start[0], start[1], start[2], start[3]);
+		}
+
+		start += format_size / 4;
+	}
+
+	igt_assert_eq(mmio_triggered_reports, 2);
+
+	munmap(buf, OA_BUFFER_SIZE);
+	intel_buf_close(bops, &src);
+	intel_buf_close(bops, &dst);
+	intel_buf_unmap(dst_buf);
+	intel_buf_destroy(dst_buf);
+	intel_bb_destroy(ibb);
+	xe_exec_queue_destroy(drm_fd, context);
+	xe_vm_destroy(drm_fd, vm);
+	buf_ops_destroy(bops);
+	__perf_close(stream_fd);
+}
+
+/**
+ * SUBTEST: mmio-triggered-reports
+ * Description: Test MMIO trigger functionality
+ */
+static void
+test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
+{
+	struct igt_helper_process child = {};
+	int ret;
+
+	write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 0);
+	igt_fork_helper(&child) {
+		igt_drop_root();
+
+		__test_mmio_triggered_reports(hwe);
+	}
+	ret = igt_wait_helper(&child);
+	write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
+
+	igt_assert(WEXITSTATUS(ret) == EAGAIN ||
+		   WEXITSTATUS(ret) == 0);
+}
+
 /**
  * SUBTEST: xe-ref-count
  * Description: Check that an open oa stream holds a reference on the xe module
@@ -4563,6 +4874,22 @@ igt_main
 				closed_fd_and_unmapped_access(hwe);
 	}
 
+	igt_subtest_group {
+		igt_fixture {
+			perf_init_whitelist();
+		}
+
+		igt_subtest_with_dynamic("oa-regs-whitelisted")
+			__for_one_hwe_in_oag(hwe)
+				test_oa_regs_whitelist(hwe);
+
+		igt_subtest_with_dynamic("mmio-triggered-reports") {
+			igt_require(HAS_OA_MMIO_TRIGGER(devid));
+			__for_one_hwe_in_oag(hwe)
+				test_mmio_triggered_reports(hwe);
+		}
+	}
+
 	igt_fixture {
 		/* leave sysctl options in their default state... */
 		write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
-- 
2.41.0

