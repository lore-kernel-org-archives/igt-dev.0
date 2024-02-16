Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D290EC48BF6
	for <igt-dev@archiver.kernel.org>; Fri, 16 Feb 2024 23:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFBD10ECF8;
	Fri, 16 Feb 2024 23:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mecrXs6h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F6510ECEE
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Feb 2024 23:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708125431; x=1739661431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yy6AOXq28FQUL4tJFFfExlZwNqSF9//8G+iTUmcOpBY=;
 b=mecrXs6hvZE6fZa4qDo456GSADH6svdAmxinPmqgjcoJsI+Q5eDPiLdM
 K7l3uVR2J9CNPf3YaDwwupltyL4KLDMyeWf/m+B/LmL8+XcgdJKTH+lEJ
 fBS2YsdVly5EnRH1Cm/fgM7Cny+5551GXZKq7XixIJoWKzdBWPhswmiro
 lQXlt1lAhO/SIZBIQuzOYw16ZT6eGQZi5lPzwfdOpvoo/4ZRsDD5tgUC0
 GqwciVCk2ujLjG/UhlX6RajEmeI4nMqRrHvwm0A4b7l8X2z8xuwCYvKvj
 076OHaIbG0GBgH5HDwemOPe60F5T0aBE5PGq0s6HeJ+juKa7FrH3hN+k6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="27724279"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; d="scan'208";a="27724279"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 15:17:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="8626864"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 15:17:09 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 05/18] drm-uapi/xe: Sync with Perf/OA changes
Date: Fri, 16 Feb 2024 15:16:50 -0800
Message-ID: <20240216231703.845644-6-ashutosh.dixit@intel.com>
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

Include Perf/OA changes from the kernel in include/drm-uapi/xe_drm.h.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 include/drm-uapi/xe_drm.h | 321 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 320 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index bacdca787c21..42f0f3ab2ef9 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -100,6 +100,8 @@ extern "C" {
 #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
+#define DRM_XE_PERF			0x0e
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
@@ -574,6 +577,36 @@ struct drm_xe_query_engine_cycles {
 	__u64 cpu_delta;
 };
 
+/**
+ * struct drm_xe_query_uc_fw_version - query a micro-controller firmware version
+ *
+ * Given a uc_type this will return the branch, major, minor and patch version
+ * of the micro-controller firmware.
+ */
+struct drm_xe_query_uc_fw_version {
+	/** @uc_type: The micro-controller type to query firmware version */
+#define XE_QUERY_UC_TYPE_GUC_SUBMISSION 0
+	__u16 uc_type;
+
+	/** @pad: MBZ */
+	__u16 pad;
+
+	/** @branch_ver: branch uc fw version */
+	__u32 branch_ver;
+	/** @major_ver: major uc fw version */
+	__u32 major_ver;
+	/** @minor_ver: minor uc fw version */
+	__u32 minor_ver;
+	/** @patch_ver: patch uc fw version */
+	__u32 patch_ver;
+
+	/** @pad2: MBZ */
+	__u32 pad2;
+
+	/** @reserved: Reserved */
+	__u64 reserved;
+};
+
 /**
  * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
  * structure to query device information
@@ -643,6 +676,8 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
+#define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
+#define DRM_XE_DEVICE_QUERY_OA_UNITS		8
 	/** @query: The type of data to query */
 	__u32 query;
 
@@ -832,7 +867,6 @@ struct drm_xe_vm_destroy {
  *
  * and the @flags can be:
  *  - %DRM_XE_VM_BIND_FLAG_READONLY
- *  - %DRM_XE_VM_BIND_FLAG_ASYNC
  *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
  *    MAP operation immediately rather than deferring the MAP to the page
  *    fault handler.
@@ -1340,6 +1374,291 @@ struct drm_xe_wait_user_fence {
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
+ * struct drm_xe_perf_param - Perf layer param
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
+	/** @num_oa_units: number of OA units returned in oau[] */
+	__u32 num_oa_units;
+	/** @pad: MBZ */
+	__u32 pad;
+	/** @oa_units: OA units returned for this device */
+	struct drm_xe_oa_unit oa_units[];
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
+	 * @DRM_XE_OA_PROPERTY_OA_EXPONENT: Requests periodic OA unit sampling
+	 * with sampling frequency proportional to 2^(period_exponent + 1)
+	 */
+	DRM_XE_OA_PROPERTY_OA_EXPONENT,
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
+ * struct drm_xe_oa_stream_config - OA stream re-configuration with
+ * @DRM_XE_PERF_IOCTL_CONFIG perf fd ioctl
+ */
+struct drm_xe_oa_stream_config {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/**
+	 * @metric_set: metric set id, previously added using
+	 * @DRM_XE_PERF_OP_ADD_CONFIG
+	 */
+	__u64 metric_set;
+
+	/** @reserved: reserved for future use */
+	__u64 reserved[3];
+};
+
+/**
+ * struct drm_xe_oa_stream_status - OA stream status returned from
+ * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl
+ */
+struct drm_xe_oa_stream_status {
+	/** @oa_status: OA status register as specified in PRM/Bspec 46717/61226 */
+	__u64 oa_status;
+#define DRM_XE_OASTATUS_MMIO_TRG_Q_FULL		(1 << 6)
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

