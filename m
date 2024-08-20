Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F90C52D7C
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 00:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E03D10E31D;
	Tue, 20 Aug 2024 00:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RULTcvzx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817ED10E320
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 00:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724113868; x=1755649868;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=S9Bzqg0JMJgtkQkA8b6I0XyQOCFSR+BFVWqw1FCJI7Q=;
 b=RULTcvzxYeQv2fE7+DNWasWLJRT4CHhbkY0ZK+YNfTUg4s52lQS7nRMe
 TsXZA8j3vL2Qqux5LCUVtEKtG0CWoS2GJU+8B02I49OXSmXHSdOHFWJq3
 vzgr7M3i+vyHM/KWU9M4JN3TZ5jj+2oXc9ZXv4m86rcUog7M1gIRtmZdm
 Vwo9knUKHGsXy9lMzDjVSzFlbj1kBmoseRcBAYQZXC8qLaVEOloqSu/Hs
 MEqrJ+wtS2yfQKHdAbl7A3LPDLocSFNDuwQBxuaA+hoMtAqGeAAPv4Vm7
 kn9IEaInFoT2F4quwf8/lbTVIkf2a+bnd23AKl65AH9hmuLPrkepmYk1C w==;
X-CSE-ConnectionGUID: 1XIluvEaTy2DCz1oEVJsGw==
X-CSE-MsgGUID: vRzbxPOKQYigy+N5g+koiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33544869"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="33544869"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 17:31:07 -0700
X-CSE-ConnectionGUID: e4PBqVGATByPMlmbW2U3BQ==
X-CSE-MsgGUID: wRiFAF5PRXiYQd7c4P38BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="61101266"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 17:31:07 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] tests/intel/oa: Add syncs-signal test for OA syncs
Date: Mon, 19 Aug 2024 17:31:03 -0700
Message-ID: <20240820003104.1407398-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240820003104.1407398-1-ashutosh.dixit@intel.com>
References: <20240820003104.1407398-1-ashutosh.dixit@intel.com>
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

