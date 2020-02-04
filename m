Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5D56E916
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Feb 2020 21:53:40 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Tue,  4 Feb 2020 13:53:37 -0800
Message-Id: <20200204215337.7837-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH v2] tests/i915/gem_ctx_sseu: Extend the
 mmapped paramaters test
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
List-ID: <igt-dev@lists.freedesktop.org>

The current implementation of the test only maps the arguments in gtt.
This proposal is to extend the test to use different mappings. This is a
first step in making this test exhaustive enough to say that the
interface is robust but, it is meant as a first step improvement. It
also helps with the lack of mappable aperture skipping the mappings if
they do not work.

Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: Dixit Ashutosh <ashutosh.dixit@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_ctx_sseu.c | 54 +++++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 14 deletions(-)

diff --git a/tests/i915/gem_ctx_sseu.c b/tests/i915/gem_ctx_sseu.c
index 38dc584b..7d1ee5a3 100644
--- a/tests/i915/gem_ctx_sseu.c
+++ b/tests/i915/gem_ctx_sseu.c
@@ -48,6 +48,8 @@ static unsigned int __intel_gen__, __intel_devid__;
 static uint64_t __slice_mask__, __subslice_mask__;
 static unsigned int __slice_count__, __subslice_count__;
 
+enum { GTT, WC, CPU, COHERENT, } mappings;
+
 static uint64_t mask_minus_one(uint64_t mask)
 {
 	unsigned int i;
@@ -364,7 +366,7 @@ test_invalid_args(int fd)
  * Verify that ggtt mapped area can be used as the sseu pointer.
  */
 static void
-test_ggtt_args(int fd)
+test_mmapped_args(int fd)
 {
 	struct drm_i915_gem_context_param_sseu *sseu;
 	struct drm_i915_gem_context_param arg = {
@@ -373,17 +375,40 @@ test_ggtt_args(int fd)
 		.size = sizeof(*sseu),
 	};
 	uint32_t bo;
-
-	bo = gem_create(fd, 4096);
-	arg.value = to_user_pointer(gem_mmap__gtt(fd, bo, 4096,
-						  PROT_READ | PROT_WRITE));
-
-	igt_assert_eq(__gem_context_get_param(fd, &arg), 0);
-	igt_assert_eq(__gem_context_set_param(fd, &arg), 0);
-
-	munmap((void *)(uintptr_t)arg.value, 4096);
-	gem_close(fd, bo);
-	gem_context_destroy(fd, arg.ctx_id);
+	void *ptr;
+
+	for (unsigned mapping = GTT; mapping <= COHERENT; mapping++)
+	{
+		bo = gem_create(fd, 4096);
+
+		switch (mapping)
+		{
+			case GTT:
+				ptr = gem_mmap__gtt(fd, bo, 4096, PROT_READ | PROT_WRITE);
+				break;
+			case WC:
+				ptr = gem_mmap__wc(fd, bo, 0, 4096, PROT_READ | PROT_WRITE);
+				break;
+			case CPU:
+				ptr = gem_mmap__cpu(fd, bo, 0, 4096, PROT_READ | PROT_WRITE);
+				break;
+			case COHERENT:
+				ptr = gem_mmap__device_coherent(fd, bo, 0, 4096, PROT_READ | PROT_WRITE);
+				break;
+		};
+
+		if (!ptr)
+			continue;
+
+		arg.value = to_user_pointer(ptr);
+
+		igt_assert_eq(__gem_context_get_param(fd, &arg), 0);
+		igt_assert_eq(__gem_context_set_param(fd, &arg), 0);
+
+		munmap((void *)(uintptr_t)arg.value, 4096);
+		gem_close(fd, bo);
+		gem_context_destroy(fd, arg.ctx_id);
+	}
 }
 
 /*
@@ -528,8 +553,9 @@ igt_main
 		igt_subtest("invalid-sseu")
 			test_invalid_sseu(fd);
 
-		igt_subtest("ggtt-args")
-			test_ggtt_args(fd);
+		igt_subtest("mmapped-args") {
+			test_mmapped_args(fd);
+		}
 
 		igt_subtest("engines")
 			test_engines(fd);
-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
