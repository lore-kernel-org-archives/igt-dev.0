Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F824CF58C5
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 03:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9F610E2D2;
	Fri, 20 Sep 2024 03:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mLfuk/x3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED3F10E2D2
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 03:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726804214; x=1758340214;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qN1Xms3AD0SUTo650vLstCZgP5/ocDeKSBWl4U5a8Ak=;
 b=mLfuk/x37macgMFklh57BPuGD2QhUJjkN4wOQl8SK+rxu3QtFMBTvhEa
 XqIi22diKAH7cnq7uzJJlokaDz02wXpxsNunHE/qJ0YtAbJcoRRj33Fbm
 pdzIYAfri4SusEpOzFKeeNv7jdLonu/2Uv7x4tpgFJbDggiOS2AVxHKQX
 qVEZxrpTysh1DOM5XMM/1DS1fpiugw47KSBgGDaeLRuYmsW4/F8y+U6GH
 PxG7/24xCMwLz6PT27VaVz0sJCOO4VvoJ5SZril0pGIzEwc4egLo/vt3L
 4qP4h6+D5/Exm5NrDguAFO8pmFw5qGKFpsbLustLecrP0Mwm5X+9NIN8y g==;
X-CSE-ConnectionGUID: 0GXEv2i9TQCGdId6+kBaQg==
X-CSE-MsgGUID: kgq5NNffR7Wyq7GBSn5FXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="36931293"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="36931293"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 20:50:14 -0700
X-CSE-ConnectionGUID: rqgYov9KSmiYoaoMd2/fKA==
X-CSE-MsgGUID: mBtCZzoiSJiS2YKs/p1obw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="70287177"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 20:50:12 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Jeevan B <jeevan.b@intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH] tests/intel/kms_psr2_sf: Add eDP check for Early Transport
Date: Fri, 20 Sep 2024 09:32:06 +0530
Message-Id: <20240920040206.1206695-1-jeevan.b@intel.com>
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

On current platforms early transport is supported on eDP only
so avoiding assert for other connector.

v2: Add checks to handle crashes and fix typo.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel/kms_psr2_sf.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index a9be1a1ec..847f181d3 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -935,9 +935,11 @@ static void run(data_t *data)
 							  data->pipe),
 							  "FBC still disabled\n");
 
-	if (data->et_flag)
+	/* TODO: Enable this check if other connectors support Early Transport */
+	if (data->et_flag && data->output != NULL &&
+	    data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
 		igt_assert_f(early_transport_check(data->debugfs_fd),
-			     "Early Trasport Disbaled\n");
+			     "Early Transport Disabled\n");
 
 	data->screen_changes = 0;
 
-- 
2.25.1

