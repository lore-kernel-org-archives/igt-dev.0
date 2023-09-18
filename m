Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A8210E0E4
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 16:48:22 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Sep 2023 18:47:43 +0200
Message-ID: <20230918164747.30171-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Ignore some tests on MTL which
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: andi.shyti@intel.com, oak.zeng@intel.com, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Because of a HW bug in MTL it is recommended to do GGTT
update using MI_UPDATE_GGTT[1] which happens through BCS0
engine. If some test blocks bcs with a spinner then such
tests will fail. This series ignore those tests on MTL.

v2: use macro,
s/gem_has_ggtt_bind/gem_engine_can_block_ggtt_binder(Kamil)
v3: Skip gem_ctx_schedule@in-order@bcs as well.
Add two more tests in gem_spin_batch as hinted by the latest
results from the i915 CI.

[1]https://patchwork.freedesktop.org/series/123329/

Nirmoy Das (4):
  lib/igt_gt: Add gem_engine_can_block_ggtt_binder
  tests/intel/gem_ctx_shared: Skip some test on MTL
  tests/intel/gem_ctx_schedule: Skip some test on MTL
  tests/intel/gem_spin_batch: Skip some test on MTL

 lib/igt_gt.c                    | 15 +++++++++++++
 lib/igt_gt.h                    |  2 ++
 tests/intel/gem_ctx_shared.c    | 14 ++++++++----
 tests/intel/gem_exec_schedule.c | 39 +++++++++++++++++++--------------
 tests/intel/gem_spin_batch.c    |  3 +++
 5 files changed, 53 insertions(+), 20 deletions(-)

-- 
2.41.0
