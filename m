Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A41810E316
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 11:06:35 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Feb 2022 12:06:23 +0100
Message-Id: <20220225110626.82776-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Add i915 blt library + gem_ccs test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Enable DG2+ testing of flatccs.

Idea of library comes from Ayaz, just implementation differs due
to some reasons discovered during different tiling testing.

Currently I used default (0) mocs to avoid kernel differences.
We may change it to UC/WB when kernel interface will be stabilized
and merged.

v3: rebased on top of local DG2 pciids
v4: fix tile64 - set mip tail

Cc: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>

Chris Wilson (1):
  i915/gem_engine_topology: Only use the main copy engines for
    XY_BLOCK_COPY

Zbigniew Kempczyński (2):
  lib/i915_blt: Add library for blitter
  tests/gem_ccs: Verify uncompressed and compressed blits

 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |    1 +
 lib/i915/gem_engine_topology.c                |   38 +
 lib/i915/gem_engine_topology.h                |    5 +
 lib/i915/i915_blt.c                           | 1087 +++++++++++++++++
 lib/i915/i915_blt.h                           |  196 +++
 lib/meson.build                               |    1 +
 tests/i915/gem_ccs.c                          |  488 ++++++++
 tests/meson.build                             |    1 +
 8 files changed, 1817 insertions(+)
 create mode 100644 lib/i915/i915_blt.c
 create mode 100644 lib/i915/i915_blt.h
 create mode 100644 tests/i915/gem_ccs.c

-- 
2.32.0
