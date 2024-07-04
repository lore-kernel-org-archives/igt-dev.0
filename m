Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C2AC3271E
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jul 2024 01:11:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F109E10E2A4;
	Thu,  4 Jul 2024 01:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kUqCEC+N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CA710E02A
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jul 2024 01:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720055507; x=1751591507;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bqQXFze7RMj30SO35xR03Tyt2XFbq9kPu1O6iRny6XI=;
 b=kUqCEC+NEBfbbYd8i/BSHu9UUF7DSlCMHy1kCkpNG1rqXZjBXybLCR5m
 4ru69uUPCUWIbG+kFEN9c3Tc98XBuAX54Cy8GACkLSUrc1JQXjLxuBzg5
 ZZosz4MCR8j+spQme/VWEw0oXDNTrXxfNukL7Dr6/QXuXP3RgeqhjITKQ
 f1KZEdV9o7KddgsCX5jnOGCAyv9/41Sb2zBJ/YDcPyyPYaDAXRvZczp1y
 umh6vFHujiC2nFam9LpfHTWCl1Rf3Qsn/Ui/5W4GipaNvxLHPMIFUAi2b
 GsTE3cR1YMK4vby2EZ6gXZdihf/V+aAiMNN64CBuHz5fVwJ2m1yMOjNHo A==;
X-CSE-ConnectionGUID: gwrhAGJ6ToiIY0m5ZZCBAQ==
X-CSE-MsgGUID: OkgxEkO+QAmkvME7Mv7pvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17450012"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="17450012"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 18:11:46 -0700
X-CSE-ConnectionGUID: GIXueieQQ4KFGx64drfHKw==
X-CSE-MsgGUID: bSKlAKiWTiOpjHaE0Ue90w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="46320132"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 18:11:45 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 04/15] tests/intel/xe_oa: Add some negative tests
Date: Wed,  3 Jul 2024 18:11:31 -0700
Message-ID: <20240704011142.2618968-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240704011142.2618968-1-ashutosh.dixit@intel.com>
References: <20240704011142.2618968-1-ashutosh.dixit@intel.com>
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

v2: Rename xe perf layer as xe observation layer

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 192 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 192 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 34ba46bed9..f8422d1eed 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -303,6 +303,7 @@ struct drm_xe_engine_class_instance default_hwe;
 static struct intel_xe_perf *intel_xe_perf;
 static uint64_t oa_exp_1_millisec;
 struct intel_mmio_data mmio_data;
+static igt_render_copyfunc_t render_copy;
 
 static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_class_instance *hwe)
 {
@@ -550,6 +551,166 @@ init_sys_info(void)
 	return true;
 }
 
+/**
+ * SUBTEST: non-system-wide-paranoid
+ * Description: CAP_SYS_ADMIN is required to open system wide metrics, unless
+ *		sysctl parameter dev.xe.observation_paranoid == 0
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
+		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
+
+		igt_drop_root();
+
+		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EACCES);
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
+		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 0);
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
+	write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
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
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
+
+	properties[ARRAY_SIZE(properties) - 1] = 0; /* ID 0 is also be reserved as invalid */
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
+
+	/* Check that we aren't just seeing false positives... */
+	properties[ARRAY_SIZE(properties) - 1] = default_test_set->perf_oa_metrics_set;
+	stream_fd = __perf_open(drm_fd, &param, false);
+	__perf_close(stream_fd);
+
+	/* There's no valid default OA metric set ID... */
+	param.num_properties--;
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
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
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
+
+	properties[ARRAY_SIZE(properties) - 1] = __ff(0); /* ID 0 is also be reserved as invalid */
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
+
+	/* Check that we aren't just seeing false positives... */
+	properties[ARRAY_SIZE(properties) - 1] = __ff(default_test_set->perf_oa_format);
+	stream_fd = __perf_open(drm_fd, &param, false);
+	__perf_close(stream_fd);
+	/* There's no valid default OA format... */
+	param.num_properties--;
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
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
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EINVAL);
+}
+
 static void
 read_2_oa_reports(int format_id,
 		  int exponent,
@@ -793,6 +954,37 @@ igt_main
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
+		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
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
 		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
-- 
2.41.0

