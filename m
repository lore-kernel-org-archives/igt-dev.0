Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49C66F932
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2020 23:35:30 +0000 (UTC)
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date: Wed, 22 Jan 2020 15:33:26 -0800
Message-Id: <20200122233326.29131-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] tests/i915/gem_mmap_wc: Update test to use
 mmap_wc IOCTL
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

Purpose of this test is to validate the mmap_wc ioctl. After recent
additions to library wrappers, the local wrapper ended up calling
the unintended mmap. Also check for presence of mappable GGTT before
testing it.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_mmap_wc.c | 59 ++++++++++++++++++++++++----------------
 1 file changed, 35 insertions(+), 24 deletions(-)

diff --git a/tests/i915/gem_mmap_wc.c b/tests/i915/gem_mmap_wc.c
index 375a9b50..27334b6d 100644
--- a/tests/i915/gem_mmap_wc.c
+++ b/tests/i915/gem_mmap_wc.c
@@ -51,19 +51,36 @@ struct local_i915_gem_mmap_v2 {
 
 static int OBJECT_SIZE = 16*1024*1024;
 
+static int mmap_ioctl(int i915, struct drm_i915_gem_mmap *arg)
+{
+	int err = 0;
+
+	if (igt_ioctl(i915, DRM_IOCTL_I915_GEM_MMAP, arg))
+		err = -errno;
+
+	errno = 0;
+	return err;
+}
+
 /*
  * Local WC mmap wrapper. This is used to make sure we go through
  * the GEM_MMAP IOCTL.
  * */
 static void *
-local_gem_mmap__wc(int fd, uint32_t handle, uint64_t offset, uint64_t size, unsigned prot)
+local_gem_mmap__wc(int fd, uint32_t handle, uint64_t offset, uint64_t size)
 {
-	void *ptr;
 
-	ptr = __gem_mmap__wc(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
-	igt_assert(ptr);
+	struct drm_i915_gem_mmap arg = {
+		.handle = handle,
+		.offset = offset,
+		.size = size,
+		.flags = I915_MMAP_WC,
+	};
 
-	return ptr;
+	igt_assert_eq(mmap_ioctl(fd, &arg), 0);
+	igt_assert(arg.addr_ptr);
+
+	return from_user_pointer(arg.addr_ptr);
 }
 
 static void set_domain(int fd, uint32_t handle)
@@ -76,7 +93,7 @@ mmap_bo(int fd, uint32_t handle)
 {
 	void *ptr;
 
-	ptr = local_gem_mmap__wc(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
+	ptr = local_gem_mmap__wc(fd, handle, 0, OBJECT_SIZE);
 
 	return ptr;
 }
@@ -192,9 +209,9 @@ test_read_write2(int fd, enum test_read_write order)
 	handle = gem_create(fd, OBJECT_SIZE);
 	set_domain(fd, handle);
 
-	r = local_gem_mmap__wc(fd, handle, 0, OBJECT_SIZE, PROT_READ);
+	r = local_gem_mmap__wc(fd, handle, 0, OBJECT_SIZE);
 
-	w = local_gem_mmap__wc(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
+	w = local_gem_mmap__wc(fd, handle, 0, OBJECT_SIZE);
 
 	if (order == READ_BEFORE_WRITE) {
 		val = *(uint32_t *)r;
@@ -236,7 +253,7 @@ test_coherency(int fd)
 
 	handle = gem_create(fd, OBJECT_SIZE);
 
-	wc = local_gem_mmap__wc(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
+	wc = local_gem_mmap__wc(fd, handle, 0, OBJECT_SIZE);
 	cpu = gem_mmap__cpu(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
 
@@ -314,7 +331,7 @@ test_write_cpu_read_wc(int fd, int force_domain)
 
 	handle = gem_create(fd, OBJECT_SIZE);
 
-	dst = local_gem_mmap__wc(fd, handle, 0, OBJECT_SIZE, PROT_READ);
+	dst = local_gem_mmap__wc(fd, handle, 0, OBJECT_SIZE);
 
 	src = gem_mmap__cpu(fd, handle, 0, OBJECT_SIZE, PROT_WRITE);
 
@@ -337,7 +354,7 @@ test_write_gtt_read_wc(int fd)
 	handle = gem_create(fd, OBJECT_SIZE);
 	set_domain(fd, handle);
 
-	dst = local_gem_mmap__wc(fd, handle, 0, OBJECT_SIZE, PROT_READ);
+	dst = local_gem_mmap__wc(fd, handle, 0, OBJECT_SIZE);
 
 	src = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_WRITE);
 
@@ -452,7 +469,7 @@ test_pf_nonblock(int i915)
 
 	igt_set_timeout(1, "initial pagefaulting did not complete within 1s");
 
-	ptr = gem_mmap__wc(i915, spin->handle, 0, 4096, PROT_WRITE);
+	ptr = local_gem_mmap__wc(i915, spin->handle, 0, 4096);
 	ptr[256] = 0;
 	munmap(ptr, 4096);
 
@@ -470,16 +487,6 @@ run_without_prefault(int fd,
 	igt_enable_prefault();
 }
 
-static int mmap_ioctl(int i915, struct drm_i915_gem_mmap *arg)
-{
-	int err = 0;
-
-	if (igt_ioctl(i915, DRM_IOCTL_I915_GEM_MMAP, arg))
-		err = -errno;
-
-	errno = 0;
-	return err;
-}
 
 int fd;
 
@@ -593,14 +600,18 @@ igt_main
 		run_without_prefault(fd, test_read);
 	igt_subtest("write-no-prefault")
 		run_without_prefault(fd, test_write);
-	igt_subtest("write-gtt-no-prefault")
+	igt_subtest("write-gtt-no-prefault") {
+		gem_require_mappable_ggtt(fd);
 		run_without_prefault(fd, test_write_gtt);
+	}
 	igt_subtest("write-cpu-read-wc")
 		test_write_cpu_read_wc(fd, 1);
 	igt_subtest("write-cpu-read-wc-unflushed")
 		test_write_cpu_read_wc(fd, 0);
-	igt_subtest("write-gtt-read-wc")
+	igt_subtest("write-gtt-read-wc") {
+		gem_require_mappable_ggtt(fd);
 		test_write_gtt_read_wc(fd);
+	}
 	igt_subtest("pf-nonblock")
 		test_pf_nonblock(fd);
 	igt_subtest("set-cache-level")
-- 
2.22.0.245.g4d8ec15c66

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
