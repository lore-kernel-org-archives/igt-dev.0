Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521CCCAC5AC
	for <igt-dev@archiver.kernel.org>; Tue, 17 Sep 2024 23:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3AA10E02A;
	Tue, 17 Sep 2024 23:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXLxnbiO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4211910E02A
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Sep 2024 23:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726615627; x=1758151627;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zzTIxBnqLX7Ls6krQbZlMeLOK5/UR7VFFN59BFTj6BM=;
 b=iXLxnbiO5dtNZsBjklSMKTZuiH3U4EE4y3CRZxNt756/g2QqxS0VImsN
 bapphQXy2gXPBC6auqMF9zVIP6g53ywWkGFLJCl+KLgBQPX7IeaciIM1e
 h8VkF2jeHMCf2Wit54exvqIVVtanoeGlH8yuFu1IoU57YiKDpQ7I+Wfv7
 ceXwmLK4TG4J+TIxVS4lfFfJR5A07tuo5NUW378vRzByBp6po+CbDwzNX
 mlA9++oDzvYacGs1keleX4UarqaT7GoSJxzcqxfJ2cTN3S2vT+jXw0z32
 oFxJQUma5woqdaX1kJumHjD8RPUwT5G+/cuK4qDozvlXsNLiTIx+Qp/ph g==;
X-CSE-ConnectionGUID: wAXuTjVrScefLLR4EtIc/Q==
X-CSE-MsgGUID: SRO/c0yiSzypArTet4x1jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36883750"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="36883750"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 16:27:04 -0700
X-CSE-ConnectionGUID: EaUJ9bjPRGi5QjHDowlWRA==
X-CSE-MsgGUID: Y5DIFU7aTGGu59sz9uVZ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="73920414"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 16:27:03 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/oa: Tests for OA syncs
Date: Tue, 17 Sep 2024 16:26:59 -0700
Message-ID: <20240917232659.3123456-1-ashutosh.dixit@intel.com>
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

Verify OA syncs signal correctly in open and change config code
paths. Verify with different types of sync objects as well as by both
waiting and skipping the wait for syncs to signal.

v2: Significant expand oa syncs testing as described above

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 include/drm-uapi/xe_drm.h |  18 +++
 lib/xe/xe_oa.c            |   6 +-
 lib/xe/xe_oa.h            |   2 +
 tests/intel/xe_oa.c       | 261 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 284 insertions(+), 3 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index f0a450db95..8ed9940568 100644
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
index 86264230c9..6444d2c755 100644
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
index aae9be2c40..506646789c 100644
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
@@ -4459,6 +4460,231 @@ static void test_mapped_oa_buffer(map_oa_buffer_test_t test_with_fd_open,
 	__perf_close(stream_fd);
 }
 
