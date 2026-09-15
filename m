Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B21C88E53
	for <igt-dev@archiver.kernel.org>; Tue, 15 Sep 2026 08:54:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0981710FB28;
	Tue, 15 Sep 2026 08:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7VL9jkr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C275910FB1E
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2026 08:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789462431; x=1820998431;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sdInBzdaize+eKY/lSKuLNAUDRSvkf9hguXvccooxEc=;
 b=h7VL9jkr5h7ElTDUO7TmrlWazWv98LR7ot13c2HTBCSMQ9Brc+mmbVYZ
 pL5IKSTtnAsSkFjPKcoNczPAw8yk9plcXgYhoA+ZnQikbkTKu45nd7HWW
 7cFQfc3uhcsGPO/6+Y+czOE4hF1UDBbjTxKYbytdejc3Oo9xInfXaiUAU
 x8RZpWWTFtDlEO8AaAc8lMx8e6W8x3B8l9nD/w35eNcjAo1Sudpd2U/TV
 0u3of7fZgRAYK5x0eLK9ejQkfbfW0Ts73H/doUIjRv1NP5g2sYKMtIe5R
 PkIPQGt4unB6pIw5cv81vxUhNidxfLeYO+w5CoNXHJSAiIm1HEekcNpd0 Q==;
X-CSE-ConnectionGUID: JNHXygkMS9Gne0PFLzocdg==
X-CSE-MsgGUID: FZxket8VSK6MBtH3i/ytSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101168384"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101168384"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 01:53:51 -0700
X-CSE-ConnectionGUID: ukM9UvXqQueO5ypscVV9lQ==
X-CSE-MsgGUID: wxdMzFeLQ0OKtvIN2g4Vyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1290717"
Received: from dut1121bmgfrd.igk.intel.com ([10.211.178.40])
 by fmviesa013.fm.intel.com with ESMTP; 15 Sep 2026 01:53:50 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v3] tests/intel-ci: blocklist multi-queue tests on NVL
Date: Tue, 15 Sep 2026 08:53:46 +0000
Message-ID: <20260915085346.38452-1-shivtej.eknath.patil@intel.com>
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
 tests/intel-ci/xe.nvl.core.blocklist.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
index 7de332352..0d28e1b60 100644
--- a/tests/intel-ci/xe.nvl.core.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
@@ -107,3 +107,9 @@ igt@xe_exec_sip@.*
 igt@xe_exec_sip_eudebug@.*
 igt@xe_live_ktest@xe_eudebug
 ##################################################################
+# Expected skip on NVL due to unsupported multi-queue capability
+# Multi-queue is not supported on platforms older than xe3p
+##################################################################
+igt@.*multi.queue.*
+igt@.*multiqueue.*
+##################################################################
-- 
2.43.0

