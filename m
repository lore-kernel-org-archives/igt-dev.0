Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B3910E4E0
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Mar 2023 15:00:12 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Mar 2023 15:59:52 +0100
Message-Id: <cover.1678197486.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/7] Update gem_blits for newer generations
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

gem_blits test utilizes XY_SRC_COPY_BLT, a legacy blitter command
that is not available on newer generations such as MTL. To make
sure the test covers such platforms, update it to switch to
XY_FAST_COPY_BLT for blit copy operations.

In addition to this change, the series:
  1) Adds helpers to i915_blt library that check support for
     XY_SRC_COPY_BLT command and its capabilities
  2) Updates the definitions of older platforms to properly list
     all available commands and tilings
  3) Updates gem_blits to use aforementioned helpers to detect
     tiling formats supported by the platform

Arjun Melkaveri (2):
  tests/i915/gem_blits: Use new copy instruction
  tests/i915/gem_blits: Add XY_FAST_COPY_BLT support for gem_blits

Karolina Stolarek (4):
  lib/i915_blt: Add helpers to check XY_SRC_COPY support
  lib/intel_cmds_info: Correct tiling formats for XY_SRC_COPY
  lib/intel_device_info: Add tiling information for early gens
  tests/gem_blits: Use intel_cmds_info library

Vikas Srivastava (1):
  lib/intel_batchbuffer: Add wrapper API to use
    XY_FAST_COPY_BLT/XY_SRC_BLT

 lib/i915/i915_blt.c        |  33 ++++++++
 lib/i915/i915_blt.h        |   2 +
 lib/i915/intel_cmds_info.c |  24 ++++--
 lib/i915/intel_cmds_info.h |   3 +-
 lib/intel_batchbuffer.c    |  83 ++++++++++++++++++--
 lib/intel_batchbuffer.h    |  28 +++++++
 lib/intel_device_info.c    |  29 +++++--
 tests/i915/gem_blits.c     | 156 ++++++++++++++++++++++++-------------
 8 files changed, 283 insertions(+), 75 deletions(-)

-- 
2.25.1
