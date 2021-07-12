Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B6189D58
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jul 2021 16:31:30 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id p202so2099966qka.12
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jul 2021 09:31:30 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 12 Jul 2021 12:31:16 -0400
Message-Id: <20210712163116.384942-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] tests/kms_concurrent: Replace fb modifier to
 DRM_FORMAT_MOD_LINEAR
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
Cc: robdclark@chromium.org, petri.latvala@intel.com, anson.jacob@amd.com, seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

[Why]
LOCAL_I915_FORMAT_MOD_X_TILED is unique to intel SoCs and is not
supported on any other device.

[How]
Replace LOCAL_I915_FORMAT_MOD_X_TILED by DRM_FORMAT_MOD_LINEAR which is
supported on all other devices.

Tested on ChromeOS Trogdor[msm]

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 tests/kms_concurrent.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index c3f29ec7..abe2ab75 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -187,8 +187,7 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
 	/* primary plane */
 	data->plane[primary->index] = primary;
 	create_fb_for_mode_position(data, mode, x, y, size, size,
-				    LOCAL_I915_FORMAT_MOD_X_TILED,
-				    max_planes, output);
+		DRM_FORMAT_MOD_LINEAR, max_planes, output);
 
 	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary->index]);
 
-- 
2.32.0.93.g670b81a890-goog

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
