Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B50C6EA46
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2020 10:36:09 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 17so5401683wmo.1
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2020 03:36:09 -0700 (PDT)
Date: Thu, 25 Jun 2020 07:36:01 -0300
From: Melissa Wen <melissa.srw@gmail.com>
Message-ID: <a1dabf70afc82f5069871489b409200e41e6ac0c.1592840756.git.melissa.srw@gmail.com>
References: <cover.1592840756.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1592840756.git.melissa.srw@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 2/2] test/kms_cursor_crc: align the start of
 the CRC capture to a vblank
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

When running subtests in sequence using vkms, the beginning of CRC capture
process does not match the simulated vblank timing. This mismatch leads to
an endless busy wait and, consequently, timeout failures for the remaining
subtests in the test sequence. This patch sets the pace by waiting for
vblank before starting the CRC capture.

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 tests/kms_cursor_crc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 5976df5f..755c34ed 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -474,6 +474,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
 		igt_assert(data->batch);
 	}
 
+	igt_wait_for_vblank(data->drm_fd, data->pipe);
 	igt_pipe_crc_start(data->pipe_crc);
 }
 
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
