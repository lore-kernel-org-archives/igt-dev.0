Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD7CEE57D4
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 20:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B22710EA96;
	Wed, 11 Sep 2024 20:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gd3GiAEJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E225310EA96
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 20:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726086286; x=1757622286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b8TSNsHSyCLIf0fBcIRDUI1eEY8YTUOrb0BVbcVeNUo=;
 b=Gd3GiAEJ8kT+bg7bsDHq3T/Yz98vlCWQcf8X+qsng/rfPu7O2BDghgDR
 3KuTCwOSDESViZVloLkKwQbY2+Grk/It3GD4pCnbvpQVM2UTAn4E4tC1N
 G2JMT02HLRBq8YjK7D8hbxS/2z712k3ys4Gbe+exMJuSyUN5eY/nOawkP
 HUBhX4Y38RNqp+pL5bGIt5cEsI1UElFXYj+qCRKRzk2Eg+xK7ftuo4jd+
 uzMSaAYI92QUxhysSWMq42E8HIkGeg+foErDcpB9WxTMZR1hgDWbLqi1J
 O4C7tvl88zmricFRkmpRJ6P+Ck14Gh0ptow9/Rk0vxx4xk1gutIIEDlFr g==;
X-CSE-ConnectionGUID: 4R9FPg10Qy6YHCKAR5WImw==
X-CSE-MsgGUID: IyZ6ILY1Q3mWYqDyvP7qbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="35503421"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="35503421"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:24:46 -0700
X-CSE-ConnectionGUID: Zo8BubC3TAS8UNwxijvuEQ==
X-CSE-MsgGUID: 54XzES7iSzaBPSLJsilS5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="72078281"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 13:24:44 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 2/2] lib/igt_psr: Fix PR state check for DisplayPort
 connectors
Date: Thu, 12 Sep 2024 01:54:08 +0530
Message-ID: <20240911202408.1665929-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240911202408.1665929-1-ramanaidu.naladala@intel.com>
References: <20240911202408.1665929-1-ramanaidu.naladala@intel.com>
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

The PR state check logic has been updated to handle DisplayPort
connectors.

v1: Update connecter logic for PR tests.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/igt_psr.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 222e05e6c..99f08f3c2 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -77,12 +77,11 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 	if (mode == PR_MODE || mode == PR_MODE_SEL_FETCH) {
 		igt_assert_f(output, "Output not given\n");
 		c = output->config.connector;
-	}
-
-	if ((mode == PR_MODE || mode == PR_MODE_SEL_FETCH) &&
-	    c && c->connector_type == DRM_MODE_CONNECTOR_eDP)
-		state = "SLEEP";
-	else if (mode == PSR_MODE_1 || mode == PR_MODE || mode == PR_MODE_SEL_FETCH)
+		if (c->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
+			state = "SRDENT_ON";
+		else if (c->connector_type == DRM_MODE_CONNECTOR_eDP)
+			state = "SLEEP";
+	} else if (mode == PSR_MODE_1)
 		state = "SRDENT";
 	else if (mode == PSR_MODE_2 || mode == PSR_MODE_2_SEL_FETCH)
 		state = "DEEP_SLEEP";
-- 
2.43.0

