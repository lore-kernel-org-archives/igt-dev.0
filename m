Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2530A6E84E
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2020 11:52:46 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Date: Tue, 22 Sep 2020 13:52:05 +0200
Message-Id: <20200922115229.28371-2-dominik.grzegorzek@intel.com>
In-Reply-To: <20200922115229.28371-1-dominik.grzegorzek@intel.com>
References: <20200922115229.28371-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 01/25] i915/gem_mmap: Modified offset in
 subtest "bad-size"
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
Cc: Melkaveri@freedesktop.org, Arjun <arjun.melkaveri@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Subtest "bad-size" should keep valid/good offset
corresponding to buffer object being mapped.
Currently, subtest will pass for any value of size
provided as the offset value itself will not allow
to map any size of memory which defies the purpose
of this subtest.

The subtest should not pass due to bad offset value
while it should pass only due to bad size provided.

v2: Added new offset. Updated the same changes in
"bad-size" subtest of gem_mmap_wc too.

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_mmap.c    | 25 ++++++++++++++++---------
 tests/i915/gem_mmap_wc.c | 26 ++++++++++++++++----------
 2 files changed, 32 insertions(+), 19 deletions(-)

diff --git a/tests/i915/gem_mmap.c b/tests/i915/gem_mmap.c
index f8cf052e..8bad9b14 100644
--- a/tests/i915/gem_mmap.c
+++ b/tests/i915/gem_mmap.c
@@ -214,18 +214,25 @@ igt_main
 			2 * 4096,
 			~0,
 		};
+		uint64_t offset[] = {
+			4096,
+			0
+		};
 
-		for (int i = 0; i < ARRAY_SIZE(bad_size); i++) {
-			struct drm_i915_gem_mmap arg = {
-				.handle = gem_create(fd, 4096),
-				.offset = 4096,
-				.size = bad_size[i],
-			};
+		for(int i = 0; i < ARRAY_SIZE(offset); i++) {
+			for (int j = 0; j < ARRAY_SIZE(bad_size); j++) {
+				struct drm_i915_gem_mmap arg = {
+					.handle = gem_create(fd, 4096),
+					.offset = offset[i],
+					.size = bad_size[j],
+				};
 
-			igt_debug("Trying to mmap bad size; size: %'"PRIu64"\n", bad_size[i]);
-			igt_assert_eq(mmap_ioctl(fd, &arg), -EINVAL);
+				igt_debug("Trying to mmap bad size; size: %'"PRIu64", offset: %'"PRIu64"\n",
+						bad_size[j], offset[i]);
+				igt_assert_eq(mmap_ioctl(fd, &arg), -EINVAL);
 
-			gem_close(fd, arg.handle);
+				gem_close(fd, arg.handle);
+			}
 		}
 	}
 
diff --git a/tests/i915/gem_mmap_wc.c b/tests/i915/gem_mmap_wc.c
index f44b406d..fe1283e5 100644
--- a/tests/i915/gem_mmap_wc.c
+++ b/tests/i915/gem_mmap_wc.c
@@ -563,17 +563,23 @@ igt_main
 			2 * 4096,
 			~0,
 		};
+		uint64_t offset[] = {
+			4096,
+			0
+		};
 
-		for (int i = 0; i < ARRAY_SIZE(bad_size); i++) {
-			struct drm_i915_gem_mmap arg = {
-				.handle = gem_create(fd, 4096),
-				.offset = 4096,
-				.size = bad_size[i],
-				.flags = I915_MMAP_WC,
-			};
-
-			igt_assert_eq(mmap_ioctl(fd, &arg), -EINVAL);
-			gem_close(fd, arg.handle);
+		for(int i = 0; i < ARRAY_SIZE(offset); i++) {
+			for (int j = 0; j < ARRAY_SIZE(bad_size); j++) {
+				struct drm_i915_gem_mmap arg = {
+					.handle = gem_create(fd, 4096),
+					.offset = offset[i],
+					.size = bad_size[j],
+					.flags = I915_MMAP_WC,
+				};
+
+				igt_assert_eq(mmap_ioctl(fd, &arg), -EINVAL);
+				gem_close(fd, arg.handle);
+			}
 		}
 	}
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
