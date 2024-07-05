Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E09CC3DA40
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jul 2024 18:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB6C10EBC2;
	Fri,  5 Jul 2024 18:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B5Q3chRj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D4310E1DF
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jul 2024 18:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720204000; x=1751740000;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=n0DnwhexYBKnZyqNoVNjGapW29XkQrpywgljLydXr3g=;
 b=B5Q3chRjcOX2MQYndrYsft57Hel1cvn5RvYbfMx7rujP7LLmhuhtm596
 XQJ1onCdzALME6FFA09hddlrZwnuaLfE9/OcLnKZaWvbck0wP2qZReD8c
 eLYyKc1VjIeKOvVPdAh5NPhsUAEmd2/qNKysNN/9ARlHZr6v3nEC9lYAT
 n1gi26PczIi/GTt9EqHv8xLOH3tmt8UlBiJI6NzuI2f1qgSeXY66SPdO9
 ApxKtIX4eUYIrn0mpNBiqfGnb0tz44hrcevkZQpAcOH5zRFiIrbvgJ74Y
 9TZrCWt8/lKGLaNApWcVnhRiXqA+/SbWMgg8v9WuR7U9eaDztEiE3p9Hh g==;
X-CSE-ConnectionGUID: YzMSkb1NSl63IKCOhPNdbQ==
X-CSE-MsgGUID: msy+nfU/Qy2giMF2yBqJsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17146538"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="17146538"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 11:26:40 -0700
X-CSE-ConnectionGUID: QCneRA7eRyKq0+S3L0+WRQ==
X-CSE-MsgGUID: OH04J73VT6OlUYFs4BxC2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="47011691"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 11:26:40 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 01/15] drm-uapi/xe: Sync with Perf/Observation layer
 uapi updates
Date: Fri,  5 Jul 2024 11:26:22 -0700
Message-ID: <20240705182637.2679730-2-ashutosh.dixit@intel.com>
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

Align with kernel commit 8169b2097d88 ("drm/xe/uapi: Rename xe perf layer
as xe observation layer") which changes uapi to rename perf streams to
observation streams.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 include/drm-uapi/xe_drm.h        | 102 ++++++++++++++++---------------
 lib/xe/xe_oa.c                   |  18 +++---
 lib/xe/xe_oa.h                   |   4 +-
 tools/xe-perf/xe_perf_configs.c  |   2 +-
 tools/xe-perf/xe_perf_recorder.c |   4 +-
 5 files changed, 66 insertions(+), 64 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index a5f94bb625..3bab3fdaa8 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -80,7 +80,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
  *  - &DRM_IOCTL_XE_EXEC
  *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
- *  - &DRM_IOCTL_XE_PERF
+ *  - &DRM_IOCTL_XE_OBSERVATION
  */
 
 /*
@@ -101,7 +101,7 @@ extern "C" {
 #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
-#define DRM_XE_PERF			0x0b
+#define DRM_XE_OBSERVATION		0x0b
 
 /* Must be kept compact -- no holes */
 
@@ -116,7 +116,7 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
-#define DRM_IOCTL_XE_PERF			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF, struct drm_xe_perf_param)
+#define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1376,66 +1376,67 @@ struct drm_xe_wait_user_fence {
 };
 
 /**
- * enum drm_xe_perf_type - Perf stream types
+ * enum drm_xe_observation_type - Observation stream types
  */
