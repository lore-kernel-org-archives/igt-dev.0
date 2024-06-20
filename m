Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB948C2BBCA
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 20:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D53510EB6E;
	Thu, 20 Jun 2024 20:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZi22zZB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAE210E889
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 20:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718913659; x=1750449659;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tj81xqagKaaHcp6JqVBtEXJXiIQGqzDfXp7gioyYRsk=;
 b=SZi22zZBktn9I/85rErzl2S1Lb/93InhzxcnWaKl8yTqj0pTy6lJ8cFo
 DlrbwrekhaPLrRD5CGqUV1YQsHRS9fCeyTi9gcCh3ZwF8d2hJtcMZsYLx
 vmctAW3jG+PjDTOmWNvX+cfBN/B1DwRh/t1NX7QpDvZx7YthBpp7XywJ+
 gII6QKWO5njsivF6vBLFUcL9kbVEQgvrDWUggMtMsvhVf9q0Sj1+lN95f
 /qqD/UGkKsbGWGeEU2ncpBOxRkIOlI6/wbgqW56y5858u02VNOHjIkOcr
 scv2lm2KlEkvpOTNxZMYt1gZRfB6xVt928fFJ0k76YjXL6axjNJ7oZvTA g==;
X-CSE-ConnectionGUID: Ql/i+FHzToKpphOtIBRhtQ==
X-CSE-MsgGUID: Qzdpo42IQa6TbyUV30qO2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="41329324"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="41329324"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 13:00:59 -0700
X-CSE-ConnectionGUID: vl/ZhH7UQhqQHf0jl7Z3lw==
X-CSE-MsgGUID: PHhr4qNzRR+9WSyOgnld4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="42459842"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 13:00:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 07/28] drm-uapi/xe: Sync with Perf/OA changes
Date: Thu, 20 Jun 2024 13:00:32 -0700
Message-ID: <20240620200054.3550653-8-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
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

