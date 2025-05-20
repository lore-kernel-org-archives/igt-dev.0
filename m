Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50738C3ABDD
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 10:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD87210E1AF;
	Tue, 20 May 2025 10:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="guckdQrE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA40410E1AF
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 10:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747738321; x=1779274321;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JN2QXybHh0FUuYAl7Mdd5f5z0zpAho4nWnezVyNHdlo=;
 b=guckdQrEu6tjt/xt2UzvcNztczomr45ba3iJvCVlJL4xcZ/dkMxt3cDG
 DvCfj/o3UPkL3bHcif73y7C1Sgru5nJ8x+cPquswBwz3TV74h30NVxGoG
 xMpw21Q0xKI1mbAclQtNzgqo8D5t2pXqtDb4eG952DbyhpIpfZV0J/Ocd
 Yzcngjj41arCTu3+BittU//DHPe+YElz2Rl7ylLubqILqsoL9bde79X/o
 FZI3ur0x0QK0S5vrtGOFQD/EE4EZbB9OLPFDloAnISOIygebWahn3+J3N
 D1CqvePA83xS2U/uKmdn7QHM0Cy/MeCeBV5jqZlhQ8CLrXMlf9gSriOp+ Q==;
X-CSE-ConnectionGUID: RQu+BC4FS9uClbanJ1VRyA==
X-CSE-MsgGUID: BzE/P+2PRUGR16kdGFHJfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="53466295"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="53466295"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 03:52:01 -0700
X-CSE-ConnectionGUID: kn5NVofKSruUDkvOvpkK+A==
X-CSE-MsgGUID: ybWmYWrWTXOLhGbq29/Tew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139559900"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.227.88.132])
 by fmviesa006.fm.intel.com with ESMTP; 20 May 2025 03:51:59 -0700
From: himanshu.girotra@intel.com
To: ramadevi.gandi@intel.com, katarzyna.piecielska@intel.com,
 kamil.konieczny@intel.com, igt-dev@lists.freedesktop.org
Subject: [PATCH v2 i-g-t] tests/intel-ci: Add platform  Blocklist for Eudebug
Date: Tue, 20 May 2025 16:21:58 +0530
Message-Id: <20250520105158.2016-1-himanshu.girotra@intel.com>
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
index cb775e2f1..f48c53e7c 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -9,9 +9,12 @@ intelci_files = [
   'fast-feedback-chamelium-only.testlist',
   'meta.testlist',
   'xe.blocklist.txt',
+  'xe.eudebug.blocklist.txt',
   'xe.bmg.core.blocklist.txt',
+  'xe.bmg.eudebug.blocklist.txt',
   'xe.bmg.display.blocklist.txt',
   'xe.lnl.core.blocklist.txt',
+  'xe.lnl.eudebug.blocklist.txt',
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

