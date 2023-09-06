Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E8110E5A2
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 08:16:56 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Sep 2023 13:38:37 +0530
Message-Id: <20230906080840.1714917-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20230906080840.1714917-1-bhanuprakash.modem@intel.com>
References: <20230906080840.1714917-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 3/6] tests/kms_flip: Allow hang tests to run on
 XE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As hang tests supports both i915 & XE, update the intel specific
checks to allow them to run on XE.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_flip.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 23c71cee2..f09a00dd0 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1042,7 +1042,10 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
 	memset(&hang, 0, sizeof(hang));
 	if (do_flip && (o->flags & TEST_HANG)) {
 		igt_require_intel(drm_fd);
-		ahnd = get_reloc_ahnd(drm_fd, 0);
+
+		ahnd = is_i915_device(drm_fd) ?
+			get_reloc_ahnd(drm_fd, 0) :
+			intel_allocator_open(drm_fd, 0, INTEL_ALLOCATOR_RELOC);
 		hang = hang_gpu(drm_fd, ahnd);
 	}
 
@@ -1847,8 +1850,9 @@ static void run_test(int duration, int flags)
 	if (flags & TEST_BO_TOOBIG && !is_intel_device(drm_fd))
 		return;
 
-	igt_require((flags & TEST_HANG) == 0 ||
-		    (is_i915_device(drm_fd) && !is_wedged(drm_fd)));
+	if ((flags & TEST_HANG) == 0 && is_i915_device(drm_fd))
+		igt_require(!is_wedged(drm_fd));
+
 	igt_require(!(flags & TEST_FENCE_STRESS) ||
 		    (is_i915_device(drm_fd) && gem_available_fences(drm_fd)));
 
@@ -1923,8 +1927,9 @@ static void run_pair(int duration, int flags)
 	if (flags & TEST_BO_TOOBIG && !is_intel_device(drm_fd))
 		return;
 
-	igt_require((flags & TEST_HANG) == 0 ||
-		    (is_i915_device(drm_fd) && !is_wedged(drm_fd)));
+	if ((flags & TEST_HANG) == 0 && is_i915_device(drm_fd))
+		igt_require(!is_wedged(drm_fd));
+
 	igt_require(!(flags & TEST_FENCE_STRESS) ||
 		    (is_i915_device(drm_fd) && gem_available_fences(drm_fd)));
 
-- 
2.40.0
