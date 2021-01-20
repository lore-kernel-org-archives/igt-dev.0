Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 20 Jan 2021 11:11:14 +0000
Message-Id: <20210120111115.846341-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 1/2] i915/gem_create: Check wrap condition
 for -1
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, matthew.auld@intel.com, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Check that we correctly reject an object size that will intentionally
wrap upon aligning to a page.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_create.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index bf6531844..432ccdefa 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -79,11 +79,15 @@ static int create_ioctl(int fd, struct drm_i915_gem_create *create)
 
 static void invalid_size_test(int fd)
 {
-	struct drm_i915_gem_create create = {
-		.size = 0,
-	};
+	struct drm_i915_gem_create create = { };
 
+	create.size = 0; /* zero-sized objects are not allowed */
 	igt_assert_eq(create_ioctl(fd, &create), -EINVAL);
+
+	create.size = -1ull; /* will wrap to 0 on aligning to page */
+	igt_assert_eq(create_ioctl(fd, &create), -EINVAL);
+
+	igt_assert_eq(create.handle, 0);
 }
 
 /*
-- 
2.30.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
