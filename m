Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB4CC04FF8
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 09:26:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE0D10FB5B;
	Thu, 18 Apr 2024 09:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWFj8SJs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB7910FB5B
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 09:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713432380; x=1744968380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DuT5X8C+xNx7LBkcm8BrKbfgeTSnwSEvZRGMcfpxuRg=;
 b=NWFj8SJs7bb8kF5hGbhNGwz6gXe2ud8JhTPIlTRwfhCWvjCH+zn+kSir
 LbSN9x0IL6jMQ/f9G0oaLgtBqt2rOXYt5LFh4p+M4Tc1VWvsK6kFkPGeb
 quRageZab8rRvyi79v73s7XCHRP58DypFGr97HGCDJCO63kCvgrp240F+
 zrX8zO0+Ux1GN9ZTwXSbLHhi31G7BeKqhdSm6w9UHmBWh03GW+R4qDXF9
 5Tsb8OrDeIihoHPX5/W9PhdSeqzXIQllhwT/t+JGkvaKHBNwbkA5YUz3m
 7hs09sDjypP4k7vACLzPjeyUPum7KXl8LZJVfJO5BJXNneziDlMnMocpi w==;
X-CSE-ConnectionGUID: wMBxVs3hQYK5760a82KCmQ==
X-CSE-MsgGUID: 7qFgo+XySDyRB1tTI6BeAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="31447807"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="31447807"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 02:26:20 -0700
X-CSE-ConnectionGUID: dD/60u+uTUW2Mm9FBBAohA==
X-CSE-MsgGUID: DkJq0gDnSL+L75WI2Ww4+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="53855403"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 02:26:17 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [i-g-t V2 5/6] tests/kms_setmode: Force joiner support in bigjoiner
 checks
Date: Thu, 18 Apr 2024 14:49:58 +0530
Message-ID: <20240418091959.781560-6-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240418091959.781560-1-bhanuprakash.modem@intel.com>
References: <20240418091959.781560-1-bhanuprakash.modem@intel.com>
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

As we recently introduced the option (through debugfs) to
force the bigjoiner, needs to extend the support in bigjoiner
checks to handle the force joiner.

V2: - Fix connector name

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_setmode.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 490bfd3dd..95c5bfadc 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -709,24 +709,38 @@ static void test_one_combination(const struct test_config *tconf,
 
 		for (i = 0; i < crtc_count; i++) {
 			struct crtc_config *crtc = &crtcs[i];
+			char conn_name[24], prev_conn_name[24];
+
+			snprintf(conn_name, sizeof(conn_name),
+				 "%s-%d",
+				 kmstest_connector_type_str(crtcs[i].cconfs->connector->connector_type),
+				 crtcs[i].cconfs->connector->connector_type_id);
+
+			if (i > 0)
+				snprintf(prev_conn_name, sizeof(prev_conn_name),
+					 "%s-%d",
+					 kmstest_connector_type_str(crtcs[i - 1].cconfs->connector->connector_type),
+					 crtcs[i - 1].cconfs->connector->connector_type_id);
 
 			/*
 			 * Handle BW limitations on intel hardware:
 			 *
-			 * if mode resolution > 5K (or) mode clock > max_dotclock,
+			 * if force joiner (or) mode resolution > 5K (or) mode clock > max_dotclock,
 			 * then ignore
 			 *   - last crtc in single/multi-connector config
 			 *   - consecutive crtcs in multi-connector config
 			 *
 			 * in multi-connector config ignore if
-			 *   - previous crtc (mode resolution > 5K (or)
+			 *   - previous crtc (force joiner (or) mode resolution > 5K (or)
 			 *     mode clock > max_dotclock) and
 			 *   - current & previous crtcs are consecutive
 			 */
-			if ((igt_bigjoiner_possible(&crtc->mode, max_dotclock) &&
+			if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
+			      igt_bigjoiner_possible(&crtc->mode, max_dotclock)) &&
 			     ((crtc->crtc_idx >= (tconf->resources->count_crtcs - 1)) ||
 			      ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx - crtc->crtc_idx) <= 1)))) ||
-			    ((i > 0) && igt_bigjoiner_possible(&crtc[i - 1].mode, max_dotclock) &&
+			    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
+					 igt_bigjoiner_possible(&crtc[i - 1].mode, max_dotclock)) &&
 			     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <= 1))) {
 				igt_info("Combo: %s is not possible with selected mode(s).\n", test_name);
 				goto out;
-- 
2.43.2

