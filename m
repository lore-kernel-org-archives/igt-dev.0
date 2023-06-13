Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8269110E3CA
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 16:21:10 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f61b45ee0dso7149698e87.0
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 09:21:10 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Jun 2023 19:21:02 +0300
Message-Id: <20230613162105.2757-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Include i915_blt funtions to blitter
 path for igt_fb.c
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

Here start to use copy engine for doing rc ccs on Intel hw with flat ccs.
While at it enable Xe driver to pass through blitter path with tiling, this
will still otherwise need work to enable xe otherwise for framebuffer blitting.

Juha-Pekka Heikkila (3):
  lib/i915/i915_blt: Add offset to block and fast copy
  lib/igt_fb: include lib/i915/i915_blt functions to blitter path
  lib/igt_fb: use blitter for rendercompression on Intel hw with flat
    ccs

 lib/i915/i915_blt.c |  12 ++-
 lib/i915/i915_blt.h |   3 +
 lib/igt_fb.c        | 213 ++++++++++++++++++++++++++++++++++++++------
 3 files changed, 196 insertions(+), 32 deletions(-)

-- 
2.25.1
