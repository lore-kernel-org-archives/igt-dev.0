Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7A66ECFD
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Oct 2021 10:41:15 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Fri, 22 Oct 2021 16:01:50 +0530
Message-Id: <20211022103150.1172603-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_userptr_blits: Update for
 discrete
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, ashutosh.dixit@intel.com, matthew.auld@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

The set_caching ioctl returns -ENODEV for discrete.
Update the relocations and set-cache-level subtest.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 tests/i915/gem_userptr_blits.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 93e4b25b..3d99aa2e 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -1111,8 +1111,12 @@ static void test_relocations(int fd)
 	memset(&obj, 0, sizeof(obj));
 	igt_assert(posix_memalign(&ptr, PAGE_SIZE, size) == 0);
 	gem_userptr(fd, ptr, size, 0, userptr_flags, &obj.handle);
-	if (!gem_has_llc(fd))
-		gem_set_caching(fd, obj.handle, 0);
+	if (!gem_has_llc(fd)){
+		int err;
+		int expect = gem_has_lmem(fd) ? -ENODEV : 0;
+		err = __gem_set_caching(fd, obj.handle, 0);
+		igt_require(err == expect);
+		}
 	*(uint32_t *)ptr = MI_BATCH_BUFFER_END;
 
 	reloc = (typeof(reloc))((char *)ptr + PAGE_SIZE);
@@ -2064,7 +2068,9 @@ static void test_set_caching(int i915)
 	for (int idx = 0; idx < ARRAY_SIZE(levels); idx++) {
 		gem_userptr(i915, page, 4096, 0, 0, &handle);
 		ret = __gem_set_caching(i915, handle, levels[idx]);
-		if (levels[idx] == I915_CACHING_NONE) {
+		if (gem_has_lmem(i915))
+			igt_assert_eq(ret, -ENODEV);
+		else if (levels[idx] == I915_CACHING_NONE) {
 			if(ret != 0)
 				igt_assert_eq(ret, -ENXIO);
 			else
@@ -2078,7 +2084,9 @@ static void test_set_caching(int i915)
 	gem_userptr(i915, page, 4096, 0, 0, &handle);
 	for (int idx = 0; idx < ARRAY_SIZE(levels); idx++) {
 		ret = __gem_set_caching(i915, handle, levels[idx]);
-		if (levels[idx] == I915_CACHING_NONE) {
+		if (gem_has_lmem(i915))
+                        igt_assert_eq(ret, -ENODEV);
+		else if (levels[idx] == I915_CACHING_NONE) {
 			if (ret != 0)
 			        igt_assert_eq(ret, -ENXIO);
 		} else {
@@ -2087,7 +2095,9 @@ static void test_set_caching(int i915)
 	}
 	for (int idx = 0; idx < ARRAY_SIZE(levels); idx++) {
 		ret = __gem_set_caching(i915, handle, levels[idx]);
-		if (levels[idx] == I915_CACHING_NONE) {
+		if (gem_has_lmem(i915))
+                        igt_assert_eq(ret, -ENODEV);
+		else if (levels[idx] == I915_CACHING_NONE) {
 			if (ret != 0)
 				igt_assert_eq(ret, -ENXIO);
 		} else {
-- 
2.25.1
