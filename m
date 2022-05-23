Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F5110E1EB
 for <igt-dev@lists.freedesktop.org>; Mon, 23 May 2022 11:43:43 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 23 May 2022 17:14:18 +0530
Message-Id: <20220523114422.19112-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 0/4] enable 4-tiled ccs modifiers on dg2
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

LOCAL_I915_FORMAT_MOD_4_TILED_DG2_RC_CCS work for creating framebuffers, they
will pass crc checks. Copying from compressed to non-compressed for some
reason will copy compressed main surface instead of decompressing.

LOCAL_I915_FORMAT_MOD_4_TILED_DG2_MC_CCS produce good image if image is
framebuffer is all solid color. Areas with color edges sometimes cause random
compression block size content, these blocks show at same locations but yet
unknown where they're coming from. xrgb, xyuv and 16bpp yuv work equally.
Planar framebuffers cause fifo underrun hence no idea if content is good or no.

v2: pull headers from kernel
v3: modified commit message

Jeevan B (1):
  drm/fourcc: Import drm_fourcc header from 9035039e1ed69

Juha-Pekka Heikkilä (3):
  lib/DG2: create flat ccs framebuffers with 4-tile
  tests/kms_ccs: Add dg2 tiled-4 ccs modifiers
  tests/kms_getfb: Add flat ccs modifier support

 include/drm-uapi/drm_fourcc.h |  36 ++++++++++
 lib/gen9_render.h             |  38 ++++++++---
 lib/igt_fb.c                  |  51 ++++++++++----
 lib/intel_aux_pgtable.c       |   6 +-
 lib/intel_batchbuffer.c       |   2 +-
 lib/intel_bufops.c            | 118 ++++++++++++++++++++++++++++----
 lib/intel_chipset.h           |   3 +-
 lib/rendercopy_gen9.c         | 125 +++++++++++++++++++++++-----------
 lib/veboxcopy_gen12.c         | 109 +++++++++++++++++++++--------
 tests/i915/kms_ccs.c          |  62 ++++++++++-------
 tests/kms_getfb.c             |  20 +++++-
 11 files changed, 438 insertions(+), 132 deletions(-)

-- 
2.36.0
