Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4783C982E6
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 06:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594B310E296;
	Mon, 21 Sep 2026 06:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lkv7V0Xi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45F910E2F3
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 06:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789973582; x=1821509582;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oiJtuuArRnyqmcg9L/t4D943Hd3HdwmruO+nRC+ahFM=;
 b=lkv7V0XiCuvQTG1DBJm/gbmIvc7zb5PUICvuvQJcjO1NFT2twAim54gb
 5ELzemoow82+uopweRd8mNCW4KfvV0hogbYCqgnRDrcgcLlWVrSgRehXg
 /qC0ZD75h/OsDP3GeSnFytAvRb0oifgE6WdqQM7OWF6AlDedjbgwT64tG
 rMr8h9dDePwJWSvxBcVAhv+GYiXnlu7tTrEaty8TcKwo+5sJidlaQdM+6
 PBf+t6YEsiwTe8fyeRhM7aT3N21S4EkhHljbzhnS5Eevy7xAQY4MiK3Ry
 e1ZqE7t4qeQdQwRbCTXKA6o3H+3Q0pObcuMOSKhy8+B0ZqPH677c4HELG A==;
X-CSE-ConnectionGUID: /GA2x0wWR4SURPftfY3HcQ==
X-CSE-MsgGUID: h9hfEWHmSkiX91+csJZ6gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="89393944"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="89393944"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2026 23:53:02 -0700
X-CSE-ConnectionGUID: mnQFN0JSShKyW7w0bggaxw==
X-CSE-MsgGUID: k9/IwrwQRK2s/NZY+I3dJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="271064535"
Received: from dut1131bmgfrd.igk.intel.com ([10.211.178.48])
 by fmviesa006.fm.intel.com with ESMTP; 20 Sep 2026 23:53:01 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v1] intel-ci: blocklist multi-queue tests on BMG, LNL,
 PTL and WCL
Date: Mon, 21 Sep 2026 06:52:55 +0000
Message-ID: <20260921065255.39530-1-shivtej.eknath.patil@intel.com>
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

From: Shivtej Patil <shivtej.eknath.patil@intel.com>

The multi-queue subtests require xe_has_multi_queue_engine(fd).
On BMG, LNL, PTL and WCL platforms these tests are expected to skip because
multi-queue engine support is not available.

Add blocklist entries to suppress expected CI failures.

Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
---
 tests/intel-ci/xe.bmg.core.blocklist.txt | 5 +++++
 tests/intel-ci/xe.lnl.core.blocklist.txt | 5 +++++
 tests/intel-ci/xe.ptl.core.blocklist.txt | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
index cd38d16f8..80aea12e8 100644
--- a/tests/intel-ci/xe.bmg.core.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
@@ -80,3 +80,8 @@ igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
 ##################################################################
 igt@xe_pm@d3hot-i2c
 ##################################################################
+# Expected skip on BMG due to unsupported multi-queue capability
+# Multi-queue is not supported on platforms older than xe3p
+##################################################################
+igt@.*multi.queue.*
+##################################################################
diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
index c830ac3c8..7975fe126 100644
--- a/tests/intel-ci/xe.lnl.core.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
@@ -108,3 +108,8 @@ igt@xe_module_load@force-load
 #################################################################
 igt@xe_pm@d3hot-i2c
 ##################################################################
+# Expected skip on LNL due to unsupported multi-queue capability
+# Multi-queue is not supported on platforms older than xe3p
+##################################################################
+igt@.*multi.queue.*
+##################################################################
diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
index 362711406..3df649a2c 100644
--- a/tests/intel-ci/xe.ptl.core.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
@@ -91,3 +91,8 @@ igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
 ##################################################################
 igt@.*survivability.*
 #################################################################
+# Expected skip on PTL/WCL due to unsupported multi-queue capability
+# Multi-queue is not supported on platforms older than xe3p
+##################################################################
+igt@.*multi.queue.*
+##################################################################
-- 
2.43.0

