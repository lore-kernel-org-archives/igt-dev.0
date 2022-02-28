Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D608B10E76C
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Feb 2022 12:29:00 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
To: igt-dev <igt-dev@lists.freedesktop.org>
Date: Mon, 28 Feb 2022 17:59:18 +0530
Message-Id: <20220228122921.15095-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] tests/i915: ccs subtests for
 gem_lmem_swapping
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

Third patch adds the subtests covering the compressed obj's
eviction and restoration.

First two patches were added for the dependency purpose those will be
reviewed at their respective series.

Chris Wilson (1):
  i915/gem_engine_topology: Only use the main copy engines for
    XY_BLOCK_COPY

Ramalingam C (1):
  tests/i915/gem_lmem_swapping: ccs subtests

Zbigniew Kempczyński (1):
  lib/i915_blt: Add library for blitter

 lib/i915/gem_engine_topology.c |    38 +
 lib/i915/gem_engine_topology.h |     5 +
 lib/i915/i915_blt.c            |   992 +
 lib/i915/i915_blt.h            |   157 +
 lib/meson.build                |     1 +
 tags                           | 51095 +++++++++++++++++++++++++++++++
 tests/i915/gem_lmem_swapping.c |   218 +-
 7 files changed, 52501 insertions(+), 5 deletions(-)
 create mode 100644 lib/i915/i915_blt.c
 create mode 100644 lib/i915/i915_blt.h
 create mode 100644 tags

-- 
2.20.1
