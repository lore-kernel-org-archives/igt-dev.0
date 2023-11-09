Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9747C10E8E4
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:55:42 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:53:45 +0000
Message-Id: <20231109155410.7-33-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-1-francois.dugast@intel.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 32/57] drm-uapi/xe: Split xe_sync types from
 flags
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Align with commit ("drm/xe/uapi: Split xe_sync types from flags")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 benchmarks/gem_wsim.c              |   9 +-
 include/drm-uapi/xe_drm.h          | 527 ++++++++++++++++++-----------
 lib/intel_batchbuffer.c            |  11 +-
 lib/intel_compute.c                |   6 +-
 lib/intel_ctx.c                    |   5 +-
 lib/xe/xe_ioctl.c                  |   3 +-
 lib/xe/xe_spin.c                   |   6 +-
 lib/xe/xe_util.c                   |   6 +-
 tests/intel/xe_dma_buf_sync.c      |   5 +-
 tests/intel/xe_drm_fdinfo.c        |   6 +-
 tests/intel/xe_evict.c             |   9 +-
 tests/intel/xe_exec_balancer.c     |  15 +-
 tests/intel/xe_exec_basic.c        |   6 +-
 tests/intel/xe_exec_compute_mode.c |   3 +-
 tests/intel/xe_exec_fault_mode.c   |   3 +-
 tests/intel/xe_exec_reset.c        |  21 +-
 tests/intel/xe_exec_store.c        |  15 +-
 tests/intel/xe_exec_threads.c      |  19 +-
 tests/intel/xe_guc_pc.c            |   6 +-
 tests/intel/xe_huc_copy.c          |   3 +-
 tests/intel/xe_perf_pmu.c          |   8 +-
 tests/intel/xe_pm.c                |   6 +-
 tests/intel/xe_pm_residency.c      |   3 +-
 tests/intel/xe_spin_batch.c        |   3 +-
 tests/intel/xe_vm.c                |  49 ++-
 tests/intel/xe_waitfence.c         |   4 +-
 26 files changed, 473 insertions(+), 284 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 43ae7cb51..d02f72087 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1773,21 +1773,22 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
 	i = 0;
 	/* out fence */
 	w->xe.syncs[i].handle = syncobj_create(fd, 0);
-	w->xe.syncs[i++].flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL;
+	w->xe.syncs[i++].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
+	w->xe.syncs[i++].flags = DRM_XE_SYNC_FLAG_SIGNAL;
 	/* in fence(s) */
 	for_each_dep(dep, w->data_deps) {
 		int dep_idx = w->idx + dep->target;
 
 		igt_assert(wrk->steps[dep_idx].xe.syncs && wrk->steps[dep_idx].xe.syncs[0].handle);
 		w->xe.syncs[i].handle = wrk->steps[dep_idx].xe.syncs[0].handle;
-		w->xe.syncs[i++].flags = DRM_XE_SYNC_FLAG_SYNCOBJ;
+		w->xe.syncs[i++].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
 	}
 	for_each_dep(dep, w->fence_deps) {
 		int dep_idx = w->idx + dep->target;
 
 		igt_assert(wrk->steps[dep_idx].xe.syncs && wrk->steps[dep_idx].xe.syncs[0].handle);
 		w->xe.syncs[i].handle = wrk->steps[dep_idx].xe.syncs[0].handle;
-		w->xe.syncs[i++].flags = DRM_XE_SYNC_FLAG_SYNCOBJ;
+		w->xe.syncs[i++].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
 	}
 	w->xe.exec.syncs = to_user_pointer(w->xe.syncs);
 }
