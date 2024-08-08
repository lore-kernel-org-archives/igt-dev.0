Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9A5C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  8 Aug 2024 17:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7230310E7B2;
	Thu,  8 Aug 2024 17:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PPtDas6W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E60210E7B2
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Aug 2024 17:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723138599; x=1754674599;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vUgAG5e8dV0Cub1tscVnP+c+4rsJHtIdZPeU31g1FAg=;
 b=PPtDas6WqDReTa3PSNR6dqBzVCIz1Gvx3C4s3FHtlYLrFOuvl/YoEbzB
 CMqtwX6Tgecf6zail/LClHA8SHBB6tHeOmfeSGe7fFVrod+wjD35J157W
 Jj4kihLf3U9zH2ncmkwzNBLKGolL0HmfezsNlUkYHSo3SioRjF0vGqcO+
 xrqlIiNKZ493qcTMCA4h0CaVRVpmZND00qYCxzbWPdvafGEjyzBU8oRLH
 qG+el3WwATkOGLqQaIE7wWLx3KbNVY/HRTdy6FP6e6TQJQJv84xsPjpRP
 yJslC+sGj76b9dOXSL69nW7rHl9j+2xMu5IFNf5XnSTITI93jG9gCNhjB A==;
X-CSE-ConnectionGUID: ZZORBpb6TDG7W/xATISk2A==
X-CSE-MsgGUID: 5wZwNlnlRF2HM9sLu32Lxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32432099"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="32432099"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 10:36:38 -0700
X-CSE-ConnectionGUID: P8Btrjo1ThSEaE/zWyUrkA==
X-CSE-MsgGUID: JbLf6ApaT6yTKrUS9k5Gaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="62253973"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 10:36:39 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jose Souza <jose.souza@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_oa: Add syncs-signal test for OA syncs
Date: Thu,  8 Aug 2024 10:36:32 -0700
Message-ID: <20240808173632.4027344-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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
 include/drm-uapi/xe_drm.h | 12 +++++
 lib/xe/xe_oa.c            |  6 +--
 lib/xe/xe_oa.h            |  2 +
 tests/intel/xe_oa.c       | 97 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 114 insertions(+), 3 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 29425d7fdc..f9f0d706cf 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -1632,6 +1632,18 @@ enum drm_xe_oa_property_id {
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
index f2c6d53007..0b9c3349cb 100644
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
@@ -4702,6 +4795,10 @@ igt_main
 		}
 	}
 
+	igt_subtest_with_dynamic("syncs-signal")
+		__for_one_render_engine(hwe)
+			test_syncs_signal(hwe);
+
 	igt_fixture {
 		/* leave sysctl options in their default state... */
 		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
-- 
2.41.0

