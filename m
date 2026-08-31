Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D77C624CE
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 14:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3E410E296;
	Mon, 31 Aug 2026 14:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q1NGMlgX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E04310E908
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 14:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788186032; x=1819722032;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VYDa7xAdaW+nXpUOOckCSh1o9t8X0egYxQu1vO8rCDE=;
 b=Q1NGMlgXVcaQ4gu/8sAm01+vmdzpQPNjwRp0q7q7kMfd8bUA7wlA2fAO
 36Eni4TjWW4E2r6xLGEqShMuTThEmdGxsxQcpfgwzAatA1hoYZe3vg18Z
 HIigSBBtz/RLQbIBmKDx0TZryzjHD/9cdBnVB56rvgb959l8pQrhjUJgh
 opk9Yy1e22KLSi9Fo1is60OquhPCbI4nOBY0R27Cj2uzoqzt615xEfF4o
 YdpgFPJifjPOhYn8L/raDkY6w4whGe4ixPrirWRlS15IR/oKx6WkgyZ1y
 RG+z76LkIsDbzrSRIfsMB4YWIPi+w8No6wSbTqpXXR36NZ47NQMeef0oP w==;
X-CSE-ConnectionGUID: ohDvUTuUSfCDW9knynToYg==
X-CSE-MsgGUID: ZTwwz5pPQdaxSY9OpoLZWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="114133367"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="114133367"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 07:19:29 -0700
X-CSE-ConnectionGUID: qPgxzx6+RnqOrPJyEgbAYA==
X-CSE-MsgGUID: Gdxu4HdDTN+8RIa8CJ1Eng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="262677801"
Received: from dut1451bmgsvc.igk.intel.com ([10.211.179.204])
 by fmviesa009.fm.intel.com with ESMTP; 31 Aug 2026 07:19:28 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 smitha.balasubramanyam@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v1] tests/intel-ci: blocklist xe_exec_threads multi-queue
 tests on NVL
Date: Mon, 31 Aug 2026 14:19:21 +0000
Message-ID: <20260831141921.18451-1-shivtej.eknath.patil@intel.com>
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
 tests/intel-ci/xe.nvl.core.blocklist.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
index 7de332352..ef9249a6d 100644
--- a/tests/intel-ci/xe.nvl.core.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
@@ -107,3 +107,9 @@ igt@xe_exec_sip@.*
 igt@xe_exec_sip_eudebug@.*
 igt@xe_live_ktest@xe_eudebug
 ##################################################################
+# VLK-96753
+# Expected skip on NVL due to unsupported multi-queue capability
+# Multi-queue is not supported on platforms older than xe3p
+##################################################################
+igt@xe_exec_threads@threads-multi-queue-.*
+##################################################################
-- 
2.43.0

