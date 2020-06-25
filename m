Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D726EA46
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2020 10:35:33 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z13so5303817wrw.5
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2020 03:35:33 -0700 (PDT)
Date: Thu, 25 Jun 2020 07:35:25 -0300
From: Melissa Wen <melissa.srw@gmail.com>
Message-ID: <0cef6a7b7dbd8510de62f0c17e8cd952cfa84678.1592840756.git.melissa.srw@gmail.com>
References: <cover.1592840756.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1592840756.git.melissa.srw@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 1/2] test/kms_cursor_crc: release old
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
index f105e295..5976df5f 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -423,6 +423,8 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
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
