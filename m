Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC5BC3ABDD
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 09:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF29A10E569;
	Tue, 20 May 2025 09:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SGAHYKgQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A00310E562
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 09:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747734525; x=1779270525;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Ng9pRf8KvvrOWGoRcqM4YcvZey7Et90E/70GgocvMM=;
 b=SGAHYKgQOu4XGRebJtJQTfD9kpKaL7aT9fvCo5J7PbfpLLanQY0/mg87
 /DXFvG51zwsi02pDyQL/T5awNIifp3WoI5fXMLf7nfRBXMPAysINaKQ3Y
 Rsqcp8b11Oh6CvdFNl/tSRy0lVFQ91IbHMW3I+RUa3AQ+62YtQ0u8itjc
 eXgxwAc3LxxUtR5UY16XNLjeXeqj9xJC68ItqeT4XKphhZ7f/gM1mZNWc
 PX4f5p/kUUBrr01/a++DtxJcLYkaDQN/Jos6MB7vggtkQvAJB3VwllPI1
 TZdSWJxIk0Pyp1g21IqxPidM69ELiVN2IQAqH4iHbJkPYpxu19EyKdzNH Q==;
X-CSE-ConnectionGUID: qi7CmlFiQy2ueKfUdsqv1g==
X-CSE-MsgGUID: RV0aIUv8TbS60jelwi6H4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49760235"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49760235"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 02:48:45 -0700
X-CSE-ConnectionGUID: p7E2MQgrROqkM/gA0f7Vmg==
X-CSE-MsgGUID: Ss5Im71PQEKqvU4d/jvUQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="170530317"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.227.88.132])
 by orviesa002.jf.intel.com with ESMTP; 20 May 2025 02:48:43 -0700
From: himanshu.girotra@intel.com
To: ramadevi.gandi@intel.com, katarzyna.piecielska@intel.com,
 kamil.konieczny@intel.com, igt-dev@lists.freedesktop.org
Subject: [PATCH v2 i-g-t] tests/intel-ci: Add platform  Blocklist for Eudebug
Date: Tue, 20 May 2025 15:18:39 +0530
Message-Id: <20250520094839.1164-1-himanshu.girotra@intel.com>
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

Add blocklist file for LNL/BMG and core blocklist for debugger
functionality

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Ramadevi Gandi <ramadevi.gandi@intel.com>
---
 tests/intel-ci/xe.bmg.eudebug.blocklist.txt | 5 +++++
 tests/intel-ci/xe.eudebug.blocklist.txt     | 4 ++++
 tests/intel-ci/xe.lnl.eudebug.blocklist.txt | 6 ++++++
 3 files changed, 15 insertions(+)
 create mode 100644 tests/intel-ci/xe.bmg.eudebug.blocklist.txt
 create mode 100644 tests/intel-ci/xe.eudebug.blocklist.txt
 create mode 100644 tests/intel-ci/xe.lnl.eudebug.blocklist.txt

diff --git a/tests/intel-ci/xe.bmg.eudebug.blocklist.txt b/tests/intel-ci/xe.bmg.eudebug.blocklist.txt
new file mode 100644
index 000000000..661e3122a
--- /dev/null
+++ b/tests/intel-ci/xe.bmg.eudebug.blocklist.txt
@@ -0,0 +1,5 @@
+#####################################################
+# BMG specific blocklist for Xe EUdebugger tests
+#####################################################
+igt@.*@.*tiles
+igt@.*@*multigpu.*
diff --git a/tests/intel-ci/xe.eudebug.blocklist.txt b/tests/intel-ci/xe.eudebug.blocklist.txt
new file mode 100644
index 000000000..e13a5cc2b
--- /dev/null
+++ b/tests/intel-ci/xe.eudebug.blocklist.txt
@@ -0,0 +1,4 @@
+#####################################################
+# Core Blocklist for Xe EUdebugger tests
+#####################################################
+igt@(?!.*xe.*eudebug.*|xe_exec_sip.*).*
diff --git a/tests/intel-ci/xe.lnl.eudebug.blocklist.txt b/tests/intel-ci/xe.lnl.eudebug.blocklist.txt
new file mode 100644
index 000000000..cabac8858
--- /dev/null
+++ b/tests/intel-ci/xe.lnl.eudebug.blocklist.txt
@@ -0,0 +1,6 @@
+#####################################################
+# LNL specific blocklist for Xe EUdebugger tests
+#####################################################
+igt@.*@.*tiles
+igt@.*@*multigpu.*
+igt@xe_eudebug_online@writes-caching-(?!sram-bb-sram-target-sram).*
-- 
2.40.0