-enum drm_xe_perf_type {
-	/** @DRM_XE_PERF_TYPE_OA: OA perf stream type */
-	DRM_XE_PERF_TYPE_OA,
+enum drm_xe_observation_type {
+	/** @DRM_XE_OBSERVATION_TYPE_OA: OA observation stream type */
+	DRM_XE_OBSERVATION_TYPE_OA,
 };
 
 /**
- * enum drm_xe_perf_op - Perf stream ops
+ * enum drm_xe_observation_op - Observation stream ops
  */
-enum drm_xe_perf_op {
-	/** @DRM_XE_PERF_OP_STREAM_OPEN: Open a perf counter stream */
-	DRM_XE_PERF_OP_STREAM_OPEN,
+enum drm_xe_observation_op {
+	/** @DRM_XE_OBSERVATION_OP_STREAM_OPEN: Open an observation stream */
+	DRM_XE_OBSERVATION_OP_STREAM_OPEN,
 
-	/** @DRM_XE_PERF_OP_ADD_CONFIG: Add perf stream config */
-	DRM_XE_PERF_OP_ADD_CONFIG,
+	/** @DRM_XE_OBSERVATION_OP_ADD_CONFIG: Add observation stream config */
+	DRM_XE_OBSERVATION_OP_ADD_CONFIG,
 
-	/** @DRM_XE_PERF_OP_REMOVE_CONFIG: Remove perf stream config */
-	DRM_XE_PERF_OP_REMOVE_CONFIG,
+	/** @DRM_XE_OBSERVATION_OP_REMOVE_CONFIG: Remove observation stream config */
+	DRM_XE_OBSERVATION_OP_REMOVE_CONFIG,
 };
 
 /**
- * struct drm_xe_perf_param - Input of &DRM_XE_PERF
+ * struct drm_xe_observation_param - Input of &DRM_XE_OBSERVATION
  *
- * The perf layer enables multiplexing perf counter streams of multiple
- * types. The actual params for a particular stream operation are supplied
- * via the @param pointer (use __copy_from_user to get these params).
+ * The observation layer enables multiplexing observation streams of
+ * multiple types. The actual params for a particular stream operation are
+ * supplied via the @param pointer (use __copy_from_user to get these
+ * params).
  */
-struct drm_xe_perf_param {
+struct drm_xe_observation_param {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
-	/** @perf_type: Perf stream type, of enum @drm_xe_perf_type */
-	__u64 perf_type;
-	/** @perf_op: Perf op, of enum @drm_xe_perf_op */
-	__u64 perf_op;
+	/** @observation_type: observation stream type, of enum @drm_xe_observation_type */
+	__u64 observation_type;
+	/** @observation_op: observation stream op, of enum @drm_xe_observation_op */
+	__u64 observation_op;
 	/** @param: Pointer to actual stream params */
 	__u64 param;
 };
 
 /**
- * enum drm_xe_perf_ioctls - Perf fd ioctl's
+ * enum drm_xe_observation_ioctls - Observation stream fd ioctl's
  *
- * Information exchanged between userspace and kernel for perf fd ioctl's
- * is stream type specific
+ * Information exchanged between userspace and kernel for observation fd
+ * ioctl's is stream type specific
  */
-enum drm_xe_perf_ioctls {
-	/** @DRM_XE_PERF_IOCTL_ENABLE: Enable data capture for a stream */
-	DRM_XE_PERF_IOCTL_ENABLE = _IO('i', 0x0),
+enum drm_xe_observation_ioctls {
+	/** @DRM_XE_OBSERVATION_IOCTL_ENABLE: Enable data capture for an observation stream */
+	DRM_XE_OBSERVATION_IOCTL_ENABLE = _IO('i', 0x0),
 
-	/** @DRM_XE_PERF_IOCTL_DISABLE: Disable data capture for a stream */
-	DRM_XE_PERF_IOCTL_DISABLE = _IO('i', 0x1),
+	/** @DRM_XE_OBSERVATION_IOCTL_DISABLE: Disable data capture for a observation stream */
+	DRM_XE_OBSERVATION_IOCTL_DISABLE = _IO('i', 0x1),
 
-	/** @DRM_XE_PERF_IOCTL_CONFIG: Change stream configuration */
-	DRM_XE_PERF_IOCTL_CONFIG = _IO('i', 0x2),
+	/** @DRM_XE_OBSERVATION_IOCTL_CONFIG: Change observation stream configuration */
+	DRM_XE_OBSERVATION_IOCTL_CONFIG = _IO('i', 0x2),
 
-	/** @DRM_XE_PERF_IOCTL_STATUS: Return stream status */
-	DRM_XE_PERF_IOCTL_STATUS = _IO('i', 0x3),
+	/** @DRM_XE_OBSERVATION_IOCTL_STATUS: Return observation stream status */
+	DRM_XE_OBSERVATION_IOCTL_STATUS = _IO('i', 0x3),
 
-	/** @DRM_XE_PERF_IOCTL_INFO: Return stream info */
-	DRM_XE_PERF_IOCTL_INFO = _IO('i', 0x4),
+	/** @DRM_XE_OBSERVATION_IOCTL_INFO: Return observation stream info */
+	DRM_XE_OBSERVATION_IOCTL_INFO = _IO('i', 0x4),
 };
 
 /**
@@ -1546,12 +1547,12 @@ enum drm_xe_oa_format_type {
  * Stream params are specified as a chain of @drm_xe_ext_set_property
  * struct's, with @property values from enum @drm_xe_oa_property_id and
  * @drm_xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY.
- * @param field in struct @drm_xe_perf_param points to the first
+ * @param field in struct @drm_xe_observation_param points to the first
  * @drm_xe_ext_set_property struct.
  *
- * Exactly the same mechanism is also used for stream reconfiguration using
- * the @DRM_XE_PERF_IOCTL_CONFIG perf fd ioctl, though only a subset of
- * properties below can be specified for stream reconfiguration.
+ * Exactly the same mechanism is also used for stream reconfiguration using the
+ * @DRM_XE_OBSERVATION_IOCTL_CONFIG observation stream fd ioctl, though only a
+ * subset of properties below can be specified for stream reconfiguration.
  */
 enum drm_xe_oa_property_id {
 #define DRM_XE_OA_EXTENSION_SET_PROPERTY	0
@@ -1571,11 +1572,11 @@ enum drm_xe_oa_property_id {
 
 	/**
 	 * @DRM_XE_OA_PROPERTY_OA_METRIC_SET: OA metrics defining contents of OA
-	 * reports, previously added via @DRM_XE_PERF_OP_ADD_CONFIG.
+	 * reports, previously added via @DRM_XE_OBSERVATION_OP_ADD_CONFIG.
 	 */
 	DRM_XE_OA_PROPERTY_OA_METRIC_SET,
 
-	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: Perf counter report format */
+	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: OA counter report format */
 	DRM_XE_OA_PROPERTY_OA_FORMAT,
 	/*
 	 * OA_FORMAT's are specified the same way as in PRM/Bspec 52198/60942,
@@ -1596,13 +1597,13 @@ enum drm_xe_oa_property_id {
 
 	/**
 	 * @DRM_XE_OA_PROPERTY_OA_DISABLED: A value of 1 will open the OA
-	 * stream in a DISABLED state (see @DRM_XE_PERF_IOCTL_ENABLE).
+	 * stream in a DISABLED state (see @DRM_XE_OBSERVATION_IOCTL_ENABLE).
 	 */
 	DRM_XE_OA_PROPERTY_OA_DISABLED,
 
 	/**
 	 * @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID: Open the stream for a specific
-	 * @exec_queue_id. Perf queries can be executed on this exec queue.
+	 * @exec_queue_id. OA queries can be executed on this exec queue.
 	 */
 	DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID,
 
@@ -1622,7 +1623,7 @@ enum drm_xe_oa_property_id {
 /**
  * struct drm_xe_oa_config - OA metric configuration
  *
- * Multiple OA configs can be added using @DRM_XE_PERF_OP_ADD_CONFIG. A
+ * Multiple OA configs can be added using @DRM_XE_OBSERVATION_OP_ADD_CONFIG. A
  * particular config can be specified when opening an OA stream using
  * @DRM_XE_OA_PROPERTY_OA_METRIC_SET property.
  */
@@ -1645,8 +1646,9 @@ struct drm_xe_oa_config {
 
 /**
  * struct drm_xe_oa_stream_status - OA stream status returned from
- * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl. Userspace can call the ioctl to
- * query stream status in response to EIO errno from perf fd read().
+ * @DRM_XE_OBSERVATION_IOCTL_STATUS observation stream fd ioctl. Userspace can
+ * call the ioctl to query stream status in response to EIO errno from
+ * observation fd read().
  */
 struct drm_xe_oa_stream_status {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -1665,7 +1667,7 @@ struct drm_xe_oa_stream_status {
 
 /**
  * struct drm_xe_oa_stream_info - OA stream info returned from
- * @DRM_XE_PERF_IOCTL_INFO perf fd ioctl
+ * @DRM_XE_OBSERVATION_IOCTL_INFO observation stream fd ioctl
  */
 struct drm_xe_oa_stream_info {
 	/** @extensions: Pointer to the first extension struct, if any */
diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
index 576358fe22..98c53620d3 100644
--- a/lib/xe/xe_oa.c
+++ b/lib/xe/xe_oa.c
@@ -688,7 +688,7 @@ load_metric_set_config(struct intel_xe_perf_metric_set *metric_set, int drm_fd)
 	memcpy(regs, metric_set->flex_regs, 2 * metric_set->n_flex_regs * sizeof(u32));
 	regs += 2 * metric_set->n_flex_regs * sizeof(u32);
 
-	ret = intel_xe_perf_ioctl(drm_fd, DRM_XE_PERF_OP_ADD_CONFIG, &config);
+	ret = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config);
 	if (ret >= 0)
 		metric_set->perf_oa_metrics_set = ret;
 
@@ -1042,31 +1042,31 @@ static void xe_oa_prop_to_ext(struct intel_xe_oa_open_prop *properties,
 		ext[j].base.next_extension = to_user_pointer(&ext[j + 1]);
 }
 
-int intel_xe_perf_ioctl(int fd, enum drm_xe_perf_op op, void *arg)
+int intel_xe_perf_ioctl(int fd, enum drm_xe_observation_op op, void *arg)
 {
 #define XE_OA_MAX_SET_PROPERTIES 16
 
 	struct drm_xe_ext_set_property ext[XE_OA_MAX_SET_PROPERTIES] = {};
 
 	/* Chain the PERF layer struct */
-	struct drm_xe_perf_param p = {
+	struct drm_xe_observation_param p = {
 		.extensions = 0,
-		.perf_type = DRM_XE_PERF_TYPE_OA,
-		.perf_op = op,
-		.param = to_user_pointer((op == DRM_XE_PERF_OP_STREAM_OPEN) ? ext : arg),
+		.observation_type = DRM_XE_OBSERVATION_TYPE_OA,
+		.observation_op = op,
+		.param = to_user_pointer((op == DRM_XE_OBSERVATION_OP_STREAM_OPEN) ? ext : arg),
 	};
 
-	if (op == DRM_XE_PERF_OP_STREAM_OPEN) {
+	if (op == DRM_XE_OBSERVATION_OP_STREAM_OPEN) {
 		struct intel_xe_oa_open_prop *oprop = (struct intel_xe_oa_open_prop *)arg;
 
 		igt_assert_lte(oprop->num_properties, XE_OA_MAX_SET_PROPERTIES);
 		xe_oa_prop_to_ext(oprop, ext);
 	}
 
-	return igt_ioctl(fd, DRM_IOCTL_XE_PERF, &p);
+	return igt_ioctl(fd, DRM_IOCTL_XE_OBSERVATION, &p);
 }
 
-void intel_xe_perf_ioctl_err(int fd, enum drm_xe_perf_op op, void *arg, int err)
+void intel_xe_perf_ioctl_err(int fd, enum drm_xe_observation_op op, void *arg, int err)
 {
 	igt_assert_eq(intel_xe_perf_ioctl(fd, op, arg), -1);
 	igt_assert_eq(errno, err);
diff --git a/lib/xe/xe_oa.h b/lib/xe/xe_oa.h
index f6f2768b00..d5f59a3815 100644
--- a/lib/xe/xe_oa.h
+++ b/lib/xe/xe_oa.h
@@ -398,8 +398,8 @@ uint64_t intel_xe_perf_read_record_timestamp_raw(const struct intel_xe_perf *per
 const char *intel_xe_perf_read_report_reason(const struct intel_xe_perf *perf,
 					     const struct intel_xe_perf_record_header *record);
 
-int intel_xe_perf_ioctl(int fd, enum drm_xe_perf_op op, void *arg);
-void intel_xe_perf_ioctl_err(int fd, enum drm_xe_perf_op op, void *arg, int err);
+int intel_xe_perf_ioctl(int fd, enum drm_xe_observation_op op, void *arg);
+void intel_xe_perf_ioctl_err(int fd, enum drm_xe_observation_op op, void *arg, int err);
 
 #ifdef __cplusplus
 };
diff --git a/tools/xe-perf/xe_perf_configs.c b/tools/xe-perf/xe_perf_configs.c
index af33c0078c..bd37fef5c7 100644
--- a/tools/xe-perf/xe_perf_configs.c
+++ b/tools/xe-perf/xe_perf_configs.c
@@ -228,7 +228,7 @@ main(int argc, char *argv[])
 			continue;
 
 		if (purge) {
-			if (intel_xe_perf_ioctl(drm_fd, DRM_XE_PERF_OP_REMOVE_CONFIG, &metric_id) == 0)
+			if (intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &metric_id) == 0)
 				fprintf(stdout, "\tRemoved config %s id=%03" PRIu64 " name=%s\n",
 					entry->d_name, metric_id, metric_name(perf, entry->d_name));
 			else
diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
index bd2d645fa1..9cf51f3e15 100644
--- a/tools/xe-perf/xe_perf_recorder.c
+++ b/tools/xe-perf/xe_perf_recorder.c
@@ -443,7 +443,7 @@ perf_open(struct recording_context *ctx)
 		.properties_ptr = to_user_pointer(properties),
 	};
 
-	stream_fd = intel_xe_perf_ioctl(ctx->drm_fd, DRM_XE_PERF_OP_STREAM_OPEN, &param);
+	stream_fd = intel_xe_perf_ioctl(ctx->drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param);
 	if (stream_fd < 0) {
 		errno = 0;
 		goto exit;
@@ -541,7 +541,7 @@ static int get_stream_status(int perf_fd, u32 *oa_status)
 	struct drm_xe_oa_stream_status status;
 	int ret;
 
-	ret = perf_ioctl(perf_fd, DRM_XE_PERF_IOCTL_STATUS, &status);
+	ret = perf_ioctl(perf_fd, DRM_XE_OBSERVATION_IOCTL_STATUS, &status);
 	if (ret)
 		return ret;
 
-- 
2.41.0

