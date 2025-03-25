Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012B8C35FFC
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 13:08:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CA510E28A;
	Tue, 25 Mar 2025 13:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dR5P/AxK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1927510E54E
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 13:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742908128; x=1774444128;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EpEJw5CFjohDf8/h9t1eMwKHzMI33IGNifpKzgGp4es=;
 b=dR5P/AxKMFDs/RxCLuGs6Oeu5PEQKZA7uaLYiBE8D6eTaab2F3HEufys
 axe/ICGqIQ5QXeAQ2WtpZXB2sAUiIesH2/gWWzckYxIVb7nb/qrUOLPEp
 bgNUC6Sn+00UGokPjQGai+FZ4zUxwhmPKuWqSxhVDQlHtqyWecv1N0tHW
 a1ISUd/gp0ZnNotxTRzr8qdro1TfABKCEeFpnOPOLWO3Ah7VlkPPWYTj3
 BnqcAiKOtvwWm3uusEOqCadOmv6YmtLzdsA2PtPKVmAdUPybj+E0DXaSQ
 Tz/pAxAl4XnDWSoGwtklbWmr+9v8UjO2K3iJjLkVlY2ioO+Ypnh/hIxUT Q==;
X-CSE-ConnectionGUID: GuZF9+QcSeeDuXy7QHwLDQ==
X-CSE-MsgGUID: D/DPGaDTTYa/oEH4p8cHfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="43878234"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="43878234"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 06:08:48 -0700
X-CSE-ConnectionGUID: 7MDDp+y6QhauMz0E7kgukA==
X-CSE-MsgGUID: bU7RIAPORHSnAD2SGnTi6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="161584518"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.134])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 06:08:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>
Subject: [PATCH i-g-t] lib/dsc: use intel_display_caps instead of
 i915_display_capabilities
Date: Tue, 25 Mar 2025 15:08:42 +0200
Message-Id: <20250325130842.1821042-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Turns out we've added two similar files in kernel. Consolidate on
intel_display_caps as the more driver independent name.

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_dsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 8d259b7344a6..4caad39db7a9 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -56,7 +56,7 @@ bool igt_is_dsc_supported_by_source(int drmfd)
 	dir = igt_debugfs_dir(drmfd);
 	igt_assert(dir >= 0);
 
-	res = igt_debugfs_simple_read(dir, "i915_display_capabilities",
+	res = igt_debugfs_simple_read(dir, "intel_display_caps",
 				      buf, sizeof(buf));
 	close(dir);
 
-- 
2.39.5

