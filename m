Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E986912B65E
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jun 2022 07:08:19 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Jun 2022 09:07:47 +0200
Message-Id: <20220610070751.27541-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Add crc32 calculation on dg2 gpu
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

Add crc32 calculation library on gpu (dg2).

v2: use predication instead of cond_bbe with memory access.
v3: migrate crc32 tables to separate file to avoid license clashes.
v4: move common definitions to intel_reg.h, add docs
v5: addressing review comments, further changes in intel_reg.h.

Zbigniew Kempczyński (4):
  lib/intel_reg: Add common MI_* macros to remove duplicates
  lib/igt_crc: Introduce common place for crc tables and functions
  lib/i915_crc: Introduce crc32 on gpu for DG2
  tests/api_intel_bb: Add crc32 checking test for DG2

 benchmarks/gem_wsim.c                         |  31 --
 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   2 +
 lib/i915/i915_crc.c                           | 298 ++++++++++++++++++
 lib/i915/i915_crc.h                           |  27 ++
 lib/igt_crc.c                                 | 107 +++++++
 lib/igt_crc.h                                 |  31 ++
 lib/intel_aux_pgtable.c                       |   4 +-
 lib/intel_reg.h                               |  50 ++-
 lib/meson.build                               |   2 +
 tests/i915/api_intel_bb.c                     |  70 +++-
 tests/i915/gem_exec_fair.c                    |  27 --
 tests/i915/gem_exec_fence.c                   |  43 +--
 tests/i915/gem_watchdog.c                     |  27 --
 tests/i915/gem_workarounds.c                  |   4 +-
 tests/i915/gen7_exec_parse.c                  |   6 +-
 tests/i915/gen9_exec_parse.c                  |  11 +-
 16 files changed, 600 insertions(+), 140 deletions(-)
 create mode 100644 lib/i915/i915_crc.c
 create mode 100644 lib/i915/i915_crc.h
 create mode 100644 lib/igt_crc.c
 create mode 100644 lib/igt_crc.h

-- 
2.32.0
