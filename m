Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC52CC10F15
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 12:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B5B113369;
	Tue, 23 Apr 2024 12:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IwHEJhxI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F4510FC3C
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 12:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713875586; x=1745411586;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DuT5X8C+xNx7LBkcm8BrKbfgeTSnwSEvZRGMcfpxuRg=;
 b=IwHEJhxIG7KX61eA7JDOAUVBt5oupalZBGj3D1Xx+BPjjKCO2UecpuPs
 B/B9lnII0DrB9fej4pOw4EdFD0mXq7gZ9IxLWqAo5+5B+bznRk4h0NYeC
 LNZgYqiCdVkx/Zmb9rj05aYHI1sMFHdm625AUR4TWnUKli9mPhaiTVPyP
 IqgEPc9g5cC54wtsl4ulBU2zmjbE7cRHoVvMJMsbZy6ogrWpGTLdXSks/
 r2Ao5g606sJmb2DAQSKx6IScZf5MyCSZ9q9xG51YuXxifEgP39Nr4OJBQ
 LyhrP9tszzrHGoeIBRTO8l6cD0UrQkYxgVvIOsmBDHLLzw4Yco6hUUSGq A==;
X-CSE-ConnectionGUID: 7McyzoHAQoitNGobw5vENg==
X-CSE-MsgGUID: PDImz0rST8aH6rXEldWuwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20067059"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20067059"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 05:33:06 -0700
X-CSE-ConnectionGUID: TQkdHoOrR7qCijKV/fq/9w==
X-CSE-MsgGUID: LcXXXrRrS/KK+edfFEA7Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24361363"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 05:33:04 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [i-g-t V4 6/7] tests/kms_setmode: Force joiner support in bigjoiner
 checks
Date: Tue, 23 Apr 2024 17:56:35 +0530
Message-ID: <20240423122636.1241111-7-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240423122636.1241111-1-bhanuprakash.modem@intel.com>
References: <20240423122636.1241111-1-bhanuprakash.modem@intel.com>
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

