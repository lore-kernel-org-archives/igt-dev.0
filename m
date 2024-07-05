Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F814C3DA45
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jul 2024 18:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0210410EC14;
	Fri,  5 Jul 2024 18:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ew3L0mru";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3A910EACB
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jul 2024 18:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720204001; x=1751740001;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1qIiUJhK1pjWyZDxTMYSlvnmMbPjREMDOe/2F3iCT74=;
 b=Ew3L0mruLt8jReARGkgr3N5dIFovk73OwooC6es2ijS/2B6vtbzXlbBn
 Kt6U+KIdYdR20eNHcT8CAfStZzAircSi6DoUaWbTO7P8wZXjZCoR0SeXm
 pWqbhQgtgqRi4eg3kPTDQPpScb4rEWpoKPCVuWHML9RJhVn5Z5U+Yag9b
 E+oihmPOcf9vaLkUBS30P2slATzgEx08Bz8bFcTOXZdmE4vb0FZ30OYtt
 e6STrzuwcKOTccxFxJoDW0RGiF4HmJ+PrIVf0nV8AnZdtL5gHLu3hjTha
 T2UA524WwNvOrBZhRG9tjjuAn2rZA1ZfQBDn3a6zrOUuDs141yGEj9/tg A==;
X-CSE-ConnectionGUID: a1Way7d9RQawuSypG1Oc0w==
X-CSE-MsgGUID: 6E7Kl2MjQG+zLrc7QMHBzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17146547"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="17146547"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 11:26:41 -0700
X-CSE-ConnectionGUID: gVF4x6DMTsSPWJMNNfESCQ==
X-CSE-MsgGUID: UCRu0jO7RgSI1gXK+omelA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="47011700"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 11:26:41 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 10/15] tests/intel/xe_oa: Exclusive/concurrent access,
 rc6 and stress open close
Date: Fri,  5 Jul 2024 11:26:31 -0700
Message-ID: <20240705182637.2679730-11-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240705182637.2679730-1-ashutosh.dixit@intel.com>
References: <20240705182637.2679730-1-ashutosh.dixit@intel.com>
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

v2: Rename xe perf layer as xe observation layer

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 264 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 264 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index b2f18ee402..26bb7cfd2f 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -430,6 +430,23 @@ static struct drm_xe_engine_class_instance *oa_unit_engine(int fd, int n)
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
@@ -517,6 +534,14 @@ write_u64_file(const char *path, uint64_t val)
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
 read_report_ticks(const uint32_t *report, enum intel_xe_oa_format_name format)
 {
@@ -3370,6 +3395,95 @@ done:
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
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+	};
+	struct intel_xe_oa_open_prop param = {
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
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
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
+			DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
+			DRM_XE_OA_PROPERTY_OA_DISABLED, true,
+			DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
+		};
+		struct intel_xe_oa_open_prop param = {
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
@@ -3456,6 +3570,137 @@ test_sysctl_defaults(void)
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
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	uint32_t *exec_q = calloc(qoa->num_oa_units, sizeof(u32));
+	uint32_t *perf_fd = calloc(qoa->num_oa_units, sizeof(u32));
+	u32 vm = xe_vm_create(drm_fd, 0, 0);
+	struct intel_xe_perf_metric_set *test_set;
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
+		perf_fd[i] = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param);
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
+		properties[10] = DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT;
+		properties[11] = oa_exp_1_millisec;
+		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EBUSY);
+
+		/* case 2: concurrent access to non-OAG unit should fail */
+		igt_debug("try with exec_q with c:i %d:%d\n",
+			  hwe->engine_class, hwe->engine_instance);
+		exec_q[i] = xe_exec_queue_create(drm_fd, vm, hwe, 0);
+		properties[10] = DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID;
+		properties[11] = exec_q[i];
+		errno = 0;
+		err = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param);
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
@@ -3630,6 +3875,25 @@ igt_main
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
+
 	igt_fixture {
 		/* leave sysctl options in their default state... */
 		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
-- 
2.41.0

