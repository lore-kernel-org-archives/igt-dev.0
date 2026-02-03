Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BE8E87823
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 12:54:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49D410E647;
	Tue,  3 Feb 2026 12:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d98ZnJb/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B48A10E320
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 12:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770123287; x=1801659287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cnbjmlq3S5kkeA64wM04k73PpfvD1803uxUEnHNhS/I=;
 b=d98ZnJb/RjvupICyU0BYQwuEviyJai4Hm2HcV3OmRSKStgTwyIgCxPhy
 ZeU9NkaYTkjnApKS7Qtw+m7JKhFJIZfkPnOKKcC0A+7e1s+1nQrpPhhJx
 P90HGRf9kBV9j3Ba9F0Z98OdKgVxUnS88NzIzUp+DnTSt2CtojgtqPUUE
 h7QHoNlRJyNTnlTeMC/jciiaoY3Jb0A/geD65XJryhZfX+U0WHcRfB5kz
 YO8GPLvnlmJecz0JGZIKwaWY7qX+NOBJ5gU65me5bxluDqmMtY+fiBI+v
 MZ4LrhDrgRAE68+4DD2EgptbhlKRz5X8MW6xrVdhTHglCIK24/+UXDHbD A==;
X-CSE-ConnectionGUID: zpSgz5UFQy+DvZbc2bk9dw==
X-CSE-MsgGUID: YQ4iSpp4T06UYabes7pmpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="73889288"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="73889288"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 04:54:45 -0800
X-CSE-ConnectionGUID: y3vXX6PZSRilfwKd8CIIVw==
X-CSE-MsgGUID: nGS+7o+CTKWFkIU/pdy9Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="209631342"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.46])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 04:54:46 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 1/3] lib/xe_eudebug: Add retry mechanism in
 xe_eudebug_enable
Date: Tue,  3 Feb 2026 13:54:20 +0100
Message-Id: <20260203125422.32880-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260203125422.32880-1-dominik.karol.piatkowski@intel.com>
References: <20260203125422.32880-1-dominik.karol.piatkowski@intel.com>
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

Add retry mechanism in xe_eudebug_enable to make sure the cleanup will
not fail due to race conditions. Abort on unsuccessful cleanup to not
leave the environment in potentially dirty state.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 2387b74f8..5344d240f 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1897,9 +1897,23 @@ out:
 bool xe_eudebug_enable(int fd, bool enable)
 {
 	bool old = false;
-	int ret = __xe_eudebug_enable_getset(fd, &old, &enable);
+	int ret;
+
+	for (int i = 0; i < 10; i++) {
+		ret = __xe_eudebug_enable_getset(fd, &old, &enable);
+
+		if (!ret)
+			break;
+
+		if (i < 9) {
+			igt_debug("xe_eudebug_enable: Failed, retrying...\n");
+
+			sleep(1);
+		}
+	}
 
-	igt_skip_on(ret);
+	igt_abort_on_f(ret, "xe_eudebug_enable: Failed to %s eudebug\n",
+		       enable ? "enable" : "disable");
 
 	return old;
 }
-- 
2.34.1

