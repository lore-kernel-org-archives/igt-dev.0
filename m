Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3D2C71136
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 00:20:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4EF10E004;
	Fri, 13 Jun 2025 00:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IX0GMwAq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F165D10E004
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jun 2025 00:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749774043; x=1781310043;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HsYq2SSsH9tDCZpbNjuND7GHGZ8KfAm0atsW/dkpCCU=;
 b=IX0GMwAqhzlIstnO3W/pjqBGQbH1pQt4OE3ZV9iopbZD5UfLvz/deLUi
 HHALWECIRlVeq+aqVa1vruedsQg38yaXLaRiLYxGmh95F/vuR2R27qfZW
 hFAYFsYmMShNQ0+N64ihJw2MUuAhN465GlcOYT43sjIqRlwBDz/M2COMN
 4Q7oisR1YNCLEZpOcP4N5A7LenwDskJ/Khz8qOp+pTmZ9myqK3YC9/SBF
 NKW2RvbQpkW97Om6wfC1yIBczfUjjO5OEwrch/YPkQzRX2lEaql++7yuB
 O9UkmDZo8OuurmMrtwdKKizitSXvrhX6nrbT2SrAvr/n+rAMt23O93iZ4 w==;
X-CSE-ConnectionGUID: dLk9XztgStaBiDZCVPHLTw==
X-CSE-MsgGUID: DiGjG1jaQZK9Yqvgs56RRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51087966"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="51087966"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 17:20:42 -0700
X-CSE-ConnectionGUID: 2b6c4dkNStOO394EaCc41Q==
X-CSE-MsgGUID: lkojevwNT6uH6X53jtq56A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="152655274"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa004.jf.intel.com with ESMTP; 12 Jun 2025 17:20:40 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v4] tests/intel/xe_exec_compute_mode: Fix assertion of batch
 buffer size
Date: Fri, 13 Jun 2025 00:19:43 +0000
Message-Id: <20250613001943.3704187-1-shuicheng.lin@intel.com>
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

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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

