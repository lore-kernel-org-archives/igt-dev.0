Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018D86E86D
 for <igt-dev@lists.freedesktop.org>; Fri, 21 May 2021 06:44:43 +0000 (UTC)
From: viswax.krishna.raveendra.talabattula@intel.com
Date: Fri, 21 May 2021 12:19:06 +0530
Message-Id: <20210521064906.775140-1-viswax.krishna.raveendra.talabattula@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [Patch V5] [i-g-t] tests/i915: test pass for no caching
 case
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
To: igt-dev@lists.freedesktop.org, tejaskumarx.surendrakumar.upadhyay@intel.com, Mahesh.Meena@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Viswa Krishna Raveendra Talabattula <viswax.krishna.raveendra.talabattula@intel.com>

The userptr memory does not support I915_CACHING_NONE(no caching) level
as per the below commit related to i915 in the kernel

commit 02b64a4a0cb14e414b0be3b7261edc4fabfc0e2c
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Tue Mar 23 16:50:02 2021 +0100

        drm/i915: Reject more ioctls for userptr, v2.

So lets make test pass for return value of -ENXIO and 0
Print warning of "Deprecated userptr SET_CACHING behavior" for older kernels

Signed-off-by: Viswa Krishna Raveendra Talabattula <viswax.krishna.raveendra.talabattula@intel.com>
---
 tests/i915/gem_userptr_blits.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index aad5f141..2814e3c3 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -2016,6 +2016,7 @@ static void test_set_caching(int i915)
 	};
 	uint32_t handle;
 	void *page;
+	int ret;
 
 	page = mmap(NULL, 4096, PROT_READ | PROT_WRITE,
 		    MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
@@ -2032,15 +2033,37 @@ static void test_set_caching(int i915)
 
 	for (int idx = 0; idx < ARRAY_SIZE(levels); idx++) {
 		gem_userptr(i915, page, 4096, 0, 0, &handle);
-		igt_assert_eq(__gem_set_caching(i915, handle, levels[idx]), 0);
+		ret = __gem_set_caching(i915, handle, levels[idx]);
+		if (levels[idx] == I915_CACHING_NONE) {
+			if(ret != 0)
+				igt_assert_eq(ret, -ENXIO);
+			else
+				igt_warn("Deprecated userptr SET_CACHING behavior\n");
+		} else {
+			igt_assert_eq(ret, 0);
+		}
 		gem_close(i915, handle);
 	}
 
 	gem_userptr(i915, page, 4096, 0, 0, &handle);
-	for (int idx = 0; idx < ARRAY_SIZE(levels); idx++)
-		igt_assert_eq(__gem_set_caching(i915, handle, levels[idx]), 0);
-	for (int idx = 0; idx < ARRAY_SIZE(levels); idx++)
-		igt_assert_eq(__gem_set_caching(i915, handle, levels[idx]), 0);
+	for (int idx = 0; idx < ARRAY_SIZE(levels); idx++) {
+		ret = __gem_set_caching(i915, handle, levels[idx]);
+		if (levels[idx] == I915_CACHING_NONE) {
+			if (ret != 0)
+			        igt_assert_eq(ret, -ENXIO);
+		} else {
+			igt_assert_eq(ret, 0);
+		}
+	}
+	for (int idx = 0; idx < ARRAY_SIZE(levels); idx++) {
+		ret = __gem_set_caching(i915, handle, levels[idx]);
+		if (levels[idx] == I915_CACHING_NONE) {
+			if (ret != 0)
+				igt_assert_eq(ret, -ENXIO);
+		} else {
+			igt_assert_eq(ret, 0);
+		}
+	}
 	gem_close(i915, handle);
 
 	munmap(page, 4096);
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
