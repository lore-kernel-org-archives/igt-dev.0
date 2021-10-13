Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038B06E1BD
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Oct 2021 22:17:30 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu, 14 Oct 2021 01:17:19 +0300
Message-Id: <20211013221727.6392-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/8] Promote kms_flip_tiling to general
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Got fed up with the piles of copy-pasted code in kms_flip_tiling
and so proceeded to fully generalize it. After this it tests flipping
between all ordered pairs of modifiers. I did have to optimize it a bit
to keep the runtime within reasonable bounds since we now test a lot
more than before.

The only reason why I still left it ina tests/i915/ is that it relies
on the new igt_fb_modifier_name() to generate the dynamic subtest
name, and I didn't populate any non-i915 modifiers in there. So if/when
that gets filled out a bit more we can move this back out from the i915
dungeon.

Ville Syrjälä (8):
  lib/fb: Introduce igt_fb_modifier_name()
  tests/kms_plane: Use IGT_MODIFIER_{FMT,ARGS}
  tests/i915/kms_flip_tiling: Drop ancient stride change restrictin
  tests/i915/kms_flip_tiling: Replace i915 interlace check with
    try_commit
  tests/i915/kms_flip_tiling: Generalize away copy-pasta
  tests/i915/kms_flip_tiling: Drop useless i915 include
  tests/i915/kms_flip_tiling: Stick pipe_crc into data_t
  tests/i915/kms_flip_tiling: Keep CRC running all the time

 lib/igt_fb.c                 |  26 +++
 lib/igt_fb.h                 |   4 +
 tests/i915/kms_flip_tiling.c | 301 ++++++++---------------------------
 tests/kms_plane.c            |  16 +-
 4 files changed, 108 insertions(+), 239 deletions(-)

-- 
2.32.0
