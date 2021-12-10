Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC45510E712
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Dec 2021 13:00:41 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Fri, 10 Dec 2021 18:35:28 +0530
Message-Id: <20211210130533.3688728-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t,v4 0/5] Add testing for CCS
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com, igt-dev@lists.freedesktop.org, ramalingam.c@intel.com, zbigniew.kempczynski@intel.com, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

- Add new library intel_mocs for mocs settings.

- Add new library i915_blt for various blt commands.

- Add a new platform flag, has_flat_ccs, for platforms
  supporting Flat CCS.

- Only use the main copy engines for XY_BLOCK_COPY.
  XY_BLOCK_COPY blt command is used to transfer the ccs data.
  So, we can only run the tests on those engines which have
  support for the "block_copy" capability.

- Add gem_ccs test for CCS testing.
  Commands are constructed with XY_BLOCK_COPY_BLT
  and XY_CTRL_SURF_COPY_BLT instructions.

v4: Used macro to avoid code duplication in gem_ccs test.

Apoorva Singh (3):
  lib/i915: Introduce library intel_mocs
  lib/i915: Introduce library i915_blt
  lib/intel_chipset.h: Add has_flat_ccs flag

CQ Tang (1):
  i915/gem_ccs: Add testing for CCS

Chris Wilson (1):
  i915/gem_engine_topology: Only use the main copy engines for
    XY_BLOCK_COPY

 lib/i915/gem_engine_topology.c |  38 +++
 lib/i915/gem_engine_topology.h |   5 +
 lib/i915/i915_blt.c            | 469 +++++++++++++++++++++++++++++++++
 lib/i915/i915_blt.h            |  82 ++++++
 lib/i915/intel_mocs.c          |  51 ++++
 lib/i915/intel_mocs.h          |  19 ++
 lib/intel_chipset.h            |   3 +
 lib/meson.build                |   2 +
 tests/i915/gem_ccs.c           | 406 ++++++++++++++++++++++++++++
 tests/meson.build              |   1 +
 10 files changed, 1076 insertions(+)
 create mode 100644 lib/i915/i915_blt.c
 create mode 100644 lib/i915/i915_blt.h
 create mode 100644 lib/i915/intel_mocs.c
 create mode 100644 lib/i915/intel_mocs.h
 create mode 100644 tests/i915/gem_ccs.c

-- 
2.25.1