Include Perf/OA changes from the kernel in include/drm-uapi/xe_drm.h

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 include/drm-uapi/xe_drm.h | 291 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 291 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 1100dfe1ff..d377572aa3 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -100,6 +100,8 @@ extern "C" {
 #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
+#define DRM_XE_PERF			0x0b
+
 /* Must be kept compact -- no holes */
 
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -113,6 +115,7 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
+#define DRM_IOCTL_XE_PERF			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF, struct drm_xe_perf_param)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -685,6 +688,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
 #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
+#define DRM_XE_DEVICE_QUERY_OA_UNITS		8
 	/** @query: The type of data to query */
 	__u32 query;
 
@@ -1370,6 +1374,293 @@ struct drm_xe_wait_user_fence {
 	__u64 reserved[2];
 };
 
+/** enum drm_xe_perf_type - Perf stream types */
+enum drm_xe_perf_type {
+	DRM_XE_PERF_TYPE_OA,
+	DRM_XE_PERF_TYPE_MAX,
+};
+
+/**
+ * enum drm_xe_perf_op - Perf stream ops
+ */
+enum drm_xe_perf_op {
+	/** @DRM_XE_PERF_OP_STREAM_OPEN: Open a perf counter stream */
+	DRM_XE_PERF_OP_STREAM_OPEN,
+
+	/** @DRM_XE_PERF_OP_ADD_CONFIG: Add perf stream config */
+	DRM_XE_PERF_OP_ADD_CONFIG,
+
+	/** @DRM_XE_PERF_OP_REMOVE_CONFIG: Remove perf stream config */
+	DRM_XE_PERF_OP_REMOVE_CONFIG,
+};
+
+/**
+ * struct drm_xe_perf_param - Input of &DRM_XE_PERF
+ *
+ * The perf layer enables multiplexing perf counter streams of multiple
+ * types. The actual params for a particular stream operation are supplied
+ * via the @param pointer (use __copy_from_user to get these params).
+ */
+struct drm_xe_perf_param {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+	/** @perf_type: Perf stream type, of enum @drm_xe_perf_type */
+	__u64 perf_type;
+	/** @perf_op: Perf op, of enum @drm_xe_perf_op */
+	__u64 perf_op;
+	/** @param: Pointer to actual stream params */
+	__u64 param;
+};
+
+/**
+ * enum drm_xe_perf_ioctls - Perf fd ioctl's
+ *
+ * Information exchanged between userspace and kernel for perf fd ioctl's
+ * is stream type specific
+ */
+enum drm_xe_perf_ioctls {
+	/** @DRM_XE_PERF_IOCTL_ENABLE: Enable data capture for a stream */
+	DRM_XE_PERF_IOCTL_ENABLE = _IO('i', 0x0),
+
+	/** @DRM_XE_PERF_IOCTL_DISABLE: Disable data capture for a stream */
+	DRM_XE_PERF_IOCTL_DISABLE = _IO('i', 0x1),
+
+	/** @DRM_XE_PERF_IOCTL_CONFIG: Change stream configuration */
+	DRM_XE_PERF_IOCTL_CONFIG = _IO('i', 0x2),
+
+	/** @DRM_XE_PERF_IOCTL_STATUS: Return stream status */
+	DRM_XE_PERF_IOCTL_STATUS = _IO('i', 0x3),
+
+	/** @DRM_XE_PERF_IOCTL_INFO: Return stream info */
+	DRM_XE_PERF_IOCTL_INFO = _IO('i', 0x4),
+};
+
+/** enum drm_xe_oa_unit_type - OA unit types */
+enum drm_xe_oa_unit_type {
+	/**
+	 * @DRM_XE_OA_UNIT_TYPE_OAG: OAG OA unit. OAR/OAC are considered
+	 * sub-types of OAG. For OAR/OAC, use OAG.
+	 */
+	DRM_XE_OA_UNIT_TYPE_OAG,
+
+	/** @DRM_XE_OA_UNIT_TYPE_OAM: OAM OA unit */
+	DRM_XE_OA_UNIT_TYPE_OAM,
+};
+
+/**
+ * struct drm_xe_oa_unit - describe OA unit
+ */
+struct drm_xe_oa_unit {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @oa_unit_id: OA unit ID */
+	__u32 oa_unit_id;
+
+	/** @oa_unit_type: OA unit type of @drm_xe_oa_unit_type */
+	__u32 oa_unit_type;
+
+	/** @capabilities: OA capabilities bit-mask */
+	__u64 capabilities;
+#define DRM_XE_OA_CAPS_BASE		(1 << 0)
+
+	/** @oa_timestamp_freq: OA timestamp freq */
+	__u64 oa_timestamp_freq;
+
+	/** @reserved: MBZ */
+	__u64 reserved[4];
+
+	/** @num_engines: number of engines in @eci array */
+	__u64 num_engines;
+
+	/** @eci: engines attached to this OA unit */
+	struct drm_xe_engine_class_instance eci[];
+};
+
+/**
+ * struct drm_xe_query_oa_units - describe OA units
+ *
+ * If a query is made with a struct drm_xe_device_query where .query
+ * is equal to DRM_XE_DEVICE_QUERY_OA_UNITS, then the reply uses struct
+ * drm_xe_query_oa_units in .data.
+ *
+ * OA unit properties for all OA units can be accessed using a code block
+ * such as the one below:
+ *
+ * .. code-block:: C
+ *
+ *	struct drm_xe_query_oa_units *qoa;
+ *	struct drm_xe_oa_unit *oau;
+ *	u8 *poau;
+ *
+ *	// malloc qoa and issue DRM_XE_DEVICE_QUERY_OA_UNITS. Then:
+ *	poau = (u8 *)&qoa->oa_units[0];
+ *	for (int i = 0; i < qoa->num_oa_units; i++) {
+ *		oau = (struct drm_xe_oa_unit *)poau;
+ *		// Access 'struct drm_xe_oa_unit' fields here
+ *		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
+ *	}
+ */
+struct drm_xe_query_oa_units {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+	/** @num_oa_units: number of OA units returned in oau[] */
+	__u32 num_oa_units;
+	/** @pad: MBZ */
+	__u32 pad;
+	/**
+	 * @oa_units: struct @drm_xe_oa_unit array returned for this device.
+	 * Written below as a u64 array to avoid problems with nested flexible
+	 * arrays with some compilers
+	 */
+	__u64 oa_units[];
+};
+
+/** enum drm_xe_oa_format_type - OA format types */
+enum drm_xe_oa_format_type {
+	DRM_XE_OA_FMT_TYPE_OAG,
+	DRM_XE_OA_FMT_TYPE_OAR,
+	DRM_XE_OA_FMT_TYPE_OAM,
+	DRM_XE_OA_FMT_TYPE_OAC,
+	DRM_XE_OA_FMT_TYPE_OAM_MPEC,
+	DRM_XE_OA_FMT_TYPE_PEC,
+};
+
+/**
+ * enum drm_xe_oa_property_id - OA stream property id's
+ *
+ * Stream params are specified as a chain of @drm_xe_ext_set_property
+ * struct's, with @property values from enum @drm_xe_oa_property_id and
+ * @drm_xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY.
+ * @param field in struct @drm_xe_perf_param points to the first
+ * @drm_xe_ext_set_property struct.
+ *
+ * Exactly the same mechanism is also used for stream reconfiguration using
+ * the @DRM_XE_PERF_IOCTL_CONFIG perf fd ioctl, though only a subset of
+ * properties below can be specified for stream reconfiguration.
+ */
+enum drm_xe_oa_property_id {
+#define DRM_XE_OA_EXTENSION_SET_PROPERTY	0
+	/**
+	 * @DRM_XE_OA_PROPERTY_OA_UNIT_ID: ID of the OA unit on which to open
+	 * the OA stream, see @oa_unit_id in 'struct
+	 * drm_xe_query_oa_units'. Defaults to 0 if not provided.
+	 */
+	DRM_XE_OA_PROPERTY_OA_UNIT_ID = 1,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_SAMPLE_OA: A value of 1 requests inclusion of raw
+	 * OA unit reports or stream samples in a global buffer attached to an
+	 * OA unit.
+	 */
+	DRM_XE_OA_PROPERTY_SAMPLE_OA,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_OA_METRIC_SET: OA metrics defining contents of OA
+	 * reports, previously added via @DRM_XE_PERF_OP_ADD_CONFIG.
+	 */
+	DRM_XE_OA_PROPERTY_OA_METRIC_SET,
+
+	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: Perf counter report format */
+	DRM_XE_OA_PROPERTY_OA_FORMAT,
+	/*
+	 * OA_FORMAT's are specified the same way as in PRM/Bspec 52198/60942,
+	 * in terms of the following quantities: a. enum @drm_xe_oa_format_type
+	 * b. Counter select c. Counter size and d. BC report. Also refer to the
+	 * oa_formats array in drivers/gpu/drm/xe/xe_oa.c.
+	 */
+#define DRM_XE_OA_FORMAT_MASK_FMT_TYPE		(0xff << 0)
+#define DRM_XE_OA_FORMAT_MASK_COUNTER_SEL	(0xff << 8)
+#define DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE	(0xff << 16)
+#define DRM_XE_OA_FORMAT_MASK_BC_REPORT		(0xff << 24)
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT: Requests periodic OA unit
+	 * sampling with sampling frequency proportional to 2^(period_exponent + 1)
+	 */
+	DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_OA_DISABLED: A value of 1 will open the OA
+	 * stream in a DISABLED state (see @DRM_XE_PERF_IOCTL_ENABLE).
+	 */
+	DRM_XE_OA_PROPERTY_OA_DISABLED,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID: Open the stream for a specific
+	 * @exec_queue_id. Perf queries can be executed on this exec queue.
+	 */
+	DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE: Optional engine instance to
+	 * pass along with @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will default to 0.
+	 */
+	DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE,
+
+	/** @DRM_XE_OA_PROPERTY_MAX: non-ABI */
+	DRM_XE_OA_PROPERTY_MAX
+};
+
+/**
+ * struct drm_xe_oa_config - OA metric configuration
+ *
+ * Multiple OA configs can be added using @DRM_XE_PERF_OP_ADD_CONFIG. A
+ * particular config can be specified when opening an OA stream using
+ * @DRM_XE_OA_PROPERTY_OA_METRIC_SET property.
+ */
+struct drm_xe_oa_config {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @uuid: String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x" */
+	char uuid[36];
+
+	/** @n_regs: Number of regs in @regs_ptr */
+	__u32 n_regs;
+
+	/**
+	 * @regs_ptr: Pointer to (register address, value) pairs for OA config
+	 * registers. Expected length of buffer is: (2 * sizeof(u32) * @n_regs).
+	 */
+	__u64 regs_ptr;
+};
+
+/**
+ * struct drm_xe_oa_stream_status - OA stream status returned from
+ * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl. Userspace can call the ioctl to
+ * query stream status in response to EIO errno from perf fd read().
+ */
+struct drm_xe_oa_stream_status {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @oa_status: OA stream status (see Bspec 46717/61226) */
+	__u64 oa_status;
+#define DRM_XE_OASTATUS_MMIO_TRG_Q_FULL		(1 << 3)
+#define DRM_XE_OASTATUS_COUNTER_OVERFLOW	(1 << 2)
+#define DRM_XE_OASTATUS_BUFFER_OVERFLOW		(1 << 1)
+#define DRM_XE_OASTATUS_REPORT_LOST		(1 << 0)
+
+	/** @reserved: reserved for future use */
+	__u64 reserved[3];
+};
+
+/**
+ * struct drm_xe_oa_stream_info - OA stream info returned from
+ * @DRM_XE_PERF_IOCTL_INFO perf fd ioctl
+ */
+struct drm_xe_oa_stream_info {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @oa_buf_size: OA buffer size */
+	__u64 oa_buf_size;
+
+	/** @reserved: reserved for future use */
+	__u64 reserved[3];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.41.0

