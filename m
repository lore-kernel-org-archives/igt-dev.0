Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB3F10E6DC
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Apr 2022 11:19:22 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  7 Apr 2022 16:49:20 +0530
Message-Id: <20220407111924.21745-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] enable 4-tiled ccs modifiers on dg2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

LOCAL_I915_FORMAT_MOD_4_TILED_DG2_RC_CCS work for creating framebuffers, they
will pass crc checks. Copying from compressed to non-compressed for some
reason will copy compressed main surface instead of decompressing.

LOCAL_I915_FORMAT_MOD_4_TILED_DG2_MC_CCS produce good image if image is
framebuffer is all solid color. Areas with color edges sometimes cause random
compression block size content, these blocks show at same locations but yet
unknown where they're coming from. xrgb, xyuv and 16bpp yuv work equally.
Planar framebuffers cause fifo underrun hence no idea if content is good or no.

Jeevan B (1):
  DO NOT MERGE: drm/fourcc: Introduce format modifiers for DG2 render,
    media compression and clear color

Juha-Pekka Heikkilä (3):
  lib/DG2: create flat ccs framebuffers with 4-tile
  tests/kms_ccs: Add dg2 tiled-4 ccs modifiers
  tests/kms_getfb: Add flat ccs modifier support

 include/drm-uapi/drm_fourcc.h |  36 ++++++++++
 lib/gen9_render.h             |  37 ++++++++---
 lib/igt_fb.c                  |  18 +++--
 lib/intel_aux_pgtable.c       |   6 +-
 lib/intel_batchbuffer.c       |   2 +-
 lib/intel_bufops.c            | 116 +++++++++++++++++++++++++++++----
 lib/intel_chipset.h           |   3 +-
 lib/rendercopy_gen9.c         | 119 +++++++++++++++++++++++-----------
 lib/veboxcopy_gen12.c         | 110 +++++++++++++++++++++++--------
 tests/i915/kms_ccs.c          |  60 ++++++++++-------
 tests/kms_getfb.c             |  18 ++++-
 11 files changed, 401 insertions(+), 124 deletions(-)

-- 
2.35.1
