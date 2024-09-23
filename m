Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433F7CF9C71
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 22:11:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E067D10E4A7;
	Mon, 23 Sep 2024 22:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W20pu3Y3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC6A10E4A7
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 22:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727129518; x=1758665518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bbhBk36guhHo5Qe1c6rk3mEix6q5ypm/IiloO/FazTo=;
 b=W20pu3Y3ujCV696dlRg+KHAsguD60/5gZ48YMH1CIJhL7Gu6eRAtgFfM
 YU+75vrA1jrQefmAH8Xoz8D01gIl6FhqZR/qCIyf83wLcvS2Uu5RA4BmK
 dTI7FTgTSAotKt+RCs8PEDK4Cew0HDbY9ziROty30QiqzREVir0kREvyR
 C3su5km/Fzb2KRrMsX7f65y4HQQIuc5yUDWXxbkx0hLA4GptMzqDXIl+K
 0G53Eka0S/DIifM/S4QO/M+rwI2sKuiD82JDXcjXnPfzVcpHHs5M/ZRoS
 NLJdY/uzKnWwnFLcHecs0q1xA6EwAYrVQ7KSYoyiNQKGyk8FFNkFp+1w/ g==;
X-CSE-ConnectionGUID: F30X5YBhTbGrlh7N0h4OaA==
X-CSE-MsgGUID: CtXXW4FKS9GVI5uCv0R/FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43615590"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="43615590"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 15:11:58 -0700
X-CSE-ConnectionGUID: qhRVzzKOR6+IbYkTWUed9g==
X-CSE-MsgGUID: yiwutjz/RA+6eQA5Wo9W6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71244267"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.110.192])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 15:11:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 5/5] lib/igt_gt: Stop passing fd == -1 in
 igt_open_forcewake_handle()
Date: Mon, 23 Sep 2024 17:11:46 -0500
Message-ID: <20240923221146.125848-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240923221146.125848-1-lucas.demarchi@intel.com>
References: <20240923221146.125848-1-lucas.demarchi@intel.com>
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

If something like -1 is needed, then
igt_open_forcewake_handle_for_pcidev() should be used.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_gt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index c9fd9164f..ba4163c97 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -493,6 +493,7 @@ void igt_stop_hang_helper(void)
 
 /**
  * igt_open_forcewake_handle:
+ * @fd: drm fd - i915 or xe
  *
  * This functions opens the debugfs forcewake file and so prevents the GT from
  * suspending. The reference is automatically dropped when the is closed.
@@ -509,8 +510,10 @@ int igt_open_forcewake_handle(int fd)
 
 	if (is_xe_device(fd))
 		fn = "forcewake_all";
-	else
+	else if (is_i915_device(fd))
 		fn = "i915_forcewake_user";
+	else
+		return -1;
 
 	return igt_debugfs_open(fd, fn, O_RDONLY);
 }
-- 
2.46.1

