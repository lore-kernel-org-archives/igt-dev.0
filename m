Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACCE89F2D
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Nov 2021 06:43:43 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Mon, 22 Nov 2021 12:18:46 +0530
Message-Id: <20211122064849.785894-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t,v2 0/3] Add testing for CCS
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com, igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

- Add new libraries i915_blt and intel_mocs for various blt
  commands and mocs settings.

- Add a new platform flag, has_flat_ccs, for platforms
  supporting Flat CCS.

- Add gem_ccs test for CCS testing.
  Commands are constructed with XY_BLOCK_COPY_BLT
  and XY_CTRL_SURF_COPY_BLT instructions.

Apoorva Singh (2):
  lib/i915: Introduce libraries i915_blt and intel_mocs
  lib/intel_chipset.h: Add has_flat_ccs flag

CQ Tang (1):
  i915/gem_ccs: Add testing for CCS

 lib/i915/gem_engine_topology.c |  38 ++
 lib/i915/gem_engine_topology.h |   5 +
 lib/i915/i915_blt.c            | 419 +++++++++++++++++++++
 lib/i915/i915_blt.h            |  93 +++++
 lib/i915/intel_mocs.c          |  75 ++++
 lib/i915/intel_mocs.h          |  43 +++
 lib/intel_chipset.h            |   3 +
 lib/meson.build                |   2 +
 tests/i915/gem_ccs.c           | 640 +++++++++++++++++++++++++++++++++
 tests/meson.build              |   1 +
 10 files changed, 1319 insertions(+)
 create mode 100644 lib/i915/i915_blt.c
 create mode 100644 lib/i915/i915_blt.h
 create mode 100644 lib/i915/intel_mocs.c
 create mode 100644 lib/i915/intel_mocs.h
 create mode 100644 tests/i915/gem_ccs.c

-- 
2.25.1
