Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E6710E1C4
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jul 2023 23:18:03 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Jul 2023 16:17:37 -0700
Message-ID: <20230720231756.3464641-2-ashutosh.dixit@intel.com>
In-Reply-To: <20230720231756.3464641-1-ashutosh.dixit@intel.com>
References: <20230720231756.3464641-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 01/20] drm-uapi/xe_drm: OA changes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Import latest xe_drm.h uapi from the kernel including OA changes.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 include/drm-uapi/xe_drm.h | 295 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 283 insertions(+), 12 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 432bd87ca401..bec8b82dc8bb 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -3,8 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef _UAPI_XE_DRM_H_
-#define _UAPI_XE_DRM_H_
+#ifndef _XE_DRM_H_
+#define _XE_DRM_H_
 
 #include "drm.h"
 
@@ -29,7 +29,7 @@ extern "C" {
  * redefine the interface more easily than an ever growing struct of
  * increasing complexity, and for large parts of that interface to be
  * entirely optional. The downside is more pointer chasing; chasing across
- * the __user boundary with pointers encapsulated inside u64.
+ * the boundary with pointers encapsulated inside u64.
  *
  * Example chaining:
  *
@@ -101,6 +101,9 @@ struct xe_user_extension {
 #define DRM_XE_WAIT_USER_FENCE		0x0b
 #define DRM_XE_VM_MADVISE		0x0c
 #define DRM_XE_ENGINE_GET_PROPERTY	0x0d
+#define DRM_XE_OA_OPEN			0x36
+#define DRM_XE_OA_ADD_CONFIG		0x37
+#define DRM_XE_OA_REMOVE_CONFIG		0x38
 
 /* Must be kept compact -- no holes */
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -117,6 +120,9 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_ENGINE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_ENGINE_SET_PROPERTY, struct drm_xe_engine_set_property)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
+#define DRM_IOCTL_XE_OA_OPEN			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_OPEN, struct drm_xe_oa_open_param)
+#define DRM_IOCTL_XE_OA_ADD_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_ADD_CONFIG, struct drm_xe_oa_config)
+#define DRM_IOCTL_XE_OA_REMOVE_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_REMOVE_CONFIG, __u64)
 
 /**
  * enum drm_xe_memory_class - Supported memory classes.
@@ -223,7 +229,8 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_GT_COUNT		4
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
 #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
-#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
+#define XE_QUERY_OA_IOCTL_VERSION		7
+#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_OA_IOCTL_VERSION + 1)
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
@@ -242,11 +249,13 @@ struct drm_xe_query_gts {
 	/** @pad: MBZ */
 	__u32 pad;
 
-	/*
+	/**
+	 * @gts: The GTs returned for this device
+	 *
+	 * TODO: convert drm_xe_query_gt to proper kernel-doc.
 	 * TODO: Perhaps info about every mem region relative to this GT? e.g.
 	 * bandwidth between this GT and remote region?
 	 */
-
 	struct drm_xe_query_gt {
 #define XE_QUERY_GT_TYPE_MAIN		0
 #define XE_QUERY_GT_TYPE_REMOTE		1
@@ -258,6 +267,7 @@ struct drm_xe_query_gts {
 		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
 		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */
 		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
+		__u64 oa_timestamp_freq;
 		__u64 reserved[8];
 	} gts[];
 };
@@ -697,6 +707,7 @@ struct drm_xe_engine_class_instance {
 
 	__u16 engine_instance;
 	__u16 gt_id;
+	__u16 oa_unit_id;
 };
 
 struct drm_xe_engine_create {
@@ -799,7 +810,7 @@ struct drm_xe_exec {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @vm_id: VM ID to run batch buffer in */
+	/** @engine_id: Engine ID for the batch buffer */
 	__u32 engine_id;
 
 	/** @num_syncs: Amount of struct drm_xe_sync in array. */
@@ -852,8 +863,9 @@ struct drm_xe_mmio {
  * struct drm_xe_wait_user_fence - wait user fence
  *
  * Wait on user fence, XE will wakeup on every HW engine interrupt in the
- * instances list and check if user fence is complete:
- * (*addr & MASK) OP (VALUE & MASK)
+ * instances list and check if user fence is complete::
+ *
+ *	(*addr & MASK) OP (VALUE & MASK)
  *
  * Returns to user on user fence completion or timeout.
  */
@@ -901,8 +913,20 @@ struct drm_xe_wait_user_fence {
 #define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
 	/** @mask: comparison mask */
 	__u64 mask;
-
-	/** @timeout: how long to wait before bailing, value in jiffies */
+	/**
+	 * @timeout: how long to wait before bailing, value in nanoseconds.
+	 * Without DRM_XE_UFENCE_WAIT_ABSTIME flag set (relative timeout)
+	 * it contains timeout expressed in nanoseconds to wait (fence will
+	 * expire at now() + timeout).
+	 * When DRM_XE_UFENCE_WAIT_ABSTIME flat is set (absolute timeout) wait
+	 * will end at timeout (uses system MONOTONIC_CLOCK).
+	 * Passing negative timeout leads to neverending wait.
+	 *
+	 * On relative timeout this value is updated with timeout left
+	 * (for restarting the call in case of signal delivery).
+	 * On absolute timeout this value stays intact (restarted call still
+	 * expire at the same point of time).
+	 */
 	__s64 timeout;
 
 	/**
@@ -987,8 +1011,255 @@ struct drm_xe_vm_madvise {
 	__u64 reserved[2];
 };
 
+enum drm_xe_oa_format {
+	XE_OA_FORMAT_C4_B8 = 7,
+
+	/* Gen8+ */
+	XE_OA_FORMAT_A12,
+	XE_OA_FORMAT_A12_B8_C8,
+	XE_OA_FORMAT_A32u40_A4u32_B8_C8,
+
+	/* DG2 */
+	XE_OAR_FORMAT_A32u40_A4u32_B8_C8,
+	XE_OA_FORMAT_A24u40_A14u32_B8_C8,
+
+	/* MTL OAM */
+	XE_OAM_FORMAT_MPEC8u64_B8_C8,
+	XE_OAM_FORMAT_MPEC8u32_B8_C8,
+
+	XE_OA_FORMAT_MAX	    /* non-ABI */
+};
+
+enum drm_xe_oa_property_id {
+	/**
+	 * Open the stream for a specific engine id (as used with
+	 * drm_xe_exec). A stream opened for a specific engine id this way
+	 * won't typically require root privileges.
+	 */
+	DRM_XE_OA_PROP_ENGINE_ID = 1,
+
+	/**
+	 * A value of 1 requests the inclusion of raw OA unit reports as
+	 * part of stream samples.
+	 */
+	DRM_XE_OA_PROP_SAMPLE_OA,
+
+	/**
+	 * The value specifies which set of OA unit metrics should be
+	 * configured, defining the contents of any OA unit reports.
+	 */
+	DRM_XE_OA_PROP_OA_METRICS_SET,
+
+	/**
+	 * The value specifies the size and layout of OA unit reports.
+	 */
+	DRM_XE_OA_PROP_OA_FORMAT,
+
+	/**
+	 * Specifying this property implicitly requests periodic OA unit
+	 * sampling and (at least on Haswell) the sampling frequency is derived
+	 * from this exponent as follows:
+	 *
+	 *   80ns * 2^(period_exponent + 1)
+	 */
+	DRM_XE_OA_PROP_OA_EXPONENT,
+
+	/**
+	 * Specifying this property is only valid when specify a context to
+	 * filter with DRM_XE_OA_PROP_ENGINE_ID. Specifying this property
+	 * will hold preemption of the particular engine we want to gather
+	 * performance data about.
+	 */
+	DRM_XE_OA_PROP_HOLD_PREEMPTION,
+
+	/**
+	 * Specifying this pins all contexts to the specified SSEU power
+	 * configuration for the duration of the recording.
+	 *
+	 * This parameter's value is a pointer to a struct
+	 * drm_xe_gem_context_param_sseu (TBD).
+	 */
+	DRM_XE_OA_PROP_GLOBAL_SSEU,
+
+	/**
+	 * This optional parameter specifies the timer interval in nanoseconds
+	 * at which the xe driver will check the OA buffer for available data.
+	 * Minimum allowed value is 100 microseconds. A default value is used by
+	 * the driver if this parameter is not specified. Note that larger timer
+	 * values will reduce cpu consumption during OA perf captures. However,
+	 * excessively large values would potentially result in OA buffer
+	 * overwrites as captures reach end of the OA buffer.
+	 */
+	DRM_XE_OA_PROP_POLL_OA_PERIOD,
+
+	/**
+	 * Multiple engines may be mapped to the same OA unit. The OA unit is
+	 * identified by class:instance of any engine mapped to it.
+	 *
+	 * This parameter specifies the engine class and must be passed along
+	 * with DRM_XE_OA_PROP_OA_ENGINE_INSTANCE.
+	 */
+	DRM_XE_OA_PROP_OA_ENGINE_CLASS,
+
+	/**
+	 * This parameter specifies the engine instance and must be passed along
+	 * with DRM_XE_OA_PROP_OA_ENGINE_CLASS.
+	 */
+	DRM_XE_OA_PROP_OA_ENGINE_INSTANCE,
+
+	DRM_XE_OA_PROP_MAX /* non-ABI */
+};
+
+struct drm_xe_oa_open_param {
+	__u32 flags;
+#define XE_OA_FLAG_FD_CLOEXEC	BIT(0)
+#define XE_OA_FLAG_FD_NONBLOCK	BIT(1)
+#define XE_OA_FLAG_DISABLED	BIT(2)
+
+	/** The number of u64 (id, value) pairs */
+	__u32 num_properties;
+
+	/**
+	 * Pointer to array of u64 (id, value) pairs configuring the stream
+	 * to open.
+	 */
+	__u64 properties_ptr;
+};
+
+/*
+ * Enable data capture for a stream that was either opened in a disabled state
+ * via I915_PERF_FLAG_DISABLED or was later disabled via
+ * I915_PERF_IOCTL_DISABLE.
+ *
+ * It is intended to be cheaper to disable and enable a stream than it may be
+ * to close and re-open a stream with the same configuration.
+ *
+ * It's undefined whether any pending data for the stream will be lost.
+ */
+#define XE_OA_IOCTL_ENABLE	_IO('i', 0x0)
+
+/*
+ * Disable data capture for a stream.
+ *
+ * It is an error to try and read a stream that is disabled.
+ */
+#define XE_OA_IOCTL_DISABLE	_IO('i', 0x1)
+
+/*
+ * Change metrics_set captured by a stream.
+ *
+ * If the stream is bound to a specific context, the configuration change
+ * will performed __inline__ with that context such that it takes effect before
+ * the next execbuf submission.
+ *
+ * Returns the previously bound metrics set id, or a negative error code.
+ */
+#define XE_OA_IOCTL_CONFIG	_IO('i', 0x2)
+
+struct drm_xe_oa_record_header {
+	__u32 type;
+	__u16 pad;
+	__u16 size;
+};
+
+enum drm_xe_oa_record_type {
+
+	/**
+	 * Samples are the work horse record type whose contents are
+	 * extensible and defined when opening an xe oa stream based on the
+	 * given properties.
+	 *
+	 * Boolean properties following the naming convention
+	 * DRM_XE_OA_SAMPLE_xyz_PROP request the inclusion of 'xyz' data in
+	 * every sample.
+	 *
+	 * The order of these sample properties given by userspace has no
+	 * affect on the ordering of data within a sample. The order is
+	 * documented here.
+	 *
+	 * struct {
+	 *     struct drm_xe_oa_record_header header;
+	 *
+	 *     { u32 oa_report[]; } && DRM_XE_OA_PROP_SAMPLE_OA
+	 * };
+	 */
+	DRM_XE_OA_RECORD_SAMPLE = 1,
+
+	/**
+	 * Indicates that one or more OA reports were not written by the
+	 * hardware. This can happen for example if an MI_REPORT_PERF_COUNT
+	 * command collides with periodic sampling - which would be more likely
+	 * at higher sampling frequencies.
+	 */
+	DRM_XE_OA_RECORD_OA_REPORT_LOST = 2,
+
+	/**
+	 * An error occurred that resulted in all pending OA reports being lost.
+	 */
+	DRM_XE_OA_RECORD_OA_BUFFER_LOST = 3,
+
+	DRM_XE_OA_RECORD_MAX /* non-ABI */
+};
+
+struct drm_xe_oa_config {
+	/**
+	 * @uuid:
+	 *
+	 * String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x"
+	 */
+	char uuid[36];
+
+	/**
+	 * @n_mux_regs:
+	 *
+	 * Number of mux regs in &mux_regs_ptr.
+	 */
+	__u32 n_mux_regs;
+
+	/**
+	 * @n_boolean_regs:
+	 *
+	 * Number of boolean regs in &boolean_regs_ptr.
+	 */
+	__u32 n_boolean_regs;
+
+	/**
+	 * @n_flex_regs:
+	 *
+	 * Number of flex regs in &flex_regs_ptr.
+	 */
+	__u32 n_flex_regs;
+
+	/**
+	 * @mux_regs_ptr:
+	 *
+	 * Pointer to tuples of u32 values (register address, value) for mux
+	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
+	 * &n_mux_regs).
+	 */
+	__u64 mux_regs_ptr;
+
+	/**
+	 * @boolean_regs_ptr:
+	 *
+	 * Pointer to tuples of u32 values (register address, value) for mux
+	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
+	 * &n_boolean_regs).
+	 */
+	__u64 boolean_regs_ptr;
+
+	/**
+	 * @flex_regs_ptr:
+	 *
+	 * Pointer to tuples of u32 values (register address, value) for mux
+	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
+	 * &n_flex_regs).
+	 */
+	__u64 flex_regs_ptr;
+};
+
 #if defined(__cplusplus)
 }
 #endif
 
-#endif /* _UAPI_XE_DRM_H_ */
+#endif /* _XE_DRM_H_ */
-- 
2.41.0
