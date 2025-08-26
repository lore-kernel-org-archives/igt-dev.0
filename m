Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E99CA0FF0
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 21:15:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7C110E2F8;
	Tue, 26 Aug 2025 21:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j89CH4uk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E7410E2F8
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 21:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756242953; x=1787778953;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Cc+bElQW763td5fRiNCSj7Fn7fmC0i9zUYUzEb3u7jM=;
 b=j89CH4ukMYA1Ro3NDisQjMK/CbPmZXGAQk5kAut1UzaGT+IJpOFfg6aw
 uzoMiGP0v5NAuadqR4RsE+uJ8r3A0jiLk60hswOtHZGj9Bf3m+kVPa+fl
 hKIFjeoyBq2s17EtnnRoVBsj0DOtdJhWLKkDxEhtDUxfC6308L4nEB80H
 6yGd+XJzHmGZnGKD0VKi41uwbzkfY/tOB+rS17CMq1Realde/4EtWBYYx
 3Vw272XqzZ9Sa1UNTYWgu0fRiytFQCiKPSKBeWhjmaXJN/qcxS6ZhGDe9
 H6mMVMB5bvi9esLH0RVyqSIt0pZyvZFJgbYlLEgLYOKSFxu6ZttjIbVIq Q==;
X-CSE-ConnectionGUID: ZiOyqbajSiya1potEdzbiA==
X-CSE-MsgGUID: sDc9Pka+RMSjAVN0EgRpXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="62307270"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="62307270"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 14:15:52 -0700
X-CSE-ConnectionGUID: Xvq7bw15Rz2BFowXzCIhXA==
X-CSE-MsgGUID: TeY64xP2To6Gcj6PIgsabA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="170055298"
Received: from dut4399mtlh.fm.intel.com ([10.105.8.92])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 14:15:52 -0700
From: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sushma.venkatesh.reddy@intel.com, ashutosh.dixit@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH 1/2] lib/xe/oa: Add perf consts to support more metrics
Date: Tue, 26 Aug 2025 21:15:44 +0000
Message-ID: <20250826211545.17076-1-sushma.venkatesh.reddy@intel.com>
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
 lib/xe/oa-configs/codegen.py |  9 ++++++++-
 lib/xe/xe_oa.h               | 13 +++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

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
diff --git a/lib/xe/xe_oa.h b/lib/xe/xe_oa.h
index 7d3d07456..020f6d058 100644
--- a/lib/xe/xe_oa.h
+++ b/lib/xe/xe_oa.h
@@ -110,6 +110,19 @@ struct intel_xe_perf_devinfo {
 	/* Number of threads in one EU */
 	uint64_t eu_threads_count;
 
+	/* Squidi Total Count */
+	uint32_t n_sq_idis;
+	/* L3 Bank Count */
+	uint32_t l3_banks;
+	/* Number of L3 nodes */
+	uint32_t n_l3_nodes;
+	/* Number of depth pipes */
+	uint32_t n_depth_pipes;
+	/* Number of geometry pipes */
+	uint32_t n_geom_pipes;
+	/* Number of color pipes */
+	uint32_t n_color_pipes;
+
 	/**
 	 * Maximu number of slices present on this device (can be more than
 	 * num_slices if some slices are fused).
-- 
2.43.0

