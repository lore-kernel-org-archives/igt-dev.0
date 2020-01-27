Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA39F6E1BB
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2020 17:02:06 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Mon, 27 Jan 2020 22:32:02 +0530
Message-Id: <20200127170205.7195-2-ramalingam.c@intel.com>
In-Reply-To: <20200127170205.7195-1-ramalingam.c@intel.com>
References: <20200127170205.7195-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/5] tests/i915/gem_create: Modify the page
 nonaligned tests
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
allocated, "create-invalid-nonaligned" test is not needed anymore.
Hence removing them.

At "create-valid-nonaligned" test we are asserting the returned mem size
from kernel to be minimum page aligned and checking the write into padded
memory.

v2:
  added check for padded mem at "create-valid-nonaligned" [chris]

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_create.c | 30 +++---------------------------
 1 file changed, 3 insertions(+), 27 deletions(-)

diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index 8fc128dae6e2..0a0c4d5804a2 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -120,9 +120,8 @@ static void invalid_size_test(int fd)
 }
 
 /*
- * Creating an object with non-aligned size and trying to access it with an
- * offset, which is greater than the requested size but smaller than the
- * object's last page boundary. pwrite here must be successful.
+ * Creating an object with non-aligned size request and assert the buffer is
+ * page aligned. And test the write into the padded extra memory.
  */
 static void valid_nonaligned_size(int fd)
 {
@@ -132,33 +131,13 @@ static void valid_nonaligned_size(int fd)
 	char buf[PAGE_SIZE];
 
 	igt_assert_eq(create_ioctl(fd, &create), 0);
+	igt_assert(create.size >= PAGE_SIZE);
 
 	gem_write(fd, create.handle, PAGE_SIZE / 2, buf, PAGE_SIZE / 2);
 
 	gem_close(fd, create.handle);
 }
 
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
@@ -307,9 +286,6 @@ igt_main
 	igt_subtest("create-valid-nonaligned")
 		valid_nonaligned_size(fd);
 
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
