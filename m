Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB5DC48BF5
	for <igt-dev@archiver.kernel.org>; Fri, 16 Feb 2024 23:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0549710ECEE;
	Fri, 16 Feb 2024 23:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aRNqTRGK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6F010ED00
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Feb 2024 23:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708125432; x=1739661432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PMKsjwagK3KT8CgiWEIsgG8nn3KTKhqun0B0QFd+OAo=;
 b=aRNqTRGKVQDR5etsGG4fPvxVHFQWHoNuyAiai8ZDUN/KW6o0jYEa1smG
 nzP3p668o6juPXYFDHLu9Yd8KEPiEYHeqnyjZ14dAfXf7nMyIb0zdQHdS
 e9eevJkNgnwU3Gyx7tqDt8aRW1VQttxStl2G8w58OH+wegrDB8oA0uCJ/
 YhoNQyN/1PTtyVK0H/+7zzHWy8CTEG3C/tplw0noHuiXLLn7VOUF9/axD
 KoOfs9H2F+JRVAfUQv7VKIAQILYwIUIP6QGKgXWsnG2uwcSJqxcyd6HvH
 NyB4lfw5sh3kaI5K8RTYuN9+4DGQ0ZIOHDbVmbisCAwXnccmkB79EEmJA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="27724290"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; d="scan'208";a="27724290"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 15:17:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="8626897"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 15:17:09 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 15/18] tests/intel/xe_oa: Exclusive/concurrent access,
 rc6 and stress open close
Date: Fri, 16 Feb 2024 15:17:00 -0800
Message-ID: <20240216231703.845644-16-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216231703.845644-1-ashutosh.dixit@intel.com>
References: <20240216231703.845644-1-ashutosh.dixit@intel.com>
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
* "oa-unit-exclusive-stream-sample-oa"
* "oa-unit-exclusive-stream-exec-q"
* "oa-unit-concurrent-oa-buffer-read"
* "rc6-disable"
* "stress-open-close"

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 263 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 263 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index f3ded6ae998f..0984d73bc0f9 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -471,6 +471,23 @@ static struct drm_xe_engine_class_instance *oa_unit_engine(int fd, int n)
 	return hwe;
 }
 
+static struct drm_xe_oa_unit *nth_oa_unit(int fd, int n)
+{
+	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
+	struct drm_xe_oa_unit *oau;
+	u8 *poau;
+
+	poau = (u8 *)&qoa->oa_units[0];
+	for (int i = 0; i < qoa->num_oa_units; i++) {
+		oau = (struct drm_xe_oa_unit *)poau;
+		if (i == n)
+			return oau;
+		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
+	}
+
+	return NULL;
+}
+
 static char *
 pretty_print_oa_period(uint64_t oa_period_ns)
 {
@@ -558,6 +575,14 @@ write_u64_file(const char *path, uint64_t val)
 	fclose(f);
 }
 
+static unsigned long rc6_residency_ms(void)
+{
+	unsigned long value;
+
+	igt_assert(igt_sysfs_scanf(sysfs, "device/tile0/gt0/gtidle/idle_residency_ms", "%lu", &value) == 1);
+	return value;
+}
+
 static uint64_t
 read_report_ticks(const uint32_t *report, enum xe_oa_format_name format)
 {
@@ -3487,6 +3512,95 @@ done:
 	return ref_count;
 }
 
