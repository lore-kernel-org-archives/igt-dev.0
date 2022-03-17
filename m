Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C31D10E0D7
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Mar 2022 20:54:28 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Mar 2022 02:24:10 +0530
Message-Id: <20220317205414.13668-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/4] Add tile 4 plane format support
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

Adding new tests and support for tile 4 plane format. 

v2: Rename f-tile to tile-4 and revert the call to avoid ci failures.

Jeevan B (1):
  igt/tests: Add support for Tile4(TileF) format to
    tests/kms_addfb_basic

Matt Roper (1):
  lib/igt_draw: Use XY_FAST_COLOR_BLT on DG2

Mika Kahola (2):
  tests/kms_frontbuffer_tracking: Add support for 4 tiling
  tests/kms_draw_crc: Use 4 tiling when filling framebuffer

 lib/igt_draw.c                        | 107 +++++++++++++++++++-------
 lib/intel_reg.h                       |   2 +
 tests/i915/kms_draw_crc.c             |   5 +-
 tests/i915/kms_frontbuffer_tracking.c |  22 +++++-
 tests/kms_addfb_basic.c               |  46 +++++++++++
 5 files changed, 153 insertions(+), 29 deletions(-)

-- 
2.35.1
