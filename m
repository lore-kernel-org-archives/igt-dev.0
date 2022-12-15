Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB2810E535
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Dec 2022 11:35:52 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 15 Dec 2022 12:35:16 +0100
Message-Id: <20221215113519.36660-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/3] Add block-multicopy-* subtests
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

v2: - return to safe alignment in blit functions
    - add test functions table
    - avoid casting in formatting

Cc: Karolina Stolarek <karolina.stolarek@intel.com>

Zbigniew Kempczyński (3):
  lib/i915_blt: Remove src == dst pitch restriction
  lib/i915_blt: Extract blit emit functions
  tests/gem_ccs: Add block-multicopy subtest

 lib/i915/i915_blt.c  | 281 +++++++++++++++++++++++++++++++------------
 lib/i915/i915_blt.h  |  19 +++
 tests/i915/gem_ccs.c | 250 ++++++++++++++++++++++++++++++++++++--
 3 files changed, 460 insertions(+), 90 deletions(-)

-- 
2.34.1
