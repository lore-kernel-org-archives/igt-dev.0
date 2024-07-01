Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D236C3271F
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 01:41:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E601D10E2E5;
	Mon,  1 Jul 2024 01:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ehCNE+47";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963C710E136
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 01:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719798105; x=1751334105;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+C3LjNIq+yY/bmhY1QEoT64rsvGFiVADaAE60zEx+C4=;
 b=ehCNE+47FX1DGqa6z1KjTgsb62CNBsc/d/1/OqBoBILdEbM+zU9xuixm
 eOMXNZO+cuJNmztzL7ZltuyQXzLy877DRjGqEuE1fZK/5cdZkPc7v8nJl
 TPtYIaWEk9mGa6viZahbj71NxybwaXhXX8mBRNT/Cvgd1xKZaCSL7c831
 wJWHwpNQSXASFhOYepkH1W3a2q1DSaJoBhES3erp+GNOtIef5TbrmZEol
 bhxiqnbI8eoiA7t0BmFmU3shefrhcs1vr41O3nnPFN14L2ztbTh1X+X5c
 +8lOVzgeEVo+aFb7/V3gimQccpL/N1aomGBSJWdhP0+hhYIAqKrGsem6D w==;
X-CSE-ConnectionGUID: c+tPZy/eTBqpFl5427h8JA==
X-CSE-MsgGUID: HknVe3RnQYaagmV6PT+nSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="19801046"
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="19801046"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 18:41:44 -0700
X-CSE-ConnectionGUID: iLXc+coXSR+Nu3ltPKIBVw==
X-CSE-MsgGUID: ui3+SwAeRGW5ydJ0cSu8rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="46091829"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 18:41:44 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 02/13] tests/intel/xe_oa: Add some negative tests
Date: Sun, 30 Jun 2024 18:41:24 -0700
Message-ID: <20240701014135.2412560-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240701014135.2412560-1-ashutosh.dixit@intel.com>
References: <20240701014135.2412560-1-ashutosh.dixit@intel.com>
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
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 192 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 192 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 2b5044b116..9a59350b16 100644
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

