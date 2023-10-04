Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B2D10E392
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Oct 2023 16:43:34 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Oct 2023 18:37:27 +0200
Message-Id: <20231004163729.464980-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add flat-ccs tests
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

On DG2 I observe data inconsistency with flat-ccs when buffers are
returning back from system to vram. For the verification first group
of subtests is run on 20% of vram, second on 110% which triggers
eviction. Issue is visible mostly on 'parallel' subtests.

Zbigniew Kempczyński (2):
  lib/intel_blt: Release an offset in the allocator on buffer destroy
  tests/xe_evict: Add flat-ccs eviction tests

 lib/intel_blt.c        |  15 +-
 lib/intel_blt.h        |   2 +
 tests/intel/xe_evict.c | 335 ++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 350 insertions(+), 2 deletions(-)

-- 
2.34.1