+/**
+ * SUBTEST: rc6-disable
+ * Description: Check that opening an OA stream disables RC6
+ */
+static void
+test_rc6_disable(void)
+{
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+
+		/* Include OA reports in samples */
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+
+		/* OA unit configuration */
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
+		DRM_XE_OA_PROPERTY_OA_EXPONENT, oa_exp_1_millisec,
+	};
+	struct drm_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	unsigned long rc6_start, rc6_end;
+
+	/* Verify rc6 is functional by measuring residency while idle */
+	rc6_start = rc6_residency_ms();
+	usleep(50000);
+	rc6_end = rc6_residency_ms();
+	igt_require(rc6_end != rc6_start);
+
+	/* While OA is active, we keep rc6 disabled so we don't lose metrics */
+	stream_fd = __perf_open(drm_fd, &param, false);
+
+	rc6_start = rc6_residency_ms();
+	usleep(50000);
+	rc6_end = rc6_residency_ms();
+	igt_assert_eq(rc6_end - rc6_start, 0);
+
+	__perf_close(stream_fd);
+
+	/* But once OA is closed, we expect the device to sleep again */
+	rc6_start = rc6_residency_ms();
+	usleep(50000);
+	rc6_end = rc6_residency_ms();
+	igt_assert_neq(rc6_end - rc6_start, 0);
+}
+
+/**
+ * SUBTEST: stress-open-close
+ * Description: Open/close OA streams in a tight loop
+ */
+static void
+test_stress_open_close(const struct drm_xe_engine_class_instance *hwe)
+{
+	struct intel_perf_metric_set *test_set = metric_set(hwe);
+
+	load_helper_init();
+	load_helper_run(HIGH);
+
+	igt_until_timeout(2) {
+		int oa_exponent = 5; /* 5 micro seconds */
+		uint64_t properties[] = {
+			DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+
+			/* XXX: even without periodic sampling we have to
+			 * specify at least one sample layout property...
+			 */
+			DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+
+			/* OA unit configuration */
+			DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
+			DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
+			DRM_XE_OA_PROPERTY_OA_EXPONENT, oa_exponent,
+			DRM_XE_OA_PROPERTY_OA_DISABLED, true,
+			DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
+		};
+		struct drm_xe_oa_open_prop param = {
+			.num_properties = ARRAY_SIZE(properties) / 2,
+			.properties_ptr = to_user_pointer(properties),
+		};
+
+		stream_fd = __perf_open(drm_fd, &param, false);
+		__perf_close(stream_fd);
+	}
+
+	load_helper_stop();
+	load_helper_fini();
+}
+
 /**
  * SUBTEST: xe-ref-count
  * Description: Check that an open oa stream holds a reference on the xe module
@@ -3573,6 +3687,137 @@ test_sysctl_defaults(void)
 	igt_assert_eq(paranoid, 1);
 }
 
+/**
+ * SUBTEST: oa-unit-exclusive-stream-sample-oa
+ * Description: Check that only a single stream can be opened on an OA unit (with sampling)
+ *
+ * SUBTEST: oa-unit-exclusive-stream-exec-q
+ * Description: Check that only a single stream can be opened on an OA unit (for OAR/OAC)
+*/
+/*
+ * Test if OA buffer streams can be independently opened on OA unit. Once a user
+ * opens a stream, that oa unit is exclusive to the user, other users get -EBUSY on
+ * trying to open a stream.
+ */
+static void
+test_oa_unit_exclusive_stream(bool exponent)
+{
+	struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
+	struct drm_xe_oa_unit *oau;
+	u8 *poau = (u8 *)&qoa->oa_units[0];
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, 0,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(0),
+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, 0,
+		DRM_XE_OA_PROPERTY_OA_EXPONENT, oa_exp_1_millisec,
+	};
+	struct drm_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	uint32_t *exec_q = calloc(qoa->num_oa_units, sizeof(u32));
+	uint32_t *perf_fd = calloc(qoa->num_oa_units, sizeof(u32));
+	u32 vm = xe_vm_create(drm_fd, 0, 0);
+	struct intel_perf_metric_set *test_set;
+	uint32_t i;
+
+	/* for each oa unit, open one random perf stream with sample OA */
+	for (i = 0; i < qoa->num_oa_units; i++) {
+		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(drm_fd, i);
+
+		oau = (struct drm_xe_oa_unit *)poau;
+		if (oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
+			continue;
+		test_set = metric_set(hwe);
+
+		igt_debug("opening OA buffer with c:i %d:%d\n",
+			  hwe->engine_class, hwe->engine_instance);
+		exec_q[i] = xe_exec_queue_create(drm_fd, vm, hwe, 0);
+		if (!exponent) {
+			properties[10] = DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID;
+			properties[11] = exec_q[i];
+		}
+
+		properties[1] = oau->oa_unit_id;
+		properties[5] = test_set->perf_oa_metrics_set;
+		properties[7] = __ff(test_set->perf_oa_format);
+		properties[9] = hwe->engine_instance;
+		perf_fd[i] = xe_perf_ioctl(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param);
+		igt_assert(perf_fd[i] >= 0);
+		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
+	}
+
+	/* Xe KMD holds reference to the exec_q's so they shouldn't be really destroyed */
+	for (i = 0; i < qoa->num_oa_units; i++)
+		if (exec_q[i])
+			xe_exec_queue_destroy(drm_fd, exec_q[i]);
+
+	/* for each oa unit make sure no other streams can be opened */
+	poau = (u8 *)&qoa->oa_units[0];
+	for (i = 0; i < qoa->num_oa_units; i++) {
+		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(drm_fd, i);
+		int err;
+
+		oau = (struct drm_xe_oa_unit *)poau;
+		if (oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
+			continue;
+		test_set = metric_set(hwe);
+
+		igt_debug("try with exp with c:i %d:%d\n",
+			  hwe->engine_class, hwe->engine_instance);
+		/* case 1: concurrent access to OAG should fail */
+		properties[1] = oau->oa_unit_id;
+		properties[5] = test_set->perf_oa_metrics_set;
+		properties[7] = __ff(test_set->perf_oa_format);
+		properties[9] = hwe->engine_instance;
+		properties[10] = DRM_XE_OA_PROPERTY_OA_EXPONENT;
+		properties[11] = oa_exp_1_millisec;
+		xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EBUSY);
+
+		/* case 2: concurrent access to non-OAG unit should fail */
+		igt_debug("try with exec_q with c:i %d:%d\n",
+			  hwe->engine_class, hwe->engine_instance);
+		exec_q[i] = xe_exec_queue_create(drm_fd, vm, hwe, 0);
+		properties[10] = DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID;
+		properties[11] = exec_q[i];
+		errno = 0;
+		err = xe_perf_ioctl(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param);
+		igt_assert(err < 0);
+		igt_assert(errno == EBUSY || errno == ENODEV);
+		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
+	}
+
+	for (i = 0; i < qoa->num_oa_units; i++) {
+		if (perf_fd[i])
+			close(perf_fd[i]);
+		if (exec_q[i])
+			xe_exec_queue_destroy(drm_fd, exec_q[i]);
+	}
+}
+
+/**
+ * SUBTEST: oa-unit-concurrent-oa-buffer-read
+ * Description: Test that we can read streams concurrently on all OA units
+ */
+static void
+test_oa_unit_concurrent_oa_buffer_read(void)
+{
+	struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
+
+	igt_fork(child, qoa->num_oa_units) {
+		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(drm_fd, child);
+
+		/* No OAM support yet */
+		if (nth_oa_unit(drm_fd, child)->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
+			exit(0);
+
+		test_blocking(40 * 1000 * 1000, false, 5 * 1000 * 1000, hwe);
+	}
+	igt_waitchildren();
+}
+
 static const char *xe_engine_class_name(uint32_t engine_class)
 {
 	switch (engine_class) {
@@ -3740,6 +3985,24 @@ igt_main
 				test_single_ctx_render_target_writes_a_counter(hwe);
 		}
 	}
+	igt_subtest_group {
+		igt_subtest("oa-unit-exclusive-stream-sample-oa")
+			test_oa_unit_exclusive_stream(true);
+
+		igt_subtest("oa-unit-exclusive-stream-exec-q")
+			test_oa_unit_exclusive_stream(false);
+
+		igt_subtest("oa-unit-concurrent-oa-buffer-read")
+			test_oa_unit_concurrent_oa_buffer_read();
+	}
+
+	igt_subtest("rc6-disable")
+		test_rc6_disable();
+
+	igt_subtest_with_dynamic("stress-open-close") {
+		__for_one_hwe_in_oag(hwe)
+			test_stress_open_close(hwe);
+	}
 
 	igt_fixture {
 		/* leave sysctl options in their default state... */
-- 
2.41.0

