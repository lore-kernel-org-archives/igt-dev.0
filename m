Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB42C10E0DC
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 14:32:22 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 00/15] tests/kms_big_fb: Test planar formats, and CCS
Date: Fri, 22 Dec 2023 16:31:44 +0200
Message-ID: <20231222143159.24662-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

While poking around in the i915 display surface address
calculations I decided that we should increase our testing
coverage to include planar formats, and compressed modifiers.

This series achieves the bare minimum of that; We now test
uncompressed NV12 and P016 [1], and compressed RGB on
up to TGL (not sure about anything more recent yet).

[1] compressed planar formats would require a mechanism to do
    the copy_pattern() stuff, and unfortunately the current
    vebox copy implementation leaves us hanging by not
    supporting arbitraty coordinates

v2: Hopefully fixed the TGL clear color woes

Ville Syrjälä (15):
  lib/rendercopy: Add deltas to all surface relocs
  tests/kms_big_fb: Use igt_fb_create_intel_buf()
  lib/igt_fb: Expose igt_fb_is_ccs_modifier()
  tests/kms_big_fb: Fix async
  tests/kms_big_fb: Test async flips + linear on tgl+
  tests/kms_big_fb: Determine the max fb size the same way always
  tests/kms_frontbuffer_tracking: Use igt_create_fb()
  lib/igt_fb: Make igt_calc_fb_size() somewhat usable
  tests/kms_big_fb: Nuke fliptab[]
  tests/kms_big_fb: Replace 'bpp' with 'name'
  tests/kms_big_fb: Test planar YCbCr formats
  tests/kms_big_fb: Also test some CCS modifiers
  lib/rendercopy: Always setup clear color for TGL
  tests/kms_big_fb: Enable CCS testing for TGL
  lib/rendercopy: Enable clear color consistently

 lib/igt_fb.c                           |  94 +++----
 lib/igt_fb.h                           |   4 +-
 lib/intel_bufops.h                     |   2 +
 lib/rendercopy_gen4.c                  |  11 +-
 lib/rendercopy_gen6.c                  |  11 +-
 lib/rendercopy_gen7.c                  |  11 +-
 lib/rendercopy_gen8.c                  |  13 +-
 lib/rendercopy_gen9.c                  |  37 ++-
 lib/rendercopy_i830.c                  |  10 +-
 lib/rendercopy_i915.c                  |   6 +-
 tests/intel/gem_pxp.c                  |   4 +-
 tests/intel/kms_big_fb.c               | 328 +++++++++++++++----------
 tests/intel/kms_frontbuffer_tracking.c |  11 +-
 tests/kms_addfb_basic.c                |  14 +-
 tests/kms_prime.c                      |  12 +-
 tests/kms_rotation_crc.c               |  10 +-
 16 files changed, 333 insertions(+), 245 deletions(-)

-- 
2.41.0
