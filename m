Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192C46EA46
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2020 10:36:54 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id 22so5053995wmg.1
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2020 03:36:54 -0700 (PDT)
Date: Thu, 25 Jun 2020 07:36:45 -0300
From: Melissa Wen <melissa.srw@gmail.com>
Message-ID: <cover.1592991729.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [igt-dev] [PATCH i-g-t 0/2] minor improvements to the
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

Hi,

(I had sent this to the wrong list before)

I was studying the code of kms_cursor_crc test, and I just adjusted some comments
and added descriptions for subtests.

Melissa Wen (2):
  lib/igt_fb: change comments with fd description
  test/kms_cursor_crc: update subtests descriptions and some comments

 lib/igt_fb.c           |  6 +++---
 tests/kms_cursor_crc.c | 38 ++++++++++++++++++++++++++++----------
 2 files changed, 31 insertions(+), 13 deletions(-)

-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
