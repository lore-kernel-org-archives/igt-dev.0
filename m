Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74EFB6EE9F
 for <igt-dev@lists.freedesktop.org>; Thu, 20 May 2021 04:23:02 +0000 (UTC)
From: viswax.krishna.raveendra.talabattula@intel.com
Date: Thu, 20 May 2021 09:57:25 +0530
Message-Id: <20210520042725.770003-1-viswax.krishna.raveendra.talabattula@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [Patch V2] [i-g-t] tests/i915: test pass for no caching
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

drm/i915: Reject more ioctls for userptr, v2.

So lets make test pass for both cases and return warning for 0 return
code

Signed-off-by: Viswa Krishna Raveendra Talabattula <viswax.krishna.raveendra.talabattula@intel.com>
---
 tests/i915/gem_userptr_blits.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index aad5f141..2ac5713b 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -2032,15 +2032,24 @@ static void test_set_caching(int i915)
 
 	for (int idx = 0; idx < ARRAY_SIZE(levels); idx++) {
 		gem_userptr(i915, page, 4096, 0, 0, &handle);
-		igt_assert_eq(__gem_set_caching(i915, handle, levels[idx]), 0);
+		if (__gem_set_caching(i915, handle, levels[idx]) == 0)
+			igt_warn("Deprecated return code 0 from __gem_set_caching\n");
+		else
+			igt_assert_eq(__gem_set_caching(i915, handle, levels[idx]), -ENXIO);
 		gem_close(i915, handle);
 	}
 
 	gem_userptr(i915, page, 4096, 0, 0, &handle);
 	for (int idx = 0; idx < ARRAY_SIZE(levels); idx++)
-		igt_assert_eq(__gem_set_caching(i915, handle, levels[idx]), 0);
+		if (__gem_set_caching(i915, handle, levels[idx]) == 0)
+			igt_warn("Deprecated return code 0 from __gem_set_caching\n");
+		else
+			igt_assert_eq(__gem_set_caching(i915, handle, levels[idx]), -ENXIO);
 	for (int idx = 0; idx < ARRAY_SIZE(levels); idx++)
-		igt_assert_eq(__gem_set_caching(i915, handle, levels[idx]), 0);
+		if (__gem_set_caching(i915, handle, levels[idx]) == 0)
+			igt_warn("Deprecated return code 0 from __gem_set_caching\n");
+		else
+			igt_assert_eq(__gem_set_caching(i915, handle, levels[idx]), -ENXIO);
 	gem_close(i915, handle);
 
 	munmap(page, 4096);
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
