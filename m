Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE5B10E211
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jan 2024 11:30:22 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/3] Add Xe2 render-copy implementation
Date: Mon,  8 Jan 2024 12:30:09 +0100
Message-Id: <20240108113012.382557-1-zbigniew.kempczynski@intel.com>
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

Zbigniew Kempczyński (3):
  lib/rendercopy: Add render-copy xe2 implementation
  lib/intel_batchbuffer: Select xe2 rendercopy for LunarLake
  tests/xe_intel_bb: Use Tile4 instead Y on render subtest

 lib/genxe2_render.h                       | 14 ++++++
 lib/i915/shaders/ps/gen20_render_copy.asm |  8 +++
 lib/intel_batchbuffer.c                   | 38 +++++++-------
 lib/rendercopy.h                          |  4 ++
 lib/rendercopy_gen9.c                     | 60 +++++++++++++++++++++--
 tests/intel/xe_intel_bb.c                 |  2 +-
 6 files changed, 102 insertions(+), 24 deletions(-)
 create mode 100644 lib/genxe2_render.h
 create mode 100644 lib/i915/shaders/ps/gen20_render_copy.asm

-- 
2.34.1
