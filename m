Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3423489E08
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 05:27:50 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 07:26:32 +0200
Message-Id: <20210810052711.7866-27-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
References: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 26/65] tests/gem_fenced_exec_thrash:
 Adopt to use allocator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_fenced_exec_thrash.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_fenced_exec_thrash.c b/tests/i915/gem_fenced_exec_thrash.c
index 6497ff576..a9597d801 100644
--- a/tests/i915/gem_fenced_exec_thrash.c
+++ b/tests/i915/gem_fenced_exec_thrash.c
@@ -98,7 +98,7 @@ static void run_test(int fd, int num_fences, int expected_errno,
 	struct drm_i915_gem_execbuffer2 execbuf[2];
 	struct drm_i915_gem_exec_object2 exec[2][2*MAX_FENCES+1];
 	struct drm_i915_gem_relocation_entry reloc[2*MAX_FENCES];
-
+	uint64_t ahnd = get_reloc_ahnd(fd, 0);
 	unsigned long count;
 	int i, n;
 
@@ -111,7 +111,19 @@ static void run_test(int fd, int num_fences, int expected_errno,
 
 	for (n = 0; n < 2*num_fences; n++) {
 		uint32_t handle = tiled_bo_create(fd);
-		exec[1][2*num_fences - n-1].handle = exec[0][n].handle = handle;
+		struct drm_i915_gem_exec_object2 *obj0, *obj1;
+
+		obj0 = &exec[0][n];
+		obj1 = &exec[1][2*num_fences - n-1];
+
+		obj1->handle = obj0->handle = handle;
+		obj1->offset = get_offset(ahnd, handle, OBJECT_SIZE, 0);
+		obj0->offset = obj1->offset;
+
+		if (ahnd) {
+			obj0->flags |= EXEC_OBJECT_PINNED;
+			obj1->flags |= EXEC_OBJECT_PINNED;
+		}
 		fill_reloc(&reloc[n], handle);
 	}
 
@@ -121,7 +133,7 @@ static void run_test(int fd, int num_fences, int expected_errno,
 
 		exec[i][2*num_fences].handle = batch_create(fd);
 		exec[i][2*num_fences].relocs_ptr = to_user_pointer(reloc);
-		exec[i][2*num_fences].relocation_count = 2*num_fences;
+		exec[i][2*num_fences].relocation_count = !ahnd ? 2*num_fences : 0;
 
 		execbuf[i].buffers_ptr = to_user_pointer(exec[i]);
 		execbuf[i].buffer_count = 2*num_fences+1;
@@ -134,7 +146,7 @@ static void run_test(int fd, int num_fences, int expected_errno,
 			igt_spin_t *spin = NULL;
 
 			if (flags & BUSY_LOAD)
-				spin = __igt_spin_new(fd);
+				spin = __igt_spin_new(fd, .ahnd = ahnd);
 
 			igt_while_interruptible(flags & INTERRUPTIBLE) {
 				igt_assert_eq(__gem_execbuf(fd, &execbuf[i]),
@@ -154,6 +166,8 @@ static void run_test(int fd, int num_fences, int expected_errno,
 
 	for (i = 0; i < 2; i++)
 		gem_close(fd, exec[i][2*num_fences].handle);
+
+	put_ahnd(ahnd);
 }
 
 igt_main
-- 
2.26.0
