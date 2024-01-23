Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A06C47DDF
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 18:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B33210E7EF;
	Tue, 23 Jan 2024 18:33:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA3010E7EF
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 18:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706034821; x=1737570821;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rhLt0xM7GFtTAxvm88sWCS2xZTmzjy/XnKMyHkVv9og=;
 b=HcRSRrXv1uhdFhbBYnHeQ2UIDGUaixy9riaDhWVAI5mvwNl8zt1kucoj
 OCcyrhUqhYvTRXrPQRUnlfjzoc423UcReJK412CIGiBZWREXcv8qAns0T
 4ZFw3OxMLvJXix/4m4D+3mp7VAqa81CBo7dH/HOjB0Vpy5oMwHAov8BVs
 LPyhLcJULo/eXMiBm2YRkdjqUY4N9BERFBj3RqTQ+v9IUzhZMW6mJOMcV
 Ff/McP//x9gCSwWOK9CUHACMypW27vDABSFRu6GBEiDyWnIs5q97CqufG
 1aJ2wwnnXOD4QTCQNdD9odMJH6aYgK/v+fgesYvN55q+ODhMWGxKiu2GL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1496360"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1496360"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 10:33:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909392729"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="909392729"
Received: from kogorman-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.18.165])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 10:33:39 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] lib/intel_blt: use BYTE_COPY mode on xe2
Date: Tue, 23 Jan 2024 18:33:23 +0000
Message-ID: <20240123183323.173424-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123183323.173424-1-matthew.auld@intel.com>
References: <20240123183323.173424-1-matthew.auld@intel.com>
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

Currently we see various CAT errors and timeouts on xe2 when running
xe_copy_basic. If selecting PAGE_COPY mode for MEM_COPY, the page size
is defined as 256B block as xe2. Also the width should be defined in
number of pages, and not bytes, which likely explains the CAT errors.
However the caller in xe_copy_basic is not using a size that is aligned
to 256B, so rather just select the more general BYTE_COPY mode instead,
which should work for any reasonable number of bytes.

BSpec: 57561
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_blt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index e41e261ea..25d251c4f 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1613,7 +1613,7 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
 	optype = mem->src.type == M_MATRIX ? 1 << 17 : 0;
 
 	i = 0;
-	batch[i++] = MEM_COPY_CMD | (1 << 19) | optype;
+	batch[i++] = MEM_COPY_CMD | optype;
 	batch[i++] = mem->src.width - 1;
 	batch[i++] = mem->src.height - 1;
 	batch[i++] = mem->src.pitch - 1;
-- 
2.43.0

