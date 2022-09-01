Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3045610E6D9
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 11:45:23 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Sep 2022 13:44:40 +0200
Message-Id: <20220901114442.55071-11-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220901114442.55071-1-zbigniew.kempczynski@intel.com>
References: <20220901114442.55071-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 10/12] i915/gem_mmap_offset: Check all mmap
 types reject invalid objects
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@linux.intel.com>

Extend the bad_object negative subtest to cover all mmap types.

Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
---
 tests/i915/gem_mmap_offset.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index 40daa53061..7c663f1074 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -121,15 +121,17 @@ static void bad_object(int i915)
 	handles[i] = real_handle + 1;
 
 	for (; i >= 0; i--) {
-		struct drm_i915_gem_mmap_offset arg = {
-			.handle = handles[i],
-			.flags = I915_MMAP_OFFSET_WB,
-		};
+		for_each_mmap_offset_type(i915, t) {
+			struct drm_i915_gem_mmap_offset arg = {
+				.handle = handles[i],
+				.flags = t->type,
+			};
 
-		igt_debug("Trying MMAP IOCTL with handle %x\n",
-			  handles[i]);
-		igt_assert_eq(mmap_offset_ioctl(i915, &arg),
-			      -ENOENT);
+			igt_debug("Trying MMAP IOCTL[%s] with handle %x\n",
+				  t->name, handles[i]);
+			igt_assert_eq(mmap_offset_ioctl(i915, &arg),
+				      -ENOENT);
+		}
 	}
 
 	gem_close(i915, real_handle);
-- 
2.34.1
