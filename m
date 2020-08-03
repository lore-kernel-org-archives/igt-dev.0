Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE36C6E297
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Aug 2020 13:59:03 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon,  3 Aug 2020 16:58:50 +0300
Message-Id: <20200803135851.316355-5-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200803135851.316355-1-lionel.g.landwerlin@intel.com>
References: <20200803135851.316355-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/5] tests/i915/exec_fence: add timeline
 fence tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

We can now give a tuple (handle, point_value) for timeline semaphores.

v2: Fix up syncobj-timeline-repeat test (Lionel)
    Update following kernel rename

v3: Add more ordering tests for syncobj/buffer handle state (Chris)

v4: Rebase
    Drop gem_context_set_all_engines()

v5: Fix syncobj-timeline-wait, ensure cloned context remains blocked
    on the spinner.

v6: Ensure syncobj-timeline-wait can run on all generations, make the
    spinner use the same GEM context and spin on all engines.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v4)
---
 tests/i915/gem_exec_fence.c | 684 ++++++++++++++++++++++++++++++++++++
 1 file changed, 684 insertions(+)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 863386c5..9ca18b27 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -1580,6 +1580,646 @@ static void test_syncobj_channel(int fd)
 		syncobj_destroy(fd, syncobj[i]);
 }
 
+static bool has_syncobj_timeline(int fd)
+{
+	struct drm_get_cap cap = { .capability = DRM_CAP_SYNCOBJ_TIMELINE };
+	ioctl(fd, DRM_IOCTL_GET_CAP, &cap);
+	return cap.value;
+}
+
+static bool exec_has_timeline_fences(int fd)
+{
+	struct drm_i915_getparam gp;
+	int value = 0;
+
+	memset(&gp, 0, sizeof(gp));
+	gp.param = I915_PARAM_HAS_EXEC_TIMELINE_FENCES;
+	gp.value = &value;
+
+	ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp, sizeof(gp));
+	errno = 0;
+
+	return value;
+}
+
+static const char *test_invalid_timeline_fence_array_desc =
+	"Verifies invalid execbuf parameters in"
+	" drm_i915_gem_execbuffer_ext_timeline_fences are rejected";
+static void test_invalid_timeline_fence_array(int fd)
+{
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	struct drm_i915_gem_execbuffer2 execbuf;
+	struct drm_i915_gem_exec_object2 obj;
+	struct drm_i915_gem_execbuffer_ext_timeline_fences timeline_fences;
+	struct drm_i915_gem_exec_fence fence;
+	uint64_t value;
+	void *ptr;
+
+	/* create an otherwise valid execbuf */
+	memset(&obj, 0, sizeof(obj));
+	obj.handle = gem_create(fd, 4096);
+	gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.buffers_ptr = to_user_pointer(&obj);
+	execbuf.buffer_count = 1;
+	gem_execbuf(fd, &execbuf);
+
+	/* Invalid num_cliprects value */
+	execbuf.cliprects_ptr = to_user_pointer(&timeline_fences);
+	execbuf.num_cliprects = 1;
+	execbuf.flags = I915_EXEC_USE_EXTENSIONS;
+	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EINVAL);
+
+	fence.handle = syncobj_create(fd, 0);
+	fence.flags = I915_EXEC_FENCE_SIGNAL;
+	value = 1;
+
+	memset(&timeline_fences, 0, sizeof(timeline_fences));
+	timeline_fences.base.name = DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES;
+	timeline_fences.fence_count = 1;
+	timeline_fences.handles_ptr = to_user_pointer(&fence);
+	timeline_fences.values_ptr = to_user_pointer(&value);
+
+	/* Invalid fence array & i915 ext */
+	execbuf.cliprects_ptr = to_user_pointer(&timeline_fences);
+	execbuf.num_cliprects = 0;
+	execbuf.flags = I915_EXEC_FENCE_ARRAY | I915_EXEC_USE_EXTENSIONS;
+	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EINVAL);
+
+	syncobj_create(fd, fence.handle);
+
+	execbuf.flags = I915_EXEC_USE_EXTENSIONS;
+
+	/* Invalid handles_ptr */
+	value = 1;
+	memset(&timeline_fences, 0, sizeof(timeline_fences));
+	timeline_fences.base.name = DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES;
+	timeline_fences.fence_count = 1;
+	timeline_fences.handles_ptr = -1;
+	timeline_fences.values_ptr = to_user_pointer(&value);
+	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EFAULT);
+
+	/* Invalid values_ptr */
+	value = 1;
+	memset(&timeline_fences, 0, sizeof(timeline_fences));
+	timeline_fences.base.name = DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES;
+	timeline_fences.fence_count = 1;
+	timeline_fences.handles_ptr = to_user_pointer(&fence);
+	timeline_fences.values_ptr = -1;
+	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EFAULT);
+
+	/* Invalid syncobj handle */
+	memset(&fence, 0, sizeof(fence));
+	fence.handle = 0;
+	fence.flags = I915_EXEC_FENCE_WAIT;
+	value = 1;
+	memset(&timeline_fences, 0, sizeof(timeline_fences));
+	timeline_fences.base.name = DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES;
+	timeline_fences.fence_count = 1;
+	timeline_fences.handles_ptr = to_user_pointer(&fence);
+	timeline_fences.values_ptr = to_user_pointer(&value);
+	igt_assert_eq(__gem_execbuf(fd, &execbuf), -ENOENT);
+
+	/* Invalid syncobj timeline point */
+	memset(&fence, 0, sizeof(fence));
+	fence.handle = syncobj_create(fd, 0);
+	fence.flags = I915_EXEC_FENCE_WAIT;
+	value = 1;
+	memset(&timeline_fences, 0, sizeof(timeline_fences));
+	timeline_fences.base.name = DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES;
+	timeline_fences.fence_count = 1;
+	timeline_fences.handles_ptr = to_user_pointer(&fence);
+	timeline_fences.values_ptr = to_user_pointer(&value);
+	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EINVAL);
+	syncobj_destroy(fd, fence.handle);
+
+	/* Invalid handles_ptr */
+	ptr = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+	igt_assert(ptr != MAP_FAILED);
+	memset(&timeline_fences, 0, sizeof(timeline_fences));
+	timeline_fences.base.name = DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES;
+	timeline_fences.fence_count = 1;
+	timeline_fences.handles_ptr = to_user_pointer(ptr);
+	timeline_fences.values_ptr = to_user_pointer(&value);
+	igt_assert_eq(__gem_execbuf(fd, &execbuf), -ENOENT);
+
+	do_or_die(mprotect(ptr, 4096, PROT_READ));
+	igt_assert_eq(__gem_execbuf(fd, &execbuf), -ENOENT);
+
+	do_or_die(mprotect(ptr, 4096, PROT_NONE));
+	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EFAULT);
+
+	munmap(ptr, 4096);
+
+	/* Invalid values_ptr */
+	ptr = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+	igt_assert(ptr != MAP_FAILED);
+	memset(&timeline_fences, 0, sizeof(timeline_fences));
+	timeline_fences.base.name = DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES;
+	timeline_fences.fence_count = 1;
+	timeline_fences.handles_ptr = to_user_pointer(&fence);
+	timeline_fences.values_ptr = to_user_pointer(ptr);
+	igt_assert_eq(__gem_execbuf(fd, &execbuf), -ENOENT);
+
+	do_or_die(mprotect(ptr, 4096, PROT_READ));
+	igt_assert_eq(__gem_execbuf(fd, &execbuf), -ENOENT);
+
+	do_or_die(mprotect(ptr, 4096, PROT_NONE));
+	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EFAULT);
+
+	munmap(ptr, 4096);
+}
+
+static const char *test_syncobj_timeline_unused_fence_desc =
+	"Verifies that a timeline syncobj passed into"
+	" drm_i915_gem_execbuffer_ext_timeline_fences but with no signal/wait"
+	" flag is left untouched";
+static void test_syncobj_timeline_unused_fence(int fd)
+{
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	struct drm_i915_gem_exec_object2 obj;
+	struct drm_i915_gem_execbuffer2 execbuf;
+	struct drm_i915_gem_execbuffer_ext_timeline_fences timeline_fences;
+	struct drm_i915_gem_exec_fence fence = {
+		.handle = syncobj_create(fd, 0),
+	};
+	igt_spin_t *spin = igt_spin_new(fd);
+	uint64_t value = 1;
+
+	/* sanity check our syncobj_to_sync_file interface */
+	igt_assert_eq(__syncobj_to_sync_file(fd, 0), -ENOENT);
+
+	memset(&timeline_fences, 0, sizeof(timeline_fences));
+	timeline_fences.base.name = DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES;
+	timeline_fences.fence_count = 1;
+	timeline_fences.handles_ptr = to_user_pointer(&fence);
+	timeline_fences.values_ptr = to_user_pointer(&value);
+
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.buffers_ptr = to_user_pointer(&obj);
+	execbuf.buffer_count = 1;
+	execbuf.flags = I915_EXEC_USE_EXTENSIONS;
+	execbuf.cliprects_ptr = to_user_pointer(&timeline_fences);
+	execbuf.num_cliprects = 0;
+
+	memset(&obj, 0, sizeof(obj));
+	obj.handle = gem_create(fd, 4096);
+	gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
+
+	gem_execbuf(fd, &execbuf);
+
+	/* no flags, the fence isn't created */
+	igt_assert_eq(__syncobj_to_sync_file(fd, fence.handle), -EINVAL);
+	igt_assert(gem_bo_busy(fd, obj.handle));
+
+	gem_close(fd, obj.handle);
+	syncobj_destroy(fd, fence.handle);
+
+	igt_spin_free(fd, spin);
+}
+
+static const char *test_syncobj_timeline_invalid_wait_desc =
+	"Verifies that submitting an execbuf with a wait on a timeline syncobj"
+	" point that does not exists is rejected";
+static void test_syncobj_timeline_invalid_wait(int fd)
+{
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	struct drm_i915_gem_exec_object2 obj;
+	struct drm_i915_gem_execbuffer2 execbuf;
+	struct drm_i915_gem_execbuffer_ext_timeline_fences timeline_fences;
+	struct drm_i915_gem_exec_fence fence = {
+		.handle = syncobj_create(fd, 0),
+	};
+	uint64_t value = 1;
+
+	memset(&timeline_fences, 0, sizeof(timeline_fences));
+	timeline_fences.base.name = DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES;
+	timeline_fences.fence_count = 1;
+	timeline_fences.handles_ptr = to_user_pointer(&fence);
+	timeline_fences.values_ptr = to_user_pointer(&value);
+
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.buffers_ptr = to_user_pointer(&obj);
+	execbuf.buffer_count = 1;
+	execbuf.flags = I915_EXEC_USE_EXTENSIONS;
+	execbuf.cliprects_ptr = to_user_pointer(&timeline_fences);
+	execbuf.num_cliprects = 0;
+
+	memset(&obj, 0, sizeof(obj));
+	obj.handle = gem_create(fd, 4096);
+	gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
+
+	/* waiting before the fence point 1 is set is invalid */
+	fence.flags = I915_EXEC_FENCE_WAIT;
+	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EINVAL);
+
+	/* Now set point 1. */
+	fence.flags = I915_EXEC_FENCE_SIGNAL;
+	gem_execbuf(fd, &execbuf);
+
+	/* waiting before the fence point 2 is set is invalid */
+	value = 2;
+	fence.flags = I915_EXEC_FENCE_WAIT;
+	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EINVAL);
+
+	gem_close(fd, obj.handle);
+	syncobj_destroy(fd, fence.handle);
+}
+
+static const char *test_syncobj_timeline_invalid_flags_desc =
+	"Verifies that invalid fence flags in"
+	" drm_i915_gem_execbuffer_ext_timeline_fences are rejected";
+static void test_syncobj_timeline_invalid_flags(int fd)
+{
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	struct drm_i915_gem_exec_object2 obj;
+	struct drm_i915_gem_execbuffer2 execbuf;
+	struct drm_i915_gem_execbuffer_ext_timeline_fences timeline_fences;
+	struct drm_i915_gem_exec_fence fence = {
+		.handle = syncobj_create(fd, 0),
+	};
+	uint64_t value = 1;
+
+	memset(&timeline_fences, 0, sizeof(timeline_fences));
+	timeline_fences.base.name = DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES;
+	timeline_fences.fence_count = 1;
+	timeline_fences.handles_ptr = to_user_pointer(&fence);
+	timeline_fences.values_ptr = to_user_pointer(&value);
+
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.buffers_ptr = to_user_pointer(&obj);
+	execbuf.buffer_count = 1;
+	execbuf.flags = I915_EXEC_USE_EXTENSIONS;
+	execbuf.cliprects_ptr = to_user_pointer(&timeline_fences);
+	execbuf.num_cliprects = 0;
+
+	memset(&obj, 0, sizeof(obj));
+	obj.handle = gem_create(fd, 4096);
+	gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
+
+	/* set all flags to hit an invalid one */
+	fence.flags = ~0;
+	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EINVAL);
+
+	gem_close(fd, obj.handle);
+	syncobj_destroy(fd, fence.handle);
+}
+
+static uint64_t
+gettime_ns(void)
+{
+	struct timespec current;
+	clock_gettime(CLOCK_MONOTONIC, &current);
+	return (uint64_t)current.tv_sec * NSEC_PER_SEC + current.tv_nsec;
+}
+
+static const char *test_syncobj_timeline_signal_desc =
+	"Verifies proper signaling of a timeline syncobj through execbuf";
+static void test_syncobj_timeline_signal(int fd)
+{
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	struct drm_i915_gem_exec_object2 obj;
+	struct drm_i915_gem_execbuffer2 execbuf;
+	struct drm_i915_gem_execbuffer_ext_timeline_fences timeline_fences;
+	struct drm_i915_gem_exec_fence fence = {
+		.handle = syncobj_create(fd, 0),
+	};
+	uint64_t value = 42, query_value;
+	igt_spin_t *spin;
+
+	/* Check that the syncobj is signaled only when our request/fence is */
+
+	memset(&timeline_fences, 0, sizeof(timeline_fences));
+	timeline_fences.base.name = DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES;
+	timeline_fences.fence_count = 1;
+	timeline_fences.handles_ptr = to_user_pointer(&fence);
+	timeline_fences.values_ptr = to_user_pointer(&value);
+
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.buffers_ptr = to_user_pointer(&obj);
+	execbuf.buffer_count = 1;
+	execbuf.flags = I915_EXEC_USE_EXTENSIONS;
+	execbuf.cliprects_ptr = to_user_pointer(&timeline_fences);
+	execbuf.num_cliprects = 0;
+
+	memset(&obj, 0, sizeof(obj));
+	obj.handle = gem_create(fd, 4096);
+	gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
+
+	fence.flags = I915_EXEC_FENCE_SIGNAL;
+
+	/* Check syncobj after waiting on the buffer handle. */
+	spin = igt_spin_new(fd);
+	gem_execbuf(fd, &execbuf);
+
+	igt_assert(gem_bo_busy(fd, obj.handle));
+	igt_assert(syncobj_busy(fd, fence.handle));
+	igt_assert(syncobj_timeline_wait(fd, &fence.handle, &value, 1, 0,
+					 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE, NULL));
+	igt_assert_eq(syncobj_timeline_wait_err(fd, &fence.handle, &value,
+						1, 0, 0), -ETIME);
+
+	igt_spin_free(fd, spin);
+
+	gem_sync(fd, obj.handle);
+	igt_assert(!syncobj_busy(fd, fence.handle));
+	igt_assert(!gem_bo_busy(fd, obj.handle));
+
+	syncobj_timeline_query(fd, &fence.handle, &query_value, 1);
+	igt_assert_eq(query_value, value);
+
+	spin = igt_spin_new(fd);
+
+	/*
+	 * Wait on the syncobj and verify the state of the buffer
+	 * handle.
+	 */
+	value = 84;
+	gem_execbuf(fd, &execbuf);
+
+	igt_assert(gem_bo_busy(fd, obj.handle));
+	igt_assert(gem_bo_busy(fd, obj.handle));
+	igt_assert(syncobj_busy(fd, fence.handle));
+	igt_assert(syncobj_timeline_wait(fd, &fence.handle, &value, 1, 0,
+					 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE, NULL));
+	igt_assert_eq(syncobj_timeline_wait_err(fd, &fence.handle, &value,
+						1, 0, 0), -ETIME);
+
+	igt_spin_free(fd, spin);
+
+	igt_assert(syncobj_timeline_wait(fd, &fence.handle, &value, 1,
+					 gettime_ns() + NSEC_PER_SEC,
+					 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT, NULL));
+
+	igt_assert(!gem_bo_busy(fd, obj.handle));
+	igt_assert(!syncobj_busy(fd, fence.handle));
+
+	syncobj_timeline_query(fd, &fence.handle, &query_value, 1);
+	igt_assert_eq(query_value, value);
+
+	gem_close(fd, obj.handle);
+	syncobj_destroy(fd, fence.handle);
+}
+
+static const char *test_syncobj_timeline_wait_desc =
+	"Verifies that waiting on a timeline syncobj point between engines"
+	" works";
+static void test_syncobj_timeline_wait(int fd)
+{
+	const uint32_t bbe[2] = {
+		MI_BATCH_BUFFER_END,
+		MI_NOOP,
+	};
+	uint32_t gem_context = gem_context_clone_with_engines(fd, 0);
+	struct drm_i915_gem_exec_object2 obj;
+	struct drm_i915_gem_execbuffer2 execbuf;
+	struct drm_i915_gem_execbuffer_ext_timeline_fences timeline_fences;
+	struct drm_i915_gem_exec_fence fence = {
+		.handle = syncobj_create(fd, 0),
+	};
+	uint64_t value = 1;
+	igt_spin_t *spin;
+	unsigned handle[16];
+	int n;
+
+	/* Check that we can use the syncobj to asynchronous wait prior to
+	 * execution.
+	 */
+
+	gem_quiescent_gpu(fd);
+
+	spin = igt_spin_new(fd, .ctx = gem_context, .engine = ALL_ENGINES);
+
+	memset(&timeline_fences, 0, sizeof(timeline_fences));
+	timeline_fences.base.name = DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES;
+	timeline_fences.fence_count = 1;
+	timeline_fences.handles_ptr = to_user_pointer(&fence);
+	timeline_fences.values_ptr = to_user_pointer(&value);
+
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.buffers_ptr = to_user_pointer(&obj);
+	execbuf.buffer_count = 1;
+	execbuf.batch_len = sizeof(bbe);
+	execbuf.rsvd1 = gem_context;
+
+	memset(&obj, 0, sizeof(obj));
+	obj.handle = gem_create(fd, 4096);
+	gem_write(fd, obj.handle, 0, bbe, sizeof(bbe));
+
+	/* Queue a signaler from the blocked engine */
+	execbuf.flags = I915_EXEC_USE_EXTENSIONS;
+	execbuf.cliprects_ptr = to_user_pointer(&timeline_fences);
+	execbuf.num_cliprects = 0;
+	fence.flags = I915_EXEC_FENCE_SIGNAL;
+	gem_execbuf(fd, &execbuf);
+	igt_assert(gem_bo_busy(fd, spin->handle));
+
+	gem_close(fd, obj.handle);
+	obj.handle = gem_create(fd, 4096);
+	gem_write(fd, obj.handle, 0, bbe, sizeof(bbe));
+
+	n = 0;
+	for_each_engine(engine, fd) {
+		obj.handle = gem_create(fd, 4096);
+		gem_write(fd, obj.handle, 0, bbe, sizeof(bbe));
+
+		/* No inter-engine synchronisation, will complete */
+		if (engine->flags == I915_EXEC_BLT) {
+			execbuf.flags = engine->flags;
+			execbuf.cliprects_ptr = 0;
+			execbuf.num_cliprects = 0;
+			gem_execbuf(fd, &execbuf);
+			gem_sync(fd, obj.handle);
+			igt_assert(gem_bo_busy(fd, spin->handle));
+		}
+		igt_assert(gem_bo_busy(fd, spin->handle));
+
+		/* Now wait upon the blocked engine */
+		execbuf.flags = I915_EXEC_USE_EXTENSIONS | engine->flags;
+		execbuf.cliprects_ptr = to_user_pointer(&timeline_fences);
+		execbuf.num_cliprects = 0;
+		fence.flags = I915_EXEC_FENCE_WAIT;
+		gem_execbuf(fd, &execbuf);
+
+		igt_assert(gem_bo_busy(fd, obj.handle));
+		handle[n++] = obj.handle;
+	}
+	syncobj_destroy(fd, fence.handle);
+
+	for (int i = 0; i < n; i++)
+		igt_assert(gem_bo_busy(fd, handle[i]));
+
+	igt_spin_free(fd, spin);
+
+	for (int i = 0; i < n; i++) {
+		gem_sync(fd, handle[i]);
+		gem_close(fd, handle[i]);
+	}
+
+	gem_context_destroy(fd, gem_context);
+}
+
+static const char *test_syncobj_timeline_export_desc =
+	"Verify exporting of timeline syncobj signaled by i915";
+static void test_syncobj_timeline_export(int fd)
+{
+	const uint32_t bbe[2] = {
+		MI_BATCH_BUFFER_END,
+		MI_NOOP,
+	};
+	struct drm_i915_gem_exec_object2 obj;
+	struct drm_i915_gem_execbuffer2 execbuf;
+	struct drm_i915_gem_execbuffer_ext_timeline_fences timeline_fences;
+	struct drm_i915_gem_exec_fence fence = {
+		.handle = syncobj_create(fd, 0),
+	};
+	uint64_t value = 1;
+	int export[2];
+	igt_spin_t *spin = igt_spin_new(fd);
+
+	/* Check that if we export the syncobj prior to use it picks up
+	 * the later fence. This allows a syncobj to establish a channel
+	 * between clients that may be updated to a later fence by either
+	 * end.
+	 */
+	for (int n = 0; n < ARRAY_SIZE(export); n++)
+		export[n] = syncobj_export(fd, fence.handle);
+
+	memset(&timeline_fences, 0, sizeof(timeline_fences));
+	timeline_fences.base.name = DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES;
+	timeline_fences.fence_count = 1;
+	timeline_fences.handles_ptr = to_user_pointer(&fence);
+	timeline_fences.values_ptr = to_user_pointer(&value);
+
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.buffers_ptr = to_user_pointer(&obj);
+	execbuf.buffer_count = 1;
+	execbuf.flags = I915_EXEC_USE_EXTENSIONS;
+	execbuf.cliprects_ptr = to_user_pointer(&timeline_fences);
+	execbuf.num_cliprects = 0;
+
+	memset(&obj, 0, sizeof(obj));
+	obj.handle = gem_create(fd, 4096);
+	gem_write(fd, obj.handle, 0, bbe, sizeof(bbe));
+
+	fence.flags = I915_EXEC_FENCE_SIGNAL;
+	gem_execbuf(fd, &execbuf);
+
+	igt_assert(syncobj_busy(fd, fence.handle));
+	igt_assert(gem_bo_busy(fd, obj.handle));
+
+	for (int n = 0; n < ARRAY_SIZE(export); n++) {
+		uint32_t import = syncobj_import(fd, export[n]);
+		igt_assert(syncobj_busy(fd, import));
+		syncobj_destroy(fd, import);
+	}
+
+	igt_spin_free(fd, spin);
+
+	gem_sync(fd, obj.handle);
+	igt_assert(!gem_bo_busy(fd, obj.handle));
+	igt_assert(!syncobj_busy(fd, fence.handle));
+
+	gem_close(fd, obj.handle);
+	syncobj_destroy(fd, fence.handle);
+
+	for (int n = 0; n < ARRAY_SIZE(export); n++) {
+		uint32_t import = syncobj_import(fd, export[n]);
+		igt_assert(!syncobj_busy(fd, import));
+		syncobj_destroy(fd, import);
+		close(export[n]);
+	}
+}
+
+static const char *test_syncobj_timeline_repeat_desc =
+	"Verifies that waiting & signaling a same timeline syncobj point within"
+	" the same execbuf fworks";
+static void test_syncobj_timeline_repeat(int fd)
+{
+	const uint32_t bbe[2] = {
+		MI_BATCH_BUFFER_END,
+		MI_NOOP,
+	};
+	const unsigned nfences = 4096;
+	struct drm_i915_gem_exec_object2 obj;
+	struct drm_i915_gem_execbuffer2 execbuf;
+	struct drm_i915_gem_execbuffer_ext_timeline_fences timeline_fences;
+	struct drm_i915_gem_exec_fence *fence;
+	uint64_t *values;
+	int export;
+	igt_spin_t *spin = igt_spin_new(fd);
+
+	/* Check that we can wait on the same fence multiple times */
+	fence = calloc(nfences, sizeof(*fence));
+	values = calloc(nfences, sizeof(*values));
+	fence->handle = syncobj_create(fd, 0);
+	values[0] = 1;
+	export = syncobj_export(fd, fence->handle);
+	for (int i = 1; i < nfences; i++) {
+		fence[i].handle = syncobj_import(fd, export);
+		values[i] = i + 1;
+	}
+	close(export);
+
+	memset(&timeline_fences, 0, sizeof(timeline_fences));
+	timeline_fences.base.name = DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES;
+	timeline_fences.fence_count = 1;
+	timeline_fences.handles_ptr = to_user_pointer(fence);
+	timeline_fences.values_ptr = to_user_pointer(values);
+
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.buffers_ptr = to_user_pointer(&obj);
+	execbuf.buffer_count = 1;
+	execbuf.flags = I915_EXEC_USE_EXTENSIONS;
+	execbuf.cliprects_ptr = to_user_pointer(&timeline_fences);
+	execbuf.num_cliprects = 0;
+
+	memset(&obj, 0, sizeof(obj));
+	obj.handle = gem_create(fd, 4096);
+	gem_write(fd, obj.handle, 0, bbe, sizeof(bbe));
+
+	for (int i = 0; i < nfences; i++)
+		fence[i].flags = I915_EXEC_FENCE_SIGNAL;
+
+	gem_execbuf(fd, &execbuf);
+
+	for (int i = 0; i < nfences; i++) {
+		igt_assert(syncobj_busy(fd, fence[i].handle));
+		/*
+		 * Timeline syncobj cannot resignal the same point
+		 * again.
+		 */
+		fence[i].flags |= I915_EXEC_FENCE_WAIT;
+	}
+	igt_assert(gem_bo_busy(fd, obj.handle));
+
+	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EINVAL);
+
+	for (int i = 0; i < nfences; i++) {
+		igt_assert(syncobj_busy(fd, fence[i].handle));
+		fence[i].flags = I915_EXEC_FENCE_WAIT;
+	}
+	igt_assert(gem_bo_busy(fd, obj.handle));
+
+	gem_execbuf(fd, &execbuf);
+
+	for (int i = 0; i < nfences; i++)
+		igt_assert(syncobj_busy(fd, fence[i].handle));
+	igt_assert(gem_bo_busy(fd, obj.handle));
+
+	igt_spin_free(fd, spin);
+
+	gem_sync(fd, obj.handle);
+	gem_close(fd, obj.handle);
+
+	for (int i = 0; i < nfences; i++) {
+		igt_assert(!syncobj_busy(fd, fence[i].handle));
+		syncobj_destroy(fd, fence[i].handle);
+	}
+	free(fence);
+	free(values);
+}
+
 igt_main
 {
 	const struct intel_execution_engine2 *e;
@@ -1818,6 +2458,50 @@ igt_main
 		}
 	}
 
