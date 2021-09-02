Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95216E427
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Sep 2021 05:48:27 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Thu,  2 Sep 2021 11:10:57 +0530
Message-Id: <20210902054057.1258117-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] i915_drm.h sync
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Sync to get I915_MMAP_OFFSET_FIXED define value.

Taken from kernel commit:
    commit 7961c5b60f23 ("drm/i915: Add TTM offset argument to mmap.")

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 include/drm-uapi/i915_drm.h | 450 +++++++++++++++++++++++++++++-------
 lib/i915/i915_drm_local.h   |   2 -
 2 files changed, 369 insertions(+), 83 deletions(-)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index a1c0030c..b9632bb2 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -849,45 +849,94 @@ struct drm_i915_gem_mmap_gtt {
 	__u64 offset;
 };
 
+/**
+ * struct drm_i915_gem_mmap_offset - Retrieve an offset so we can mmap this buffer object.
+ *
+ * This struct is passed as argument to the `DRM_IOCTL_I915_GEM_MMAP_OFFSET` ioctl,
+ * and is used to retrieve the fake offset to mmap an object specified by &handle.
+ *
+ * The legacy way of using `DRM_IOCTL_I915_GEM_MMAP` is removed on gen12+.
+ * `DRM_IOCTL_I915_GEM_MMAP_GTT` is an older supported alias to this struct, but will behave
+ * as setting the &extensions to 0, and &flags to `I915_MMAP_OFFSET_GTT`.
+ */
 struct drm_i915_gem_mmap_offset {
-	/** Handle for the object being mapped. */
+	/** @handle: Handle for the object being mapped. */
 	__u32 handle;
+	/** @pad: Must be zero */
 	__u32 pad;
 	/**
-	 * Fake offset to use for subsequent mmap call
+	 * @offset: The fake offset to use for subsequent mmap call
 	 *
 	 * This is a fixed-size type for 32/64 compatibility.
 	 */
 	__u64 offset;
 
 	/**
-	 * Flags for extended behaviour.
+	 * @flags: Flags for extended behaviour.
 	 *
-	 * It is mandatory that one of the MMAP_OFFSET types
-	 * (GTT, WC, WB, UC, etc) should be included.
+	 * It is mandatory that one of the `MMAP_OFFSET` types
+	 * should be included:
+	 *
+	 * - `I915_MMAP_OFFSET_GTT`: Use mmap with the object bound to GTT. (Write-Combined)
+	 * - `I915_MMAP_OFFSET_WC`: Use Write-Combined caching.
+	 * - `I915_MMAP_OFFSET_WB`: Use Write-Back caching.
+	 * - `I915_MMAP_OFFSET_FIXED`: Use object placement to determine caching.
+	 *
+	 * On devices with local memory `I915_MMAP_OFFSET_FIXED` is the only valid
+	 * type. On devices without local memory, this caching mode is invalid.
+	 *
+	 * As caching mode when specifying `I915_MMAP_OFFSET_FIXED`, WC or WB will
+	 * be used, depending on the object placement on creation. WB will be used
+	 * when the object can only exist in system memory, WC otherwise.
 	 */
 	__u64 flags;
-#define I915_MMAP_OFFSET_GTT 0
-#define I915_MMAP_OFFSET_WC  1
-#define I915_MMAP_OFFSET_WB  2
-#define I915_MMAP_OFFSET_UC  3
 
-	/*
-	 * Zero-terminated chain of extensions.
+#define I915_MMAP_OFFSET_GTT	0
+#define I915_MMAP_OFFSET_WC	1
+#define I915_MMAP_OFFSET_WB	2
+#define I915_MMAP_OFFSET_UC	3
+#define I915_MMAP_OFFSET_FIXED	4
+
+	/**
+	 * @extensions: Zero-terminated chain of extensions.
 	 *
 	 * No current extensions defined; mbz.
 	 */
 	__u64 extensions;
 };
 
