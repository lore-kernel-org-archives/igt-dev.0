Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC85C27C42
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 03:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BD810E2C1;
	Fri, 24 May 2024 03:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXGl3N/I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF5F10E2C1
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 03:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716520491; x=1748056491;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7KBoc361MQLxjr/DTsY0dRnS30FYEVVEitwqfydQPGI=;
 b=IXGl3N/IOT/gBt8nwBQc+OmAeESQOfYgeyqbAGlsR4zuoC3/pw1VlEC6
 Cv5UVJ4TJ4ELjZIflkxuXuSmhGP8SkNATsAZFzHfU+3348Oy7BeH70F2h
 VX9SkNtfPXXp9YtTDKqvUAe5aEi7ZmcilEqwlc8/JzA2sBzo3ePDVyKOA
 3JCc/KMt3m2TuvJ21YB5MgDc9kNaNjYC5CU05yVKjaUTys2nmAMr4SvL8
 cH8+klAppqJEGv/4G4d+OCMO+/28cHycUMY2ImC1MCwLa5aFqL6zWHddS
 ZZyVRYaExZr2gl5krCub6SYqGoANAkU5xwxUWbfkWYmvGqPzw+fYVU+/5 g==;
X-CSE-ConnectionGUID: 1LG4+2F0RYig55Q6b7vE9Q==
X-CSE-MsgGUID: LhleiIF3ScmDk0hXpJfC2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="30384632"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="30384632"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 20:14:49 -0700
X-CSE-ConnectionGUID: F6zVfoeZSFyMV/YT0bG3dw==
X-CSE-MsgGUID: fL/al6LZSEWSmma+OmS/qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="34413525"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 20:14:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 11/23] tests/intel/xe_oa: Add some negative tests
Date: Thu, 23 May 2024 20:14:27 -0700
Message-ID: <20240524031439.106332-12-ashutosh.dixit@intel.com>
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

Add:
	"non-system-wide-paranoid"
	"invalid-oa-metric-set-id"
	"invalid-oa-format-id"
	"missing-sample-flags"

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 192 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 192 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 5c872b74b2..97bbd13674 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -301,6 +301,7 @@ struct drm_xe_engine_class_instance default_hwe;
 static struct intel_xe_perf *intel_xe_perf;
 static uint64_t oa_exp_1_millisec;
 struct intel_mmio_data mmio_data;
+static igt_render_copyfunc_t render_copy;
 
 static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_class_instance *hwe)
 {
@@ -548,6 +549,166 @@ init_sys_info(void)
 	return true;
 }
 
+/**
+ * SUBTEST: non-system-wide-paranoid
+ * Description: CAP_SYS_ADMIN is required to open system wide metrics, unless
+ *		sysctl parameter dev.xe.perf_stream_paranoid == 0
+ */
+static void test_system_wide_paranoid(void)
+{
+	igt_fork(child, 1) {
+		uint64_t properties[] = {
+			DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+
+			/* Include OA reports in samples */
+			DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+
+			/* OA unit configuration */
+			DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
+			DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
+			DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+		};
+		struct intel_xe_oa_open_prop param = {
+			.num_properties = ARRAY_SIZE(properties) / 2,
+			.properties_ptr = to_user_pointer(properties),
+		};
+
+		write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
+
+		igt_drop_root();
+
+		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EACCES);
+	}
+
+	igt_waitchildren();
+
+	igt_fork(child, 1) {
+		uint64_t properties[] = {
+			DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+
+			/* Include OA reports in samples */
+			DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+
+			/* OA unit configuration */
+			DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
+			DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
+			DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+		};
+		struct intel_xe_oa_open_prop param = {
+			.num_properties = ARRAY_SIZE(properties) / 2,
+			.properties_ptr = to_user_pointer(properties),
+		};
+		write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 0);
+
+		igt_drop_root();
+
+		stream_fd = __perf_open(drm_fd, &param, false);
+		__perf_close(stream_fd);
+	}
+
+	igt_waitchildren();
+
+	/* leave in paranoid state */
+	write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
+}
+
+/**
+ * SUBTEST: invalid-oa-metric-set-id
+ * Description: Test behavior for invalid metric set id's
+ */
+static void test_invalid_oa_metric_set_id(void)
+{
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+
+		/* Include OA reports in samples */
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+
+		/* OA unit configuration */
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, UINT64_MAX,
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
+
+	properties[ARRAY_SIZE(properties) - 1] = 0; /* ID 0 is also be reserved as invalid */
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
+
+	/* Check that we aren't just seeing false positives... */
+	properties[ARRAY_SIZE(properties) - 1] = default_test_set->perf_oa_metrics_set;
+	stream_fd = __perf_open(drm_fd, &param, false);
+	__perf_close(stream_fd);
+
+	/* There's no valid default OA metric set ID... */
+	param.num_properties--;
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
+}
+
+/**
+ * SUBTEST: invalid-oa-format-id
+ * Description: Test behavior for invalid OA format fields
+ */
+static void test_invalid_oa_format_id(void)
+{
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+
+		/* Include OA reports in samples */
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+
+		/* OA unit configuration */
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, UINT64_MAX, /* No __ff() here */
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
+
+	properties[ARRAY_SIZE(properties) - 1] = __ff(0); /* ID 0 is also be reserved as invalid */
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
+
+	/* Check that we aren't just seeing false positives... */
+	properties[ARRAY_SIZE(properties) - 1] = __ff(default_test_set->perf_oa_format);
+	stream_fd = __perf_open(drm_fd, &param, false);
+	__perf_close(stream_fd);
+	/* There's no valid default OA format... */
+	param.num_properties--;
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
+}
+
+/**
+ * SUBTEST: missing-sample-flags
+ * Description: Test behavior for no SAMPLE_OA and no EXEC_QUEUE_ID
+ */
+static void test_missing_sample_flags(void)
+{
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+
+		/* No _PROP_SAMPLE_xyz flags */
+
+		/* OA unit configuration */
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
+}
+
 static void
 read_2_oa_reports(int format_id,
 		  int exponent,
@@ -791,6 +952,37 @@ igt_main
 	igt_subtest("sysctl-defaults")
 		test_sysctl_defaults();
 
+	igt_fixture {
+		/* We expect that the ref count test before these fixtures
+		 * should have closed drm_fd...
+		 */
+		igt_assert_eq(drm_fd, -1);
+
+		drm_fd = drm_open_driver(DRIVER_XE);
+		xe_device_get(drm_fd);
+
+		devid = intel_get_drm_devid(drm_fd);
+		sysfs = igt_sysfs_open(drm_fd);
+
+		igt_require(init_sys_info());
+
+		write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
+
+		render_copy = igt_get_render_copyfunc(devid);
+	}
+
+	igt_subtest("non-system-wide-paranoid")
+		test_system_wide_paranoid();
+
+	igt_subtest("invalid-oa-metric-set-id")
+		test_invalid_oa_metric_set_id();
+
+	igt_subtest("invalid-oa-format-id")
+		test_invalid_oa_format_id();
+
+	igt_subtest("missing-sample-flags")
+		test_missing_sample_flags();
+
 	igt_fixture {
 		/* leave sysctl options in their default state... */
 		write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
-- 
2.41.0

