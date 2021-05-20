Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA30C6F520
 for <igt-dev@lists.freedesktop.org>; Thu, 20 May 2021 19:34:20 +0000 (UTC)
Received: by mail-ua1-x92d.google.com with SMTP id x9so5898840uao.3
 for <igt-dev@lists.freedesktop.org>; Thu, 20 May 2021 12:34:20 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 20 May 2021 19:34:01 +0000
Message-Id: <20210520193402.2297833-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] tests/kms_vblank: Turn on hardware before testing
 invalid vblank.
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
Cc: petri.latvala@intel.com, chris@chris-wilson.co.uk, seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

[Why]
Before any hardware is on, the vblank is off and its ref counter is in
an initialized state as each driver handles toggling it differently.
Ioctl DRM_IOCTL_WAIT_VBLANK could return 0 or invalid depending on the
hardware, without necessarily meaning anything.

[How]
For invalid_subtest(), active the CRTCs to turn the hardware on so
DRM_IOCTL_WAIT_VBLANK returns something meaningful.
---
 tests/kms_vblank.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 93b01eba..cb68a2f8 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -475,8 +475,14 @@ static void invalid_subtest(data_t *data, int fd)
 {
 	union drm_wait_vblank vbl;
 	unsigned long valid_flags;
+	igt_display_t* display = &data->display;
+	enum pipe p = 0;
+	igt_output_t* output;
 
-	igt_display_require_output_on_pipe(&data->display, 0);
+	igt_display_require_output_on_pipe(display, p);
+	data->pipe = p;
+	for_each_valid_output_on_pipe(display, p, output)
+		prepare_crtc(data, fd, output);
 
 	/* First check all is well with a simple query */
 	memset(&vbl, 0, sizeof(vbl));
@@ -511,6 +517,9 @@ static void invalid_subtest(data_t *data, int fd)
 	vbl.request.type |= _DRM_VBLANK_SECONDARY;
 	vbl.request.type |= _DRM_VBLANK_FLAGS_MASK;
 	igt_assert_eq(wait_vblank(fd, &vbl), -EINVAL);
+
+	for_each_valid_output_on_pipe(display, p, output)
+		cleanup_crtc(data, fd, output);
 }
 
 igt_main
-- 
2.31.1.818.g46aad6cb9e-goog

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
