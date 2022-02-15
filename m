Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F257710E45F
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Feb 2022 12:17:28 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Tue, 15 Feb 2022 13:17:23 +0100
Message-Id: <20220215121723.17334-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] i915/api_intel_allocator: fix standalone
 subtest
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

Subtest standalone uses igt_fork macro and after that makes
checks of work done by children processes, but this macro start
counting from zero, it never touches index 2. Correct indicies,
comment and asserts accordingly.
  This wasn't observed in CI due to HIGH_TO_LOW strategy used as
default in allocator so first obtained offset was never zero.

v2: correct comment, indices and checks (Zbigniew review)

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/api_intel_allocator.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
index 6d7764ca..bb1b3838 100644
--- a/tests/i915/api_intel_allocator.c
+++ b/tests/i915/api_intel_allocator.c
@@ -313,10 +313,10 @@ static void standalone(int fd)
 
 	igt_fork(child, 2) {
 		/*
-		 * Use standalone allocator for child 1, detach from parent,
-		 * child 2 use allocator from parent.
+		 * Use standalone allocator for child 0, detach from parent,
+		 * child 1 use allocator from parent.
 		 */
-		if (child == 1)
+		if (child == 0)
 			intel_allocator_init();
 
 		ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
@@ -326,8 +326,8 @@ static void standalone(int fd)
 		intel_allocator_close(ahnd);
 	}
 	igt_waitchildren();
-	igt_assert_eq(offset, shared[1]);
-	igt_assert_neq(offset, shared[2]);
+	igt_assert_eq(offset, shared[0]);
+	igt_assert_neq(offset, shared[1]);
 
 	intel_allocator_free(ahnd, handle);
 	igt_assert_eq(intel_allocator_close(ahnd), true);
-- 
2.32.0
