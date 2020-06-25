Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8780A6EA46
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2020 10:34:59 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g18so5327681wrm.2
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2020 03:34:59 -0700 (PDT)
Date: Thu, 25 Jun 2020 07:34:51 -0300
From: Melissa Wen <melissa.srw@gmail.com>
Message-ID: <cover.1592840756.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [igt-dev] [PATCH i-g-t 0/2] test/kms_cursor_crc: tie some loose
 ends in prepare_crtc
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

Using vkms, when running a sequence of subtests from kms_cursor_crc,
several strange timeout failures occurred. For example, running the
alpha-opaque cursor twice, the first run is successful and the second
fails. In addition, if we run the entire test in a call (i.e.: sudo
IGT_FORCE_DRIVER=vkms build/tests/kms_cursor_crc), the first subtest
passes and the rest of the subtests fail - even those that succeed when
run in isolation.

igt_debugfs-DEBUG: Opening debugfs directory '/sys/kernel/debug/dri/0'
igt_core-INFO: Timed out: Opening crc fd, and poll for first CRC.

During my debugging process, I found two issues that were blocking
execution and the solution is in this patchset:

1 - When a subtest fails, it exits and skips the cleaning step, leaving
the pipe_crc allocated and blocked for the next subtest. The first patch
fixes it by releasing any old pipe_crc before creating a new one.

2 - When the CRC capture process starts, it enters an endless wait; this
seems to be related to the fact that the VKMS simulates vblank events,
generating a time mismatch between vblank and CRC capture. Waiting for
vblank before starting the capture process sets the pace, as shown in
the second patch.

Melissa Wen (2):
  test/kms_cursor_crc: release old pipe_crc before create a new one
  test/kms_cursor_crc: align the start of the CRC capture to a vblank

 tests/kms_cursor_crc.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
