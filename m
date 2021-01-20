Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 20 Jan 2021 11:11:15 +0000
Message-Id: <20210120111115.846341-2-chris@chris-wilson.co.uk>
In-Reply-To: <20210120111115.846341-1-chris@chris-wilson.co.uk>
References: <20210120111115.846341-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 2/2] i915/gem_create: Exercise an
 impossible allocation
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

The largest processor in the works can support 57b of address space, far
more memory than we can afford to use in CI! It is safe to assume that
we will not have 64b processors for some time, so we can use the top bit
to exercise our oversized object detection.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_create.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index 432ccdefa..3610b3cda 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -90,6 +90,17 @@ static void invalid_size_test(int fd)
 	igt_assert_eq(create.handle, 0);
 }
 
+static void massive_test(int fd)
+{
+	struct drm_i915_gem_create create = { };
+
+	/* No system has this much memory... Yet small enough not to wrap */
+	create.size = -1ull << 32;
+	igt_assert_eq(create_ioctl(fd, &create), -E2BIG);
+
+	igt_assert_eq(create.handle, 0);
+}
+
 /*
  * Creating an object with non-aligned size request and assert the buffer is
  * page aligned. And test the write into the padded extra memory.
@@ -289,6 +300,9 @@ igt_main
 	igt_subtest("create-invalid-size")
 		invalid_size_test(fd);
 
+	igt_subtest("create-massive")
+		massive_test(fd);
+
 	igt_subtest("create-valid-nonaligned")
 		valid_nonaligned_size(fd);
 
-- 
2.30.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
