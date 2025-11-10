Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAACCCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 12:11:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4321F10E355;
	Mon, 10 Nov 2025 12:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="If4wLrgY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF15410E355
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 12:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762776709; x=1794312709;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xcF7RBe93PtI+StKBvhx0qmKfYajI1uf3Z17OI9Ft1k=;
 b=If4wLrgYucmnqKAjL9ugxAORiEOWp1v13wEuZ6lBNNbqs7rbXdu/B+qD
 MAs2RdriU17Lo99i2yxaQO2ZL9uZFRWul7x8KSNpl5ru1XoBkMCbAw8Ci
 u6gUwxzlVaZTlro1a6cVcfS2i+mhEbHDvltRCvBLeiwcsssPoPR4MlMR5
 GztK06X9cbHMizErt0maumjxXNq9UzkWhvjPISt5o/p27XzBncPfrmBD7
 k3GolrQ2FtSYDk9UyFD0DCeErYKN2t8fClHq/gAAzJZa/RJ5M0WU0lgyB
 KVNDHp/YKBOMVLpJJ/BZjNryH0dW2hDcKvZ20jWiMm3wtH3ir8zTSwCBe A==;
X-CSE-ConnectionGUID: 3k42Q+mrR0mxGAg5/ZswVg==
X-CSE-MsgGUID: to5QXQgXR+Kdt0Kwaoa6/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64734762"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64734762"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 04:11:49 -0800
X-CSE-ConnectionGUID: Kw9H7/K7Rsir7t/6JYeNdQ==
X-CSE-MsgGUID: FNZQnP6WRfmGOwgVMYWIZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="187911246"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by orviesa006.jf.intel.com with ESMTP; 10 Nov 2025 04:11:47 -0800
From: himanshu.girotra@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 kamil.konieczny@intel.com, aditya.chauhan@intel.com
Subject: [PATCH v2 i-g-t] tests/intel-ci: Update blocklists for xe
Date: Mon, 10 Nov 2025 17:42:25 +0530
Message-ID: <20251110121225.8849-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
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

Blocklist non-intel gpu tests across xe platforms running in CI
and update wise Blocklist files for BMG and PTL.

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel-ci/xe.blocklist.txt          | 1 +
 tests/intel-ci/xe.bmg.core.blocklist.txt | 1 +
 tests/intel-ci/xe.ptl.core.blocklist.txt | 5 +++++
 3 files changed, 7 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index aa480c6d2..8706721e3 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -13,6 +13,7 @@ igt@vgem_.*
 igt@.*virtgpu.*
 igt@vkms.*
 igt@vmwgfx.*
+igt@panthor.*
 ##################################################################
 # Exclude all i915 tests
 ##################################################################
diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
index 15dbbf2b8..3a127f780 100644
--- a/tests/intel-ci/xe.bmg.core.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
@@ -70,6 +70,7 @@ igt@xe_evict@evict-(beng-)?large-multi-vm-cm$
 # pxp support not available for BMG
 ##################################################################
 igt@xe_pxp@(?!pxp-bo-alloc$|pxp-queue-alloc$).*
+igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
 ##################################################################
 # I2c tests needs AMC capable BMG in CI
 ##################################################################
diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
index 811062449..bb8587656 100644
--- a/tests/intel-ci/xe.ptl.core.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
@@ -69,8 +69,13 @@ igt@xe_pm_residency@toggle-gt-c6
 # Expected skip as PXP is not enabled for PTL upstream
 ##################################################################
 igt@xe_pxp@.*
+igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
 ##################################################################
 # System allocator feature is not POR for PTL
 ##################################################################
 igt@xe_exec_system_allocator@.*
 ##################################################################
+# survivability feature not applicable for PTL
+##################################################################
+igt@xe_survivability@.*
+#################################################################
-- 
2.50.1

