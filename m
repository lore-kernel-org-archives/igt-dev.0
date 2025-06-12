Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF2FC61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 07:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305D310E063;
	Thu, 12 Jun 2025 07:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OAETzr/r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F13A10E063
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 07:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749715190; x=1781251190;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+Tfx4KhT0Ca+AeEcbi2Qg+ppRuOMHyjQQrADrVYqUBE=;
 b=OAETzr/rOj9SrFLRYeNN4NTZrv4iCiC9uPX+RVnIhV0ZZIUpCL4cRvri
 ocJv1ro98Hub5cdbyJ7kC2WTiKyi6vH8zG2hP0H+dTWp/TUhiLuvCEDaB
 ozL6LOX6n3K121QHjnG7nc+Sq9Qj+YfjYoU3XLlyKQSZT79C6DwrnEJYa
 cZVfLSSWtS8/ofq655A/CklUeanCV6bUUmP0TtNJurh33uel+xqYsQy9k
 JEsp2F0eVLitH5q/Kjl/PCqDNdf08ilNkksSgAwfuQYCrTp1hcswpsxWj
 rzqION8jv8DWPS+PtXxVQbGP6FrpVgRZohFFoNsgnT4RkgQbp6qW0f+a7 g==;
X-CSE-ConnectionGUID: 2mqXCRRTRVKQDCawGbOtqw==
X-CSE-MsgGUID: g0uY+AAZTLK9TR/an+PRaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62920296"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="62920296"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 00:59:50 -0700
X-CSE-ConnectionGUID: SmbYo0jbRSe1tcy6xLISqQ==
X-CSE-MsgGUID: Vuv4HTUMSnSdGvKaDWLBIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152207419"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa003.jf.intel.com with ESMTP; 12 Jun 2025 00:59:49 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH] tests/intel/xe_exec_compute_mode: Fix assertion of batch
 buffer size
Date: Thu, 12 Jun 2025 07:58:43 +0000
Message-Id: <20250612075843.3697019-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
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

The batch buffer pointer is data[EXEC_DATA] not data. Correct it in the assertion.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/xe_exec_compute_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 8fba9daef..f321e1d76 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -393,7 +393,7 @@ static void non_block(int fd, int expect)
 	data[EXEC_DATA].batch[b++] = sdi_addr >> 32;
 	data[EXEC_DATA].batch[b++] = value;
 	data[EXEC_DATA].batch[b++] = MI_BATCH_BUFFER_END;
-	igt_assert(b <= ARRAY_SIZE(data->batch));
+	igt_assert(b <= ARRAY_SIZE(data[EXEC_DATA].batch));
 
 	sync[0].addr = addr + (char *)&data[EXEC_DATA].exec_sync - (char *)data;
 	exec.num_syncs = 0;
-- 
2.25.1

