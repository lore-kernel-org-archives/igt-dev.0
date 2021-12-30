Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF9610E7DD
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Dec 2021 18:26:20 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 30 Dec 2021 19:26:10 +0100
Message-Id: <20211230182613.35827-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Add start offset and alignment detection
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Add some universal code which tries to detect kernel offset capabilities.

v2: unify cache, fix start offset iteration
    run gem_softpin@safe-alignment also on integrated
v3: move cache entry out of mutex
v4: avoid assert and skip adding to cache if there's no memory
    rename to safe-start
    verify safe start offset on each engine

Zbigniew Kempczyński (3):
  lib/intel_memory_region: Add start offset and alignment detection
  tests/i915/gem_softpin: Add safe-start test
  tests/fast-feedback.testlist: Add gem_softpin@safe-start subtest

 lib/i915/intel_memory_region.c        | 371 ++++++++++++++++++++++++++
 lib/i915/intel_memory_region.h        |   5 +
 tests/i915/gem_softpin.c              |  87 ++++++
 tests/intel-ci/fast-feedback.testlist |   1 +
 4 files changed, 464 insertions(+)

-- 
2.32.0