+	igt_subtest_group { /* syncobj timeline */
+		igt_fixture {
+			igt_require(exec_has_timeline_fences(i915));
+			igt_assert(has_syncobj_timeline(i915));
+			igt_fork_hang_detector(i915);
+		}
+
+		igt_describe(test_invalid_timeline_fence_array_desc);
+		igt_subtest("invalid-timeline-fence-array")
+			test_invalid_timeline_fence_array(i915);
+
+		igt_describe(test_syncobj_timeline_unused_fence_desc);
+		igt_subtest("syncobj-timeline-unused-fence")
+			test_syncobj_timeline_unused_fence(i915);
+
+		igt_describe(test_syncobj_timeline_invalid_wait_desc);
+		igt_subtest("syncobj-timeline-invalid-wait")
+			test_syncobj_timeline_invalid_wait(i915);
+
+		igt_describe(test_syncobj_timeline_invalid_flags_desc);
+		igt_subtest("syncobj-timeline-invalid-flags")
+			test_syncobj_timeline_invalid_flags(i915);
+
+		igt_describe(test_syncobj_timeline_signal_desc);
+		igt_subtest("syncobj-timeline-signal")
+			test_syncobj_timeline_signal(i915);
+
+		igt_describe(test_syncobj_timeline_wait_desc);
+		igt_subtest("syncobj-timeline-wait")
+			test_syncobj_timeline_wait(i915);
+
+		igt_describe(test_syncobj_timeline_export_desc);
+		igt_subtest("syncobj-timeline-export")
+			test_syncobj_timeline_export(i915);
+
+		igt_describe(test_syncobj_timeline_repeat_desc);
+		igt_subtest("syncobj-timeline-repeat")
+			test_syncobj_timeline_repeat(i915);
+
+		igt_fixture {
+			igt_stop_hang_detector();
+		}
+	}
+
 	igt_fixture {
 		close(i915);
 	}
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
