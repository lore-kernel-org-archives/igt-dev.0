Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEA06EA7A
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2020 12:29:49 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Thu,  2 Apr 2020 15:29:43 +0300
Message-Id: <20200402122943.6583-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip: Skip detiler fences subtest
 on platforms w/o aperture
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

On platforms w/o an aperture subtests using fences are not relevant, so
skip them. This also fixes a use-after-free error happening as a
side-effect of running the test on such platforms.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/kms_flip.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 9ce83c53d..506c9c142 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -216,6 +216,7 @@ static void emit_fence_stress(struct test_output *o)
 
 	igt_require(bufmgr);
 
+	igt_assert(num_fences);
 	bo = calloc(sizeof(*bo), num_fences);
 	exec = calloc(sizeof(*exec), num_fences+1);
 	for (i = 0; i < num_fences - 1; i++) {
@@ -1234,8 +1235,10 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 		o->fb_width *= 2;
 
 	tiling = LOCAL_DRM_FORMAT_MOD_NONE;
-	if (o->flags & TEST_FENCE_STRESS)
+	if (o->flags & TEST_FENCE_STRESS) {
+		igt_require(gem_available_fences(drm_fd));
 		tiling = LOCAL_I915_FORMAT_MOD_X_TILED;
+	}
 
 	/* 256 MB is usually the maximum mappable aperture,
 	 * (make it 4x times that to ensure failure) */
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
