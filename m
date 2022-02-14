Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5415910E116
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Feb 2022 15:00:49 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Mon, 14 Feb 2022 20:29:53 +0530
Message-Id: <20220214150009.26815-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 00/16] DG2 platform definition and Tile 4
 plane format support
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
Cc: juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Added DG2 platform definition with PCI IDS.
Also introduce support for the new Tile4 format, which is
4K column-major tiles consisting of 64B row-major subtiles,
with same base structure as Y Tile(16B OWords * 4)

Jeevan B (6):
  igt/tests: Add support for Tile4(TileF) format to kms_rotation_crc
  igt/tests: Add support for Tile4(TileF) format to
    tests/kms_plane_multiple
  igt/tests: Add support for Tile4(TileF) format to
    tests/kms_plane_lowres
  igt/tests: Add support for Tile4(TileF) format to tests/kms_big_fb
  igt/tests: Add support for Tile4(TileF) format to
    tests/kms_addfb_basic
  tests/kms_plane_scaling: Adding Tile-4 support

Matt Roper (4):
  lib/dg2: Add DG2 platform definition
  lib/igt_draw: Add pixel math for tile-4
  igt/tests: Add support for Tile4(TileF) format to testdisplay
  lib/igt_draw: Use XY_FAST_COLOR_BLT on DG2

Mika Kahola (4):
  lib/intel_device_info: Add a flag to indicate tiling 4 support
  tests/kms_frontbuffer_tracking: Add support for 4 tiling
  tests/kms_draw_crc: Use 4 tiling when filling framebuffer
  tests/kms_plane_scaling: Use tiling 4 if platform has support for it

Stanislav Lisovskiy (2):
  igt/lib: Add tile 4(F-tile) format support
  igt/tests: Add support for Tile4(TileF) format to kms_draw_crc

 include/drm-uapi/drm_fourcc.h         |  39 +++++
 include/drm-uapi/i915_drm.h           |   3 +-
 lib/gpu_cmds.c                        |   4 +-
 lib/igt_draw.c                        | 223 ++++++++++++++++++++++----
 lib/igt_fb.c                          |  40 ++++-
 lib/intel_batchbuffer.c               |   8 +-
 lib/intel_batchbuffer.h               |   4 +-
 lib/intel_chipset.h                   |   5 +
 lib/intel_device_info.c               |   9 ++
 lib/intel_reg.h                       |   2 +
 tests/i915/kms_big_fb.c               |   1 +
 tests/i915/kms_draw_crc.c             |  23 ++-
 tests/i915/kms_frontbuffer_tracking.c |  22 ++-
 tests/kms_addfb_basic.c               |  44 ++++-
 tests/kms_plane_lowres.c              |   3 +
 tests/kms_plane_multiple.c            |   3 +
 tests/kms_plane_scaling.c             |  22 ++-
 tests/kms_rotation_crc.c              |   4 +
 tests/testdisplay.c                   |   6 +-
 19 files changed, 410 insertions(+), 55 deletions(-)

-- 
2.17.1
