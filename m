Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FA6C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 06:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35AE910E57A;
	Tue, 18 Jun 2024 06:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dIy+7Px0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF04110E570
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 06:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718692190; x=1750228190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Isv5nydhauJdJizt8JN+D++uS0aDY+yciiyx9bjFw08=;
 b=dIy+7Px0bg4lrNUAgq8uZG6WuqFbtqqrtq9v11duIq0P/GaZPyR354ZB
 y+b3RrKqH6DXsy4iXKjP2TZEa8HeBRIefLT3dEgnlgFlAPhMUQB6CGacB
 zlQb5KMNQs1XZUsVOC1AWVudU1juWL7z5VZhijhgaE503WhM5G2iPywLN
 9deKc+c19yn8xiBzio52tAeuZQKDnockyZ8G1evtYKSx426QgzokB7kdN
 rXIlTbw+I5YOmM7Os9R1JMcS9up2ISNC1HzqXi7M9+1Sp3BKIf0ic0Tf4
 mYhcr6+pXDVETxeP+oEsvXpSuELRgmcyOXob/0PB0plXzColgtU0u0V9J A==;
X-CSE-ConnectionGUID: y9H9hzHOQeKOj2WErxVMVw==
X-CSE-MsgGUID: THSW/jbOSaG3ok+RwT3h6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26177399"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26177399"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 23:29:50 -0700
X-CSE-ConnectionGUID: HMOh8pjtQS2GcKU9TSVkdQ==
X-CSE-MsgGUID: a7hiSMILSxKl+X1OeDp66Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41360314"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 23:29:49 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Jeevan B <jeevan.b@intel.com>
Subject: [i-g-t V6 1/6] lib/igt_kms: Check validity of the selcted pipe/output
 combo
Date: Tue, 18 Jun 2024 11:51:45 +0530
Message-ID: <20240618062150.4004768-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240618062150.4004768-1-bhanuprakash.modem@intel.com>
References: <20240618062150.4004768-1-bhanuprakash.modem@intel.com>
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

Add a check to identify the selcted pipe/output combination is
valid or not.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_kms.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index af63d13b1..2e6f44e3c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6480,18 +6480,21 @@ bool intel_pipe_output_combo_valid(igt_display_t *display)
 	int combo = 0;
 	igt_output_t *output;
 
-	if (!is_intel_device(display->drm_fd))
-		return true;
-
 	for_each_connected_output(display, output) {
 		if (output->pending_pipe == PIPE_NONE)
 			continue;
 
+		if (!igt_pipe_connector_valid(output->pending_pipe, output))
+			return false;
+
 		combo++;
 	}
 
 	igt_assert_f(combo, "At least one pipe/output combo needed.\n");
 
+	if (!is_intel_device(display->drm_fd))
+		return true;
+
 	/*
 	 * Check the given pipe/output combo is valid for Bigjoiner.
 	 *
-- 
2.43.2

