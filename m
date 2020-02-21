Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 21 Feb 2020 12:16:59 +0100
Message-Id: <20200221111701.30006-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t v2 0/2] tests/gem_userptr_blits:
 Exercise mmap-offset mapping to userptr
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Submitted in series with PATCH 1/2 "lib/i915: Restrict mmap types to
GTT if no MMAP_OFFSET support", which I'm resubmitting without changes
as a dependency required for CI to be able to process PATCH 2/2.  
Please focus on PATCH 2/2 "tests/gem_userptr_blits: Exercise mmap-offset
mapping to userptr".

Thanks, 
Janusz

Janusz Krzysztofik (2):
  lib/i915: Restrict mmap types to GTT if no MMAP_OFFSET support
  tests/gem_userptr_blits: Exercise mmap-offset mapping to userptr

 lib/i915/gem_mman.c            |  5 ++++
 lib/i915/gem_mman.h            |  7 ++++--
 tests/i915/gem_ctx_sseu.c      |  2 +-
 tests/i915/gem_exec_params.c   |  2 +-
 tests/i915/gem_madvise.c       | 18 +++++++++++----
 tests/i915/gem_mmap_offset.c   | 10 ++++----
 tests/i915/gem_userptr_blits.c | 42 ++++++++++++++++++++++++++++++++++
 tests/i915/i915_pm_rpm.c       |  2 +-
 8 files changed, 74 insertions(+), 14 deletions(-)

-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
