Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364AD6EA51
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2020 08:46:10 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Mon, 27 Jan 2020 14:16:10 +0530
Message-Id: <20200127084610.29356-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_create: Remove page
 nonaligned buffer tests
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
To: igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Considering that kernel returns the real memory size(page aligned)
allocated, nonaligned buffer tests are not valid anymore. Hence removing
them.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_create.c | 46 -----------------------------------------
 1 file changed, 46 deletions(-)

diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index 8fc128dae6e2..d80479c757e8 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -119,46 +119,6 @@ static void invalid_size_test(int fd)
 	igt_assert_eq(create_ioctl(fd, &create), -EINVAL);
 }
 
-/*
- * Creating an object with non-aligned size and trying to access it with an
- * offset, which is greater than the requested size but smaller than the
- * object's last page boundary. pwrite here must be successful.
- */
-static void valid_nonaligned_size(int fd)
-{
-	struct drm_i915_gem_create create = {
-		.size = PAGE_SIZE / 2,
-	};
-	char buf[PAGE_SIZE];
-
-	igt_assert_eq(create_ioctl(fd, &create), 0);
-
-	gem_write(fd, create.handle, PAGE_SIZE / 2, buf, PAGE_SIZE / 2);
-
-	gem_close(fd, create.handle);
-}
-
-/*
- * Creating an object with non-aligned size and trying to access it with an
- * offset, which is greater than the requested size and larger than the
- * object's last page boundary. pwrite here must fail.
- */
-static void invalid_nonaligned_size(int fd)
-{
-	struct drm_i915_gem_create create = {
-		.size = PAGE_SIZE / 2,
-	};
-	char buf[PAGE_SIZE];
-
-	igt_assert_eq(create_ioctl(fd, &create), 0);
-
-	/* This should fail. Hence cannot use gem_write. */
-	igt_assert(__gem_write(fd, create.handle,
-			       PAGE_SIZE / 2, buf, PAGE_SIZE));
-
-	gem_close(fd, create.handle);
-}
-
 static uint64_t atomic_compare_swap_u64(_Atomic(uint64_t) *ptr,
 					uint64_t oldval, uint64_t newval)
 {
@@ -304,12 +264,6 @@ igt_main
 	igt_subtest("create-invalid-size")
 		invalid_size_test(fd);
 
-	igt_subtest("create-valid-nonaligned")
-		valid_nonaligned_size(fd);
-
-	igt_subtest("create-invalid-nonaligned")
-		invalid_nonaligned_size(fd);
-
 	igt_subtest("create-size-update")
 		size_update(fd);
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
