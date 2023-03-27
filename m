Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7C210E251
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 20:13:00 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id c29so13021605lfv.3
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 13:13:00 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Mar 2023 23:12:52 +0300
Message-Id: <20230327201254.2834-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] switch lib/igt_fb.c to use
 lib/i915/i915_blt functions for blitter on Intel hw
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Switch to new blitter functions on framebuffer creation. On Intel CI there's
still some legacy machines with relocation support hence left XY_SRC path as
legacy path.

Juha-Pekka Heikkila (2):
  lib/i915/i915_blt: Add offset to block and fast copy
  lib/igt_fb: switch blitcopy to use lib/i915/i915_blt functions

 lib/i915/i915_blt.c |  12 ++-
 lib/i915/i915_blt.h |   1 +
 lib/igt_fb.c        | 214 +++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 201 insertions(+), 26 deletions(-)

-- 
2.39.0
