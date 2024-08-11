Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BF7C52D7B
	for <igt-dev@archiver.kernel.org>; Sun, 11 Aug 2024 20:04:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C5410E02D;
	Sun, 11 Aug 2024 20:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GE0C0zoL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB1810E02D
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Aug 2024 20:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723406677; x=1754942677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fTVH7t8QVPcckZm3cDRoffPEepVWrYDrb/oMnZlJKxQ=;
 b=GE0C0zoLCUDIabDkQ4wikLbyMPEwv+M9lZR+hqm4sAu5LRvb0/X0qZe4
 W50GCLSKKMtLW3lStbFNbgjppXRMrIY/Y2pXiq5iGzi/rVxtwCb/GKnBR
 m5gi/J+U2yFs5l/F9XeZuoOF/MMDZarVr4UnEev0GYhRd/FDDAL5aA+tT
 IUkfA8RIb3hhrn/dodMv+y663HKLRak8jLGKtCUTKS9jql6hoGgJhN2o5
 LBFcAcBy8nUjnH/Ft/mXY0vIUqo1UMHpFrF96NGg6jelWG0wqmxiITmTB
 48sB4VEyyjddMKSpO1rZxE7jvHsj5R/9rc4jC+zXUAZS9kn2XJWF23GBu g==;
X-CSE-ConnectionGUID: M9RW48LwToe4ZhcfCdUGPg==
X-CSE-MsgGUID: 3/0rTxWBSv+E6nCoinPRNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21364033"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; d="scan'208";a="21364033"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 13:04:37 -0700
X-CSE-ConnectionGUID: LOfApdxXSpq/VyKN5IvrMw==
X-CSE-MsgGUID: nCnxPilaSeWi73Squ4r+kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; d="scan'208";a="88712440"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 13:04:36 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jeevan.b@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v4 2/4] tests/intel/kms_pm_dc: Update test duration to 4
 seconds
Date: Mon, 12 Aug 2024 01:33:57 +0530
Message-ID: <20240811200359.1086166-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240811200359.1086166-1-ramanaidu.naladala@intel.com>
References: <20240811200359.1086166-1-ramanaidu.naladala@intel.com>
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

Certain features can prevent timely entry into the C10 state,
causing inconsistent results. So increase test time to get
accurate results.

v2: Split the patch into two. (Kamil)
v3: Declare variable in new line. (Suraj)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel/kms_pm_dc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 367bf4303..565c3d48d 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -591,7 +591,8 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
 static void test_deep_pkgc_state(data_t *data)
 {
 	unsigned int pre_val = 0, cur_val = 0;
-	time_t start = time(NULL), duration = 2, delay;
+	time_t start = time(NULL);
+	time_t duration = 4, delay;
 	enum pipe pipe;
 	bool pkgc_flag = false;
 	bool flip = true;
-- 
2.43.0