Verify OA syncs signal correctly in open and change config code paths.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 include/drm-uapi/xe_drm.h |  18 +++++++
 lib/xe/xe_oa.c            |   6 +--
 lib/xe/xe_oa.h            |   2 +
 tests/intel/xe_oa.c       | 106 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 129 insertions(+), 3 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 29425d7fdc..10d1471128 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -1483,6 +1483,7 @@ struct drm_xe_oa_unit {
 	/** @capabilities: OA capabilities bit-mask */
 	__u64 capabilities;
 #define DRM_XE_OA_CAPS_BASE		(1 << 0)
+#define DRM_XE_OA_CAPS_SYNCS		(1 << 1)
 
 	/** @oa_timestamp_freq: OA timestamp freq */
 	__u64 oa_timestamp_freq;
@@ -1632,6 +1633,23 @@ enum drm_xe_oa_property_id {
 	 * to be disabled for the stream exec queue.
 	 */
 	DRM_XE_OA_PROPERTY_NO_PREEMPT,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_NUM_SYNCS: Number of syncs in the sync array
+	 * specified in @DRM_XE_OA_PROPERTY_SYNCS
+	 */
+	DRM_XE_OA_PROPERTY_NUM_SYNCS,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_SYNCS: Pointer to struct @drm_xe_sync array
+	 * with array size specified via @DRM_XE_OA_PROPERTY_NUM_SYNCS
+	 * with array size specified via @DRM_XE_OA_PROPERTY_NUM_SYNCS. OA
+	 * configuration will wait till input fences signal. Output fences
+	 * will signal after the new OA configuration takes effect. For
+	 * @DRM_XE_SYNC_TYPE_USER_FENCE, @addr is a user pointer, similar
+	 * to the VM bind case.
+	 */
+	DRM_XE_OA_PROPERTY_SYNCS,
 };
 
 /**
diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
index 4764ed1fcf..b1a9ff7fa4 100644
--- a/lib/xe/xe_oa.c
+++ b/lib/xe/xe_oa.c
@@ -1027,8 +1027,8 @@ const char *intel_xe_perf_read_report_reason(const struct intel_xe_perf *perf,
 	return "unknown";
 }
 
-static void xe_oa_prop_to_ext(struct intel_xe_oa_open_prop *properties,
-			      struct drm_xe_ext_set_property *extn)
+void intel_xe_oa_prop_to_ext(struct intel_xe_oa_open_prop *properties,
+			     struct drm_xe_ext_set_property *extn)
 {
 	__u64 *prop = from_user_pointer(properties->properties_ptr);
 	struct drm_xe_ext_set_property *ext = extn;
@@ -1065,7 +1065,7 @@ int intel_xe_perf_ioctl(int fd, enum drm_xe_observation_op op, void *arg)
 		struct intel_xe_oa_open_prop *oprop = (struct intel_xe_oa_open_prop *)arg;
 
 		igt_assert_lte(oprop->num_properties, XE_OA_MAX_SET_PROPERTIES);
-		xe_oa_prop_to_ext(oprop, ext);
+		intel_xe_oa_prop_to_ext(oprop, ext);
 	}
 
 	return igt_ioctl(fd, DRM_IOCTL_XE_OBSERVATION, &p);
diff --git a/lib/xe/xe_oa.h b/lib/xe/xe_oa.h
index 962f9dddcc..7d3d074560 100644
--- a/lib/xe/xe_oa.h
+++ b/lib/xe/xe_oa.h
@@ -398,6 +398,8 @@ uint64_t intel_xe_perf_read_record_timestamp_raw(const struct intel_xe_perf *per
 const char *intel_xe_perf_read_report_reason(const struct intel_xe_perf *perf,
 					     const struct intel_xe_perf_record_header *record);
 
+void intel_xe_oa_prop_to_ext(struct intel_xe_oa_open_prop *properties,
+			     struct drm_xe_ext_set_property *extn);
 int intel_xe_perf_ioctl(int fd, enum drm_xe_observation_op op, void *arg);
 void intel_xe_perf_ioctl_err(int fd, enum drm_xe_observation_op op, void *arg, int err);
 
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index f2c6d53007..bd38b24de8 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -22,6 +22,7 @@
 #include "drm.h"
 #include "igt.h"
 #include "igt_device.h"
+#include "igt_syncobj.h"
 #include "igt_sysfs.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
@@ -4454,6 +4455,98 @@ static void test_mapped_oa_buffer(map_oa_buffer_test_t test_with_fd_open,
 	__perf_close(stream_fd);
 }
 
+static bool find_alt_oa_config(u32 config_id, u32 *alt_config_id)
+{
+	struct dirent *entry;
+	int metrics_fd, dir_fd;
+	DIR *metrics_dir;
+	bool ret;
+
+	metrics_fd = openat(sysfs, "metrics", O_DIRECTORY);
+	igt_assert_lte(0, metrics_fd);
+
+	metrics_dir = fdopendir(metrics_fd);
+	igt_assert(metrics_dir);
+
+	while ((entry = readdir(metrics_dir))) {
+		if (entry->d_type != DT_DIR)
+			continue;
+
+		dir_fd = openat(metrics_fd, entry->d_name, O_RDONLY);
+		ret = __igt_sysfs_get_u32(dir_fd, "id", alt_config_id);
+		close(dir_fd);
+		if (!ret)
+			continue;
+
+		if (config_id != *alt_config_id) {
+			closedir(metrics_dir);
+			return true;
+		}
+	}
+
+	return false;
+}
+
+/**
+ * SUBTEST: syncs-signal
+ * Description: Test OA syncs signal correctly
+ */
+static void
+test_syncs_signal(const struct drm_xe_engine_class_instance *hwe)
+{
+	struct drm_xe_ext_set_property extn[XE_OA_MAX_SET_PROPERTIES] = {};
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct drm_xe_sync sync = {
+	    .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+	    .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+	};
+	uint64_t open_properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
+		DRM_XE_OA_PROPERTY_NUM_SYNCS, 1,
+		DRM_XE_OA_PROPERTY_SYNCS, to_user_pointer(&sync),
+	};
+	struct intel_xe_oa_open_prop open_param = {
+		.num_properties = ARRAY_SIZE(open_properties) / 2,
+		.properties_ptr = to_user_pointer(open_properties),
+	};
+	uint64_t config_properties[] = {
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, 0, /* Filled later */
+		DRM_XE_OA_PROPERTY_NUM_SYNCS, 1,
+		DRM_XE_OA_PROPERTY_SYNCS, to_user_pointer(&sync),
+	};
+	struct intel_xe_oa_open_prop config_param = {
+		.num_properties = ARRAY_SIZE(config_properties) / 2,
+		.properties_ptr = to_user_pointer(config_properties),
+	};
+	uint32_t syncobj = syncobj_create(drm_fd, 0);
+	uint32_t alt_config_id;
+	int ret;
+
+	sync.handle = syncobj;
+	stream_fd = __perf_open(drm_fd, &open_param, false);
+
+	igt_assert(syncobj_wait(drm_fd, &syncobj, 1, INT64_MAX, 0, NULL));
+
+	/* Change stream configuration */
+	syncobj_reset(drm_fd, &syncobj, 1);
+	if (!find_alt_oa_config(test_set->perf_oa_metrics_set, &alt_config_id))
+		goto out;
+
+	config_properties[1] = alt_config_id;
+	intel_xe_oa_prop_to_ext(&config_param, extn);
+
+	ret = igt_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_CONFIG, extn);
+	igt_assert_eq(ret, test_set->perf_oa_metrics_set);
+
+	igt_assert(syncobj_wait(drm_fd, &syncobj, 1, INT64_MAX, 0, NULL));
+out:
+	__perf_close(stream_fd);
+	syncobj_destroy(drm_fd, syncobj);
+}
+
 static const char *xe_engine_class_name(uint32_t engine_class)
 {
 	switch (engine_class) {
@@ -4702,6 +4795,19 @@ igt_main
 		}
 	}
 
+	igt_subtest_group {
+		igt_fixture {
+			struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
+			struct drm_xe_oa_unit *oau = (struct drm_xe_oa_unit *)&qoa->oa_units[0];
+
+			igt_require(oau->capabilities & DRM_XE_OA_CAPS_SYNCS);
+		}
+
+		igt_subtest_with_dynamic("syncs-signal")
+			__for_one_render_engine(hwe)
+				test_syncs_signal(hwe);
+	}
+
 	igt_fixture {
 		/* leave sysctl options in their default state... */
 		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
-- 
2.41.0

