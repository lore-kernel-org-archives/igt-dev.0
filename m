Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B94210E617
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jun 2022 08:50:12 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Fri,  3 Jun 2022 10:49:53 +0200
Message-Id: <20220603084958.35012-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/5] Allow building igt without graphics
 dependencies
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

This patchset allows building igt without cairo and pixman, making its tools
conveniently available in compute-only environments for debugging purposes.
Building tests, overlays and some graphics-dependent tools is not available
in this scenario, but most of the interesting stuff is in there.

The new graphics=<enabled/disabled> build-time setting decides whenever igt
requires cairo and pixman. Disabling those dependencies prevents transitive
dependencies on a large number of graphics-related libraries (X11, etc).

Ryszard Knop (5):
  lib/i915: Replace igt.h with individual header imports
  lib/igt*, lib/intel*: Replace igt.h with individual header imports
  tools, lib: Replace igt.h with individual header imports
  lib, tools: Add the 'graphics' build-time setting
  lib, tools: Misc cleanups and typo fixes

 lib/i915/gem.c                    |  6 +-
 lib/i915/gem_mman.h               |  1 +
 lib/i915/i915_blt.c               | 17 +++++-
 lib/i915/i915_blt.h               |  7 ++-
 lib/i915/intel_mocs.c             |  6 +-
 lib/igt.h                         |  8 ++-
 lib/igt_amd.c                     |  8 ++-
 lib/igt_amd.h                     |  3 +-
 lib/igt_collection.c              |  3 +-
 lib/igt_debugfs.c                 |  2 +
 lib/igt_debugfs.h                 |  5 +-
 lib/igt_device.c                  |  9 ++-
 lib/igt_fb.h                      | 10 +++-
 lib/igt_frame.h                   |  2 -
 lib/igt_nouveau.c                 |  2 +-
 lib/igt_syncobj.c                 |  3 +-
 lib/intel_allocator.c             |  9 ++-
 lib/intel_allocator_msgchannel.c  |  6 +-
 lib/intel_allocator_random.c      |  6 +-
 lib/intel_allocator_reloc.c       |  5 +-
 lib/intel_bufops.c                | 12 +++-
 lib/intel_bufops.h                |  2 +
 lib/meson.build                   | 24 ++++----
 lib/nouveau/cea0b5.c              |  2 +-
 lib/tests/meson.build             |  5 +-
 lib/veboxcopy_gen12.c             |  2 +-
 meson.build                       | 32 +++++++---
 meson_options.txt                 |  4 ++
 tools/amd_hdmi_compliance.c       |  4 +-
 tools/igt_compliance_utils.c      |  2 +-
 tools/igt_dp_compliance_hotplug.c |  6 +-
 tools/intel_dp_compliance.c       |  8 ++-
 tools/intel_gem_info.c            |  4 +-
 tools/intel_guc_logger.c          |  3 +-
 tools/intel_gvtg_test.c           |  3 +-
 tools/intel_pm_rpm.c              |  8 ++-
 tools/intel_reg.c                 | 14 +++--
 tools/intel_residency.c           |  4 +-
 tools/lsgpu.c                     |  5 +-
 tools/meson.build                 | 97 +++++++++++++++++--------------
 tools/msm_dp_compliance.c         |  4 +-
 41 files changed, 252 insertions(+), 111 deletions(-)

-- 
2.36.1
