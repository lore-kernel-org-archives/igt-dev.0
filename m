Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D1C6E8E6
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jul 2021 16:01:32 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id z18so1844794qtq.8
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Jul 2021 09:01:32 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu,  8 Jul 2021 12:01:27 -0400
Message-Id: <20210708160127.1944507-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] lib/igt_debugfs: skip test instead of assert if
 crc/control is invalid
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
Some drivers such as msm do not currently support debugfs yet.

[How]
Change igt_assert of opening "crtc-%d/crc/control" to igt_require_f.
Opening this file doesn't involved a complicated logic so assert isn't
required to verify that things are smooth. -1 indicates that the file
isn't supported by the driver.

Test: kms_atomic:plane-immutable-zpos on ChromeOS Trogdor(msm)
Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 lib/igt_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 2f58519a..5042728e 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -691,7 +691,7 @@ pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
 
 	sprintf(buf, "crtc-%d/crc/control", pipe);
 	pipe_crc->ctl_fd = openat(debugfs, buf, O_WRONLY);
-	igt_assert(pipe_crc->ctl_fd != -1);
+	igt_require_f(pipe_crc->ctl_fd != -1, "CRC isn't supported on this device.\n");
 
 	pipe_crc->crc_fd = -1;
 	pipe_crc->fd = fd;
-- 
2.32.0.93.g670b81a890-goog

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
