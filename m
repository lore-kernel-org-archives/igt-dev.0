Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6113F6EA62
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2019 19:39:17 +0000 (UTC)
From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Date: Wed, 18 Dec 2019 11:39:05 -0800
Message-Id: <20191218193915.1375365-1-vanshidhar.r.konda@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 00/10 v2] Prepare IGT display test for removal of
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

The GET/SET_TILING IOCTLs will not be supported on devices that do not 
have the CPU (de)tiler. For kms_* tests that use modifiers the IGT 
library and tests have been updated to skip calling get/set_tiling calls 
on devices that don't support these IOCTLs.

v2: Fix stride size for Gen2/Gen 3 with XY_SRC_COPY_BLT implementation; 
use uin32_t consistently for parameters

Vanshidhar Konda (10):
  lib/ioctl_wrappers: Query if device supports set/get legacy tiling
  lib/intel_batchbuffer: Add blitter copy using XY_SRC_COPY_BLT
  lib/igt_fb: Switch from XY_FAST_COPY_BLT to XY_SRC_COPY_BLT
  lib/igt_fb: Remove set_tiling calls on devices without HW tiling
    support
  lib/igt_draw: Refactor get_tiling calls
  i915/i915_fb_tiling: Skip on devices that don't support HW tiling
  tests/kms_frontbuffer_tracking: Skip set tiling calls if not supported
  tests/kms_addfb_basic: Avoid tiling subtests on device without HW
    tiling support
  tests/kms_fence_pin_leak: Skip test on devices without HW tiling
    support
  tests/kms_available_modes_crc: Don't set tiling for framebuffer

 lib/igt_draw.c                   |  56 +++++-----
 lib/igt_draw.h                   |   5 +-
 lib/igt_fb.c                     |  72 ++++++++----
 lib/intel_batchbuffer.c          | 183 +++++++++++++++++++++++++++++++
 lib/intel_batchbuffer.h          |  21 ++++
 lib/ioctl_wrappers.c             |  17 +++
 lib/ioctl_wrappers.h             |   1 +
 tests/i915/i915_fb_tiling.c      |   2 +
 tests/kms_addfb_basic.c          |   4 +
 tests/kms_available_modes_crc.c  |   6 -
 tests/kms_fence_pin_leak.c       |   2 +
 tests/kms_frontbuffer_tracking.c |  11 +-
 12 files changed, 321 insertions(+), 59 deletions(-)

-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
