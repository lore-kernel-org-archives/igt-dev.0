Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07016E871
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2020 13:16:43 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 7 Apr 2020 16:16:27 +0300
Message-ID: <20200407131633.1350311-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/7] tests/kms_vblank: Make sure that we
 have a mode set
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

Subtest 'invalid' was depending on a "leftover" mode set by something
external (usually fbcon) in order to work.

Let's make the test more robust by setting the mode explicitly.

v2: set flag for the pipe we are using (Imre)

Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 tests/kms_vblank.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index a895ab80..7b5f3426 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -472,12 +472,26 @@ static void invalid_subtest(data_t *data, int fd)
 {
 	union drm_wait_vblank vbl;
 	unsigned long valid_flags;
+	enum pipe pipe;
+	igt_output_t* output;
+	bool found = false;
+	int base_flags;
+
+	/* we need to have a mode set, otherwise we will get EINVAL no matter what */
+	for_each_pipe_with_single_output(&data->display, pipe, output) {
+		data->pipe = pipe;
+		found = true;
+		break;
+	}
+
+	igt_require_f(found, "No outputs connected = no vblanks\n");
+	prepare_crtc(data, fd, output);
 
-	igt_display_require_output_on_pipe(&data->display, 0);
+	base_flags = _DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(data->pipe);
 
 	/* First check all is well with a simple query */
 	memset(&vbl, 0, sizeof(vbl));
-	vbl.request.type = DRM_VBLANK_RELATIVE;
+	vbl.request.type = base_flags;
 	igt_assert_eq(wait_vblank(fd, &vbl), 0);
 
 	valid_flags = (_DRM_VBLANK_TYPES_MASK |
@@ -486,7 +500,9 @@ static void invalid_subtest(data_t *data, int fd)
 
 	/* pick some interesting invalid permutations */
 	memset(&vbl, 0, sizeof(vbl));
-	vbl.request.type = _DRM_VBLANK_RELATIVE | ~valid_flags;
+	vbl.request.type = base_flags;
+	vbl.request.type |= kmstest_get_vbl_flag(data->pipe);
+	vbl.request.type |= ~valid_flags;
 	igt_assert_eq(wait_vblank(fd, &vbl), -EINVAL);
 	for (int bit = 0; bit < 32; bit++) {
 		int err;
@@ -495,7 +511,7 @@ static void invalid_subtest(data_t *data, int fd)
 			continue;
 
 		memset(&vbl, 0, sizeof(vbl));
-		vbl.request.type = _DRM_VBLANK_RELATIVE | (1 << bit);
+		vbl.request.type = base_flags | (1 << bit);
 		err = wait_vblank(fd, &vbl);
 		igt_assert_f(err == -EINVAL,
 			     "vblank wait with invalid request.type bit %d [0x%08x] did not report -EINVAL, got %d\n",
@@ -504,10 +520,11 @@ static void invalid_subtest(data_t *data, int fd)
 
 	/* check the maximum pipe, nobody should have that many pipes! */
 	memset(&vbl, 0, sizeof(vbl));
-	vbl.request.type = _DRM_VBLANK_RELATIVE;
+	vbl.request.type = base_flags;
 	vbl.request.type |= _DRM_VBLANK_SECONDARY;
 	vbl.request.type |= _DRM_VBLANK_FLAGS_MASK;
 	igt_assert_eq(wait_vblank(fd, &vbl), -EINVAL);
+	cleanup_crtc(data, fd, output);
 }
 
 igt_main
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
