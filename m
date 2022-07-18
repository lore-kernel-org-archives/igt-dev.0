Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF47310EA4F
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Jul 2022 22:16:12 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 18 Jul 2022 15:15:41 -0700
Message-ID: <20220718221541.144-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v1] tests/kms_cursor_legacy: Add check for
 overlay planes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: quic_aravindh@quicinc.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

For the dynamic subtests atomic-transitions and
atomic-transitions-varying-size, check if the pipe has an overlay plane
before forking the process.

This will avoid the test trying to skip within a forked process and
throwing a SIGABRT.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_cursor_legacy.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index fc4a291d85b6..06751bac4f40 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -438,6 +438,11 @@ static void flip(igt_display_t *display,
 	if (mode >= flip_test_atomic)
 		igt_require(display->is_atomic);
 
+	if (mode == flip_test_atomic_transitions ||
+		mode == flip_test_atomic_transitions_varying_size)
+		igt_require(igt_pipe_get_plane_type(&display->pipes[flip_pipe],
+					DRM_PLANE_TYPE_OVERLAY));
+
 	igt_require((output = set_fb_on_crtc(display, flip_pipe, &fb_info)));
 	if (flip_pipe != cursor_pipe) {
 		igt_require((output2 = set_fb_on_crtc(display, cursor_pipe, &fb_info2)));
-- 
2.31.0
