Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C65C44508
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 06:07:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5694810EED0;
	Wed, 15 Jul 2026 06:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDszB/2y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9373910EECC
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 06:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784095647; x=1815631647;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/8zIRsLZSeLbZiTbFvh4GT78HgXPS+u9tPQCCK2GNjQ=;
 b=oDszB/2yciGTGYXhms0N0GBSRoTLp05PuSDkvmeLIMnXo8AeOu28W25u
 bt5zAIr9lF1H7mpSUt5dUapG9u+nvzOEy5feW4T5Fu4UbSk6pEaQuIr/X
 KSC+ET+BBYgS+cKeKpbkmdh5ZepkEf6GKb1YTB5EBS0qc3pkapDleSn/b
 8H1C2H/Y2LS1Yd6J1GwiHFjuFW4IaNBzUduhuC+j/FZzSQjf2GV0yI90N
 4KdTTV5QBRcGiMCOe2v/hcGs6WcgEZ+gKOOY7zXV4SAtIZmPK06nOz03h
 y9AIPOSyn7B9hpYSWSc3MqSIKyyhJYvm8Q0maFyynQgoZqsAXGAvbrXd7 A==;
X-CSE-ConnectionGUID: gA5cz8cKSSqh+2pNM5XELQ==
X-CSE-MsgGUID: SBHoPs1BR6CmrzC1OxJ+jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88624353"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="88624353"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 23:07:27 -0700
X-CSE-ConnectionGUID: t1EkxEf1Ra+uL/NCEnA3HQ==
X-CSE-MsgGUID: te6cXNJNTaOp25scNZKAiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="259652674"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by orviesa003.jf.intel.com with ESMTP; 14 Jul 2026 23:07:25 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t] CI: Update NVL, LNL and BMG Core Blocklist
Date: Wed, 15 Jul 2026 11:37:25 +0530
Message-ID: <20260715060724.2336612-2-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add xe_cw_post_sync@walker-post-sync as it is applicable from CRI and
above.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel-ci/xe.bmg.core.blocklist.txt | 4 ++++
 tests/intel-ci/xe.lnl.core.blocklist.txt | 4 ++++
 tests/intel-ci/xe.nvl.core.blocklist.txt | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
index 628bc3d3b0..cd38d16f8b 100644
--- a/tests/intel-ci/xe.bmg.core.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
@@ -7,6 +7,10 @@ igt@testdisplay
 igt@xe_pat@display-vs-wb-transient
 igt@fbdev@.*
 ##################################################################
+# Valid skip as test is applicable for Xe3p xpc and later platforms
+##################################################################
+igt@xe_cw_post_sync@walker-post-sync
+##################################################################
 # Expected Skip for xe2+ platforms
 ##################################################################
 igt@xe_pat@pat-index-xehpc
diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
index 60bcefa562..f921ca3a4d 100644
--- a/tests/intel-ci/xe.lnl.core.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
@@ -11,6 +11,10 @@ igt@testdisplay
 igt@xe_pat@display-vs-wb-transient
 igt@fbdev@.*
 ##################################################################
+# Valid skip as test is applicable for Xe3p xpc and later platforms
+##################################################################
+igt@xe_cw_post_sync@walker-post-sync
+##################################################################
 # Expected skip as platform has no vram support
 ##################################################################
 igt@xe_create@create-big-vram
diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
index ea47d3b857..ca1b9f9dff 100644
--- a/tests/intel-ci/xe.nvl.core.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
@@ -40,6 +40,10 @@ igt@xe_pat@pat-index-xelpg
 igt@xe_media_fill@media-fill
 igt@xe_pat@pat-index-xe2
 ##################################################################
+# Valid skip as test is applicable for Xe3p xpc and later platforms
+##################################################################
+igt@xe_cw_post_sync@walker-post-sync
+##################################################################
 # Valid Skip: Tests requiring multiple CCS (Compute Command
 # Streamers) engines — NVL exposes only a single CCS engine.
 ##################################################################
-- 
2.43.0

