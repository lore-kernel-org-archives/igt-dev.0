Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539EA10EA06
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Jul 2022 21:59:09 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id s206so15088208pgs.3
 for <igt-dev@lists.freedesktop.org>; Wed, 06 Jul 2022 14:59:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Jul 2022 14:59:24 -0700
Message-Id: <20220706215924.1515576-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt] tests/kms_cursor_crc: Actually wait an extra
 vblank
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Fulfill the comment that rightly predicts an extra vblank is needed
before attempting to read the CRC after a legacy cursor update.

On the driver side, if the cursor update comes too close to vblank,
it could end up being scheduled for the *following* vblank to avoid
blocking.  Hence needing to vblanks to be sure the CRC reflects the
cursor update.

Fixes flakey results on msm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/kms_cursor_crc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 5c90537b..ac16135c 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -204,6 +204,8 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
 		/* Extra vblank wait is because nonblocking cursor ioctl */
 		igt_wait_for_vblank(data->drm_fd,
 				display->pipes[data->pipe].crtc_offset);
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[data->pipe].crtc_offset);
 
 		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, hwcrc);
 
-- 
2.36.1
