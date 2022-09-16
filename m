Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B977010ED60
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Sep 2022 15:01:01 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 16 Sep 2022 17:00:24 +0200
Message-Id: <20220916150028.123582-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Fix spinner 48b and extend gem_create
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

This is patchset "Fix spinner 48b + add I915_MMAP_OFFSET_FIXED tests"
https://patchwork.freedesktop.org/series/108022/ splitted into
first part: changes in libs and gem_create.
The rest will follow after this is merged.

Chris Wilson (4):
  lib: Fix off-by-one-page in 48b obj.flags
  lib/i915: Mark gem_create as handling const memory regions
  i915/gem_create: Verify all regions return cleared objects
  i915/gem_create: Stress creation with busy engines

 lib/i915/intel_memory_region.c |   4 +-
 lib/i915/intel_memory_region.h |   4 +-
 lib/igt_dummyload.c            |  63 +++++++--------
 tests/i915/gem_create.c        | 143 ++++++++++++++++++++++++---------
 4 files changed, 142 insertions(+), 72 deletions(-)

-- 
2.34.1
