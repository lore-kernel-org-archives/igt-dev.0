Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6008D10E242
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Dec 2023 17:59:56 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 00/12] tests/kms_big_fb: Test planar formats, and CCS
Date: Wed, 20 Dec 2023 19:59:22 +0200
Message-ID: <20231220175934.22849-1-ville.syrjala@linux.intel.com>
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
pre-TGL [2].

[1] compressed planar formats would require a mechanism to do
    the copy_pattern() stuff, and unfortunately the current
    vebox copy implementation leaves us hanging by not
    supporting arbitraty coordinates
[2] On TGL the CCS results are garbage, which I suspect is due
    to some issue(s) with rendercopy/aux pagetables since
    pre-TGL CCS is fine

Side note: It took me about as much time to write and debug
the actual code here as it took me to figure out how to get
past the inane igt "missing documentation" checks...

Ville Syrjälä (12):
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

 lib/igt_fb.c                           |  73 ++----
 lib/igt_fb.h                           |   4 +-
 lib/rendercopy_gen4.c                  |   9 +-
 lib/rendercopy_gen6.c                  |   9 +-
 lib/rendercopy_gen7.c                  |   9 +-
 lib/rendercopy_gen8.c                  |   9 +-
 lib/rendercopy_gen9.c                  |  13 +-
 lib/rendercopy_i830.c                  |  10 +-
 lib/rendercopy_i915.c                  |   6 +-
 tests/intel/gem_pxp.c                  |   4 +-
 tests/intel/kms_big_fb.c               | 323 ++++++++++++++-----------
 tests/intel/kms_frontbuffer_tracking.c |  11 +-
 tests/kms_addfb_basic.c                |  14 +-
 tests/kms_prime.c                      |  12 +-
 tests/kms_rotation_crc.c               |  10 +-
 15 files changed, 277 insertions(+), 239 deletions(-)

-- 
2.41.0
