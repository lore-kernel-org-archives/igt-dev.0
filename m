Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89D96EA3F
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jul 2021 15:27:55 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id g12so7847176qtb.2
 for <igt-dev@lists.freedesktop.org>; Fri, 09 Jul 2021 08:27:55 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
Date: Fri,  9 Jul 2021 11:27:51 -0400
Message-Id: <20210709152751.2947886-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] tests/kms_atomic: igt_require_pipe_crc for
 plane_immutable_zpos
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
kms_atomic:plane_immutable_zpos subtest uses CRC in debugfs which is
not supported by some drivers.

[How]
igt_require_pipe_crc before the test begins.

Test: kms_atomic:plane-immutable-zpos on ChromeOS Trogdor(msm)
Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 tests/kms_atomic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index df9c9df7..4b262257 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -375,6 +375,7 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
 	uint32_t w_lower, h_lower, w_upper, h_upper;
 
 	igt_require(n_planes >= 2);
+	igt_require_pipe_crc(display->drm_fd);
 
 	mode = igt_output_get_mode(output);
 	primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-- 
2.32.0.93.g670b81a890-goog

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
