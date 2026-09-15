Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA585C88E75
	for <igt-dev@archiver.kernel.org>; Tue, 15 Sep 2026 10:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D5810EC1A;
	Tue, 15 Sep 2026 10:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dIl9L6Ip";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8837010EC1A
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2026 10:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789467260; x=1821003260;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v7Vj8lesb5jZcaApqA8TQ+y/i8pQiAkXRrxg82xf1Lc=;
 b=dIl9L6IpEPqDadyV3xi0o8xSMsbOpIpn8AMn1IOZljr1xU/1QFO9pHEw
 steaCZm007oX4Mib8+DyvKHRL14kZd/CY5I9LxhmfJGa+lbvrHK8PmTfd
 ubJ/EO7N9e8bKD80UFKCY9DleUz7A75P5/DhC3QWTGJ7HZkwDRPxYpiCt
 3+9cb6K1cSOR3UW0FBS9icXFhd9lOp0Q1qiYoVq2ivQJQavMmJonRdO4Z
 ARYZ6RcU48nR0hDnKfKkhvyiPBaC+HOczZBkSpaQpjRuUrZVNf8xwMatP
 HalBXnIUikRgaiEAobDge99OaULyCzCQBw4v+tlq8r2gNPigqmyjo/zox g==;
X-CSE-ConnectionGUID: tUvxj77vQ1W+8EqXQRyXkg==
X-CSE-MsgGUID: Rkg11hWiQmatS30bysVIrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88960847"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="88960847"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 03:14:19 -0700
X-CSE-ConnectionGUID: VKAb/1BCSBSDIvYsWeHjoA==
X-CSE-MsgGUID: ye2cdSSQTGqRr7pqCu738A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="278214798"
Received: from dut1121bmgfrd.igk.intel.com ([10.211.178.40])
 by fmviesa005.fm.intel.com with ESMTP; 15 Sep 2026 03:14:18 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v4] tests/intel-ci: blocklist multi-queue tests on NVL
Date: Tue, 15 Sep 2026 10:14:14 +0000
Message-ID: <20260915101414.66216-1-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 
On NVL platforms these tests are expected to skip because
multi-queue engine support is not available.
 
Add blocklist entries to suppress expected CI failures.

Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
---
 tests/intel-ci/xe.nvl.core.blocklist.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
index 7de332352..71715235b 100644
--- a/tests/intel-ci/xe.nvl.core.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
@@ -107,3 +107,8 @@ igt@xe_exec_sip@.*
 igt@xe_exec_sip_eudebug@.*
 igt@xe_live_ktest@xe_eudebug
 ##################################################################
+# Expected skip on NVL due to unsupported multi-queue capability
+# Multi-queue is not supported on platforms older than xe3p
+##################################################################
+igt@.*multi.queue.*
+##################################################################
-- 
2.43.0

