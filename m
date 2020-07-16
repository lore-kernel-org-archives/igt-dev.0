Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D7D6E184
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2020 11:24:59 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f2so6657911wrp.7
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2020 04:24:58 -0700 (PDT)
Date: Thu, 16 Jul 2020 08:24:49 -0300
From: Melissa Wen <melissa.srw@gmail.com>
Message-ID: <cover.1594897760.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [igt-dev] [PATCH i-g-t v2 0/1] test/kms_cursor_crc: tie some loose
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

Hi,

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
execution:

1 - When a subtest fails, it exits and skips the cleaning step, leaving
the pipe_crc allocated and blocked for the next subtest; the following
patch addresses it by releasing any old pipe_crc before creating a new
one.

2 - When the CRC capture process starts, it enters an endless wait; in
the previous version, I thought it was a matter of timing in test using
vkms, but after further investigation, other problems arise in the same
subject and I am dropping the 2nd patch to better solve the problem on
the vkms side.

Changes in v2:
- Rebase 1st patch on master
- Drop the 2nd patch

Melissa Wen (1):
  test/kms_cursor_crc: release old pipe_crc before create a new one

 tests/kms_cursor_crc.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
