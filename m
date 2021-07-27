Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Brost <matthew.brost@intel.com>
Date: Tue, 27 Jul 2021 08:21:55 -0700
Message-Id: <20210727152202.9527-1-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/7] Updates for GuC & parallel submission
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

IGT updates for GuC submission [1] and parallel submission (aka multi-bb
execbuf) [2]. This entails adding tests for parallel submission and
teaching IGTs to know of static priority mapping.

More IGTs likely need to be updated gem_ctx_persistence and i915_hangman
come to mind. Expect following series to address those tests.

v2:
 (CI)
  - Fix off by 1 error in reserved fields of drm_i915_engine_info

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/series/91840/
[2] https://patchwork.freedesktop.org/series/92789/

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (7):
  include/drm-uapi: Add parallel context configuration uAPI
  include/drm-uapi: Add logical mapping uAPI
  lib/intel_ctx: Add support for parallel contexts to intel_ctx library
  i915/gem_exec_balancer: Test parallel execbuf
  include/drm-uapi: Add static priority mapping UAPI
  i915/gem_scheduler: Make gem_scheduler understand static priority
    mapping
  i915/gem_ctx_shared: Make gem_ctx_shared understand static priority
    mapping

 include/drm-uapi/i915_drm.h    | 145 +++++++++-
 lib/i915/gem_scheduler.c       |  13 +
 lib/i915/gem_scheduler.h       |   1 +
 lib/intel_ctx.c                |  28 +-
 lib/intel_ctx.h                |   2 +
 lib/intel_reg.h                |   5 +
 tests/i915/gem_ctx_shared.c    |   5 +-
 tests/i915/gem_exec_balancer.c | 487 +++++++++++++++++++++++++++++++++
 tests/i915/gem_exec_schedule.c |  47 ++--
 9 files changed, 709 insertions(+), 24 deletions(-)

-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
