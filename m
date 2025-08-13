Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232EFCA0EE0
	for <igt-dev@archiver.kernel.org>; Wed, 13 Aug 2025 21:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB5510E10F;
	Wed, 13 Aug 2025 21:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mTcxqEnB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC9710E10F
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Aug 2025 21:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755121547; x=1786657547;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ojgaCaEBYly3WtAesSENeuA0cuoBFtSJlnTedaiDAOI=;
 b=mTcxqEnB1eSbZMcxuLmjoXUwCMJ1ob4a1Vy8+uVClensWLvgmDjdpxBL
 bBuf/OvrW5zlf2TIxptYKEgZTBj7vjar4zXksk34CowFtY8ERD+dgeuiZ
 PUlGS7PDlCHuuevb/qYAXuoy/ITWuUEEmmek0th9vO/3ZCakaCLSsvoab
 uC3faoKM0K/F8tjUROWhf8zhQhMt6Opw7eq0D42ytnvRhqiLiD91l6CrK
 ysslbanwXOUDk4j1KesJ0XTBn+bbwX7+H9YnPt+Ib7Pu7Hss6czCu/Sc6
 dIayqwey6WbNmwYZiEQUlbBuh8Smwv1byfe4IPcvpKYhhKAcq5PcJBSFT g==;
X-CSE-ConnectionGUID: 9J3PeXMmSYOBUoHVr+N9mg==
X-CSE-MsgGUID: GtNG+OLCTTmFKCi7df83Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68809789"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="68809789"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 14:45:46 -0700
X-CSE-ConnectionGUID: k0h8MvIES/aE+a/qi8hZqQ==
X-CSE-MsgGUID: EmW76jMlSuitU1TIOyzwpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166849228"
Received: from dut4399mtlh.fm.intel.com ([10.105.8.92])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 14:45:46 -0700
From: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sushma.venkatesh.reddy@intel.com
Subject: [PATCH 1/2] xe/oa: Add perf consts to support more metrics
Date: Wed, 13 Aug 2025 21:45:21 +0000
Message-ID: <20250813214522.8733-1-sushma.venkatesh.reddy@intel.com>
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

$SqidiTotalCount, $L3BankTotalCount, $L3NodeTotalCount,
$GeometryPipeTotalCount, $DepthPipeTotalCount and $ColorPipeTotalCount are
needed for collecting some important metrics.

Signed-off-by: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
---
 lib/xe/oa-configs/codegen.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/xe/oa-configs/codegen.py b/lib/xe/oa-configs/codegen.py
index 8629eac6d..d3742e11b 100644
--- a/lib/xe/oa-configs/codegen.py
+++ b/lib/xe/oa-configs/codegen.py
@@ -128,7 +128,6 @@ class Set:
         return self.xml.find(path)
 
 
-#TODO add SqidiTotalCount, L3BankTotalCount, L3NodeTotalCount
 hw_vars_mapping = {
     "$EuCoresTotalCount": { 'c': "perf->devinfo.n_eus", 'desc': "The total number of execution units" },
     "$EuSlicesTotalCount": { 'c': "perf->devinfo.n_eu_slices" },
@@ -164,6 +163,14 @@ hw_vars_mapping = {
     "$ComputeEngineTotalCount": { 'c': "perf->devinfo.n_eus", 'desc': "The total number of execution units" },
 
     "$CopyEngineTotalCount": { 'c': "perf->devinfo.n_eus", 'desc': "The total number of execution units" },
+
+    "$SqidiTotalCount": { 'c': "perf->devinfo.n_sq_idis", 'desc': "Total number of SQIDI units" },
+    "$L3BankTotalCount": { 'c': "perf->devinfo.l3_banks", 'desc': "Total L3 bank count" },
+    "$L3NodeTotalCount": { 'c': "perf->devinfo.n_l3_nodes", 'desc': "Total L3 node count" },
+
+    "$GeometryPipeTotalCount": { 'c': "perf->devinfo.n_geom_pipes", 'desc': "The total number of geometry pipelines" },
+    "$DepthPipeTotalCount": { 'c': "perf->devinfo.n_depth_pipes", 'desc': "The total number of depth pipelines" },
+    "$ColorPipeTotalCount": { 'c': "perf->devinfo.n_color_pipes", 'desc': "The total number of color pipelines" },
 }
 
 def is_hw_var(name):
-- 
2.43.0

