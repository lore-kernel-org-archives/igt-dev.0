Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E8D6EA4B
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2020 08:32:03 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Mon, 27 Jan 2020 14:02:03 +0530
Message-Id: <20200127083203.29056-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/dumb_buffer: Remove page nonaligned
 buffer tests
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
 tests/dumb_buffer.c | 52 ---------------------------------------------
 1 file changed, 52 deletions(-)

diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index 3d2dc9966d0b..b6fe6f5dc6ec 100644
--- a/tests/dumb_buffer.c
+++ b/tests/dumb_buffer.c
@@ -200,52 +200,6 @@ static void invalid_size_map(int fd)
 	dumb_destroy(fd, create.handle);
 }
 
-/*
- * Creating an dumb buffer with non-aligned size and trying to access it with an
- * offset, which is greater than the requested size but smaller than the
- * object's last page boundary. pwrite here must be successful.
- */
-static void valid_nonaligned_size(int fd)
-{
-	struct drm_mode_create_dumb create = {
-		.width = 24,
-		.height = 24,
-		.bpp = 32,
-	};
-	char buf[PAGE_SIZE];
-
-	igt_require(is_i915_device(fd));
-
-	dumb_create(fd, &create);
-
-	gem_write(fd, create.handle, PAGE_SIZE / 2, buf, PAGE_SIZE / 2);
-
-	dumb_destroy(fd, create.handle);
-}
-
-/*
- * Creating an object with non-aligned size and trying to access it with an
- * offset, which is greater than the requested size and larger than the
- * object's last page boundary. pwrite here must fail.
- */
-static void invalid_nonaligned_size(int fd)
-{
-	struct drm_mode_create_dumb create = {
-		.width = 24,
-		.height = 24,
-		.bpp = 32,
-	};
-	char buf[PAGE_SIZE];
-
-	igt_require(is_i915_device(fd));
-
-	dumb_create(fd, &create);
-	/* This should fail. Hence cannot use gem_write. */
-	igt_assert(__gem_write(fd, create.handle,
-			       create.size - (PAGE_SIZE / 2), buf, PAGE_SIZE));
-	dumb_destroy(fd, create.handle);
-}
-
 static uint64_t atomic_compare_swap_u64(_Atomic(uint64_t) *ptr,
 					uint64_t oldval, uint64_t newval)
 {
@@ -362,12 +316,6 @@ igt_main
 	igt_subtest("create-valid-dumb")
 		valid_dumb_creation_test(fd);
 
-	igt_subtest("create-valid-nonaligned")
-		valid_nonaligned_size(fd);
-
-	igt_subtest("create-invalid-nonaligned")
-		invalid_nonaligned_size(fd);
-
 	igt_subtest("map-valid")
 		valid_map(fd);
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
