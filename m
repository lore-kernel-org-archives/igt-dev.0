Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED978CCD185
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 06:44:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9733010E264;
	Wed, 15 Oct 2025 06:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RTRcL/Cx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED65910E264
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 06:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760510649; x=1792046649;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ruH+4LixTC6UllqF8CNpFgfbS9aqNW3MVkFDDgW1sRw=;
 b=RTRcL/Cx2QLGdLibkgGAJhWG/WTvPh9FaymblR4zgjhVIp026xLexHz9
 lMHckwOBfG0vcX2uVwaVH2bW9mFcJsvzZrqZcbpvCAMI7K/jLKUAk/YL1
 g07ns1E0W/VmjTiJ/55dlcdayKX0m7iMNqY+kP6y6H4is7VmgLu9Zq8iG
 UKm1sGInvkK9SWbp+8l0r21LLek2PinsoUSdntgmuDF+5rALEv4AlyPm6
 9/bEFPrMkZcUL1e83jDlGqQ+IcUr8k72S3t1StS8EtDpypXIWPtbNc7VD
 vHMW0kK9suIGRvbbZD0wYOIRz9tNgrdUzssdD1vrv6Ur4FeXmBdiMKluS w==;
X-CSE-ConnectionGUID: 3/gusZE5Sj6cb1ERkN1QZw==
X-CSE-MsgGUID: ESa2xW8gSvavaP8fSsC0kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="61710286"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="61710286"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 23:44:09 -0700
X-CSE-ConnectionGUID: ki9LWnpKT/24Hzb0iJH+sQ==
X-CSE-MsgGUID: hTMgexC5QniPp3EfgJgfeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="186096439"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by orviesa003.jf.intel.com with ESMTP; 14 Oct 2025 23:44:08 -0700
From: himanshu.girotra@intel.com
To: igt-dev@lists.freedesktop.org
Cc: ramadevi.gandi@intel.com
Subject: [PATCH i-g-t] tests/intel-ci : Add Xe Multigpu blocklist file
Date: Wed, 15 Oct 2025 12:14:06 +0530
Message-Id: <20251015064406.4076-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

Add Xe Multigpu Blocklist and unblock multigpu tests from core specific
Blocklist to display the metrics on Grafana.

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel-ci/meson.build               | 1 +
 tests/intel-ci/xe.bmg.core.blocklist.txt | 7 -------
 tests/intel-ci/xe.multigpu.blocklist.txt | 5 +++++
 3 files changed, 6 insertions(+), 7 deletions(-)
 create mode 100644 tests/intel-ci/xe.multigpu.blocklist.txt

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index ca50e93aa..0c3b79d51 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -21,6 +21,7 @@ intelci_files = [
   'xe.lnl.core.blocklist.txt',
   'xe.lnl.display.blocklist.txt',
   'xe.lnl.eudebug.blocklist.txt',
+  'xe.multigpu.blocklist.txt',
   'xe.ptl.core.blocklist.txt',
   'xe.ptl.display.blocklist.txt',
   'xe-fast-feedback.testlist',
diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
index 25da760aa..15dbbf2b8 100644
--- a/tests/intel-ci/xe.bmg.core.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
@@ -18,13 +18,6 @@ igt@xe_media_fill@media-fill
 ##################################################################
 igt@xe_pat@pat-index-xe3p-xpc
 ##################################################################
-# Expected skip on single card machines
-##################################################################
-igt@xe_peer2peer@.*
-igt@xe_query@multigpu-query-.*
-igt@xe_create@multigpu-create-massive-size
-igt@xe_exec_basic@.*multigpu.*
-##################################################################
 # Expected skip - small bar not supported
 ##################################################################
 igt@xe_mmap@small-bar
diff --git a/tests/intel-ci/xe.multigpu.blocklist.txt b/tests/intel-ci/xe.multigpu.blocklist.txt
new file mode 100644
index 000000000..387c3413e
--- /dev/null
+++ b/tests/intel-ci/xe.multigpu.blocklist.txt
@@ -0,0 +1,5 @@
+#####################################################
+# Blocklist for Xe MuitiGPU tests
+#####################################################
+igt@(?!.*xe.*multigpu.*|xe_peer2peer.*).*
+#####################################################
-- 
2.40.0

