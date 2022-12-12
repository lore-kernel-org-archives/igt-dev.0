Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DFB10E04D
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Dec 2022 12:50:47 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 12 Dec 2022 13:50:32 +0100
Message-Id: <20221212125035.51326-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Add block-multicopy-* subtests
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

According to debugging with hw team extend the test to exercise blits
in single batch and additional step with inplace decompression to same
tiling format. 

Cc: Karolina Stolarek <karolina.stolarek@intel.com>

Zbigniew Kempczyński (3):
  lib/i915_blt: Remove src == dst pitch restriction
  lib/i915_blt: Extract blit emit functions
  tests/gem_ccs: Add block-multicopy subtest

 lib/i915/i915_blt.c  | 271 +++++++++++++++++++++++++++++++------------
 lib/i915/i915_blt.h  |  19 +++
 tests/i915/gem_ccs.c | 262 ++++++++++++++++++++++++++++++++++++++---
 3 files changed, 462 insertions(+), 90 deletions(-)

-- 
2.34.1