+/**
+ * struct drm_i915_gem_set_domain - Adjust the objects write or read domain, in
+ * preparation for accessing the pages via some CPU domain.
+ *
+ * Specifying a new write or read domain will flush the object out of the
+ * previous domain(if required), before then updating the objects domain
+ * tracking with the new domain.
+ *
+ * Note this might involve waiting for the object first if it is still active on
+ * the GPU.
+ *
+ * Supported values for @read_domains and @write_domain:
+ *
+ *	- I915_GEM_DOMAIN_WC: Uncached write-combined domain
+ *	- I915_GEM_DOMAIN_CPU: CPU cache domain
+ *	- I915_GEM_DOMAIN_GTT: Mappable aperture domain
+ *
+ * All other domains are rejected.
+ */
 struct drm_i915_gem_set_domain {
-	/** Handle for the object */
+	/** @handle: Handle for the object. */
 	__u32 handle;
 
-	/** New read domains */
+	/** @read_domains: New read domains. */
 	__u32 read_domains;
 
-	/** New write domain */
+	/**
+	 * @write_domain: New write domain.
+	 *
+	 * Note that having something in the write domain implies it's in the
+	 * read domain, and only that read domain.
+	 */
 	__u32 write_domain;
 };
 
@@ -1348,12 +1397,11 @@ struct drm_i915_gem_busy {
 	 * reading from the object simultaneously.
 	 *
 	 * The value of each engine class is the same as specified in the
-	 * I915_CONTEXT_SET_ENGINES parameter and via perf, i.e.
+	 * I915_CONTEXT_PARAM_ENGINES context parameter and via perf, i.e.
 	 * I915_ENGINE_CLASS_RENDER, I915_ENGINE_CLASS_COPY, etc.
-	 * reported as active itself. Some hardware may have parallel
-	 * execution engines, e.g. multiple media engines, which are
-	 * mapped to the same class identifier and so are not separately
-	 * reported for busyness.
+	 * Some hardware may have parallel execution engines, e.g. multiple
+	 * media engines, which are mapped to the same class identifier and so
+	 * are not separately reported for busyness.
 	 *
 	 * Caveat emptor:
 	 * Only the boolean result of this query is reliable; that is whether
@@ -1364,43 +1412,79 @@ struct drm_i915_gem_busy {
 };
 
 /**
- * I915_CACHING_NONE
- *
- * GPU access is not coherent with cpu caches. Default for machines without an
- * LLC.
- */
-#define I915_CACHING_NONE		0
-/**
- * I915_CACHING_CACHED
- *
- * GPU access is coherent with cpu caches and furthermore the data is cached in
- * last-level caches shared between cpu cores and the gpu GT. Default on
- * machines with HAS_LLC.
+ * struct drm_i915_gem_caching - Set or get the caching for given object
+ * handle.
+ *
+ * Allow userspace to control the GTT caching bits for a given object when the
+ * object is later mapped through the ppGTT(or GGTT on older platforms lacking
+ * ppGTT support, or if the object is used for scanout). Note that this might
+ * require unbinding the object from the GTT first, if its current caching value
+ * doesn't match.
+ *
+ * Note that this all changes on discrete platforms, starting from DG1, the
+ * set/get caching is no longer supported, and is now rejected.  Instead the CPU
+ * caching attributes(WB vs WC) will become an immutable creation time property
+ * for the object, along with the GTT caching level. For now we don't expose any
+ * new uAPI for this, instead on DG1 this is all implicit, although this largely
+ * shouldn't matter since DG1 is coherent by default(without any way of
+ * controlling it).
+ *
+ * Implicit caching rules, starting from DG1:
+ *
+ *     - If any of the object placements (see &drm_i915_gem_create_ext_memory_regions)
+ *       contain I915_MEMORY_CLASS_DEVICE then the object will be allocated and
+ *       mapped as write-combined only.
+ *
+ *     - Everything else is always allocated and mapped as write-back, with the
+ *       guarantee that everything is also coherent with the GPU.
+ *
+ * Note that this is likely to change in the future again, where we might need
+ * more flexibility on future devices, so making this all explicit as part of a
+ * new &drm_i915_gem_create_ext extension is probable.
+ *
+ * Side note: Part of the reason for this is that changing the at-allocation-time CPU
+ * caching attributes for the pages might be required(and is expensive) if we
+ * need to then CPU map the pages later with different caching attributes. This
+ * inconsistent caching behaviour, while supported on x86, is not universally
+ * supported on other architectures. So for simplicity we opt for setting
+ * everything at creation time, whilst also making it immutable, on discrete
+ * platforms.
  */
-#define I915_CACHING_CACHED		1
-/**
- * I915_CACHING_DISPLAY
- *
- * Special GPU caching mode which is coherent with the scanout engines.
- * Transparently falls back to I915_CACHING_NONE on platforms where no special
- * cache mode (like write-through or gfdt flushing) is available. The kernel
- * automatically sets this mode when using a buffer as a scanout target.
- * Userspace can manually set this mode to avoid a costly stall and clflush in
- * the hotpath of drawing the first frame.
- */
-#define I915_CACHING_DISPLAY		2
-
 struct drm_i915_gem_caching {
 	/**
-	 * Handle of the buffer to set/get the caching level of. */
+	 * @handle: Handle of the buffer to set/get the caching level.
+	 */
 	__u32 handle;
 
 	/**
-	 * Cacheing level to apply or return value
+	 * @caching: The GTT caching level to apply or possible return value.
+	 *
+	 * The supported @caching values:
+	 *
+	 * I915_CACHING_NONE:
+	 *
+	 * GPU access is not coherent with CPU caches.  Default for machines
+	 * without an LLC. This means manual flushing might be needed, if we
+	 * want GPU access to be coherent.
+	 *
+	 * I915_CACHING_CACHED:
+	 *
+	 * GPU access is coherent with CPU caches and furthermore the data is
+	 * cached in last-level caches shared between CPU cores and the GPU GT.
 	 *
-	 * bits0-15 are for generic caching control (i.e. the above defined
-	 * values). bits16-31 are reserved for platform-specific variations
-	 * (e.g. l3$ caching on gen7). */
+	 * I915_CACHING_DISPLAY:
+	 *
+	 * Special GPU caching mode which is coherent with the scanout engines.
+	 * Transparently falls back to I915_CACHING_NONE on platforms where no
+	 * special cache mode (like write-through or gfdt flushing) is
+	 * available. The kernel automatically sets this mode when using a
+	 * buffer as a scanout target.  Userspace can manually set this mode to
+	 * avoid a costly stall and clflush in the hotpath of drawing the first
+	 * frame.
+	 */
+#define I915_CACHING_NONE		0
+#define I915_CACHING_CACHED		1
+#define I915_CACHING_DISPLAY		2
 	__u32 caching;
 };
 
@@ -1639,6 +1723,10 @@ struct drm_i915_gem_context_param {
 	__u32 size;
 	__u64 param;
 #define I915_CONTEXT_PARAM_BAN_PERIOD	0x1
+/* I915_CONTEXT_PARAM_NO_ZEROMAP has been removed.  On the off chance
+ * someone somewhere has attempted to use it, never re-use this context
+ * param number.
+ */
 #define I915_CONTEXT_PARAM_NO_ZEROMAP	0x2
 #define I915_CONTEXT_PARAM_GTT_SIZE	0x3
 #define I915_CONTEXT_PARAM_NO_ERROR_CAPTURE	0x4
@@ -1723,24 +1811,8 @@ struct drm_i915_gem_context_param {
  */
 #define I915_CONTEXT_PARAM_PERSISTENCE	0xb
 
-/*
- * I915_CONTEXT_PARAM_RINGSIZE:
- *
- * Sets the size of the CS ringbuffer to use for logical ring contexts. This
- * applies a limit of how many batches can be queued to HW before the caller
- * is blocked due to lack of space for more commands.
- *
- * Only reliably possible to be set prior to first use, i.e. during
- * construction. At any later point, the current execution must be flushed as
- * the ring can only be changed while the context is idle. Note, the ringsize
- * can be specified as a constructor property, see
- * I915_CONTEXT_CREATE_EXT_SETPARAM, but can also be set later if required.
- *
- * Only applies to the current set of engine and lost when those engines
- * are replaced by a new mapping (see I915_CONTEXT_PARAM_ENGINES).
- *
- * Must be between 4 - 512 KiB, in intervals of page size [4 KiB].
- * Default is 16 KiB.
+/* This API has been removed.  On the off chance someone somewhere has
+ * attempted to use it, never re-use this context param number.
  */
 #define I915_CONTEXT_PARAM_RINGSIZE	0xc
 /* Must be kept compact -- no holes and well documented */
@@ -1807,6 +1879,69 @@ struct drm_i915_gem_context_param_sseu {
 	__u32 rsvd;
 };
 
+/**
+ * DOC: Virtual Engine uAPI
+ *
+ * Virtual engine is a concept where userspace is able to configure a set of
+ * physical engines, submit a batch buffer, and let the driver execute it on any
+ * engine from the set as it sees fit.
+ *
+ * This is primarily useful on parts which have multiple instances of a same
+ * class engine, like for example GT3+ Skylake parts with their two VCS engines.
+ *
+ * For instance userspace can enumerate all engines of a certain class using the
+ * previously described `Engine Discovery uAPI`_. After that userspace can
+ * create a GEM context with a placeholder slot for the virtual engine (using
+ * `I915_ENGINE_CLASS_INVALID` and `I915_ENGINE_CLASS_INVALID_NONE` for class
+ * and instance respectively) and finally using the
+ * `I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE` extension place a virtual engine in
+ * the same reserved slot.
+ *
+ * Example of creating a virtual engine and submitting a batch buffer to it:
+ *
+ * .. code-block:: C
+ *
+ * 	I915_DEFINE_CONTEXT_ENGINES_LOAD_BALANCE(virtual, 2) = {
+ * 		.base.name = I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE,
+ * 		.engine_index = 0, // Place this virtual engine into engine map slot 0
+ * 		.num_siblings = 2,
+ * 		.engines = { { I915_ENGINE_CLASS_VIDEO, 0 },
+ * 			     { I915_ENGINE_CLASS_VIDEO, 1 }, },
+ * 	};
+ * 	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 1) = {
+ * 		.engines = { { I915_ENGINE_CLASS_INVALID,
+ * 			       I915_ENGINE_CLASS_INVALID_NONE } },
+ * 		.extensions = to_user_pointer(&virtual), // Chains after load_balance extension
+ * 	};
+ * 	struct drm_i915_gem_context_create_ext_setparam p_engines = {
+ * 		.base = {
+ * 			.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
+ * 		},
+ * 		.param = {
+ * 			.param = I915_CONTEXT_PARAM_ENGINES,
+ * 			.value = to_user_pointer(&engines),
+ * 			.size = sizeof(engines),
+ * 		},
+ * 	};
+ * 	struct drm_i915_gem_context_create_ext create = {
+ * 		.flags = I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
+ * 		.extensions = to_user_pointer(&p_engines);
+ * 	};
+ *
+ * 	ctx_id = gem_context_create_ext(drm_fd, &create);
+ *
+ * 	// Now we have created a GEM context with its engine map containing a
+ * 	// single virtual engine. Submissions to this slot can go either to
+ * 	// vcs0 or vcs1, depending on the load balancing algorithm used inside
+ * 	// the driver. The load balancing is dynamic from one batch buffer to
+ * 	// another and transparent to userspace.
+ *
+ * 	...
+ * 	execbuf.rsvd1 = ctx_id;
+ * 	execbuf.flags = 0; // Submits to index 0 which is the virtual engine
+ * 	gem_execbuf(drm_fd, &execbuf);
+ */
+
 /*
  * i915_context_engines_load_balance:
  *
@@ -1883,6 +2018,61 @@ struct i915_context_engines_bond {
 	struct i915_engine_class_instance engines[N__]; \
 } __attribute__((packed)) name__
 
+/**
+ * DOC: Context Engine Map uAPI
+ *
+ * Context engine map is a new way of addressing engines when submitting batch-
+ * buffers, replacing the existing way of using identifiers like `I915_EXEC_BLT`
+ * inside the flags field of `struct drm_i915_gem_execbuffer2`.
+ *
+ * To use it created GEM contexts need to be configured with a list of engines
+ * the user is intending to submit to. This is accomplished using the
+ * `I915_CONTEXT_PARAM_ENGINES` parameter and `struct
+ * i915_context_param_engines`.
+ *
+ * For such contexts the `I915_EXEC_RING_MASK` field becomes an index into the
+ * configured map.
+ *
+ * Example of creating such context and submitting against it:
+ *
+ * .. code-block:: C
+ *
+ * 	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 2) = {
+ * 		.engines = { { I915_ENGINE_CLASS_RENDER, 0 },
+ * 			     { I915_ENGINE_CLASS_COPY, 0 } }
+ * 	};
+ * 	struct drm_i915_gem_context_create_ext_setparam p_engines = {
+ * 		.base = {
+ * 			.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
+ * 		},
+ * 		.param = {
+ * 			.param = I915_CONTEXT_PARAM_ENGINES,
+ * 			.value = to_user_pointer(&engines),
+ * 			.size = sizeof(engines),
+ * 		},
+ * 	};
+ * 	struct drm_i915_gem_context_create_ext create = {
+ * 		.flags = I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
+ * 		.extensions = to_user_pointer(&p_engines);
+ * 	};
+ *
+ * 	ctx_id = gem_context_create_ext(drm_fd, &create);
+ *
+ * 	// We have now created a GEM context with two engines in the map:
+ * 	// Index 0 points to rcs0 while index 1 points to bcs0. Other engines
+ * 	// will not be accessible from this context.
+ *
+ * 	...
+ * 	execbuf.rsvd1 = ctx_id;
+ * 	execbuf.flags = 0; // Submits to index 0, which is rcs0 for this context
+ * 	gem_execbuf(drm_fd, &execbuf);
+ *
+ * 	...
+ * 	execbuf.rsvd1 = ctx_id;
+ * 	execbuf.flags = 1; // Submits to index 0, which is bcs0 for this context
+ * 	gem_execbuf(drm_fd, &execbuf);
+ */
+
 struct i915_context_param_engines {
 	__u64 extensions; /* linked chain of extension blocks, 0 terminates */
 #define I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE 0 /* see i915_context_engines_load_balance */
@@ -1901,20 +2091,10 @@ struct drm_i915_gem_context_create_ext_setparam {
 	struct drm_i915_gem_context_param param;
 };
 
-struct drm_i915_gem_context_create_ext_clone {
+/* This API has been removed.  On the off chance someone somewhere has
+ * attempted to use it, never re-use this extension number.
+ */
 #define I915_CONTEXT_CREATE_EXT_CLONE 1
-	struct i915_user_extension base;
-	__u32 clone_id;
-	__u32 flags;
-#define I915_CONTEXT_CLONE_ENGINES	(1u << 0)
-#define I915_CONTEXT_CLONE_FLAGS	(1u << 1)
-#define I915_CONTEXT_CLONE_SCHEDATTR	(1u << 2)
-#define I915_CONTEXT_CLONE_SSEU		(1u << 3)
-#define I915_CONTEXT_CLONE_TIMELINE	(1u << 4)
-#define I915_CONTEXT_CLONE_VM		(1u << 5)
-#define I915_CONTEXT_CLONE_UNKNOWN -(I915_CONTEXT_CLONE_VM << 1)
-	__u64 rsvd;
-};
 
 struct drm_i915_gem_context_destroy {
 	__u32 ctx_id;
@@ -1986,14 +2166,52 @@ struct drm_i915_reset_stats {
 	__u32 pad;
 };
 
+/**
+ * struct drm_i915_gem_userptr - Create GEM object from user allocated memory.
+ *
+ * Userptr objects have several restrictions on what ioctls can be used with the
+ * object handle.
+ */
 struct drm_i915_gem_userptr {
+	/**
+	 * @user_ptr: The pointer to the allocated memory.
+	 *
+	 * Needs to be aligned to PAGE_SIZE.
+	 */
 	__u64 user_ptr;
+
+	/**
+	 * @user_size:
+	 *
+	 * The size in bytes for the allocated memory. This will also become the
+	 * object size.
+	 *
+	 * Needs to be aligned to PAGE_SIZE, and should be at least PAGE_SIZE,
+	 * or larger.
+	 */
 	__u64 user_size;
+
+	/**
+	 * @flags:
+	 *
+	 * Supported flags:
+	 *
+	 * I915_USERPTR_READ_ONLY:
+	 *
+	 * Mark the object as readonly, this also means GPU access can only be
+	 * readonly. This is only supported on HW which supports readonly access
+	 * through the GTT. If the HW can't support readonly access, an error is
+	 * returned.
+	 *
+	 * I915_USERPTR_UNSYNCHRONIZED:
+	 *
+	 * NOT USED. Setting this flag will result in an error.
+	 */
 	__u32 flags;
 #define I915_USERPTR_READ_ONLY 0x1
 #define I915_USERPTR_UNSYNCHRONIZED 0x80000000
 	/**
-	 * Returned handle for the object.
+	 * @handle: Returned handle for the object.
 	 *
 	 * Object handles are nonzero.
 	 */
@@ -2376,6 +2594,76 @@ struct drm_i915_query_topology_info {
 	__u8 data[];
 };
 
+/**
+ * DOC: Engine Discovery uAPI
+ *
+ * Engine discovery uAPI is a way of enumerating physical engines present in a
+ * GPU associated with an open i915 DRM file descriptor. This supersedes the old
+ * way of using `DRM_IOCTL_I915_GETPARAM` and engine identifiers like
+ * `I915_PARAM_HAS_BLT`.
+ *
+ * The need for this interface came starting with Icelake and newer GPUs, which
+ * started to establish a pattern of having multiple engines of a same class,
+ * where not all instances were always completely functionally equivalent.
+ *
+ * Entry point for this uapi is `DRM_IOCTL_I915_QUERY` with the
+ * `DRM_I915_QUERY_ENGINE_INFO` as the queried item id.
+ *
+ * Example for getting the list of engines:
+ *
+ * .. code-block:: C
+ *
+ * 	struct drm_i915_query_engine_info *info;
+ * 	struct drm_i915_query_item item = {
+ * 		.query_id = DRM_I915_QUERY_ENGINE_INFO;
+ * 	};
+ * 	struct drm_i915_query query = {
+ * 		.num_items = 1,
+ * 		.items_ptr = (uintptr_t)&item,
+ * 	};
+ * 	int err, i;
+ *
+ * 	// First query the size of the blob we need, this needs to be large
+ * 	// enough to hold our array of engines. The kernel will fill out the
+ * 	// item.length for us, which is the number of bytes we need.
+ * 	//
+ * 	// Alternatively a large buffer can be allocated straight away enabling
+ * 	// querying in one pass, in which case item.length should contain the
+ * 	// length of the provided buffer.
+ * 	err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
+ * 	if (err) ...
+ *
+ * 	info = calloc(1, item.length);
+ * 	// Now that we allocated the required number of bytes, we call the ioctl
+ * 	// again, this time with the data_ptr pointing to our newly allocated
+ * 	// blob, which the kernel can then populate with info on all engines.
+ * 	item.data_ptr = (uintptr_t)&info,
+ *
+ * 	err = ioctl(fd, DRM_IOCTL_I915_QUERY, &query);
+ * 	if (err) ...
+ *
+ * 	// We can now access each engine in the array
+ * 	for (i = 0; i < info->num_engines; i++) {
+ * 		struct drm_i915_engine_info einfo = info->engines[i];
+ * 		u16 class = einfo.engine.class;
+ * 		u16 instance = einfo.engine.instance;
+ * 		....
+ * 	}
+ *
+ * 	free(info);
+ *
+ * Each of the enumerated engines, apart from being defined by its class and
+ * instance (see `struct i915_engine_class_instance`), also can have flags and
+ * capabilities defined as documented in i915_drm.h.
+ *
+ * For instance video engines which support HEVC encoding will have the
+ * `I915_VIDEO_CLASS_CAPABILITY_HEVC` capability bit set.
+ *
+ * Engine discovery only fully comes to its own when combined with the new way
+ * of addressing engines when submitting batch buffers using contexts with
+ * engine maps configured.
+ */
+
 /**
  * struct drm_i915_engine_info
  *
diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
index 0e3cef81..dd646aed 100644
--- a/lib/i915/i915_drm_local.h
+++ b/lib/i915/i915_drm_local.h
@@ -20,8 +20,6 @@ extern "C" {
  * clean these up when kernel uapi headers are sync'd.
  */
 
-#define I915_MMAP_OFFSET_FIXED 4
-
 #if defined(__cplusplus)
 }
 #endif
-- 
2.31.1
