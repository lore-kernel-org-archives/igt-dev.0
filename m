Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0191110E04D
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Mar 2022 12:10:17 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
To: igt-dev <igt-dev@lists.freedesktop.org>
Date: Mon,  7 Mar 2022 17:40:39 +0530
Message-Id: <20220307121042.23287-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/3] tests/i915: ccs subtests for
 gem_lmem_swapping
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Chris_intel_ID <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Third patch adds the subtests covering the compressed obj's
eviction and restoration.

First two patches were added for the dependency purpose those will be
reviewed at their respective series.

v3: GPU hang on verify-random-ccs is fixed

Chris Wilson (1):
  i915/gem_engine_topology: Only use the main copy engines for
    XY_BLOCK_COPY

Ramalingam C (1):
  tests/i915/gem_lmem_swapping: ccs subtests

Zbigniew Kempczyński (1):
  lib/i915_blt: Add library for blitter

 lib/i915/gem_engine_topology.c |  38 ++
 lib/i915/gem_engine_topology.h |   5 +
 lib/i915/i915_blt.c            | 992 +++++++++++++++++++++++++++++++++
 lib/i915/i915_blt.h            | 157 ++++++
 lib/meson.build                |   1 +
 tests/i915/gem_lmem_swapping.c | 217 +++++++-
 6 files changed, 1404 insertions(+), 6 deletions(-)
 create mode 100644 lib/i915/i915_blt.c
 create mode 100644 lib/i915/i915_blt.h

-- 
2.20.1
