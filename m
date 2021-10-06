Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7426EDB3
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Oct 2021 16:20:12 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Wed,  6 Oct 2021 12:14:40 -0400
Message-Id: <20211006161444.904476-5-rodrigo.vivi@intel.com>
In-Reply-To: <20211006161444.904476-1-rodrigo.vivi@intel.com>
References: <20211006161444.904476-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/8] tests/gem_userptr_blits: Remove LOCAL_
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

These UAPIs are upstreamed now.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/i915/gem_userptr_blits.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 756bd6e4..0d084674 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -2151,16 +2151,13 @@ static int userfaultfd(int flags)
 	return syscall(SYS_userfaultfd, flags);
 }
 
-#define LOCAL_I915_PARAM_HAS_USERPTR_PROBE 56
-#define LOCAL_I915_USERPTR_PROBE 0x2
-
 static bool has_userptr_probe(int fd)
 {
 	struct drm_i915_getparam gp;
 	int value = 0;
 
 	memset(&gp, 0, sizeof(gp));
-	gp.param = LOCAL_I915_PARAM_HAS_USERPTR_PROBE;
+	gp.param = I915_PARAM_HAS_USERPTR_PROBE;
 	gp.value = &value;
 
 	ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp, sizeof(gp));
@@ -2222,7 +2219,7 @@ static void test_probe(int fd)
 		}
 
 		igt_assert_eq(__gem_userptr(fd, ptr + PAGE_SIZE, 3*PAGE_SIZE,
-					    0, LOCAL_I915_USERPTR_PROBE, &handle),
+					    0, I915_USERPTR_PROBE, &handle),
 			      expected);
 
 		munmap(ptr, N_PAGES * PAGE_SIZE);
-- 
2.31.1
