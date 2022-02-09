Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B0A10E686
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Feb 2022 23:30:55 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 10 Feb 2022 00:30:40 +0100
Message-Id: <20220209233044.57624-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Add i915 blt library + gem_ccs test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Enable DG2+ testing of flatccs.

Idea of library comes from Ayaz, just implementation differs due
to some reasons discovered during different tiling testing.

Currently I used default (0) mocs to avoid kernel differences.
We may change it to UC/WB when kernel interface will be stabilized
and merged.

Temporary DG2 definitions were added to allow painless review of 
the code.

Cc: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>

Chris Wilson (1):
  i915/gem_engine_topology: Only use the main copy engines for
    XY_BLOCK_COPY

Zbigniew Kempczyński (3):
  FIXME: Add DG2 defs to use in gem-ccs
  lib/i915_blt: Add library for blitter
  tests/gem_ccs: Verify uncompressed and compressed blits

 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |    1 +
 lib/i915/gem_engine_topology.c                |   38 +
 lib/i915/gem_engine_topology.h                |    5 +
 lib/i915/i915_blt.c                           | 1090 +++++++++++++++++
 lib/i915/i915_blt.h                           |  196 +++
 lib/i915_pciids.h                             |    7 +
 lib/intel_device_info.c                       |    7 +
 lib/meson.build                               |    1 +
 tests/i915/gem_ccs.c                          |  487 ++++++++
 tests/meson.build                             |    1 +
 10 files changed, 1833 insertions(+)
 create mode 100644 lib/i915/i915_blt.c
 create mode 100644 lib/i915/i915_blt.h
 create mode 100644 tests/i915/gem_ccs.c

-- 
2.32.0
