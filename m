Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0A410E06C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 12:46:25 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Sep 2023 14:46:10 +0200
Message-ID: <20230912124613.27850-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt-dii-client 0/3] Ignore some tests on MTL which
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: andi.shyti@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Because of HW bug in MTL it is recommended to do GGTT
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