@@ -2364,7 +2365,7 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 		if (w->type == SW_FENCE) {
 			w->xe.syncs = calloc(1, sizeof(struct drm_xe_sync));
 			w->xe.syncs[0].handle = syncobj_create(fd, 0);
-			w->xe.syncs[0].flags = DRM_XE_SYNC_FLAG_SYNCOBJ;
+			w->xe.syncs[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
 		}
 
 	return 0;
diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index a2f66d44e..8ff76ab31 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -12,22 +12,82 @@
 extern "C" {
 #endif
 
-/* Please note that modifications to all structs defined here are
+/*
+ * Please note that modifications to all structs defined here are
  * subject to backwards-compatibility constraints.
+ *
+ * Sections in this file are organized as follows:
+ *   1. IOCTL definition
+ *   2. Extension definition and helper structs
+ *   3. IOCTL's Query structs in the order of the Query's entries.
+ *   4. The rest of IOCTL structs in the order of IOCTL declaration.
+ *   5. uEvents
+ *   6. PMU
+ *
  */
 
 /**
- * DOC: uevent generated by xe on it's pci node.
+ * DOC: Xe uAPI Overview
+ *
+ * This section aims to describe the Xe's IOCTL entries, its structs, and other
+ * Xe related uAPI such as uevents and PMU (Platform Monitoring Unit) related
+ * entries and usage.
+ *
+ * List of supported IOCTLs:
+ *  - &DRM_IOCTL_XE_DEVICE_QUERY
+ *  - &DRM_IOCTL_XE_GEM_CREATE
+ *  - &DRM_IOCTL_XE_GEM_MMAP_OFFSET
+ *  - &DRM_IOCTL_XE_VM_CREATE
+ *  - &DRM_IOCTL_XE_VM_DESTROY
+ *  - &DRM_IOCTL_XE_VM_BIND
+ *  - &DRM_IOCTL_XE_EXEC
+ *  - &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
+ *  - &DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
+ *  - &DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
+ *  - &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
+ *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
  *
- * DRM_XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset gt
- * fails. The value supplied with the event is always "NEEDS_RESET".
- * Additional information supplied is tile id and gt id of the gt unit for
- * which reset has failed.
  */
-#define DRM_XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
+
+/*
+ * xe specific ioctls.
+ *
+ * The device specific ioctl range is [DRM_COMMAND_BASE, DRM_COMMAND_END) ie
+ * [0x40, 0xa0) (a0 is excluded). The numbers below are defined as offset
+ * against DRM_COMMAND_BASE and should be between [0x0, 0x60).
+ */
+#define DRM_XE_DEVICE_QUERY		0x00
+#define DRM_XE_GEM_CREATE		0x01
+#define DRM_XE_GEM_MMAP_OFFSET		0x02
+#define DRM_XE_VM_CREATE		0x03
+#define DRM_XE_VM_DESTROY		0x04
+#define DRM_XE_VM_BIND			0x05
+#define DRM_XE_EXEC			0x06
+#define DRM_XE_EXEC_QUEUE_CREATE	0x07
+#define DRM_XE_EXEC_QUEUE_DESTROY	0x08
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x09
+#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0a
+#define DRM_XE_WAIT_USER_FENCE		0x0b
+/* Must be kept compact -- no holes */
+
+#define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
+#define DRM_IOCTL_XE_GEM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_CREATE, struct drm_xe_gem_create)
+#define DRM_IOCTL_XE_GEM_MMAP_OFFSET		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_MMAP_OFFSET, struct drm_xe_gem_mmap_offset)
+#define DRM_IOCTL_XE_VM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_CREATE, struct drm_xe_vm_create)
+#define DRM_IOCTL_XE_VM_DESTROY			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
+#define DRM_IOCTL_XE_VM_BIND			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
+#define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
+#define DRM_IOCTL_XE_EXEC_QUEUE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_CREATE, struct drm_xe_exec_queue_create)
+#define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
+#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
+#define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
+#define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 
 /**
- * struct xe_user_extension - Base class for defining a chain of extensions
+ * DOC: Xe IOCT Extensions
+ *
+ * Before detailing the IOCTLs and its structs, it is important to highlight
+ * that every IOCTL in Xe is extensible.
  *
  * Many interfaces need to grow over time. In most cases we can simply
  * extend the struct and have userspace pass in more data. Another option,
@@ -61,7 +121,10 @@ extern "C" {
  * Typically the struct xe_user_extension would be embedded in some uAPI
  * struct, and in this case we would feed it the head of the chain(i.e ext1),
  * which would then apply all of the above extensions.
- *
+*/
+
+/**
+ * struct xe_user_extension - Base class for defining a chain of extensions
  */
 struct xe_user_extension {
 	/**
@@ -90,39 +153,28 @@ struct xe_user_extension {
 	__u32 pad;
 };
 
-/*
- * xe specific ioctls.
+/**
+ * struct drm_xe_ext_set_property - Generic set property extension
  *
- * The device specific ioctl range is [DRM_COMMAND_BASE, DRM_COMMAND_END) ie
- * [0x40, 0xa0) (a0 is excluded). The numbers below are defined as offset
- * against DRM_COMMAND_BASE and should be between [0x0, 0x60).
+ * A generic struct that could allow any of the Xe's IOCLT to be extended
+ * with a set_property operation.
  */
-#define DRM_XE_DEVICE_QUERY		0x00
-#define DRM_XE_GEM_CREATE		0x01
-#define DRM_XE_GEM_MMAP_OFFSET		0x02
-#define DRM_XE_VM_CREATE		0x03
-#define DRM_XE_VM_DESTROY		0x04
-#define DRM_XE_VM_BIND			0x05
-#define DRM_XE_EXEC			0x06
-#define DRM_XE_EXEC_QUEUE_CREATE	0x07
-#define DRM_XE_EXEC_QUEUE_DESTROY	0x08
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x09
-#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0a
-#define DRM_XE_WAIT_USER_FENCE		0x0b
-/* Must be kept compact -- no holes */
+struct drm_xe_ext_set_property {
+	/** @base: base user extension */
+	struct xe_user_extension base;
 
-#define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
-#define DRM_IOCTL_XE_GEM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_CREATE, struct drm_xe_gem_create)
-#define DRM_IOCTL_XE_GEM_MMAP_OFFSET		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_MMAP_OFFSET, struct drm_xe_gem_mmap_offset)
-#define DRM_IOCTL_XE_VM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_CREATE, struct drm_xe_vm_create)
-#define DRM_IOCTL_XE_VM_DESTROY			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)
-#define DRM_IOCTL_XE_VM_BIND			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
-#define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
-#define DRM_IOCTL_XE_EXEC_QUEUE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_CREATE, struct drm_xe_exec_queue_create)
-#define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
-#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
-#define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
-#define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
+	/** @property: property to set */
+	__u32 property;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	/** @value: property value */
+	__u64 value;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
 
 /**
  * struct drm_xe_engine_class_instance - instance of an engine class
@@ -269,64 +321,10 @@ struct drm_xe_query_mem_region {
 	 * here will always be zero).
 	 */
 	__u64 cpu_visible_used;
-	/** @reserved: MBZ */
+	/** @reserved: Reserved */
 	__u64 reserved[6];
 };
 
-/**
- * struct drm_xe_query_engine_cycles - correlate CPU and GPU timestamps
- *
- * If a query is made with a struct drm_xe_device_query where .query is equal to
- * DRM_XE_DEVICE_QUERY_ENGINE_CYCLES, then the reply uses struct drm_xe_query_engine_cycles
- * in .data. struct drm_xe_query_engine_cycles is allocated by the user and
- * .data points to this allocated structure.
- *
- * The query returns the engine cycles and the frequency that can
- * be used to calculate the engine timestamp. In addition the
- * query returns a set of cpu timestamps that indicate when the command
- * streamer cycle count was captured.
- */
-struct drm_xe_query_engine_cycles {
-	/**
-	 * @eci: This is input by the user and is the engine for which command
-	 * streamer cycles is queried.
-	 */
-	struct drm_xe_engine_class_instance eci;
-
-	/**
-	 * @clockid: This is input by the user and is the reference clock id for
-	 * CPU timestamp. For definition, see clock_gettime(2) and
-	 * perf_event_open(2). Supported clock ids are CLOCK_MONOTONIC,
-	 * CLOCK_MONOTONIC_RAW, CLOCK_REALTIME, CLOCK_BOOTTIME, CLOCK_TAI.
-	 */
-	__s32 clockid;
-
-	/** @width: Width of the engine cycle counter in bits. */
-	__u32 width;
-
-	/**
-	 * @engine_cycles: Engine cycles as read from its register
-	 * at 0x358 offset.
-	 */
-	__u64 engine_cycles;
-
-	/** @engine_frequency: Frequency of the engine cycles in Hz. */
-	__u64 engine_frequency;
-
-	/**
-	 * @cpu_timestamp: CPU timestamp in ns. The timestamp is captured before
-	 * reading the engine_cycles register using the reference clockid set by the
-	 * user.
-	 */
-	__u64 cpu_timestamp;
-
-	/**
-	 * @cpu_delta: Time delta in ns captured around reading the lower dword
-	 * of the engine_cycles register.
-	 */
-	__u64 cpu_delta;
-};
-
 /**
  * struct drm_xe_query_mem_regions - describe memory regions
  *
@@ -396,7 +394,6 @@ struct drm_xe_query_config {
  * existing GT individual descriptions.
  * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
  * implementing graphics and/or media operations.
- *
  */
 struct drm_xe_query_gt {
 #define DRM_XE_QUERY_GT_TYPE_MAIN		0
@@ -485,6 +482,60 @@ struct drm_xe_query_topology_mask {
 	__u8 mask[];
 };
 
+/**
+ * struct drm_xe_query_engine_cycles - correlate CPU and GPU timestamps
+ *
+ * If a query is made with a struct drm_xe_device_query where .query is equal to
+ * DRM_XE_DEVICE_QUERY_ENGINE_CYCLES, then the reply uses struct drm_xe_query_engine_cycles
+ * in .data. struct drm_xe_query_engine_cycles is allocated by the user and
+ * .data points to this allocated structure.
+ *
+ * The query returns the engine cycles and the frequency that can
+ * be used to calculate the engine timestamp. In addition the
+ * query returns a set of cpu timestamps that indicate when the command
+ * streamer cycle count was captured.
+ */
+struct drm_xe_query_engine_cycles {
+	/**
+	 * @eci: This is input by the user and is the engine for which command
+	 * streamer cycles is queried.
+	 */
+	struct drm_xe_engine_class_instance eci;
+
+	/**
+	 * @clockid: This is input by the user and is the reference clock id for
+	 * CPU timestamp. For definition, see clock_gettime(2) and
+	 * perf_event_open(2). Supported clock ids are CLOCK_MONOTONIC,
+	 * CLOCK_MONOTONIC_RAW, CLOCK_REALTIME, CLOCK_BOOTTIME, CLOCK_TAI.
+	 */
+	__s32 clockid;
+
+	/** @width: Width of the engine cycle counter in bits. */
+	__u32 width;
+
+	/**
+	 * @engine_cycles: Engine cycles as read from its register
+	 * at 0x358 offset.
+	 */
+	__u64 engine_cycles;
+
+	/** @engine_frequency: Frequency of the engine cycles in Hz. */
+	__u64 engine_frequency;
+
+	/**
+	 * @cpu_timestamp: CPU timestamp in ns. The timestamp is captured before
+	 * reading the engine_cycles register using the reference clockid set by the
+	 * user.
+	 */
+	__u64 cpu_timestamp;
+
+	/**
+	 * @cpu_delta: Time delta in ns captured around reading the lower dword
+	 * of the engine_cycles register.
+	 */
+	__u64 cpu_delta;
+};
+
 /**
  * struct drm_xe_query_uc_fw_version - query a micro-controller firmware version
  *
@@ -493,15 +544,16 @@ struct drm_xe_query_topology_mask {
  *
  * The @uc_type can be:
  *  - %DRM_XE_QUERY_UC_TYPE_GUC_SUBMISSION - This is the GuC Submission Version,
- * a.k.a 'VF version'. It is not the actual GuC blob version. A running GuC can
- * support multiple VF APIs with different Submission Versions. This version is
- * negotiated by the VF KMD with GuC during VF initialization. In most of the
- * current available GuC blobs, this is a 1-1 relationship where the Submission
- * version could be inferred from the running version and vice-versa. However,
- * the submission version is the most useful information for the user space
- * perspective and needs.
+ *    a.k.a 'VF version'. It is not the actual GuC blob version. A running GuC can
+ *    support multiple VF APIs with different Submission Versions. This version is
+ *    negotiated by the VF KMD with GuC during VF initialization. In most of the
+ *    current available GuC blobs, this is a 1-1 relationship where the Submission
+ *    version could be inferred from the running version and vice-versa. However,
+ *    the submission version is the most useful information for the user space
+ *    perspective and needs.
  *  - %DRM_XE_QUERY_TYPE_HUC - The actual HuC blob that is currently running
- * in the platform. It returns 0 when HuC is not currently loaded.
+ *    in the platform. It returns 0 when HuC is not currently loaded.
+ *
  */
 struct drm_xe_query_uc_fw_version {
 	/** @uc_type: The micro-controller type to query firmware version */
@@ -529,7 +581,8 @@ struct drm_xe_query_uc_fw_version {
 };
 
 /**
- * struct drm_xe_device_query - main structure to query device information
+ * struct drm_xe_device_query - Input of &DRM_IOCLT_XE_DEVICE_QUERY - The
+ * main structure to query device information
  *
  * The user selects the type of data to query among DRM_XE_DEVICE_QUERY_*
  * and sets the value in the query member. This determines the type of
@@ -608,7 +661,8 @@ struct drm_xe_device_query {
 };
 
 /**
- * struct drm_xe_gem_create - structure for gem creation
+ * struct drm_xe_gem_create - Input of &DRM_IOCLT_XE_GEM_CREATE - A structure for
+ * gem creation
  *
  * The @flags can be:
  *  - %DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING
@@ -673,6 +727,9 @@ struct drm_xe_gem_create {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_gem_mmap_offset - Input of &DRM_IOCTL_XE_GEM_MMAP_OFFSET
+ */
 struct drm_xe_gem_mmap_offset {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -690,24 +747,9 @@ struct drm_xe_gem_mmap_offset {
 	__u64 reserved[2];
 };
 
-/** struct drm_xe_ext_set_property - XE set property extension */
-struct drm_xe_ext_set_property {
-	/** @base: base user extension */
-	struct xe_user_extension base;
-
-	/** @property: property to set */
-	__u32 property;
-
-	/** @pad: MBZ */
-	__u32 pad;
-
-	/** @value: property value */
-	__u64 value;
-
-	/** @reserved: Reserved */
-	__u64 reserved[2];
-};
-
+/**
+ * struct drm_xe_vm_create - Input of &DRM_IOCTL_XE_VM_CREATE
+ */
 struct drm_xe_vm_create {
 #define DRM_XE_VM_EXTENSION_SET_PROPERTY	0
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -727,6 +769,9 @@ struct drm_xe_vm_create {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_vm_destroy - Input of &DRM_IOCTL_XE_VM_DESTROY
+ */
 struct drm_xe_vm_destroy {
 	/** @vm_id: VM ID */
 	__u32 vm_id;
@@ -821,6 +866,9 @@ struct drm_xe_vm_bind_op {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_vm_bind - Input of &DRM_IOCTL_XE_VM_BIND
+ */
 struct drm_xe_vm_bind {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -880,35 +928,96 @@ struct drm_xe_vm_bind {
 #define XE_ACC_GRANULARITY_64M 3
 
 /**
- * struct drm_xe_exec_queue_set_property - exec queue set property
+ * struct drm_xe_sync - Main structure for sync objects and user fences
+ *
+ * This can be used with both @drm_xe_exec or with @drm_xe_vm_bind
+ *
+ * The @type can be:
+ *  - %DRM_XE_SYNC_TYPE_SYNCOBJ - A simple drm sync object
+ *  - %DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ - A timelined sync object
+ *  - %DRM_XE_SYNC_TYPE_USER_FENCE - A user fence
+ *
+ * The @flags can be:
+ *  - %DRM_XE_SYNC_FLAG_SIGNAL
  *
- * Same namespace for extensions as drm_xe_exec_queue_create
  */
-struct drm_xe_exec_queue_set_property {
+struct drm_xe_sync {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @exec_queue_id: Exec queue ID */
+#define DRM_XE_SYNC_TYPE_SYNCOBJ		0x0
+#define DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ	0x1
+#define DRM_XE_SYNC_TYPE_USER_FENCE		0x2
+	/** @type: Type of the this sync object */
+	__u32 type;
+
+#define DRM_XE_SYNC_FLAG_SIGNAL	(1 << 0)
+	/** @flags: Sync Flags */
+	__u32 flags;
+
+	union {
+		/** @handle: Handle to the sync object */
+		__u32 handle;
+
+		/**
+		 * @addr: Address of user fence. When sync is passed in via exec
+		 * IOCTL this is a GPU address in the VM. When sync passed in via
+		 * VM bind IOCTL this is a user pointer. In either case, it is
+		 * the users responsibility that this address is present and
+		 * mapped when the user fence is signalled. Must be qword
+		 * aligned.
+		 */
+		__u64 addr;
+	};
+
+	/**
+	 * @timeline_value: Input for the timeline sync object. Needs to be
+	 * different than 0 when used with %DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ.
+	 */
+	__u64 timeline_value;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+/**
+ * struct drm_xe_exec - Input of &DRM_IOCTL_XE_EXEC
+ */
+struct drm_xe_exec {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @exec_queue_id: Exec queue ID for the batch buffer */
 	__u32 exec_queue_id;
 
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY			0
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		7
-	/** @property: property to set */
-	__u32 property;
+	/** @num_syncs: Amount of struct drm_xe_sync in array. */
+	__u32 num_syncs;
 
-	/** @value: property value */
-	__u64 value;
+	/** @syncs: Pointer to struct drm_xe_sync array. */
+	__u64 syncs;
+
+	/**
+	 * @address: address of batch buffer if num_batch_buffer == 1 or an
+	 * array of batch buffer addresses
+	 */
+	__u64 address;
+
+	/**
+	 * @num_batch_buffer: number of batch buffer in this exec, must match
+	 * the width of the engine
+	 */
+	__u16 num_batch_buffer;
+
+	/** @pad: MBZ */
+	__u16 pad[3];
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
+ */
 struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -942,24 +1051,9 @@ struct drm_xe_exec_queue_create {
 	__u64 reserved[2];
 };
 
-struct drm_xe_exec_queue_get_property {
-	/** @extensions: Pointer to the first extension struct, if any */
-	__u64 extensions;
-
-	/** @exec_queue_id: Exec queue ID */
-	__u32 exec_queue_id;
-
-#define DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN	0
-	/** @property: property to get */
-	__u32 property;
-
-	/** @value: property value */
-	__u64 value;
-
-	/** @reserved: Reserved */
-	__u64 reserved[2];
-};
-
+/**
+ * struct drm_xe_exec_queue_destroy - Input of &DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
+ */
 struct drm_xe_exec_queue_destroy {
 	/** @exec_queue_id: Exec queue ID */
 	__u32 exec_queue_id;
@@ -971,74 +1065,72 @@ struct drm_xe_exec_queue_destroy {
 	__u64 reserved[2];
 };
 
-struct drm_xe_sync {
+/**
+ * struct drm_xe_exec_queue_set_property - Input of &DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
+ *
+ * The @property can be:
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY
+ *
+ */
+struct drm_xe_exec_queue_set_property {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-#define DRM_XE_SYNC_FLAG_SYNCOBJ		0x0
-#define DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ	0x1
-#define DRM_XE_SYNC_FLAG_DMA_BUF		0x2
-#define DRM_XE_SYNC_FLAG_USER_FENCE		0x3
-#define DRM_XE_SYNC_FLAG_SIGNAL		0x10
-	__u32 flags;
-
-	/** @pad: MBZ */
-	__u32 pad;
-
-	union {
-		__u32 handle;
+	/** @exec_queue_id: Exec queue ID */
+	__u32 exec_queue_id;
 
-		/**
-		 * @addr: Address of user fence. When sync passed in via exec
-		 * IOCTL this a GPU address in the VM. When sync passed in via
-		 * VM bind IOCTL this is a user pointer. In either case, it is
-		 * the users responsibility that this address is present and
-		 * mapped when the user fence is signalled. Must be qword
-		 * aligned.
-		 */
-		__u64 addr;
-	};
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY			0
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		7
+	/** @property: property to set */
+	__u32 property;
 
-	__u64 timeline_value;
+	/** @value: property value */
+	__u64 value;
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
 
-struct drm_xe_exec {
+/**
+ * struct drm_xe_exec_queue_get_property - Input of &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
+ *
+ * The @property can be:
+ *  - %DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN
+ *
+ */
+struct drm_xe_exec_queue_get_property {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @exec_queue_id: Exec queue ID for the batch buffer */
+	/** @exec_queue_id: Exec queue ID */
 	__u32 exec_queue_id;
 
-	/** @num_syncs: Amount of struct drm_xe_sync in array. */
-	__u32 num_syncs;
-
-	/** @syncs: Pointer to struct drm_xe_sync array. */
-	__u64 syncs;
-
-	/**
-	 * @address: address of batch buffer if num_batch_buffer == 1 or an
-	 * array of batch buffer addresses
-	 */
-	__u64 address;
-
-	/**
-	 * @num_batch_buffer: number of batch buffer in this exec, must match
-	 * the width of the engine
-	 */
-	__u16 num_batch_buffer;
+#define DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN	0
+	/** @property: property to get */
+	__u32 property;
 
-	/** @pad: MBZ */
-	__u16 pad[3];
+	/** @value: property value */
+	__u64 value;
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
 
 /**
- * struct drm_xe_wait_user_fence - wait user fence
+ * struct drm_xe_wait_user_fence - Input of &DRM_IOCTL_XE_WAIT_USER_FENCE
  *
  * Wait on user fence, XE will wake-up on every HW engine interrupt in the
  * instances list and check if user fence is complete::
@@ -1046,6 +1138,25 @@ struct drm_xe_exec {
  *	(*addr & MASK) OP (VALUE & MASK)
  *
  * Returns to user on user fence completion or timeout.
+ *
+ * The wait @op can be:
+ *  - %DRM_XE_UFENCE_WAIT_EQ
+ *  - %DRM_XE_UFENCE_WAIT_NEQ
+ *  - %DRM_XE_UFENCE_WAIT_GT
+ *  - %DRM_XE_UFENCE_WAIT_GTE
+ *  - %DRM_XE_UFENCE_WAIT_LT
+ *  - %DRM_XE_UFENCE_WAIT_LTE
+ *
+ * The wait @flags can be:
+ *  - %DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP
+ *  - %DRM_XE_UFENCE_WAIT_FLAG_ABSTIME
+ *
+ * The wait @mask can be:
+ *  - %DRM_XE_UFENCE_WAIT_U8
+ *  - %DRM_XE_UFENCE_WAIT_U16
+ *  - %DRM_XE_UFENCE_WAIT_U32
+ *  - %DRM_XE_UFENCE_WAIT_U64
+ *
  */
 struct drm_xe_wait_user_fence {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -1114,6 +1225,16 @@ struct drm_xe_wait_user_fence {
 	__u64 reserved[2];
 };
 
+/**
+ * DOC: uevent generated by xe on it's pci node.
+ *
+ * DRM_XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset gt
+ * fails. The value supplied with the event is always "NEEDS_RESET".
+ * Additional information supplied is tile id and gt id of the gt unit for
+ * which reset has failed.
+ */
+#define DRM_XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
+
 /**
  * DOC: XE PMU event config IDs
  *
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 3f3755180..947726caf 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1316,8 +1316,9 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct intel_bb *ibb,
 static void __unbind_xe_objects(struct intel_bb *ibb)
 {
 	struct drm_xe_sync syncs[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	int ret;
 
@@ -2304,8 +2305,10 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 	uint32_t engine = flags & (I915_EXEC_BSD_MASK | I915_EXEC_RING_MASK);
 	uint32_t engine_id;
 	struct drm_xe_sync syncs[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	struct drm_xe_vm_bind_op *bind_ops;
 	void *map;
diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 7cb0f001c..ad7e8ca4f 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -106,7 +106,8 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
 		uint64_t alignment = xe_get_default_alignment(fd);
 		struct drm_xe_sync sync = { 0 };
 
-		sync.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL;
+		sync.type = DRM_XE_SYNC_TYPE_SYNCOBJ;
+		sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
 		sync.handle = syncobj_create(fd, 0);
 
 		for (int i = 0; i < entries; i++) {
@@ -162,7 +163,8 @@ static void bo_execenv_unbind(struct bo_execenv *execenv,
 		uint32_t vm = execenv->vm;
 		struct drm_xe_sync sync = { 0 };
 
-		sync.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL;
+		sync.type = DRM_XE_SYNC_TYPE_SYNCOBJ;
+		sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
 		sync.handle = syncobj_create(fd, 0);
 
 		for (int i = 0; i < entries; i++) {
diff --git a/lib/intel_ctx.c b/lib/intel_ctx.c
index f82564572..c249532e5 100644
--- a/lib/intel_ctx.c
+++ b/lib/intel_ctx.c
@@ -423,8 +423,9 @@ intel_ctx_t *intel_ctx_xe(int fd, uint32_t vm, uint32_t exec_queue,
 int __intel_ctx_xe_exec(const intel_ctx_t *ctx, uint64_t ahnd, uint64_t bb_offset)
 {
 	struct drm_xe_sync syncs[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	struct drm_xe_exec exec = {
 		.exec_queue_id = ctx->exec_queue,
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 30f35657d..e928148ee 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -405,7 +405,8 @@ void xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
 void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr)
 {
 	struct drm_xe_sync sync = {
-		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL,
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
 		.handle = syncobj_create(fd, 0),
 	};
 
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 5fd383e07..3641811d1 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -191,7 +191,8 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
 	struct igt_spin *spin;
 	struct xe_spin *xe_spin;
 	struct drm_xe_sync sync = {
-		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL,
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -289,7 +290,8 @@ void xe_cork_init(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t vm, bo, exec_queue, syncobj;
 	struct xe_spin *spin;
 	struct drm_xe_sync sync = {
-		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL,
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 2635edf72..4dcf84421 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -179,8 +179,10 @@ void xe_bind_unbind_async(int xe, uint32_t vm, uint32_t bind_engine,
 {
 	struct drm_xe_vm_bind_op *bind_ops;
 	struct drm_xe_sync tabsyncs[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ, .handle = sync_in },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, .handle = sync_out },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .handle = sync_in },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .handle = sync_out },
 	};
 	struct drm_xe_sync *syncs;
 	uint32_t num_binds = 0;
diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
index daa1dc2ca..2298bd84a 100644
--- a/tests/intel/xe_dma_buf_sync.c
+++ b/tests/intel/xe_dma_buf_sync.c
@@ -145,8 +145,9 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *eci0,
 		uint64_t sdi_addr = addr + sdi_offset;
 		uint64_t spin_offset = (char *)&data[i]->spin - (char *)data[i];
 		struct drm_xe_sync sync[2] = {
-			{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ, },
-			{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+			{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ },
+			{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ ,
+			  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 		};
 		struct drm_xe_exec exec = {
 			.num_batch_buffer = 1,
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index cec3e0825..e085dc307 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -48,8 +48,10 @@ static void test_active(int fd, struct drm_xe_query_engine_info *engine)
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 660056f71..e30a03a2a 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -38,8 +38,10 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t bind_exec_queues[3] = { 0, 0, 0 };
 	uint64_t addr = 0x100000000, base_addr = 0x100000000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -219,7 +221,8 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 	uint64_t addr = 0x100000000, base_addr = 0x100000000;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
 		  .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index f15a40613..7d124fb67 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -37,8 +37,10 @@ static void test_all_active(int fd, int gt, int class)
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -177,8 +179,10 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	struct drm_xe_exec exec = {
 		.num_syncs = 2,
@@ -401,7 +405,8 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	uint64_t addr = 0x1a0000;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	          .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index ae406eb01..4a2dc1866 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -81,8 +81,10 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	  int n_exec_queues, int n_execs, int n_vm, unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index b0b4212be..35f9b555d 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -88,7 +88,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	uint64_t addr = 0x1a0000;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	          .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index b1c859b10..14545973b 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -107,7 +107,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	uint64_t addr = 0x1a0000;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	          .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index ddb0b7dba..d85734229 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -30,8 +30,10 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -141,8 +143,10 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	struct drm_xe_exec exec = {
 		.num_syncs = 2,
@@ -338,8 +342,10 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -504,7 +510,8 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	uint64_t addr = 0x1a0000;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	          .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index fb2c639c3..f41926819 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -55,7 +55,8 @@ static void store_dword_batch(struct data *data, uint64_t addr, int value)
 static void store(int fd)
 {
 	struct drm_xe_sync sync = {
-		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL,
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -122,8 +123,10 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
 			     unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, }
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL }
 	};
 
 	struct drm_xe_exec exec = {
@@ -212,8 +215,10 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
 static void store_all(int fd, int gt, int class)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, }
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL }
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 803413ae7..9060d36e1 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -47,8 +47,10 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 	      int class, int n_exec_queues, int n_execs, unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	struct drm_xe_sync sync_all[MAX_N_EXEC_QUEUES];
 	struct drm_xe_exec exec = {
@@ -126,7 +128,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 					&create), 0);
 		exec_queues[i] = create.exec_queue_id;
 		syncobjs[i] = syncobj_create(fd, 0);
-		sync_all[i].flags = DRM_XE_SYNC_FLAG_SYNCOBJ;
+		sync_all[i].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
 		sync_all[i].handle = syncobjs[i];
 	};
 	exec.num_batch_buffer = flags & PARALLEL ? num_placements : 1;
@@ -255,7 +257,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 {
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	          .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
@@ -459,8 +462,10 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		 int n_execs, unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	struct drm_xe_sync sync_all[MAX_N_EXEC_QUEUES];
 	struct drm_xe_exec exec = {
@@ -539,7 +544,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		else
 			bind_exec_queues[i] = 0;
 		syncobjs[i] = syncobj_create(fd, 0);
-		sync_all[i].flags = DRM_XE_SYNC_FLAG_SYNCOBJ;
+		sync_all[i].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
 		sync_all[i].handle = syncobjs[i];
 	};
 
diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c
index 062968050..210cc4aa4 100644
--- a/tests/intel/xe_guc_pc.c
+++ b/tests/intel/xe_guc_pc.c
@@ -37,8 +37,10 @@ static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
index 5eaf4778a..6cf38e2c9 100644
--- a/tests/intel/xe_huc_copy.c
+++ b/tests/intel/xe_huc_copy.c
@@ -118,7 +118,8 @@ __test_huc_copy(int fd, uint32_t vm, struct drm_xe_engine_class_instance *hwe)
 	};
 
 	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
-	sync.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL;
+	sync.type = DRM_XE_SYNC_TYPE_SYNCOBJ;
+	sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
 	sync.handle = syncobj_create(fd, 0);
 
 	for(int i = 0; i < BO_DICT_ENTRIES; i++) {
diff --git a/tests/intel/xe_perf_pmu.c b/tests/intel/xe_perf_pmu.c
index 9b7c5d9d3..e1863b35b 100644
--- a/tests/intel/xe_perf_pmu.c
+++ b/tests/intel/xe_perf_pmu.c
@@ -81,8 +81,8 @@ static void test_any_engine_busyness(int fd, struct drm_xe_engine_class_instance
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -185,8 +185,8 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 690663a79..1288e7b90 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -231,8 +231,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 373170d5b..db58107ab 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -87,7 +87,8 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *eci, unsigned
 	} *data;
 
 	struct drm_xe_sync sync = {
-		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL,
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	};
 
 	struct drm_xe_exec exec = {
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 9139d3286..0314a1694 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -145,7 +145,8 @@ static void xe_spin_fixed_duration(int fd)
 {
 	struct drm_xe_sync sync = {
 		.handle = syncobj_create(fd, 0),
-		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL,
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 2a008e0c4..79dcc23a9 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -274,8 +274,9 @@ static void test_partial_unbinds(int fd)
 	uint64_t addr = 0x1a0000;
 
 	struct drm_xe_sync sync = {
-	    .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL,
-	    .handle = syncobj_create(fd, 0),
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = syncobj_create(fd, 0),
 	};
 
 	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
@@ -314,7 +315,8 @@ static void unbind_all(int fd, int n_vmas)
 	uint32_t vm;
 	int i;
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
@@ -389,8 +391,10 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 	uint32_t vm;
 	uint64_t addr = 0x1000 * 512;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	struct drm_xe_sync sync_all[MAX_N_EXEC_QUEUES + 1];
 	struct drm_xe_exec exec = {
@@ -430,7 +434,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 	for (i = 0; i < n_exec_queues; i++) {
 		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 		syncobjs[i] = syncobj_create(fd, 0);
-		sync_all[i].flags = DRM_XE_SYNC_FLAG_SYNCOBJ;
+		sync_all[i].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
 		sync_all[i].handle = syncobjs[i];
 	};
 
@@ -573,8 +577,10 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -756,8 +762,10 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 	uint32_t vm;
 	uint64_t addr = 0x1a0000, base_addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -945,8 +953,10 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
 		 unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -1106,7 +1116,8 @@ static void *hammer_thread(void *tdata)
 {
 	struct thread_data *t = tdata;
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -1230,8 +1241,10 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 			 unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -1531,8 +1544,10 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 		     int unbind_n_pages, unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index f57785aa4..fe033e987 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -28,10 +28,12 @@ static void do_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 		    uint64_t addr, uint64_t size, uint64_t val)
 {
 	struct drm_xe_sync sync[1] = {};
-	sync[0].flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL;
 
+	sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
+	sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
 	sync[0].addr = to_user_pointer(&wait_fence);
 	sync[0].timeline_value = val;
+
 	xe_vm_bind_async(fd, vm, 0, bo, offset, addr, size, sync, 1);
 }
 
-- 
2.34.1
