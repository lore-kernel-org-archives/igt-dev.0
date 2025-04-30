Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C09C369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 09:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4F510E0E3;
	Wed, 30 Apr 2025 09:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A4NXjSsy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1936710E0E3
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 09:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746004723; x=1777540723;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UHu27Lr6xtfuBxjJi5okZGfeTrDqS8G50J0qtD+gLLE=;
 b=A4NXjSsyFFO6nINtu3euYD7DVoEDrw42LdWtqhKvRcnypmVzG3kfYH+H
 XGKFXJSfNZaseD8vCfsNBw/OQJ41FmSCrtSPg4FfTadclhKnLXQXpxnGr
 Pz8CVFJ9RxGImu/FhGHhs0vETbgy2Qa1PoDGGbswSgu8VK1p2k5uP561H
 Ty/XKLkeRThgh6Ps19aLO5Vw2wsJFH8l1axMyIVadUMcgBtyWNunaEoFN
 T7qvGXoVAAZNweQ8T9csy8GhADuiYwN++wtv+D7alQb+cnn0cmdJcFHZT
 J5Eq+z+RsI1eKti4pFsktwnaRQcYEUicwqGf6bSYWvmR0Xh1Reim2f2nR w==;
X-CSE-ConnectionGUID: h40HMfd/QpStqcenm15jFQ==
X-CSE-MsgGUID: WoyFIR7eScyPX3do+9u9+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="46773754"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="46773754"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 02:18:42 -0700
X-CSE-ConnectionGUID: ip20eyh+QmSqAYsdgWSJww==
X-CSE-MsgGUID: Ah5mZ9SnQTKS+dWB/a3thA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="139183438"
Received: from ba_tws-123.gar.corp.intel.com (HELO
 spottumu-desk.iind.intel.com) ([10.190.216.156])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 02:18:41 -0700
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH i-g-t v2] tests/intel/xe_oa: Add a new mmio triggered test
Date: Wed, 30 Apr 2025 14:46:55 +0530
Message-Id: <20250430091655.603509-1-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
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

The current mmio-triggered-reports tests mmio triggered reports via a
mmaped buffer. Add another test which uses 'read' system call to check for
mmio triggered reports.

v2:
  - Add a check for len (Umesh)

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 tests/intel/xe_oa.c | 109 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 106 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 766f81a5e..90e863c8b 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -3959,12 +3959,106 @@ __test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
 	__perf_close(stream_fd);
 }
 
+static void
+__test_mmio_triggered_reports_read(struct drm_xe_engine_class_instance *hwe)
+{
+	struct intel_xe_perf_metric_set *test_set = default_test_set;
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = sizeof(properties) / 16,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	size_t format_size = get_oa_format(test_set->perf_oa_format).size;
+	struct intel_buf src, dst;
+	uint32_t mmio_triggered_reports = 0;
+	struct buf_ops *bops;
+	struct intel_bb *ibb;
+	uint32_t context, vm;
+	uint8_t *buf = calloc(1, default_oa_buffer_size);
+	int len, total_len = 0;
+
+	bops = buf_ops_create(drm_fd);
+
+	scratch_buf_init(bops, &src, rc_width, rc_height, 0xff0000ff);
+	scratch_buf_init(bops, &dst, rc_width, rc_height, 0x00ff00ff);
+
+	vm = xe_vm_create(drm_fd, 0, 0);
+	context = xe_exec_queue_create(drm_fd, vm, hwe, 0);
+	igt_assert(context);
+	ibb = intel_bb_create_with_context(drm_fd, context, vm, NULL, BATCH_SZ);
+
+	stream_fd = __perf_open(drm_fd, &param, false);
+	set_fd_flags(stream_fd, O_CLOEXEC);
+
+	emit_mmio_triggered_report(ibb, 0xc0ffee11);
+
+	if (render_copy)
+		render_copy(ibb,
+			    &src, 0, 0, rc_width, rc_height,
+			    &dst, 0, 0);
+
+	emit_mmio_triggered_report(ibb, 0xc0ffee22);
+
+	intel_bb_flush_render(ibb);
+	intel_bb_sync(ibb);
+
+	while (total_len < default_oa_buffer_size && mmio_triggered_reports < 2 &&
+		((len = read(stream_fd, &buf[total_len], format_size)) > 0 ||
+		(len == -1 && (errno == EINTR || errno == EIO)))) {
+		uint32_t *report = (void *)&buf[total_len];
+
+		if (len != format_size)
+			continue;
+
+		if (!report_reason(report))
+			mmio_triggered_reports++;
+
+		if (get_oa_format(test_set->perf_oa_format).report_hdr_64bit) {
+			u64 *report64 = (u64 *)report;
+
+			igt_debug("hdr: %016"PRIx64" %016"PRIx64" %016"PRIx64" %016"PRIx64"\n",
+				  report64[0], report64[1], report64[2], report64[3]);
+			if (!report_reason(report))
+				igt_assert(report64[2] == 0xc0ffee11 || report64[2] == 0xc0ffee22);
+		} else {
+			igt_debug("hdr: %08x %08x %08x %08x\n",
+				  report[0], report[1], report[2], report[3]);
+			if (!report_reason(report))
+				igt_assert(report[2] == 0xc0ffee11 || report[2] == 0xc0ffee22);
+		}
+
+		if (len > 0)
+			total_len += len;
+	}
+
+	igt_assert_eq(mmio_triggered_reports, 2);
+
+	intel_buf_close(bops, &src);
+	intel_buf_close(bops, &dst);
+	intel_bb_destroy(ibb);
+	xe_exec_queue_destroy(drm_fd, context);
+	xe_vm_destroy(drm_fd, vm);
+	buf_ops_destroy(bops);
+	free(buf);
+	__perf_close(stream_fd);
+}
+
 /**
  * SUBTEST: mmio-triggered-reports
  * Description: Test MMIO trigger functionality
+ *
+ * SUBTEST: mmio-triggered-reports-read
+ * Description: Test MMIO trigger functionality with read system call
  */
 static void
-test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
+test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe,
+			    bool with_read)
 {
 	struct igt_helper_process child = {};
 	int ret;
@@ -3973,7 +4067,10 @@ test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
 	igt_fork_helper(&child) {
 		igt_drop_root();
 
-		__test_mmio_triggered_reports(hwe);
+		if (with_read)
+			__test_mmio_triggered_reports_read(hwe);
+		else
+			__test_mmio_triggered_reports(hwe);
 	}
 	ret = igt_wait_helper(&child);
 	write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
@@ -4894,7 +4991,13 @@ igt_main
 		igt_subtest_with_dynamic("mmio-triggered-reports") {
 			igt_require(HAS_OA_MMIO_TRIGGER(devid));
 			__for_one_hwe_in_oag(hwe)
-				test_mmio_triggered_reports(hwe);
+				test_mmio_triggered_reports(hwe, false);
+		}
+
+		igt_subtest_with_dynamic("mmio-triggered-reports-read") {
+			igt_require(HAS_OA_MMIO_TRIGGER(devid));
+			__for_one_hwe_in_oag(hwe)
+				test_mmio_triggered_reports(hwe, true);
 		}
 	}
 
-- 
2.34.1

