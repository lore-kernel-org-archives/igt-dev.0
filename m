Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D1510E299
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Dec 2022 20:27:24 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Dec 2022 21:27:03 +0100
Message-Id: <20221205202708.76217-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/5] Remove random allocator and improve
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
I changed one of subtest which previously required simple allocator
and another which requires distinguish offset (previously stateless reloc
hides this proposing new offset each alloc()).

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Zbigniew Kempczyński (5):
  lib/intel_allocator: Remove RANDOM allocator
  tests/api_intel_allocator: Remove duplicated reuse and reserve
    subtests
  lib/intel_allocator_reloc: Introduce stateful allocations in reloc
  tests/gem_ctx_shared: Remove necessity of passing offset to function
    call
  tests/gem_exec_parallel: Avoid acquiring offset for overlapping handle

 lib/intel_allocator.c            |   3 -
 lib/intel_allocator.h            |   3 +-
 lib/intel_allocator_random.c     | 191 -------------------------------
 lib/intel_allocator_reloc.c      | 115 ++++++++++++++++---
 lib/meson.build                  |   1 -
 tests/i915/api_intel_allocator.c |  35 +++---
 tests/i915/api_intel_bb.c        |  12 --
 tests/i915/gem_ctx_shared.c      |  45 +++-----
 tests/i915/gem_exec_parallel.c   |  16 ++-
 9 files changed, 147 insertions(+), 274 deletions(-)
 delete mode 100644 lib/intel_allocator_random.c

-- 
2.34.1
