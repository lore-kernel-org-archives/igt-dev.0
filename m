Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8969C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 06:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457CF10E586;
	Tue, 18 Jun 2024 06:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cxih1hFQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBEC910E583
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 06:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718692324; x=1750228324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Isv5nydhauJdJizt8JN+D++uS0aDY+yciiyx9bjFw08=;
 b=Cxih1hFQ3smu9LnEZM/orAcwk+ahpF23C8qRu8lXk5c9G0+gj8FmOzkS
 v1ApOtSecCoeD902Q/TATnK0CYmbI3ljrvnrm/rYl1cmMq7RzBE0Mu4CF
 ctocxY/awnyQgIf1X8uju4L7AazFABuUvr4PfvVpXWYDVDUtJsOe7qnIy
 qZniPZiqA0XGFsBktJ+N+7+qXVDxcGWE3FcuzasCY/5TNDCyklV3JXdG7
 mefV1sCQIe0RhiY9pH64ZRgfy+msWcemR1AG9H1CaSbj67dxDpuF9szk1
 0ZCOLjYpjOg65h9IyhYcF61L7G3+4+/edR183ZlI2dOHV/fMeGQ0WnULU w==;
X-CSE-ConnectionGUID: bG2tgHcnQhept1L6OplgVg==
X-CSE-MsgGUID: MjYenmBXR5Ctm/NVgOpdFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26960441"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26960441"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 23:32:04 -0700
X-CSE-ConnectionGUID: I/IWcoaGSCWgSX2wPdozWQ==
X-CSE-MsgGUID: 67tyi9LOSGqLwBKHx7Lg5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41304948"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 23:32:02 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Jeevan B <jeevan.b@intel.com>
Subject: [i-g-t V6 1/6] lib/igt_kms: Check validity of the selcted pipe/output
 combo
Date: Tue, 18 Jun 2024 11:54:00 +0530
Message-ID: <20240618062405.4004955-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240618062405.4004955-1-bhanuprakash.modem@intel.com>
References: <20240618062405.4004955-1-bhanuprakash.modem@intel.com>
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

