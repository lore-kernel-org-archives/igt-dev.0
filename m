Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE426EA05
 for <igt-dev@lists.freedesktop.org>; Tue, 11 May 2021 09:08:01 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Tue, 11 May 2021 11:00:00 +0200
Message-Id: <20210511090000.1521342-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915: Handle the case where legacy mmap is
 not available
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

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
Test-with: 20210510132305.1440923-1-maarten.lankhorst@linux.intel.com

 lib/i915/gem_mman.c      | 27 +++++++++++++++++++++++++--
 lib/i915/gem_mman.h      |  1 +
 tests/i915/gem_mmap.c    |  4 +++-
 tests/i915/gem_mmap_wc.c |  1 +
 4 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
index ab04cbecb1af..00d2e47c7208 100644
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
@@ -84,10 +93,14 @@ void *__gem_mmap__gtt(int fd, uint32_t handle, uint64_t size, unsigned prot)
 {
 	struct drm_i915_gem_mmap_gtt mmap_arg;
 	void *ptr;
+	int ret;
 
 	memset(&mmap_arg, 0, sizeof(mmap_arg));
 	mmap_arg.handle = handle;
-	if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &mmap_arg))
+	ret = igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &mmap_arg);
+	if (ret == -1 && errno == EOPNOTSUPP)
+		return __gem_mmap_offset(fd, handle, 0, size, prot, I915_MMAP_OFFSET_GTT);
+	else if (ret)
 		return NULL;
 
 	ptr = mmap64(0, size, prot, MAP_SHARED, fd, mmap_arg.offset);
@@ -136,6 +149,9 @@ bool gem_mmap__has_wc(int fd)
 	struct drm_i915_getparam gp;
 	int mmap_version = -1;
 
+	if (gem_mmap_offset__has_wc(fd))
+		return true;
+
 	memset(&gp, 0, sizeof(gp));
 	gp.param = I915_PARAM_MMAP_VERSION;
 	gp.value = &mmap_version;
@@ -204,6 +220,7 @@ static void *__gem_mmap(int fd, uint32_t handle, uint64_t offset, uint64_t size,
 			unsigned int prot, uint64_t flags)
 {
 	struct drm_i915_gem_mmap arg;
+	int ret;
 
 	memset(&arg, 0, sizeof(arg));
 	arg.handle = handle;
@@ -211,7 +228,13 @@ static void *__gem_mmap(int fd, uint32_t handle, uint64_t offset, uint64_t size,
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
index 7c36571c9bad..fdddd306acb5 100644
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
index 4a2192b30689..ad2d510fcf09 100644
--- a/tests/i915/gem_mmap_wc.c
+++ b/tests/i915/gem_mmap_wc.c
@@ -504,6 +504,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
+		igt_require(gem_has_legacy_mmap(fd));
 		gem_require_mmap_wc(fd);
 	}
 
-- 
2.31.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
