Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FFD76EBDB
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2020 16:49:11 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id k6so3446273wrn.3
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2020 09:49:10 -0700 (PDT)
Date: Wed, 15 Jul 2020 13:49:01 -0300
From: Melissa Wen <melissa.srw@gmail.com>
Message-ID: <cover.1594831260.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [igt-dev] [PATCH i-g-t v2 0/2] minor improvements to the
 kms_cursor_crc doc and some comments cleanup
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
Cc: kernel-usp@googlegroups.com, aurabindo.pillai@amd.com, twoerner@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

Just some comments cleanup and adding descriptions for subtests.

v2:
- Rebase on master

Melissa Wen (2):
  lib/igt_fb: change comments with fd description
  test/kms_cursor_crc: update subtests descriptions and some comments

 lib/igt_fb.c           |  4 ++--
 tests/kms_cursor_crc.c | 37 ++++++++++++++++++++++++++++---------
 2 files changed, 30 insertions(+), 11 deletions(-)

-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
