Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23D389B78
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jul 2021 05:09:06 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon,  5 Jul 2021 18:26:17 +0530
Message-Id: <20210705125617.4631-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20210705125617.4631-1-bhanuprakash.modem@intel.com>
References: <20210705125617.4631-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/intel-ci: Remove hang tests from
 pre-merge blacklist
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
To: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Remove kms_(busy|flip)-*hang* tests from pre-merge blacklist

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/blacklist-pre-merge.txt | 39 --------------------------
 1 file changed, 39 deletions(-)

diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blacklist-pre-merge.txt
index 115474d987..dc6095ea1b 100644
--- a/tests/intel-ci/blacklist-pre-merge.txt
+++ b/tests/intel-ci/blacklist-pre-merge.txt
@@ -71,45 +71,6 @@ igt@gem_pwrite@big-.*
 igt@gem_exec_alignment@.*
 
 
-###############################################################################
-# These 4 tests are covering an edge case which should never be hit by users
-# unless we already are in a bad situation, yet they are responsible for a
-# significant portion of our execution time:
-#
-# - shard-skl: 2% (~5 minutes)
-# - shard-kbl: 4% (~5 minutes)
-# - shard-apl: 2.7% (~5 minutes)
-# - shard-glk: 4.5% (~10 minutes)
-# - shard-icl: 2.5% (~5 minutes)
-# - shard-tgl: 3.5% (~7 minutes)
-#
-# Issue: https://gitlab.freedesktop.org/drm/intel/issues/1284
-#
-# Data acquired on 2020-02-20 by Martin Peres
-###############################################################################
-igt@kms_flip@flip-vs-modeset-vs-hang(-interruptible)?
-igt@kms_flip@flip-vs-panning-vs-hang(-interruptible)?
-
-
-###############################################################################
-# These 28 tests are covering an edge case which should never be hit by users
-# unless we already are in a bad situation, yet they are responsible for a
-# significant portion of our execution time:
-#
-# - shard-skl: 1.7% (~4 minutes)
-# - shard-kbl: 2.8% (~3.5 minutes)
-# - shard-apl: 2.2% (~4 minutes)
-# - shard-glk: 1.8% (~4 minutes)
-# - shard-icl: 1.9% (~4 minutes)
-# - shard-tgl: 2.8% (~5.5 minutes)
-#
-# Issue: https://gitlab.freedesktop.org/drm/intel/issues/1285
-#
-# Data acquired on 2020-02-20 by Martin Peres
-###############################################################################
-igt@kms_busy@.*hang.*
-
-
 ###############################################################################
 # This test is reading one file at a time while being suspended, which makes
 # testing extremelly slow. This is a developer-only feature which is also used
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
