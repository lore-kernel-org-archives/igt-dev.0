Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2398E6E184
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2020 11:25:29 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id o2so11276139wmh.2
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2020 04:25:29 -0700 (PDT)
Date: Thu, 16 Jul 2020 08:25:21 -0300
From: Melissa Wen <melissa.srw@gmail.com>
Message-ID: <e2e335dbf2189ea9ece3373364520eca8eb3349b.1594897760.git.melissa.srw@gmail.com>
References: <cover.1594897760.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1594897760.git.melissa.srw@gmail.com>
Subject: [igt-dev] [PATCH i-g-t v2 1/1] test/kms_cursor_crc: release old
 pipe_crc before create a new one
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
Cc: kernel-usp@googlegroups.com, twoerner@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

When a subtest fails, it skips the cleanup, and its pipe_crc remains allocated.
As a consequence, the following subtest also fails (timeout) when trying to
create a new one. This patch releases any remaining pipe_crc to enable the
creation of a new one for the next subtest.

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 tests/kms_cursor_crc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 7e6b24cc..bc5d4232 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -422,6 +422,8 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
 	igt_display_commit(display);
 
 	/* create the pipe_crc object for this pipe */
+	if (data->pipe_crc)
+		igt_pipe_crc_free(data->pipe_crc);
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
 					  INTEL_PIPE_CRC_SOURCE_AUTO);
 
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
