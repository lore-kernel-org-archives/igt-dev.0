Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697D510E0A1
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Sep 2023 09:43:03 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 13 Sep 2023 11:42:49 +0200
Message-ID: <20230913094252.6246-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Ignore some tests on MTL which
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: andi.shyti@intel.com, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Because of a HW bug in MTL it is recommended to do GGTT
update using MI_UPDATE_GGTT[1] which happens through BCS0
engine. If some test blocks bcs with a spinner then such 
tests will fail. This series ignore those tests on MTL.


[1]https://patchwork.freedesktop.org/series/123329/


Nirmoy Das (3):
  lib/igt_gt: Add a method to detect ggtt bind
  tests/intel/gem_ctx_shared: Skip some test on MTL
  tests/intel/gem_ctx_schedule: Skip some test on MTL

 lib/igt_gt.c                    |  5 +++++
 lib/igt_gt.h                    |  1 +
 tests/intel/gem_ctx_shared.c    | 12 ++++++----
 tests/intel/gem_exec_schedule.c | 39 ++++++++++++++++++++++-----------
 4 files changed, 40 insertions(+), 17 deletions(-)

-- 
2.41.0
