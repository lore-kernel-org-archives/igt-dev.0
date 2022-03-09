Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB61010E3C9
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Mar 2022 16:49:48 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  9 Mar 2022 22:14:47 +0530
Message-Id: <20220309164452.8240-1-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t 0/5] Add tile 4 plane format support
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

Adding new tests and support for tile 4 plane format. 

Jeevan B (2):
  igt/tests: Add support for Tile4(TileF) format to
    tests/kms_addfb_basic
  tests/kms_plane_scaling: Adding Tile-4 support

Matt Roper (1):
  lib/igt_draw: Use XY_FAST_COLOR_BLT on DG2

Mika Kahola (2):
  tests/kms_frontbuffer_tracking: Add support for 4 tiling
  tests/kms_draw_crc: Use 4 tiling when filling framebuffer

 lib/igt_draw.c                        | 107 +++++++++++++++++++-------
 lib/intel_reg.h                       |   2 +
 tests/i915/kms_draw_crc.c             |   5 +-
 tests/i915/kms_frontbuffer_tracking.c |  22 +++++-
 tests/kms_addfb_basic.c               |  44 ++++++++++-
 tests/kms_plane_scaling.c             |  11 ++-
 6 files changed, 160 insertions(+), 31 deletions(-)

-- 
2.17.1
