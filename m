Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F1E6E1F9
 for <igt-dev@lists.freedesktop.org>; Sat,  5 Jun 2021 19:29:00 +0000 (UTC)
From: Matt Roper <matthew.d.roper@intel.com>
Date: Sat,  5 Jun 2021 12:28:48 -0700
Message-Id: <20210605192853.555213-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [CI 0/5] Reviewed ADL-P patches
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

For some reason CI keeps trying to apply the series against an older
commit (not the latest master commit), so this series includes one
extra prereq patch (resynchronizing PCI IDs) that's already landed
upstream.

Clint Taylor (1):
  lib/i915/adl-p: Basic ADL-P enabling

Imre Deak (1):
  lib/i915: Add ADL-P plane offset restriction for CCS framebuffers

Matt Roper (3):
  lib: sync i915_pciids.h with kernel
  lib/i915: Split 'gen' into graphics version and display version
  lib/i915: Add intel_display_ver() and use it in display tests/libs

 lib/i915/perf.c                      |   4 +-
 lib/i915/perf.h                      |   2 +-
 lib/i915/perf_data_reader.c          |   6 +-
 lib/i915_pciids.h                    |  23 ++++
 lib/igt_device_scan.c                |   2 +-
 lib/igt_draw.c                       |   6 +-
 lib/igt_fb.c                         |  40 +++++--
 lib/igt_gt.c                         |  10 +-
 lib/intel_chipset.h                  |  10 +-
 lib/intel_device_info.c              | 153 +++++++++++++++++++--------
 tests/i915/gem_exec_store.c          |   4 +-
 tests/i915/i915_pciid.c              |   4 +-
 tests/kms_atomic_transition.c        |   2 +-
 tests/kms_big_fb.c                   |  10 +-
 tests/kms_ccs.c                      |   2 +-
 tests/kms_draw_crc.c                 |   2 +-
 tests/kms_flip_scaled_crc.c          |   2 +-
 tests/kms_flip_tiling.c              |   2 +-
 tests/kms_frontbuffer_tracking.c     |   4 +-
 tests/kms_getfb.c                    |   2 +-
 tests/kms_hdmi_inject.c              |   2 +-
 tests/kms_panel_fitting.c            |   2 +-
 tests/kms_plane.c                    |   2 +-
 tests/kms_plane_lowres.c             |   4 +-
 tests/kms_plane_scaling.c            |   8 +-
 tests/kms_rotation_crc.c             |   8 +-
 tests/kms_universal_plane.c          |  10 +-
 tools/i915-perf/i915_perf_configs.c  |   2 +-
 tools/i915-perf/i915_perf_reader.c   |   5 +-
 tools/i915-perf/i915_perf_recorder.c |   6 +-
 30 files changed, 227 insertions(+), 112 deletions(-)

-- 
2.25.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
