Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E74C04FFF
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 14:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14B41135C9;
	Wed, 17 Apr 2024 14:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cBZvyi2W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B201135C6
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 14:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713364785; x=1744900785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FYDoUuxhTGBb7gYCXC7drEHYQLeaRIVRbYGy0kZndXg=;
 b=cBZvyi2WuicpwMzWs9MYvHf2bz4vS3N3c377aXVw1lx1mfR4FIaRNc4N
 kCfTzKeeUOTo8vcShOSdNEAPpa4sI3tZVA7o62oNbVMPgNagPMGS+AQSR
 /gptaEnAQlL/3k8rT6LxD/sVfaK4/tEadw92JlXPUjMMU2i07DEgHqwBJ
 GGMAl1AvQRLY1NoR4tDLZO2vWEaaRXMTgVxAojneBNDJeDKRMDFSm7Qe8
 +exUUYq7F/WhRoQOQQ737EOIwd+YPVCzYedyHWZcl57cYzCkGrtlI7cKs
 YWHa3FMYBwTT5NsTHUizs22mQKsli2D0B/EEf44YdLDZ9KMo++hUHJef4 Q==;
X-CSE-ConnectionGUID: wFIYhQ6XTZ+T99nLc0ZBbA==
X-CSE-MsgGUID: 8hQZ077GRnmnWO5l2njUxw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9083666"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="9083666"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:39:45 -0700
X-CSE-ConnectionGUID: cFfpPjaKRImrPCBWzfMjQg==
X-CSE-MsgGUID: b6bFni3HRSirnwDpvtirRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="53859896"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:39:44 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 5/6] tests/kms_setmode: Force joiner support in
 bigjoiner checks
Date: Wed, 17 Apr 2024 20:03:24 +0530
Message-ID: <20240417143325.720515-6-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240417143325.720515-1-bhanuprakash.modem@intel.com>
References: <20240417143325.720515-1-bhanuprakash.modem@intel.com>
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

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_setmode.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 490bfd3dd..9559dc472 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -709,24 +709,38 @@ static void test_one_combination(const struct test_config *tconf,
 
 		for (i = 0; i < crtc_count; i++) {
 			struct crtc_config *crtc = &crtcs[i];
+			char conn_name[24], prev_conn_name[24];
+
+			snprintf(conn_name, sizeof(conn_name),
+				 "%s%d",
+				 kmstest_connector_type_str(crtcs[i].cconfs->connector->connector_type),
+				 crtcs[i].cconfs->connector->connector_type_id);
+
+			if (i > 0)
+				snprintf(prev_conn_name, sizeof(prev_conn_name),
+					 "%s%d",
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

