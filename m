Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F538C3DA6D
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 09:26:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D5810E080;
	Tue, 20 May 2025 09:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUBPKFua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53BAD10E080
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 09:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747733172; x=1779269172;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ISB97QCYee6jfIPRtwsABL0QvOXT6X1mrK2ZD/YbzgM=;
 b=mUBPKFuars5vbpRl1zlehuqlqwVkVNx3vkiJfCDyvHO6dB0i/VxX2wqL
 OCPHJ7aVfnxYxLJi8KoTkIeOQ5h8lw0lqIfyQVHcAA+9LxC/Cvo0Wt1FN
 2ub/BpNf1QmC6n0bbgxrSnFS6UI5Gc2GpTvJvrNGJv4KqYKzI1E4FYYY+
 kXrcvWzVo/7CJdw3XE7XTDZBlAq7cKjH/h1Cd54YesOjpzH8ZPH7FsF0p
 kzzw8Z6Lt9AIwZju32Joc6505UJ+RzI/7vZqlTbuchCMq74v0rvcWIvE1
 M6pmIXwI61d/xXHCAkJ8DyAb7HOf5bZzNuE2RgDlWa5R20bF2BUupZSA/ A==;
X-CSE-ConnectionGUID: kx+O687zTju4g++fMRkAxw==
X-CSE-MsgGUID: +XqUUSmQSZGLD0/d9QUT9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="67210630"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="67210630"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 02:26:11 -0700
X-CSE-ConnectionGUID: VzUtcSuzRhiO28qOVybxJQ==
X-CSE-MsgGUID: TLUTqsz5SMy4jPNmWk4l7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="143630390"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.227.88.132])
 by fmviesa003.fm.intel.com with ESMTP; 20 May 2025 02:26:11 -0700
From: himanshu.girotra@intel.com
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] Add platform  Blocklist for Eudebug
Date: Tue, 20 May 2025 14:56:10 +0530
Message-Id: <20250520092610.910-1-himanshu.girotra@intel.com>
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

