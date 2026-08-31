Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F164FC624A4
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 14:31:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C2810E912;
	Mon, 31 Aug 2026 14:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HANmY6AZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE71210E912
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 14:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788186634; x=1819722634;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SEC0wDV0Fe83tFq9o/Oo/qGGdL4MyCCjnt6rMTXa/Xk=;
 b=HANmY6AZf8RlnKz1E0PFgRGhGHoeh4t6tNPztYtIAGhZpFQY2WFsQKxl
 hvPxdH1cdj22hVWdL17ME81UvCnP/TtoBlqCIgUnelb8H4iPS5hWf7hQW
 FwA1X4y3vuJMg4Jvlbep6F1dylPF/ZLvowMGNCixEy7MeCWESMBiRtzUP
 fNo9waUPZIjLRE2p1AOq8elG1SQBHew/tplo1PxbX4mYnUIzFLlRV+I4V
 CZx+qLOUzmj69EqRKT5fcMQ2IbJC8B/OgJWytyEJaHkfXU64rLYBas5z6
 RWU/xfYviK1z45UWBVmUM9O0NEvJbFZciUQMBws7oAxGkh8LoDzUbZnbP Q==;
X-CSE-ConnectionGUID: kzsOcIK9T36wMI1Hn4QzhA==
X-CSE-MsgGUID: msAzBLdiQoaUtzcjLTJwKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92405158"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="92405158"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 07:30:33 -0700
X-CSE-ConnectionGUID: RvAt+ArMS9mf6LgK4oBaHw==
X-CSE-MsgGUID: 1EmrpYeOSTG5lMHqLWzZ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="274083723"
Received: from dut1451bmgsvc.igk.intel.com ([10.211.179.204])
 by fmviesa005.fm.intel.com with ESMTP; 31 Aug 2026 07:30:32 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 smitha.balasubramanyam@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v2] tests/intel-ci: blocklist xe_exec_threads multi-queue
 tests on NVL
Date: Mon, 31 Aug 2026 14:30:28 +0000
Message-ID: <20260831143028.22534-1-shivtej.eknath.patil@intel.com>
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

The xe_exec_threads multi-queue subtests require
xe_has_multi_queue_engine(fd).
 
On NVL platforms these subtests are expected to skip because
multi-queue engine support is not available.

Add a blocklist entry to avoid reporting expected CI failures.

Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
---
 tests/intel-ci/xe.nvl.core.blocklist.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
index 7de332352..19d7b9692 100644
--- a/tests/intel-ci/xe.nvl.core.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
@@ -107,3 +107,8 @@ igt@xe_exec_sip@.*
 igt@xe_exec_sip_eudebug@.*
 igt@xe_live_ktest@xe_eudebug
 ##################################################################
+# Expected skip on NVL due to unsupported multi-queue capability
+# Multi-queue is not supported on platforms older than xe3p
+##################################################################
+igt@xe_exec_threads@threads-multi-queue-.*
+##################################################################
-- 
2.43.0

