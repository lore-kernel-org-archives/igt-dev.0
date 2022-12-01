Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3721810E08D
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Dec 2022 13:03:20 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Dec 2022 14:03:08 +0100
Message-Id: <20221201130312.69093-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Remove random allocator and improve
 reloc one
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

During some debugging session with our hw team I just realized that reloc
stateless is quite big problem when I would like to collect few blits
in single batch provided by the library. Especially where are more
more objects required to acquire the offsets and not to stall if more
separate blits should be added.

I removed also RANDOM allocator, we're not using it and in softpin world
it may potentially problematic as we don't control object overlapping.

For verification real world scenario where reloc stateful is required
I changed one of subtest which previously required simple allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Zbigniew Kempczyński (4):
  lib/intel_allocator: Remove RANDOM allocator
  tests/api_intel_allocator: Remove duplicated reuse and reserve
    subtests
  lib/intel_allocator_reloc: Introduce stateful allocations in reloc
  tests/gem_ctx_shared: Remove necessity of passing offset to function
    call

 lib/intel_allocator.c            |   3 -
 lib/intel_allocator.h            |   3 +-
 lib/intel_allocator_random.c     | 191 -------------------------------
 lib/intel_allocator_reloc.c      | 115 ++++++++++++++++---
 lib/meson.build                  |   1 -
 tests/i915/api_intel_allocator.c |  35 +++---
 tests/i915/api_intel_bb.c        |  12 --
 tests/i915/gem_ctx_shared.c      |  45 +++-----
 8 files changed, 133 insertions(+), 272 deletions(-)
 delete mode 100644 lib/intel_allocator_random.c

-- 
2.34.1
