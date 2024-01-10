Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3D910E5BF
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 12:25:21 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 0/3] Add Xe2 render-copy implementation
Date: Wed, 10 Jan 2024 13:25:11 +0100
Message-Id: <20240110122514.33495-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Change touches render-copy only where source and destination surfaces
exists. I didn't touch fast clear as I don't know how it works for Xe2.
This may be subject for extension, but for now we need render-copy for
kms.

v2: Addressing review comments (Dominik)
v3: Fixing minor nits (Dominik) and drop feature selection in render
    copy if/else block selection (Matt)

Zbigniew Kempczyński (3):
  lib/rendercopy: Add render-copy xe2 implementation
  lib/intel_batchbuffer: Select xe2 rendercopy for LunarLake
  tests/xe_intel_bb: Use Tile4 instead Y on render subtest

 lib/i915/shaders/ps/gen20_render_copy.asm |  8 ++++
 lib/intel_batchbuffer.c                   | 40 ++++++++--------
 lib/rendercopy.h                          |  4 ++
 lib/rendercopy_gen9.c                     | 56 +++++++++++++++++++++--
 lib/xe2_render.h                          | 14 ++++++
 tests/intel/xe_intel_bb.c                 |  2 +-
 6 files changed, 100 insertions(+), 24 deletions(-)
 create mode 100644 lib/i915/shaders/ps/gen20_render_copy.asm
 create mode 100644 lib/xe2_render.h

-- 
2.34.1
