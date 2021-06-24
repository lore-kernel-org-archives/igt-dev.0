Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706DC6EA8C
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Jun 2021 09:14:27 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Thu, 24 Jun 2021 11:14:14 +0200
Message-Id: <20210624091414.3287487-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915: Handle the case where legacy mmap is
 not available, v2.
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

We will remove support for the legacy mmap ioctl, so handle that
case without rewriting all tests.

When the gem_mmap ioctl is not available, transparently fallback to mmap_offset.

Changes since v1:
- Skip gem_tiled_wc too, as it requires on legacy mmap behavior. (Ashutosh)
- Remove fallback for __gem_mmap__gtt, it's already mmap_offset. (Ashutosh)

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/gem_mman.c       | 22 +++++++++++++++++++++-
 lib/i915/gem_mman.h       |  1 +
 tests/i915/gem_mmap.c     |  4 +++-
 tests/i915/gem_mmap_wc.c  |  1 +
 tests/i915/gem_tiled_wc.c |  1 +
 5 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
index 300ca13d3b30..9a422a6a329f 100644
--- a/lib/i915/gem_mman.c
+++ b/lib/i915/gem_mman.c
@@ -63,6 +63,15 @@ bool gem_has_mmap_offset(int fd)
 	return gtt_version >= 4;
 }
 
+bool gem_has_legacy_mmap(int fd)
+{
+	struct drm_i915_gem_mmap arg = { .handle = ~0U };
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP, &arg), -1);
+
+	return errno != EOPNOTSUPP;
+}
+
 bool gem_has_mmap_offset_type(int fd, const struct mmap_offset *t)
 {
 	return gem_has_mmap_offset(fd) || t->type == I915_MMAP_OFFSET_GTT;
@@ -84,6 +93,7 @@ void *__gem_mmap__gtt(int fd, uint32_t handle, uint64_t size, unsigned prot)
 {
 	struct drm_i915_gem_mmap_gtt mmap_arg;
 	void *ptr;
+	int ret;
 
 	memset(&mmap_arg, 0, sizeof(mmap_arg));
 	mmap_arg.handle = handle;
@@ -136,6 +146,9 @@ bool gem_mmap__has_wc(int fd)
 	struct drm_i915_getparam gp;
 	int mmap_version = -1;
 
+	if (gem_mmap_offset__has_wc(fd))
+		return true;
+
 	memset(&gp, 0, sizeof(gp));
 	gp.param = I915_PARAM_MMAP_VERSION;
 	gp.value = &mmap_version;
@@ -204,6 +217,7 @@ static void *__gem_mmap(int fd, uint32_t handle, uint64_t offset, uint64_t size,
 			unsigned int prot, uint64_t flags)
 {
 	struct drm_i915_gem_mmap arg;
+	int ret;
 
 	memset(&arg, 0, sizeof(arg));
 	arg.handle = handle;
@@ -211,7 +225,13 @@ static void *__gem_mmap(int fd, uint32_t handle, uint64_t offset, uint64_t size,
 	arg.size = size;
 	arg.flags = flags;
 
-	if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP, &arg))
+	ret = igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP, &arg);
+	if (ret == -1 && errno == EOPNOTSUPP)
+		return __gem_mmap_offset(fd, handle, offset, size, prot,
+					 flags == I915_MMAP_WC ?
+						I915_MMAP_OFFSET_WC :
+						I915_MMAP_OFFSET_WB);
+	else if (ret)
 		return NULL;
 
 	VG(VALGRIND_MAKE_MEM_DEFINED(from_user_pointer(arg.addr_ptr), arg.size));
diff --git a/lib/i915/gem_mman.h b/lib/i915/gem_mman.h
index 4a69b25954a7..5695d2ad8736 100644
--- a/lib/i915/gem_mman.h
+++ b/lib/i915/gem_mman.h
@@ -45,6 +45,7 @@ void *gem_mmap__cpu_coherent(int fd, uint32_t handle, uint64_t offset,
 bool gem_has_mappable_ggtt(int i915);
 void gem_require_mappable_ggtt(int i915);
 bool gem_has_mmap_offset(int fd);
+bool gem_has_legacy_mmap(int fd);
 
 void *__gem_mmap__gtt(int fd, uint32_t handle, uint64_t size, unsigned prot);
 void *__gem_mmap__cpu(int fd, uint32_t handle, uint64_t offset, uint64_t size, unsigned prot);
diff --git a/tests/i915/gem_mmap.c b/tests/i915/gem_mmap.c
index d12a4c0bac6b..a77c0ad60bf3 100644
--- a/tests/i915/gem_mmap.c
+++ b/tests/i915/gem_mmap.c
@@ -154,8 +154,10 @@ igt_main
 	uint8_t buf[OBJECT_SIZE];
 	uint8_t *addr;
 
-	igt_fixture
+	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
+		igt_require(gem_has_legacy_mmap(fd));
+	}
 
 	igt_subtest("bad-object") {
 		uint32_t real_handle = gem_create(fd, 4096);
diff --git a/tests/i915/gem_mmap_wc.c b/tests/i915/gem_mmap_wc.c
index 7130a51044a0..4fcf547859b1 100644
--- a/tests/i915/gem_mmap_wc.c
+++ b/tests/i915/gem_mmap_wc.c
@@ -504,6 +504,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
+		igt_require(gem_has_legacy_mmap(fd));
 		gem_require_mmap_wc(fd);
 	}
 
diff --git a/tests/i915/gem_tiled_wc.c b/tests/i915/gem_tiled_wc.c
index 29ea700e34a3..1f245eb7d605 100644
--- a/tests/i915/gem_tiled_wc.c
+++ b/tests/i915/gem_tiled_wc.c
@@ -147,6 +147,7 @@ igt_simple_main
 	fd = drm_open_driver(DRIVER_INTEL);
 	gem_require_mmap_wc(fd);
 	gem_require_mappable_ggtt(fd);
+	igt_require(gem_has_legacy_mmap(fd));
 	igt_require(gem_available_fences(fd) > 0);
 
 	handle = create_bo(fd);
-- 
2.31.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
