Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF7A10E4A4
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Mar 2023 18:30:50 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id bi9so16994642lfb.12
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Mar 2023 11:30:50 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Mar 2023 21:30:40 +0300
Message-Id: <20230328183043.16258-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] switch lib/igt_fb.c to use
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

v2. Do rendercompression with blitter when have flat ccs

Juha-Pekka Heikkila (3):
  lib/i915/i915_blt: Add offset to block and fast copy
  lib/igt_fb: switch blitcopy to use lib/i915/i915_blt functions
  lib/igt_fb: use blitter for rendercompression on Intel hw with flat
    ccs

 lib/i915/i915_blt.c |  12 ++-
 lib/i915/i915_blt.h |   1 +
 lib/igt_fb.c        | 225 +++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 208 insertions(+), 30 deletions(-)

-- 
2.39.0
