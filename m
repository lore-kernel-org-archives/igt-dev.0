Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9846C6EC1F
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2020 10:48:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EB898ACD8
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2020 10:48:16 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue,  3 Nov 2020 11:48:11 +0100
Message-Id: <20201103104813.18236-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 0/2] Test cases for fbdev
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
List-ID: <igt-dev@lists.freedesktop.org>

This patchset adds read and write tests for fbdev. It compares the content
of the framebuffer and reference buffer. A number of the special cases
near the EOF are also tested.

Depending on the implementation (sys, cfb), fbdev read/write changes its
semantics. Together with a kernel patches [1] these test cases intend to
provide a reference.

[1] https://patchwork.freedesktop.org/series/80038/

Thomas Zimmermann (2):
  tests/fbdev: Store framebuffer pointer at function scope
  tests/fbdev: Add tests for read/write ops on framebuffer

 tests/fbdev.c | 85 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 2 deletions(-)

--
2.29.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
