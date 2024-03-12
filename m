Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EFBC54E5D
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 14:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EF410EB97;
	Tue, 12 Mar 2024 14:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T6V4ob64";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2953410EB97
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 14:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710253099; x=1741789099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x0Ay5q7LKa7mmt56q8Cja4pzt7nDxZ1PBcetgdhVsY0=;
 b=T6V4ob64wQ4SOBbBZIZvAvgrt+cTbMCkqTY65PD0JVgl/05OHJnSwZKr
 znSK7BERfB9tNjL6MJuiK9LSB+G6Btb6Zybc+uVHMyMuflup/p6oaf4k9
 amacQ5wh1WMTDbXRcs/3eVWnne1NV9HePWeIE5NkPQgQ4SBY9I3Ov1hgu
 d7SVBQ974rn3LsmCjSyK5qYi3iNb625uzBxaqvf9328NLkm6HsDVGjwt9
 fo8cZD1ySdMnsUAo0KPngzwPw00go5KlbkPt+N8iz5NXcIZS4jzDAvJS3
 MErhWnNWSjEk/Ho7v1ABRxbXlV9RyIO3pPpqz/MU+L3wvYpDjMcjRUMNT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="7909635"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="7909635"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:18:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11459661"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:18:17 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Priyanka Dandamudi <Priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t v3 25/25] tests: Update device_reset functionality
Date: Tue, 12 Mar 2024 14:14:19 +0000
Message-Id: <20240312141419.1277931-26-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
References: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
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

There is a need to keep Sub-category and Functionality different, so
automation tools can work properly.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Acked-by: Priyanka Dandamudi <Priyanka.dandamudi@intel.com>
---
 tests/device_reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index 018c8a9ac..d7163b277 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -20,7 +20,7 @@
  * Description: Examine behavior of a driver on device sysfs reset
  * Category: Server
  * Feature: reset
- * Functionality: reset
+ * Functionality: sysfs reset
  * Sub-category: Reset
  * Test category: GEM_Legacy
  *
-- 
2.34.1

