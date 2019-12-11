Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F8E6EA30
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:42 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:06 -0800
Message-Id: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 00/30] Add FreeBSD Support
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

FreeBSD maintains a port of drm and a few drivers: amdgpu, i915,
radeon, vboxvideo, vmwgfx:

https://github.com/FreeBSDDesktop/kms-drm/

Recently I backported some drm & i915 security patches into our
tree and was lacking a way to verify the backports. Here is my
attempt at adding FreeBSD support to igt.

I've tried to order the series so that what I believe will be less
controversial comes nearer the start. I've also tried to err on
the side of too many small patches, so I'm happy to squash things
where that seems more appropriate to people.

The "null" implementations toward the end are probably more like
RFC ideas. I'm willing to take other approaches there if anyone
has a better idea for how to handle large sections of code that
are more linux specific. Cheers,

Scott


D Scott Phillips (30):
  Remove unused includes
  lib/igt_chipset: Add missing libdrm dependency
  lib/igt_core: update longjmp buffers to type sigjmp_buf
  Include <sys/wait.h>, <limits.h>, and <signal.h> where appropriate
  Use /bin/sh for shell scripts
  tools/intel_gpu_top: Use POSIX signal handler type definition
  kms_atomic: change `PAGE_SIZE` to `page_size`
  lib: remove open-coded card index fetching
  igt: replace mmap64() with mmap()
  drm-uapi: patch sync_file.h to depend on drm.h
  i915/pm_backlight: use POSIX basename
  Include linux specific headers only on linux
  lib/igt_core: skip oom_adjustments on non-linux platforms
  i915/gem: Omit linux-specific madvise, mmap, and sched flags on
    non-linux
  lib/igt_aux: add null implementation
  lib/igt_kmod: add null implementation
  lib/igt_perf: add null implementation
  runner: Add support for non-linux operating systems
  Use ETIMEDOUT in place of ETIME on FreeBSD
  ilog2: Use libc provided fls() on FreeBSD
  lib: undefine FreeBSD libc's ALIGN macro
  lib: Add FreeBSD-specific pthread logic
  lib/igt_kms: Add FreeBSD support
  lib/ioctl_wrappers: Support FreeBSD in igt_require_gem
  lib/intel_os: Implement get_avail_ram and get_total_swap for FreeBSD
  lib/igt_device: Implement get_card_index for FreeBSD
  lib/igt_debugfs: Implement mount() for FreeBSD
  build: Add support for building on non-linux
  fixup! igt: replace mmap64() with mmap()
  lib/igt_device_scan: add null implementation

 benchmarks/gem_syslatency.c          |   2 -
 benchmarks/ilog2.h                   |   2 +
 benchmarks/meson.build               |   7 +-
 include/drm-uapi/sync_file.h         |   3 +-
 lib/drmtest.h                        |   4 +
 lib/i915/gem_mman.c                  |   2 +-
 lib/igt.h                            |   4 +
 lib/igt_aux.h                        |   7 ++
 lib/igt_aux_null.c                   | 139 +++++++++++++++++++++++++++
 lib/igt_core.c                       |   7 +-
 lib/igt_core.h                       |   4 +-
 lib/igt_debugfs.c                    |  31 +++---
 lib/igt_device.c                     |  22 +++++
 lib/igt_device_scan_null.c           |  67 +++++++++++++
 lib/igt_eld.c                        |   1 +
 lib/igt_kmod.h                       |   2 +
 lib/igt_kmod_null.c                  |  84 ++++++++++++++++
 lib/igt_kms.c                        |   9 ++
 lib/igt_perf.h                       |  23 +++++
 lib/igt_perf_null.c                  |  45 +++++++++
 lib/igt_sysfs.c                      |  12 ++-
 lib/igt_vgem.c                       |   2 +-
 lib/intel_os.c                       |  16 +++
 lib/ioctl_wrappers.c                 |   6 +-
 lib/meson.build                      |  31 +++++-
 lib/sw_sync.c                        |   1 +
 lib/tests/igt_describe.c             |   1 +
 lib/tests/igt_dynamic_subtests.c     |   1 +
 lib/tests/igt_exit_handler.c         |   1 +
 lib/tests/igt_fork.c                 |   1 +
 lib/tests/igt_invalid_subtest_name.c |   1 +
 lib/tests/igt_no_exit.c              |   1 +
 lib/tests/igt_tests_common.h         |   1 +
 man/rst2man.sh                       |   2 +-
 meson.build                          |  10 +-
 runner/executor.c                    |  28 +++++-
 runner/job_list.c                    |   3 +
 tests/generate_testlist.sh           |   6 +-
 tests/i915/gem_close_race.c          |   2 +
 tests/i915/gem_concurrent_all.c      |   7 +-
 tests/i915/gem_ctx_persistence.c     |   2 +-
 tests/i915/gem_exec_fence.c          |   1 +
 tests/i915/gem_exec_latency.c        |   5 +-
 tests/i915/gem_mmap_gtt.c            |  22 ++---
 tests/i915/gem_mmap_offset.c         |  18 ++--
 tests/i915/gem_reloc_overflow.c      |   1 -
 tests/i915/gem_shrink.c              |   5 +-
 tests/i915/i915_pm_backlight.c       |   1 +
 tests/kms_atomic.c                   |  14 +--
 tests/meson.build                    |  30 ++++--
 tests/perf.c                         |   1 +
 tools/aubdump.c                      |   2 +
 tools/intel_gpu_top.c                |   2 +-
 tools/intel_gvtg_test.c              |   1 +
 tools/meson.build                    |  12 ++-
 55 files changed, 624 insertions(+), 91 deletions(-)
 create mode 100644 lib/igt_aux_null.c
 create mode 100644 lib/igt_device_scan_null.c
 create mode 100644 lib/igt_kmod_null.c
 create mode 100644 lib/igt_perf_null.c

-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
