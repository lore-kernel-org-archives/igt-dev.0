Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5776FC48260
	for <igt-dev@archiver.kernel.org>; Fri, 16 Feb 2024 23:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E071B10ED11;
	Fri, 16 Feb 2024 23:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPcQPXOH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F6D10ED06
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Feb 2024 23:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708125433; x=1739661433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lFcGTgQX3ZfW7+hhjtPuhLLOJxLwBqR6ZByo7skMJfI=;
 b=GPcQPXOHICEst65DouK87BvAJOXqH0//aJ/j9+n/+n1KM8/6YxmVUG8R
 pRUv1EOhfX1+5MPRnXzFASsu+uJs+EX1pvPfRWV6GJRhOZDUl69THmjq5
 BDm4DuKqeBjOT7yO3UlZORgIes6mQqaMxmG0NOrQaJ8LCcW7tRVcceNef
 bUqKTug35mmG5N3WdZz2QBGlhXYdQFwuPQl3D+zm/dp+eW7bp4q9IOApU
 w1H4gxEmkYJPQKocR9qTMxBMRaIOdx4QJGsMmNVXSydbuAVG/MMXWxu3j
 pk4fbNndcYD3suzvCoaRxa8YJ1uYwpaxW0gZIl8ouqaZ/z9c+Fd0TxcIM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="27724283"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; d="scan'208";a="27724283"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 15:17:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="8626878"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 15:17:09 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 09/18] tests/intel/xe_oa: Add some negative tests
Date: Fri, 16 Feb 2024 15:16:54 -0800
Message-ID: <20240216231703.845644-10-ashutosh.dixit@intel.com>
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
index 1bdd779e2419..e1ad1dd3d901 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -341,6 +341,7 @@ struct drm_xe_engine_class_instance default_hwe;
 static struct intel_perf *intel_perf;
 static uint64_t oa_exp_1_millisec;
 struct intel_mmio_data mmio_data;
+static igt_render_copyfunc_t render_copy;
 
 static struct intel_perf_metric_set *metric_set(const struct drm_xe_engine_class_instance *hwe)
 {
@@ -588,6 +589,166 @@ init_sys_info(void)
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
+			DRM_XE_OA_PROPERTY_OA_EXPONENT, oa_exp_1_millisec,
+		};
+		struct drm_xe_oa_open_prop param = {
+			.num_properties = ARRAY_SIZE(properties) / 2,
+			.properties_ptr = to_user_pointer(properties),
+		};
+
+		write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
+
+		igt_drop_root();
+
+		xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EACCES);
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
+			DRM_XE_OA_PROPERTY_OA_EXPONENT, oa_exp_1_millisec,
+		};
+		struct drm_xe_oa_open_prop param = {
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
+		DRM_XE_OA_PROPERTY_OA_EXPONENT, oa_exp_1_millisec,
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, UINT64_MAX,
+	};
+	struct drm_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+
+	xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
+
+	properties[ARRAY_SIZE(properties) - 1] = 0; /* ID 0 is also be reserved as invalid */
+	xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
+
+	/* Check that we aren't just seeing false positives... */
+	properties[ARRAY_SIZE(properties) - 1] = default_test_set->perf_oa_metrics_set;
+	stream_fd = __perf_open(drm_fd, &param, false);
+	__perf_close(stream_fd);
+
+	/* There's no valid default OA metric set ID... */
+	param.num_properties--;
+	xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
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
+		DRM_XE_OA_PROPERTY_OA_EXPONENT, oa_exp_1_millisec,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, UINT64_MAX, /* No __ff() here */
+	};
+	struct drm_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+
+	xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
+
+	properties[ARRAY_SIZE(properties) - 1] = __ff(0); /* ID 0 is also be reserved as invalid */
+	xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
+
+	/* Check that we aren't just seeing false positives... */
+	properties[ARRAY_SIZE(properties) - 1] = __ff(default_test_set->perf_oa_format);
+	stream_fd = __perf_open(drm_fd, &param, false);
+	__perf_close(stream_fd);
+	/* There's no valid default OA format... */
+	param.num_properties--;
+	xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
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
+		DRM_XE_OA_PROPERTY_OA_EXPONENT, oa_exp_1_millisec,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
+	};
+	struct drm_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+
+	xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param, EINVAL);
+}
+
 static void
 read_2_oa_reports(int format_id,
 		  int exponent,
@@ -830,6 +991,37 @@ igt_main
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

