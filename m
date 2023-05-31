Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE1C10E50B
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 19:21:19 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f3b5881734so7374823e87.0
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 12:21:18 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 31 May 2023 22:21:01 +0300
Message-Id: <20230531192104.6307-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Try to have one less blitter path.
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

Here switch blitcopy in igt_fb.c to use lib/i915/i915_blt functions. This allow
start to use blitter path for doing rc ccs comression with new hardware, here
limit is set at having flat ccs since i915_blt functions didn't have aux ccs
support.

For compressing mc ccs still need to use Vebox copy as it seems copy engine
doesn't support destination compression with mc ccs.

/Juha-Pekka

Juha-Pekka Heikkila (3):
  lib/i915/i915_blt: Add offset to block and fast copy
  lib/igt_fb: switch blitcopy to use lib/i915/i915_blt functions
  lib/igt_fb: use blitter for rendercompression on Intel hw with flat
    ccs

 lib/i915/i915_blt.c |  12 ++-
 lib/i915/i915_blt.h |   3 +
 lib/igt_fb.c        | 254 +++++++++++++++++++++++++++++++++++++-------
 3 files changed, 224 insertions(+), 45 deletions(-)

-- 
2.25.1
