Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65FACA0EEB
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 00:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7054010E027;
	Sat, 23 Aug 2025 00:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8LjGb7I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15DF10E027
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 00:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755908736; x=1787444736;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AL09Pe3Nw3hS5FehVkPFbafj1fKoCLMtrl7xMR2e95E=;
 b=G8LjGb7I+yfteQiqboMcgR2fs+o06ujlHEQ8Yah8d+WpBywCY1pDtgH4
 NaJoE/sebxsLbciDpZrSLvERCxp413wiLmPugJQgbfmXbMlc1B3qz1zBG
 uvniUexVvqMHyJrLupsYMYqdjJqmg9RIy8YPpHNlvvelGC6ACuPHxR5pH
 HFr96XKuZY5rt1Y7tZ54tKjQYcyKX6uBqaJeoybOk7hL38plLfJMeQuoU
 RtRFgjvZIgIC2uJIywLzx6YZhc79YAgoJ1oFpFpy3P0KiZiB2BNyBrty5
 SJ+yZqAFOZPPGYCjfVcmwpRn0Lu7nh9cEh8RCB5MoXfDdrDCO0hmTgMT0 g==;
X-CSE-ConnectionGUID: caDqfmacS4a7Ygub0VJXMQ==
X-CSE-MsgGUID: +8eLeNtKTdS662xIhCeTlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58366154"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58366154"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 17:25:36 -0700
X-CSE-ConnectionGUID: 9qd5QkVrRqaXkmNgrNuWWA==
X-CSE-MsgGUID: eErPnwCDQhW6ASGOa7sQlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168049674"
Received: from dut4399mtlh.fm.intel.com ([10.105.8.92])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 17:25:35 -0700
From: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sushma.venkatesh.reddy@intel.com, ashutosh.dixit@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH 1/2] lib/xe/oa: Add perf consts to support more metrics
Date: Sat, 23 Aug 2025 00:25:17 +0000
Message-ID: <20250823002518.8768-1-sushma.venkatesh.reddy@intel.com>
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

Add new metrics: SqidiTotalCount, L3BankTotalCount, L3NodeTotalCount,
GeometryPipeTotalCount, DepthPipeTotalCount and ColorPipeTotalCount

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

