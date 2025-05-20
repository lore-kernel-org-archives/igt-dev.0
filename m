Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE413C3DA6D
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 10:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993CE10E494;
	Tue, 20 May 2025 10:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+/4lJkW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A853D10E494
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 10:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747736044; x=1779272044;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NgvS/YgbCy3mEVt/++yHEcEKRAfXt5X0QTRFpub7iyk=;
 b=I+/4lJkWtsNvAvgVf4B8NEeNlRNViudeuU8akh7+N05nyp6n8jRRRfOD
 udXG9MTzVR7ppXzPHGgxjBT1enuwJr7KOwXXHSDLekPkNVSS+G3cL5Qc+
 1MeXzdjm51REAu/FJtWhAUETF9ZBBEediwupqI9gGnQjlAdyO5DXTRgod
 B8hMhUWMn7Dr9I3D04WMyOdYFBB7iy451DUdIKqjqpdchIJaNkwZdqsOD
 Mqwn20t1lkisnAZAlJsq92suiF/8QVMs0QgbkUPo8itmE5Xo/0A4/38pT
 LxiIbv9X1u6Z+JRfjy+pRiR3hZ+sp4gE445heG5q0wXjb+xqYYiZEF/uS A==;
X-CSE-ConnectionGUID: 2HiMaBwmRaS8SsUIRY+XFA==
X-CSE-MsgGUID: zmUXb3V9Rv2gGc8LZhgnrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49536524"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49536524"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 03:14:04 -0700
X-CSE-ConnectionGUID: Vs5Q+XD9TfqyYhSAITUrLA==
X-CSE-MsgGUID: ZapuV7diQv6Td9CKueFq7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="144503181"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.227.88.132])
 by fmviesa005.fm.intel.com with ESMTP; 20 May 2025 03:14:02 -0700
From: himanshu.girotra@intel.com
To: ramadevi.gandi@intel.com, katarzyna.piecielska@intel.com,
 kamil.konieczny@intel.com, igt-dev@lists.freedesktop.org
Subject: [PATCH v2 i-g-t] tests/intel-ci: Add platform  Blocklist for Eudebug
Date: Tue, 20 May 2025 15:44:00 +0530
Message-Id: <20250520101400.1522-1-himanshu.girotra@intel.com>
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

v2: Add files to meson.build (Rama)

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Ramadevi Gandi <ramadevi.gandi@intel.com>
---
 tests/intel-ci/meson.build                  | 3 +++
 tests/intel-ci/xe.bmg.eudebug.blocklist.txt | 5 +++++
 tests/intel-ci/xe.eudebug.blocklist.txt     | 4 ++++
 tests/intel-ci/xe.lnl.eudebug.blocklist.txt | 6 ++++++
 4 files changed, 18 insertions(+)
 create mode 100644 tests/intel-ci/xe.bmg.eudebug.blocklist.txt
 create mode 100644 tests/intel-ci/xe.eudebug.blocklist.txt
 create mode 100644 tests/intel-ci/xe.lnl.eudebug.blocklist.txt

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index cb775e2f1..84bbdabc6 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -9,9 +9,12 @@ intelci_files = [
   'fast-feedback-chamelium-only.testlist',
   'meta.testlist',
   'xe.blocklist.txt',
+  'xe.eudebug.blocklist',
   'xe.bmg.core.blocklist.txt',
+  'xe.bmg.eudebug.blocklist',
   'xe.bmg.display.blocklist.txt',
   'xe.lnl.core.blocklist.txt',
+  'xe.lnl.eudebug.blocklist',
   'xe.lnl.display.blocklist.txt',
   'xe-fast-feedback.testlist',
   'xe-fast-feedback-chamelium-only.testlist',
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

