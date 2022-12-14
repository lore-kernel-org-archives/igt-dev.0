Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2463710E03B
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Dec 2022 16:47:53 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 14 Dec 2022 17:47:36 +0100
Message-Id: <20221214164747.68626-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 00/11] Remove libdrm remnants in i915 code
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

v2: rewrite instead of prime_udl/prime_nv_* removals.
v3: remove all references to libdrm-intel/intel_bufmgr
v4: rebase
v5: acked, re-verify before merge

I want finally remove all libdrm stuff, to get this I had to:

1. remove missed bufmgr field in i915_pipe_stress

2. rewrite prime_udl test - it is not used in CI due to lack of 
   DisplayLink hardware and I also don't have such hardware so 
   this is blind rewrite

3. rewrite prime_nv_* tests - similar to prime_udl (blind rewrite)

4. remove drm_import_export test, it exercises libdrm prime caps

5. rewrite intel_upload_blit_* benchmarks - I tried to mimic 
   behavior as much as possible but there'e some minor differences
   in execution time. I think it is related to libdrm internals
   (how it caches handles/mappings). I'm not sure but it shouldn't
   much affect what benchmark is exercising.

6. remove all intel_batchbuffer_* code

7. get libdrm decode code and adopt to use in igt

8. use local decode code (taken from libdrm) in intel_dump|error_decode
   tools

9. remove unused functions in ioctl_wrappers

10 remove libdrm definitions in tools/meson.build

11. remove libdrm/stubs definitions in lib/meson.build + libdrm stubs

Cc: Petri Latvala <petri.latvala@intel.com>

Zbigniew Kempczyński (11):
  tests/i915_pipe_stress: Remove unused bufmgr field
  tests/prime_udl: Remove intel-libdrm dependency
  tests/prime_nv: Remove intel-libdrm calls
  tests/drm_import_export: Remove the test
  benchmarks/intel_upload_blit_*: Remove libdrm in upload blits
  lib/intel_batchbuffer: Get rid of libdrm batchbuffer
  lib/intel_decode: Get drm decode code and adopt to use in igt
  tools/intel_dump|error_decode: Use local igt decode code
  lib/ioctl_wrappers: Remove gem_handle_to_libdrm_bo
  tools/meson: Move tools out of libdrm scope
  lib/meson: Remove libdrm configuration and intel_bufmgr stubs

 benchmarks/intel_upload_blit_large.c     |  131 +-
 benchmarks/intel_upload_blit_large_gtt.c |  130 +-
 benchmarks/intel_upload_blit_large_map.c |  132 +-
 benchmarks/intel_upload_blit_small.c     |  139 +-
 benchmarks/meson.build                   |   13 +-
 lib/i915/intel_decode.c                  | 3962 ++++++++++++++++++++++
 lib/i915/intel_decode.h                  |   42 +
 lib/intel_batchbuffer.c                  |  575 +---
 lib/intel_batchbuffer.h                  |  248 --
 lib/ioctl_wrappers.c                     |   31 -
 lib/ioctl_wrappers.h                     |    5 -
 lib/meson.build                          |    8 +-
 lib/stubs/drm/README                     |    4 -
 lib/stubs/drm/intel_bufmgr.c             |  292 --
 lib/stubs/drm/intel_bufmgr.h             |  323 --
 tests/drm_import_export.c                |  304 --
 tests/i915/i915_pipe_stress.c            |    1 -
 tests/meson.build                        |    1 -
 tests/prime_nv_api.c                     |  151 +-
 tests/prime_nv_pcopy.c                   |  107 +-
 tests/prime_nv_test.c                    |  162 +-
 tests/prime_udl.c                        |   64 +-
 tools/intel_dump_decode.c                |   16 +-
 tools/intel_error_decode.c               |   14 +-
 tools/meson.build                        |   15 +-
 25 files changed, 4536 insertions(+), 2334 deletions(-)
 create mode 100644 lib/i915/intel_decode.c
 create mode 100644 lib/i915/intel_decode.h
 delete mode 100644 lib/stubs/drm/README
 delete mode 100644 lib/stubs/drm/intel_bufmgr.c
 delete mode 100644 lib/stubs/drm/intel_bufmgr.h
 delete mode 100644 tests/drm_import_export.c

-- 
2.34.1
