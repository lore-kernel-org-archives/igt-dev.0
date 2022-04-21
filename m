Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC8410E5C5
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 15:00:30 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, petri.latvala@intel.com,
 ashutosh.dixit@intel.com, umesh.nerlige.ramappa@intel.com,
 arjun.melkaveri@intel.com, krishnaiah.bommu@intel.com,
 igt-dev@lists.freedesktop.org
Date: Thu, 21 Apr 2022 20:22:05 +0530
Message-Id: <20220421145211.464313-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/6] Test for shared reset domain
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add test for shared reset domain and lib functions to support it.

Ashutosh Dixit (1):
  lib/intel_ctx: Create intel_ctx with physical engines in a single gt

Chris Wilson (1):
  lib/i915/gem_engine_topology: Add helper to list engines

Marcin Bernatowicz (1):
  lib/sysfs: helper for number of gts

Priyanka Dandamudi (2):
  lib/i915/i915_drm_local : Add DRM_I915_QUERY_DISTANCE_INFO query
  tests/gem_reset_stats: Test for shared reset domain

Umesh Nerlige Ramappa (1):
  lib/igt_sysfs: Add helpers to iterate over GTs

 lib/i915/gem_engine_topology.c | 118 +++++++++++++++++++++---
 lib/i915/gem_engine_topology.h |   8 ++
 lib/i915/i915_drm_local.h      |  23 +++++
 lib/igt_sysfs.c                |  92 +++++++++++++++++++
 lib/igt_sysfs.h                |  14 +++
 lib/intel_ctx.c                |  41 +++++++++
 lib/intel_ctx.h                |   2 +
 tests/i915/gem_reset_stats.c   | 162 +++++++++++++++++++++++++++++++++
 8 files changed, 447 insertions(+), 13 deletions(-)

-- 
2.25.1
