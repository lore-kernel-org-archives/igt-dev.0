Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3DDCD128A
	for <igt-dev@archiver.kernel.org>; Mon,  8 Apr 2024 06:18:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39C3112112;
	Mon,  8 Apr 2024 06:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+5jIGyQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A167112112
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2024 06:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712557111; x=1744093111;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GMHcaRBuE/rCrpjDTOZkwjIJfjTp3U1/LMF0PWFu4+0=;
 b=R+5jIGyQwOBezSe4L+kJHvSrJysHLNh7UEjrOoXD6ZPvhbLqFQ2fL15G
 6Oo0jyZjoTznmkBq+UPG1/XcWS8WBZ6FembfzNDYwu7LuQML9CnRP0M9K
 17OkPijyhKMK78u4PsecRr0/Rt6s4w2N/5LX2UdMYnm7y+pmpyYLCSzE3
 jMcrJ+b+v7yHNYi49lJS9vMICG/7T3iP5I7nUtkRbQAuB78JL5iZL0gAj
 i8Yl6T+4z533I/OFJcPMQjHwsWoh99nwdVY/JC2qzVajVjra2aQV1QOEV
 uhhlqQKPlJ9avfXBzOSEPBLRks0BXMpZ+J5qcaOTiVnvrQz8CcfXfWbwq g==;
X-CSE-ConnectionGUID: G0sbRD6GT0ScW+tqeltXRQ==
X-CSE-MsgGUID: wBRaS9SzRbiUQeFhRGIfCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7940235"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7940235"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2024 23:18:15 -0700
X-CSE-ConnectionGUID: vK9Zx3HqS9m+H957VnvIOw==
X-CSE-MsgGUID: xRsyQvI8Q9ale3p/S8QdkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="50976975"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2024 23:18:14 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 1/5] lib/igt_kms: Check validity of the selcted
 pipe/output combo
Date: Mon,  8 Apr 2024 11:42:17 +0530
Message-ID: <20240408061221.291523-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240408061221.291523-1-bhanuprakash.modem@intel.com>
References: <20240408061221.291523-1-bhanuprakash.modem@intel.com>
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
---
 lib/igt_kms.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2a518eb8d..8eb3b877c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6347,18 +6347,21 @@ bool intel_pipe_output_combo_valid(igt_display_t *display)
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

