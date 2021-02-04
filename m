Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE556E053
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Feb 2021 12:43:15 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id o21so595571pgn.12
 for <igt-dev@lists.freedesktop.org>; Thu, 04 Feb 2021 04:43:15 -0800 (PST)
Date: Thu, 4 Feb 2021 18:13:10 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
Message-ID: <cover.1612441942.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [igt-dev] [PATCH i-g-t 0/2] Decouple ioctl call logic for vblank
 wait
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
Cc: daniel@ffwll.ch
List-ID: <igt-dev@lists.freedesktop.org>

Extract the ioctl call logic from igt_wait_for_vblank_count() into
a helper function, __igt_vblank_wait(). Refactor 
igt_wait_for_vblank_count() and igt_wait_For_vblank() to act as
wrapper functions calling this helper instead.

Update documentation for the same.

Sumera Priyadarsini (2):
  lib/igt_kms: Decouple ioctl call logic for vblank wait
  lib/igt_kms: Update documentation for __igt_vblank_wait()

 lib/igt_kms.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
