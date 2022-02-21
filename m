Return-path: <SRS0=ONlT=TE=lists.freedesktop.org=igt-dev-bounces@kernel.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 21 Feb 2022 14:16:19 +0000
Message-Id: <20220221141620.2490914-6-matthew.auld@intel.com>
In-Reply-To: <20220221141620.2490914-1-matthew.auld@intel.com>
References: <20220221141620.2490914-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 5/6] i915/tests/capture: add a negative
 test for NEEDS_CPU_ACCESS
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Sanity check that the kernel does indeed reject LMEM buffers marked with
EXEC_OBJECT_CAPTURE, that are not also marked with NEEDS_CPU_ACCESS.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/i915/gem_exec_capture.c | 69 +++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index 24ba6036..09187f62 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -735,6 +735,71 @@ static void userptr(int fd, int dir)
 	gem_engine_properties_restore(fd, &saved_engine);
 }
 
+static bool supports_needs_cpu_access(int fd)
+{
+	struct drm_i915_gem_memory_class_instance regions[] = {
+		{ I915_MEMORY_CLASS_DEVICE, },
+		{ I915_MEMORY_CLASS_SYSTEM, },
+	};
+	struct drm_i915_gem_create_ext_memory_regions setparam_region = {
+		.base = { .name = I915_GEM_CREATE_EXT_MEMORY_REGIONS },
+		.regions = to_user_pointer(&regions),
+		.num_regions = ARRAY_SIZE(regions),
+	};
+	uint64_t size = 4096;
+	uint32_t handle;
+	int ret;
+
+	ret = __gem_create_ext(fd, &size,
+			       I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS,
+			       &handle, &setparam_region.base);
+	if (!ret) {
+		gem_close(fd, handle);
+		igt_assert(gem_has_lmem(fd)); /* Should be dgpu only */
+	}
+
+	return ret == 0;
+}
+
+static void capture_no_cpu_access(int fd)
+{
+	struct drm_i915_gem_exec_object2 exec = {
+		.flags = EXEC_OBJECT_CAPTURE,
+	};
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffers_ptr = to_user_pointer(&exec),
+		.buffer_count = 1,
+	};
+	uint64_t size = 4096;
+	uint32_t handle;
+	int ret;
+
+	igt_require(gem_has_lmem(fd));
+	igt_require(supports_needs_cpu_access(fd));
+
+	/*
+	 * Sanity check that execbuf rejects EXEC_OBJECT_CAPTURE marked BO, that
+	 * is not also tagged with I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS, if
+	 * it can be placed in LMEM. This is only relevant for Dg2+.
+	 */
+
+	igt_require(__gem_create_in_memory_regions(fd, &handle, &size,
+						   REGION_LMEM(0)) == 0);
+
+	exec.handle = handle;
+	ret = __gem_execbuf(fd, &execbuf);
+	if (IS_DG1(fd)) /* Should be no impact on existing ABI */
+		igt_assert(ret == 0);
+	else
+		igt_assert(ret == -EINVAL);
+
+	/* SMEM only buffers should work as normal */
+	igt_assert(__gem_create_in_memory_regions(fd, &handle, &size,
+						  REGION_SMEM) == 0);
+	exec.handle = handle;
+	igt_assert(__gem_execbuf(fd, &execbuf) == 0);
+}
+
 static bool has_capture(int fd)
 {
 	drm_i915_getparam_t gp;
@@ -839,6 +904,10 @@ igt_main
 		igt_dynamic_f("%s", (e)->name)
 			prioinv(fd, dir, ctx, e);
 
+	igt_describe("Verify the ABI contract when using EXEC_OBJECT_CAPTURE without I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS");
+	igt_subtest_f("capture-non-cpu-access")
+		capture_no_cpu_access(fd);
+
 	igt_fixture {
 		close(dir);
 		igt_disallow_hang(fd, hang);
-- 
2.34.1
