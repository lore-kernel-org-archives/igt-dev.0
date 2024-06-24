Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB97C2D0D1
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 07:06:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C0010E371;
	Mon, 24 Jun 2024 07:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QB6Utf+s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE0910E370
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 07:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719212770; x=1750748770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JJrQTwv46GxGnAlgUjbDRoMoDUfZaGFTV8NSQ2ye7zU=;
 b=QB6Utf+sOlX2V6RFG2V/RpDSHFbGvKGCrCFLnoLaaNFlrbJvYPxLPD8M
 lAGyKJkDEInvNVhiykDCjiA+GxWVgJBXne/8iTW0WkoRiUIZn6Qm6vhoV
 HxFwBqzsLZ8/K/yzgFTvncGsQgNqFlxk5UgG3TN4lkHYksQEVEyMhgOVa
 t8kW8wHgslCVITa5i4oOizIkplMQaYgygRkAevH6NmLlynRrzFahKXxEM
 zshVKsjJHTDTLbir7MB9yd/YUtZsF4ZQn2tf3lje6zVMt37LgKe6OQC+l
 3qEiK+1TXyrkR4z0RqvguflJZ6+5N7ja4ivVjtksNYlAbdU5Cv/Rornx+ Q==;
X-CSE-ConnectionGUID: HhQBKvM7Sz6OJemshf484w==
X-CSE-MsgGUID: LucmFxfgTSayOymsquVtSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="15921317"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="15921317"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:06:10 -0700
X-CSE-ConnectionGUID: UZXG5Vc/SLqoBRIsGS7MCQ==
X-CSE-MsgGUID: Wb0De+YNTj6diB1NP/Sfvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="48372205"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 00:06:09 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH 1/2] lib/igt_debugfs: handle xe driver as well
Date: Mon, 24 Jun 2024 12:48:04 +0530
Message-Id: <20240624071805.1356668-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240624071805.1356668-1-kunal1.joshi@intel.com>
References: <20240624071805.1356668-1-kunal1.joshi@intel.com>
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

add support for xe driver as well

Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index a7b54bae5..f4f749e30 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -502,7 +502,7 @@ bool igt_ignore_long_hpd(int drm_fd, bool enable)
 
 static void igt_hpd_storm_exit_handler(int sig)
 {
-	int fd = drm_open_driver(DRIVER_INTEL);
+	int fd = drm_open_driver(DRIVER_INTEL | DRIVER_XE);
 
 	/* Here we assume that only one i915 device will be ever present */
 	igt_hpd_storm_reset(fd);
-- 
2.25.1

