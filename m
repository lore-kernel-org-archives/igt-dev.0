Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8080710E5CC
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 06:30:17 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Sep 2022 08:29:47 +0200
Message-Id: <20220901063000.25640-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 00/13] Quick bat tests, please don't review.
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

GEM_MMAP_OFFSET_FIXED missing subtests.

Chris Wilson (12):
  lib: Fix off-by-one-page in 48b obj.flags
  lib/i915: Mark gem_create as handling const memory regions
  lib/i915: Distinguish I915_MMAP_OFFSET_FIXED with an invalid domain
  i915/gem_create: Verify all regions return cleared objects
  i915/gem_create: Stress creation with busy engines
  i915/gem_mmap_offset: Verify all regions return clear mmaps on cration
  i915/gem_mmap_offset: Verify all regions with ptrace
  i915/gem_mmap_offset: Verify all regions remain in isolation
  i915/gem_mmap_offset: Verify all regions have nonblocking pagefaults
  i915/gem_mmap_offset: Check all mmap types reject invalid objects
  i915/gem_mmap_offset: Exercise close race against all types/regions
  i915/gem_mmap_offset: Crudely measure read/write to different mmaps

Zbigniew Kempczyński (1):
  HAX: exercise subset of gem_create and gem_mmap_offset

 lib/i915/gem_mman.c                   |   2 +-
 lib/i915/intel_memory_region.c        |   4 +-
 lib/i915/intel_memory_region.h        |   4 +-
 lib/igt_dummyload.c                   |  63 ++--
 tests/i915/gem_create.c               | 141 ++++++--
 tests/i915/gem_mmap_offset.c          | 453 +++++++++++++++++---------
 tests/intel-ci/fast-feedback.testlist | 189 +----------
 7 files changed, 461 insertions(+), 395 deletions(-)

-- 
2.34.1
