Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F85789C51
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Aug 2021 03:26:36 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Wed, 11 Aug 2021 08:56:52 +0530
Message-Id: <20210811032652.14357-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel-ci: Remove kms_rotation_crc
 from pre-merge blacklist
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, petri.latvala@intel.com, kunal1.joshi@intel.com, bhanuprakash.modem@intel.com, Karthik B S <karthik.b.s@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Remove kms_rotation_crc@* test from pre-merge blacklist.

Execution time on shards-tgl:
Before:  ~14mins.
Current: ~2mins.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel-ci/blacklist-pre-merge.txt | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blacklist-pre-merge.txt
index dc6095ea..d4e5ef66 100644
--- a/tests/intel-ci/blacklist-pre-merge.txt
+++ b/tests/intel-ci/blacklist-pre-merge.txt
@@ -1,25 +1,3 @@
-###############################################################################
-# This test has caught regressions in the past, but the feature is rarely used
-# by our users, yet it is responsible a significant portion of our execution
-# time:
-#
-# - shard-skl: 10.2% (~22 minutes)
-# - shard-kbl: 6% (~8 minutes)
-# - shard-apl: 3.9% (~7 minutes)
-# - shard-glk: 8% (~18 minutes)
-# - shard-icl: 11% (~22 minutes)
-# - shard-tgl: 7.1% (~14 minutes)
-#
-# Some patches already appeared to reduce the run time so this will likely not
-# remain for long.
-#
-# Issue: https://gitlab.freedesktop.org/drm/intel/issues/1280
-#
-# Data acquired on 2020-02-19 by Martin Peres
-###############################################################################
-igt@kms_rotation_crc@.*
-
-
 ###############################################################################
 # These 4 tests catching a lot of unrelated issues and are responsible for a
 # significant portion of our execution time:
-- 
2.22.0
