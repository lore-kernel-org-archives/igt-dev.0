Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D81CC88E53
	for <igt-dev@archiver.kernel.org>; Tue, 15 Sep 2026 05:10:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007C710F969;
	Tue, 15 Sep 2026 05:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IVO00lHV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDC110F969
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2026 05:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789448985; x=1820984985;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vm34r/QM+vpbyyShdwU1eH+MBFpHXH727zSBiBF6HK0=;
 b=IVO00lHVrChCSTL8hkzl+nt2wG/IqqyVxnr5VKCLW7SUuMVl4s9jGEcu
 gSv77a9B3PYUSW66SGXm672nqxzaVu3oTaZdYYHx1hSZQdqOKOjDaYkTi
 Jyq3ZDqdT5RjzvO5fA9IiEFaB+sRqY7v+XwBJJJOFugyrWjGGn62dEwbZ
 5hlhwS0u4UZiILincIkfExcZ0Ib+PR2fmEXe5XQas42lz+fwbm3i57+/7
 JNFYle2Cn4R9IMHnByiuJC/AGfkXNHo42U5s8VHb/dmnIOL/U19Slsa31
 /GoK7Wte5lh1CxhyOFR4dIjOz0p+Xv2Vjb9zNB6s6xsgz5+/zniAuAuQF g==;
X-CSE-ConnectionGUID: fV7yhtdvQdSrMzl/DkF3iQ==
X-CSE-MsgGUID: qOVIi0FERuSACv9Q+BnMOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100400454"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100400454"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 22:09:44 -0700
X-CSE-ConnectionGUID: /NnZrz7DTqaIvLbH2tSexQ==
X-CSE-MsgGUID: gGZy4UcxRkeNc+CzXuLJfQ==
X-ExtLoop1: 1
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.55])
 by fmviesa003.fm.intel.com with ESMTP; 14 Sep 2026 22:09:43 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH] tests/intel/xe_wedged: ignore expected fault/CAT dmesg in
 wedged paths
Date: Tue, 15 Sep 2026 05:09:42 +0000
Message-ID: <20260915050942.618218-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Nishit Sharma <nishit.sharma@intel.com>

The wedged test flow intentionally triggers hang/reset behavior that can
emit a known multi-line fault dump and CAT error in dmesg during
wedged-mode-toggle and related wedged scenarios. Updated existing
test to extend ignore_wedged_in_dmesg with regex patterns that match:
1. Tile/GT fault header and fault detail lines (ASID, faulted address,
fault type, access type, fault level, engine class/instance)
2. Fault response: Unsuccessful -EINVAL
3. Engine memory CAT error line

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_wedged.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index e1ac629ca..8c3c8bd36 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -30,12 +30,28 @@
 
 static void ignore_wedged_in_dmesg(void)
 {
-	/* this is needed for igt_runner so it will ignore it */
+	/*
+	 * The wedged flow intentionally triggers a recoverable GT fault/CAT dump
+	 * while the reset attempt fails. Ignore the specific transient fault lines
+	 * emitted by that path: the GT header, the per-fault details, and the
+	 * corresponding CAT response.
+	 */
 	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
 				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
 				    "|GT[0-9A-Fa-f]*: Failed to submit"
 				    "|Modules linked in:"
-				    "|__pfx___drm_");
+				    "|__pfx___drm_"
+				    "|Tile[0-9]+: GT[0-9A-Fa-f]*:$"
+				    "|ASID: [0-9]+"
+				    "|Faulted Address: 0x[0-9A-Fa-f]+"
+				    "|FaultType: [0-9]+"
+				    "|AccessType: [0-9]+"
+				    "|FaultLevel: [0-9]+"
+				    "|EngineClass: [0-9]+ [a-z]+"
+				    "|EngineInstance: [0-9]+"
+				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
+				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error \\[[0-9]+\\]:"
+				    "class=[a-z]+, logical_mask: 0x[0-9A-Fa-f]+, guc_id=[0-9]+");
 }
 
 static void force_wedged(int fd)
-- 
2.43.0

