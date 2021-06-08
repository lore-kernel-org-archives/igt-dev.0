Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB92B6EC1C
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jun 2021 15:26:14 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Tue,  8 Jun 2021 20:45:52 +0530
Message-Id: <20210608151552.15095-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] intel-ci: Remove
 pixel-format-source-clamping@* from the pre-merge blacklist
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>

This subtest currently taking less time ~20s. So removing this
subtest from pre-merge ci blacklist file.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
---
 tests/intel-ci/blacklist-pre-merge.txt | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blacklist-pre-merge.txt
index 6363a7ac86..115474d987 100644
--- a/tests/intel-ci/blacklist-pre-merge.txt
+++ b/tests/intel-ci/blacklist-pre-merge.txt
@@ -153,26 +153,6 @@ igt@gem_tiled_blits@normal
 igt@gem_tiled_wc
 
 
-###############################################################################
-# This is a useful test, but it mostly tests the HW rather than the driver.
-# Very few regressions should be caught by this test as the driver code should
-# be relatively left untouched. Hopefully, it will get optimized to be made
-# useful in pre-merge as well:
-#
-# - shard-skl: 1% (~2.5 minutes)
-# - shard-kbl: 1.5% (~2 minutes)
-# - shard-apl: 1.4% (~2.5 minutes)
-# - shard-glk: 2% (~4.5 minutes)
-# - shard-icl: 2.7% (~5.5 minutes)
-# - shard-tgl: 2.3% (~4.5 minutes)
-#
-# Issue: https://gitlab.freedesktop.org/drm/intel/issues/1287
-#
-# Data acquired on 2020-02-20 by Martin Peres
-###############################################################################
-igt@kms_plane@pixel-format-pipe-[b-d]-planes(-source-clamping)?
-
-
 ###############################################################################
 # This test is doing nothing more than waiting for the driver to be suspended
 # before issueing a modeset. However, it never failed while testing for this
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