+
+/* Return alternative config_id if available, else just return config_id */
+static void find_alt_oa_config(u32 config_id, u32 *alt_config_id)
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
+		if (config_id != *alt_config_id)
+			goto exit;
+	}
+
+	*alt_config_id = config_id;
+exit:
+	closedir(metrics_dir);
+}
+
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+
+#define WAIT		(0x1 << 0)
+#define CONFIG		(0x1 << 1)
+
+enum oa_sync_type {
+	OA_SYNC_TYPE_SYNCOBJ,
+	OA_SYNC_TYPE_USERPTR,
+	OA_SYNC_TYPE_UFENCE,
+};
+
+struct oa_sync {
+	enum oa_sync_type sync_type;
+	u32 syncobj;
+	u32 vm;
+	u32 bo;
+	size_t bo_size;
+	struct {
+		uint64_t vm_sync;
+		uint64_t pad;
+		uint64_t oa_sync;
+	} *data;
+};
+
+static void
+oa_sync_init(enum oa_sync_type sync_type, const struct drm_xe_engine_class_instance *hwe,
+	     struct oa_sync *osync, struct drm_xe_sync *sync)
+{
+	uint64_t addr = 0x1a0000;
+
+	osync->sync_type = sync_type;
+	sync->flags = DRM_XE_SYNC_FLAG_SIGNAL;
+
+	switch (osync->sync_type) {
+	case OA_SYNC_TYPE_SYNCOBJ:
+		osync->syncobj = syncobj_create(drm_fd, 0);
+		sync->handle = osync->syncobj;
+		sync->type = DRM_XE_SYNC_TYPE_SYNCOBJ;
+		break;
+	case OA_SYNC_TYPE_USERPTR:
+	case OA_SYNC_TYPE_UFENCE:
+		sync->type = DRM_XE_SYNC_TYPE_USER_FENCE;
+		sync->timeline_value = USER_FENCE_VALUE;
+
+		osync->vm = xe_vm_create(drm_fd, 0, 0);
+		osync->bo_size = xe_bb_size(drm_fd, sizeof(*osync->data));
+		if (osync->sync_type == OA_SYNC_TYPE_USERPTR) {
+			osync->data = aligned_alloc(xe_get_default_alignment(drm_fd),
+						    osync->bo_size);
+			igt_assert(osync->data);
+		} else {
+			osync->bo = xe_bo_create(drm_fd, osync->vm, osync->bo_size,
+						 vram_if_possible(drm_fd, hwe->gt_id),
+						 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+			osync->data = xe_bo_map(drm_fd, osync->bo, osync->bo_size);
+		}
+		memset(osync->data, 0, osync->bo_size);
+
+		sync->addr = to_user_pointer(&osync->data[0].vm_sync);
+		if (osync->bo)
+			xe_vm_bind_async(drm_fd, osync->vm, 0, osync->bo, 0,
+					 addr, osync->bo_size, sync, 1);
+		else
+			xe_vm_bind_userptr_async(drm_fd, osync->vm, 0,
+						 to_user_pointer(osync->data),
+						 addr, osync->bo_size, sync, 1);
+		xe_wait_ufence(drm_fd, &osync->data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+
+		sync->addr = to_user_pointer(&osync->data[0].oa_sync);
+		break;
+	default:
+		igt_assert(false);
+	}
+}
+
+static void oa_sync_wait(struct oa_sync *osync)
+{
+	switch (osync->sync_type) {
+	case OA_SYNC_TYPE_SYNCOBJ:
+		igt_assert(syncobj_wait(drm_fd, &osync->syncobj, 1, INT64_MAX, 0, NULL));
+		syncobj_reset(drm_fd, &osync->syncobj, 1);
+		break;
+	case OA_SYNC_TYPE_USERPTR:
+	case OA_SYNC_TYPE_UFENCE:
+		xe_wait_ufence(drm_fd, &osync->data[0].oa_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+		osync->data[0].oa_sync = 0;
+		break;
+	default:
+		igt_assert(false);
+	}
+}
+
+static void oa_sync_free(struct oa_sync *osync)
+{
+	switch (osync->sync_type) {
+	case OA_SYNC_TYPE_SYNCOBJ:
+		syncobj_destroy(drm_fd, osync->syncobj);
+		break;
+	case OA_SYNC_TYPE_USERPTR:
+	case OA_SYNC_TYPE_UFENCE:
+		if (osync->bo) {
+			munmap(osync->data, osync->bo_size);
+			gem_close(drm_fd, osync->bo);
+		} else {
+			free(osync->data);
+		}
+		xe_vm_destroy(drm_fd, osync->vm);
+		break;
+	default:
+		igt_assert(false);
+	}
+}
+
+/**
+ * SUBTEST: syncs-%s-%s
+ *
+ * Description: Test OA syncs (with %arg[1] sync types and %arg[2] wait and
+ *		reconfig flags) signal correctly in open and reconfig code
+ *		paths
+ *
+ * arg[1]:
+ *
+ * @syncobj:	sync type syncobj
+ * @userptr:	sync type userptr
+ * @ufence:	sync type ufence
+ *
+ * arg[2]:
+ *
+ * @wait-cfg:	Exercise reconfig path and wait for syncs to signal
+ * @wait:	Don't exercise reconfig path and wait for syncs to signal
+ * @cfg:	Exercise reconfig path but don't wait for syncs to signal
+ * @none:	Don't exercise reconfig path and don't wait for syncs to signal
+ */
+static void test_syncs(const struct drm_xe_engine_class_instance *hwe,
+		       enum oa_sync_type sync_type, int flags)
+{
+	struct drm_xe_ext_set_property extn[XE_OA_MAX_SET_PROPERTIES] = {};
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct drm_xe_sync sync = {};
+	struct oa_sync osync = {};
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
+	uint32_t alt_config_id;
+	int ret;
+
+	oa_sync_init(sync_type, hwe, &osync, &sync);
+
+	stream_fd = __perf_open(drm_fd, &open_param, false);
+
+	/* Reset the sync object if we are going to reconfig the stream */
+	if (flags & (WAIT | CONFIG))
+		oa_sync_wait(&osync);
+
+	if (!(flags & CONFIG))
+		goto exit;
+
+	/* Change stream configuration */
+	find_alt_oa_config(test_set->perf_oa_metrics_set, &alt_config_id);
+
+	config_properties[1] = alt_config_id;
+	intel_xe_oa_prop_to_ext(&config_param, extn);
+
+	ret = igt_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_CONFIG, extn);
+	igt_assert_eq(ret, test_set->perf_oa_metrics_set);
+
+	if (flags & WAIT)
+		oa_sync_wait(&osync);
+exit:
+	__perf_close(stream_fd);
+	oa_sync_free(&osync);
+}
+
 static const char *xe_engine_class_name(uint32_t engine_class)
 {
 	switch (engine_class) {
@@ -4507,6 +4733,25 @@ static const char *xe_engine_class_name(uint32_t engine_class)
 
 igt_main
 {
+	const struct sync_section {
+		const char *name;
+		enum oa_sync_type sync_type;
+		unsigned int flags;
+	} sync_sections[] = {
+		{ "syncobj-wait-cfg", OA_SYNC_TYPE_SYNCOBJ, WAIT | CONFIG},
+		{ "syncobj-wait", OA_SYNC_TYPE_SYNCOBJ, WAIT },
+		{ "syncobj-cfg", OA_SYNC_TYPE_SYNCOBJ, CONFIG },
+		{ "syncobj-none", OA_SYNC_TYPE_SYNCOBJ, 0 },
+		{ "userptr-wait-cfg", OA_SYNC_TYPE_USERPTR, WAIT | CONFIG},
+		{ "userptr-wait", OA_SYNC_TYPE_USERPTR, WAIT },
+		{ "userptr-cfg", OA_SYNC_TYPE_USERPTR, CONFIG },
+		{ "userptr-none", OA_SYNC_TYPE_USERPTR, 0 },
+		{ "ufence-wait-cfg", OA_SYNC_TYPE_UFENCE, WAIT | CONFIG},
+		{ "ufence-wait", OA_SYNC_TYPE_UFENCE, WAIT },
+		{ "ufence-cfg", OA_SYNC_TYPE_UFENCE, CONFIG },
+		{ "ufence-none", OA_SYNC_TYPE_UFENCE, 0 },
+		{ NULL },
+	};
 	struct drm_xe_engine_class_instance *hwe = NULL;
 	struct xe_device *xe_dev;
 
@@ -4707,6 +4952,22 @@ igt_main
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
+		for (const struct sync_section *s = sync_sections; s->name; s++) {
+			igt_subtest_with_dynamic_f("syncs-%s", s->name)
+				__for_one_render_engine(hwe)
+					test_syncs(hwe, s->sync_type, s->flags);
+
+		}
+	}
+
 	igt_fixture {
 		/* leave sysctl options in their default state... */
 		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
-- 
2.41.0

