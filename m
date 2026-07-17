Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF59CC44514
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 10:39:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8928989A60;
	Fri, 17 Jul 2026 10:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TKfe4hMK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DF310F4E2
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 10:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784284736; x=1815820736;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7ZM4c5LBHpblB4QJY7b9sFL+Qmibp9S0I7GvfBYfv3g=;
 b=TKfe4hMKjGaR5eyIduexkzZG+gJF8MfzO548uymN5ssVs4QzOQuV8ANL
 lMzILpC+23TiScKc0u9XQ2eL7KbVAPtmDEI/bR/uov6vLUQvB1iSJirLt
 JYv9W+vNY7lZ9ozesmnICEz5klolrWYyNLTWXfiSEZAD7tWfiotAt1Jnm
 TXDG8caP4W3tojKdtwSsSMbIw0BZAbJ23SktrmHDoaY7F29Q0aMGXlxzE
 CFtvokO8XQBVySRcJZTg6M+NXcaD4ivgsxGHXjjJzyvoZA/D9+470j+Fi
 RUfjMglQxBXggIhJdDBSVMe40wqpuSfJiW2iJHg8+C/I2P35izpHYJnud g==;
X-CSE-ConnectionGUID: ZQ2FBfZFSUWEULhSvrBNCg==
X-CSE-MsgGUID: /lfL/zAzTpqMRqqbWOAmZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="96467283"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="96467283"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 03:38:55 -0700
X-CSE-ConnectionGUID: ZcRtwCMqQoq2uEeT1tJkjw==
X-CSE-MsgGUID: 3WlcfORFTfC1VQ0mjyJzzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="294949879"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.223.55.11])
 by orviesa001.jf.intel.com with ESMTP; 17 Jul 2026 03:38:54 -0700
From: aditya.chauhan@intel.com
To: ramadevi.gandi@intel.com,
	igt-dev@lists.freedesktop.org
Cc: priyanka.dandamudi@intel.com,
	himanshu.girotra@intel.com
Subject: [PATCH i-g-t] intel-ci: Update PTL Core blocklist
Date: Fri, 17 Jul 2026 16:08:52 +0530
Message-Id: <20260717103852.420934-1-aditya.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Aditya Chauhan <aditya.chauhan@intel.com>

Add xe_cw_post_sync@walker-post-sync as it is applicable from CRI
and above.

Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
---
 tests/intel-ci/xe.ptl.core.blocklist.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
index 8752e92cd..dc094e7e8 100644
--- a/tests/intel-ci/xe.ptl.core.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
@@ -7,6 +7,10 @@ igt@testdisplay
 igt@xe_pat@display-vs-wb-transient
 igt@fbdev@.*
 ##################################################################
+# Valid skip as test is applicable for Xe3p xpc and later platforms
+##################################################################
+igt@xe_cw_post_sync@walker-post-sync
+##################################################################
 # Expected skip as iGPU has no vram
 ##################################################################
 igt@xe_mmap@vram$
-- 
2.34.1

