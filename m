Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CAF10E176
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Mar 2022 21:24:52 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
To: igt-dev <igt-dev@lists.freedesktop.org>
Date: Wed,  2 Mar 2022 02:55:10 +0530
Message-Id: <20220301212513.30772-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/3] tests/i915: ccs subtests for
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

v2: gem_sync after the init obj.

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
 6 files changed, 1405 insertions(+), 5 deletions(-)
 create mode 100644 lib/i915/i915_blt.c
 create mode 100644 lib/i915/i915_blt.h

-- 
2.20.1
