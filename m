Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EACC001CC
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 14:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EA71135C8;
	Wed, 17 Apr 2024 14:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9PlFwKq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EAD1135C0
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 14:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713364784; x=1744900784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q7XNRz81e6gyBsKHaR/JhXzyuk162u9RWv/6fVoBw28=;
 b=X9PlFwKqbNUomCZEw0zyWppxrt4iqVJuC7ykUo48DncFokvmlX+jQu2j
 vaXOw5kXhIQc3GBJ/flq93vssEvosMTUzcs92UXlBnM5lfAQBH/3awmoW
 Lf/j8oeuW7YuVBvZ12TeUkk2yhjzcxJ68ch/FFrvWKQSXaiYxdLmWN3CZ
 ZiIxC12SLPPAnbDNB9ws8rpLtwynT/gdEsWcKr1P/nilRd0camlcwf4Pn
 jSXcGnmORHLBHtfFuLksAVkw0wbm/1gaKRPz34zXyhB4pHQ2bkz0LsbIt
 fDd+tqGLqs4F/IG65VTEnkyeVbSx/LHAYXyKvDFImQ87T/l3FBR3+GUk4 g==;
X-CSE-ConnectionGUID: vHODCW24TRG1p3LPOCX5uA==
X-CSE-MsgGUID: iqlhB+SLSzucJh0FIRLxOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9083661"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="9083661"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:39:43 -0700
X-CSE-ConnectionGUID: ZVuNQ/R1Qj64WCL+34Vdhg==
X-CSE-MsgGUID: QSaheDl3Sf6mKLjzFFkWWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="53859893"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:39:42 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 4/6] tests/kms_flip: Force joiner support in bigjoiner
 checks
Date: Wed, 17 Apr 2024 20:03:23 +0530
Message-ID: <20240417143325.720515-5-bhanuprakash.modem@intel.com>
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
 tests/kms_flip.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 15c3b5ba2..18729c890 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1730,22 +1730,37 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 	/*
 	 * Handle BW limitations on intel hardware:
 	 *
-	 * if mode resolution > 5K (or) mode clock > max_dotclock, then ignore
+	 * if force joiner (or) mode resolution > 5K (or) mode clock > max_dotclock, then ignore
 	 *  - last crtc in single/multi-connector config
 	 *  - consecutive crtcs in multi-connector config
 	 *
 	 * in multi-connector config ignore if
-	 *  - previous crtc (mode resolution > 5K or mode clock > max_dotclock) and
+	 *  - previous crtc (force joiner or mode resolution > 5K or mode clock > max_dotclock) and
 	 *  - current & previous crtcs are consecutive
 	 */
 	if (!is_intel_device(drm_fd))
 		goto test;
 
 	for (i = 0; i < crtc_count; i++) {
-		if ((igt_bigjoiner_possible(&o->kmode[i], max_dotclock) &&
+		char conn_name[24], prev_conn_name[24];
+
+		snprintf(conn_name, sizeof(conn_name),
+			 "%s%d",
+			 kmstest_connector_type_str(o->kconnector[i]->connector_type),
+			 o->kconnector[i]->connector_type_id);
+
+		if (i > 0)
+			snprintf(prev_conn_name, sizeof(prev_conn_name),
+				 "%s%d",
+				 kmstest_connector_type_str(o->kconnector[i - 1]->connector_type),
+				 o->kconnector[i - 1]->connector_type_id);
+
+		if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
+		      igt_bigjoiner_possible(&o->kmode[i], max_dotclock)) &&
 		     ((crtc_idxs[i] >= (total_crtcs - 1)) ||
 		      ((i < (crtc_count - 1)) && (abs(crtc_idxs[i + 1] - crtc_idxs[i]) <= 1)))) ||
-		    ((i > 0) && igt_bigjoiner_possible(&o->kmode[i - 1], max_dotclock) &&
+		    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
+				 igt_bigjoiner_possible(&o->kmode[i - 1], max_dotclock)) &&
 		     (abs(crtc_idxs[i] - crtc_idxs[i - 1]) <= 1))) {
 
 			igt_debug("Combo: %s is not possible with selected mode(s).\n", test_name);
-- 
2.43.2

