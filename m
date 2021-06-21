Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E3E6E3F0
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 18:33:01 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id x12so2685198vsp.4
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 11:33:01 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 21 Jun 2021 18:32:57 +0000
Message-Id: <20210621183257.1030915-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v4] tests/kms_vblank: Turn on hardware before
 testing invalid vblank.
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
Cc: seanpaul@chromium.org, petri.latvala@intel.com, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

[Why]
Before any hardware is on, the vblank is off and its ref counter is in
an initialized state as each driver handles toggling it differently.
Ioctl DRM_IOCTL_WAIT_VBLANK could return 0 such as on i915, or an invalid
integer that doesn't mean much, such as on Zork running Kernel 5.4 due
to the kernel workaround that increments the vblank ref count to prevent
a get from enabling the interrupt.

[How]
For invalid_subtest(), active the CRTCs to turn the hardware on so
DRM_IOCTL_WAIT_VBLANK returns something meaningful.

Changes since v3:
Turn on only 1 output instead of all.

Changes since v2:
1. Updated Signed-off-by.

Changes since v1:
1. Update Commit message
2. Rename variable p to pipe_number

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
Change-Id: Id70072ea797a74d3e9563ef8feb5901daa6b511a
---
 tests/kms_vblank.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 93b01eba..19284257 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -475,8 +475,13 @@ static void invalid_subtest(data_t *data, int fd)
 {
 	union drm_wait_vblank vbl;
 	unsigned long valid_flags;
+	igt_display_t* display = &data->display;
+	igt_output_t* output;
 
-	igt_display_require_output_on_pipe(&data->display, 0);
+	igt_display_require_output_on_pipe(display, 0);
+	igt_require(display->n_outputs);
+	output = &display->outputs[0];
+	prepare_crtc(data, fd, output);
 
 	/* First check all is well with a simple query */
 	memset(&vbl, 0, sizeof(vbl));
@@ -511,6 +516,8 @@ static void invalid_subtest(data_t *data, int fd)
 	vbl.request.type |= _DRM_VBLANK_SECONDARY;
 	vbl.request.type |= _DRM_VBLANK_FLAGS_MASK;
 	igt_assert_eq(wait_vblank(fd, &vbl), -EINVAL);
+
+	cleanup_crtc(data, fd, output);
 }
 
 igt_main
-- 
2.32.0.288.g62a8d224e6-goog

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
