Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEBE10E24A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Dec 2021 19:37:39 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 29 Dec 2021 20:37:31 +0100
Message-Id: <20211229193734.57616-1-zbigniew.kempczynski@intel.com>
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

Zbigniew Kempczyński (3):
  lib/intel_memory_region: Add start offset and alignment detection
  tests/i915/gem_softpin: Add safe-alignment test
  tests/fast-feedback.testlist: Add gem_softpin@safe-alignment subtest

 lib/i915/intel_memory_region.c        | 367 ++++++++++++++++++++++++++
 lib/i915/intel_memory_region.h        |   5 +
 tests/i915/gem_softpin.c              |  66 +++++
 tests/intel-ci/fast-feedback.testlist |   1 +
 4 files changed, 439 insertions(+)

-- 
2.32.0
