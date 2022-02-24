Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA0E10EFE3
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Feb 2022 07:54:23 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Feb 2022 08:54:13 +0100
Message-Id: <20220224075415.18663-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Use safe alignment as a default
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

To avoid rewriting many tests use safe alignment as a default
when intel-allocator open is being called.

v2: Renaming alignment -> default-alignment test name.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>

Zbigniew Kempczyński (2):
  lib/intel_allocator: Add safe alignment as a default
  tests/api_intel_allocator: Add default-alignment test

 lib/intel_allocator.c              | 64 +++++++++++++++++++++---------
 lib/intel_allocator.h              | 13 ++++--
 lib/intel_allocator_msgchannel.h   |  1 +
 lib/intel_batchbuffer.c            |  5 ++-
 tests/i915/api_intel_allocator.c   | 38 +++++++++++++++++-
 tests/i915/gem_softpin.c           |  4 +-
 tests/i915/gem_tiled_fence_blits.c |  2 +-
 7 files changed, 97 insertions(+), 30 deletions(-)

-- 
2.32.0
