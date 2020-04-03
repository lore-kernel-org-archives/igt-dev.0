Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAADC6EB7F
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Apr 2020 13:03:28 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Fri, 3 Apr 2020 16:03:01 +0300
Message-ID: <20200403130306.1272436-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/6] tests/kms_vblank: Make sure that we
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

Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 tests/kms_vblank.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index a895ab80..edf8581e 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -472,9 +472,22 @@ static void invalid_subtest(data_t *data, int fd)
 {
 	union drm_wait_vblank vbl;
 	unsigned long valid_flags;
+	enum pipe pipe;
+	igt_output_t* output;
+	bool found = false;
 
 	igt_display_require_output_on_pipe(&data->display, 0);
 
+	/* we need to have a mode set, otherwise we will get EINVAL no matter what */
+	for_each_pipe_with_single_output(&data->display, pipe, output) {
+		data->pipe = pipe;
+		found = true;
+		break;
+	}
+
+	igt_require_f(found, "No outputs connected = no vblanks\n");
+	prepare_crtc(data, fd, output);
+
 	/* First check all is well with a simple query */
 	memset(&vbl, 0, sizeof(vbl));
 	vbl.request.type = DRM_VBLANK_RELATIVE;
@@ -508,6 +521,7 @@ static void invalid_subtest(data_t *data, int fd)
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
