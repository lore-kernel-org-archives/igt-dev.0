Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86314E7717D
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 10:15:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAAA10EF93;
	Fri, 13 Dec 2024 10:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LrhL9QPI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F4610EF93
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 10:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734084956; x=1765620956;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1KKD7PtbVyqcPysu+3nM1M9uxHrnlg/8LENeJCyFI2A=;
 b=LrhL9QPI5sHp0fcX+IM4fSkDjnaEaPkqtZrYTJ8ugHJW5spI1n1lBFn7
 7lt2MT2JEL2KAUpRFU3++ktwiMIM+GHjoiNyh5To5onvWVc6MsRvIac8c
 plTVsIp2Rep+1eNJb+Px+KZ+mwnz8KxQXI65uPw2FP7L0FFkWlIz5oD8g
 DOx9583wh34JTzATLxd0mxRPOeeFlsa8eAxeaXV6Sueq2l0J2Aj7jtb3A
 9fGKvOdFPaFBM37dk30JRScq9h4aC+hLJ80MrCeni4dV+3atFs1GTSZMR
 khyZuiV9NX0LZsWF0QLy21AyHqKzQa9KW42xjtp9rAQQMBPPty8dEZmYP g==;
X-CSE-ConnectionGUID: noKOY2BITCqQ80FR4aFhrg==
X-CSE-MsgGUID: ShmB73T/SC6sF6JCc1M+/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34673774"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="34673774"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 02:15:56 -0800
X-CSE-ConnectionGUID: 593uoiCVT7iOBPtBbFSUHw==
X-CSE-MsgGUID: +hCyFgCcQsO4L0lN4b1MBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96931552"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.251])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 02:15:54 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] Update MAINTAINERS
Date: Fri, 13 Dec 2024 11:15:47 +0100
Message-ID: <20241213101547.13411-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.1
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

Add Karthik B S.

Cc: Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90c3c0880..afc5dbb36 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4,3 +4,4 @@ Kamil Konieczny <kamil.konieczny@linux.intel.com>
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
 Ashutosh Dixit <ashutosh.dixit@intel.com>
+Karthik B S <karthik.b.s@intel.com>
-- 
2.47.1

