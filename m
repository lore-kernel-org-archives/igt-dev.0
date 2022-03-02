Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0624310EB05
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Mar 2022 14:39:50 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  2 Mar 2022 20:09:13 +0530
Message-Id: <20220302143923.26498-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 00/10] Tile 4 plane format support
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

Added DG2 platform definition with PCI IDS.
Also introduce support for the new Tile4 format, which is
4K column-major tiles consisting of 64B row-major subtiles,
with same base structure as Y Tile(16B OWords * 4)

v3: Remove DG2 platform definition patch and
    Add check for tile4 support in kms_draw_crc patch.
v4: Split second patch
    Kernel patch yet to be merged to add in commit. (Petri)
v5: place I915_TILING_4 correctly
v6: sync header from kernel

Jeevan B (6):
  include/drm-uapi: Import drm_fourcc header from c6e7deb0f092
  igt/lib: Add tile 4(F-tile) format support
  igt/tests: Add support for Tile4(TileF) format to
    tests/kms_plane_multiple
  igt/tests: Add support for Tile4(TileF) format to
    tests/kms_plane_lowres
  igt/tests: Add support for Tile4(TileF) format to tests/kms_big_fb
  igt/tests: Add support for Tile4(TileF) format to kms_rotation_crc

Matt Roper (2):
  lib/igt_draw: Add pixel math for tile-4
  igt/tests: Add support for Tile4(TileF) format to testdisplay

Mika Kahola (1):
  lib/intel_device_info: Add a flag to indicate tiling 4 support

Stanislav Lisovskiy (1):
  igt/tests: Add support for Tile4(TileF) format to kms_draw_crc

 include/drm-uapi/drm_fourcc.h |  28 ++++++++
 lib/gpu_cmds.c                |   4 +-
 lib/igt_draw.c                | 116 +++++++++++++++++++++++++++++++++-
 lib/igt_fb.c                  |   7 ++
 lib/intel_batchbuffer.c       |   8 ++-
 lib/intel_batchbuffer.h       |   7 +-
 lib/intel_chipset.h           |   3 +
 lib/intel_device_info.c       |   1 +
 tests/i915/kms_big_fb.c       |   1 +
 tests/i915/kms_draw_crc.c     |  18 ++++--
 tests/kms_plane_lowres.c      |   3 +
 tests/kms_plane_multiple.c    |   3 +
 tests/kms_rotation_crc.c      |   4 ++
 tests/testdisplay.c           |   6 +-
 14 files changed, 193 insertions(+), 16 deletions(-)

-- 
2.17.1
