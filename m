Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FC0C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 08:31:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141AC10E5F4;
	Tue, 18 Jun 2024 08:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bj9szt1V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC9010E5E2
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 08:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718699464; x=1750235464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kEebWBDMME9ioMzrWyLwBGsvNzZ5IWzPWrV8JphQK9g=;
 b=bj9szt1VcLsn/110w8q/bz1ozEoQQoKjeho8BN490SpQ/7C3ZNVJy6H2
 DLiTZTdkjYtPv7YOnF/xlhY41iYhZWdCSekD9ASOiVN4UXFIKkFSAeiSV
 peY5mMbh+clC2KTP2NmTOWhZNX7PyJQ1FW4IRPBRH+kinPOnntEo7q2tZ
 ybHP0Nx60gmC/u8xYJJafV8blMCoPNBrmniq2DX7lJqBQvQqf95cRZIuC
 hJCJfgyHqNxxUTk9wCdepu5g/Ei36zzOL+pbfyL4IYfLZkq4ofr7genV8
 KOkkNQc4S6TTGN+ZQgfZAQHx9IQr2OeyKSRQq8Na8shV4QFmC8P2MB16l A==;
X-CSE-ConnectionGUID: bEPh1DgUR7WLzHDllzN8/g==
X-CSE-MsgGUID: H09GuDzuRI+MccYlSOe+1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="38082194"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="38082194"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 01:31:04 -0700
X-CSE-ConnectionGUID: y3+n+ljAS/6t8NfahdWQ+w==
X-CSE-MsgGUID: WhHYLDxsSHKioLFFbCnU+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="64699601"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 01:31:01 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	jeevan.b@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [i-g-t V6 6/8] tests/kms_flip: Force joiner support in bigjoiner
 checks
Date: Tue, 18 Jun 2024 13:52:46 +0530
Message-ID: <20240618082248.4070611-7-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
References: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
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
 tests/kms_flip.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index d352ee14c..cbabbe74f 100755
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
+			 "%s-%d",
+			 kmstest_connector_type_str(o->kconnector[i]->connector_type),
+			 o->kconnector[i]->connector_type_id);
+
+		if (i > 0)
+			snprintf(prev_conn_name, sizeof(prev_conn_name),
+				 "%s-%d",
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

