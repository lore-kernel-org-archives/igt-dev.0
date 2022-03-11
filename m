Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A2510E953
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 12:13:23 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 11 Mar 2022 13:13:12 +0100
Message-Id: <20220311121318.112757-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/6] Add i915 blt library + gem_ccs test
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

Enable DG2+ testing of flatccs.

Idea of library comes from Ayaz, just implementation differs due
to some reasons discovered during different tiling testing.

v3: rebased on top of local DG2 pciids
v4: fix tile64 - set mip tail
v5: use gem-pool in ctrl-surf-copy
    use uc mocs (Ayaz)
    address review comments (Kamil)
v6: address review comments (Kamil)

Cc: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>

Apoorva Singh (1):
  lib/i915: Introduce library intel_mocs

Chris Wilson (1):
  i915/gem_engine_topology: Add helpers for checking driver capabilities

Zbigniew Kempczyński (4):
  lib/i915/gem_create: Introduce gem-pool bo cache
  tests/api_intel_allocator: Verify gem-pool is working as expected
  lib/i915_blt: Add library for blitter
  tests/gem_ccs: Verify uncompressed and compressed blits

 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |    2 +
 lib/i915/gem_create.c                         |  271 +++++
 lib/i915/gem_create.h                         |    4 +
 lib/i915/gem_engine_topology.c                |   39 +
 lib/i915/gem_engine_topology.h                |    5 +
 lib/i915/i915_blt.c                           | 1082 +++++++++++++++++
 lib/i915/i915_blt.h                           |  196 +++
 lib/i915/intel_mocs.c                         |   69 ++
 lib/i915/intel_mocs.h                         |   12 +
 lib/igt_core.c                                |    2 +
 lib/meson.build                               |    2 +
 tests/i915/api_intel_allocator.c              |   58 +
 tests/i915/gem_ccs.c                          |  487 ++++++++
 tests/meson.build                             |    1 +
 14 files changed, 2230 insertions(+)
 create mode 100644 lib/i915/i915_blt.c
 create mode 100644 lib/i915/i915_blt.h
 create mode 100644 lib/i915/intel_mocs.c
 create mode 100644 lib/i915/intel_mocs.h
 create mode 100644 tests/i915/gem_ccs.c

-- 
2.32.0
