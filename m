Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34E7C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 09:26:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E6F10FB59;
	Thu, 18 Apr 2024 09:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="avs/1Suc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C6110FB59
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 09:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713432378; x=1744968378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nMwcvvaaqLqNV+sa/Cfza5Ea7P6r6WxfA6sCB5bN+ok=;
 b=avs/1SucxSAWDB8NqYltXDSbXl58YhfAiJxACTx9CoysmUDvoAflevLW
 yG27xearjl9LOWJ5HXTr9Wju20RIez9jwtcKfYaS1HiT70nivVS8h5diJ
 1nv9Um4pYKvcFgHlg+vblYwZPq1rnxs7iXnmU6oIVPouk0QSluYNamCnz
 5QPwWsQwbbxWadAOI4JmlK6+it1RpmR0Mg6s0tYxaxj6aL9/5kmQzDE2+
 w6XMFjjhqpR+NVaFnydJonO6p+vSuZ1UOvurmyP6BDPy22jglyGS+Fkn7
 Tm/jhy8+dVNdBzA9FfVKxx7oG+pSJjWrJURObN90uFAiO34v3Wl8+QJoy A==;
X-CSE-ConnectionGUID: vkNwpzHFQhCh9zD/exf7ag==
X-CSE-MsgGUID: GVdN+w/yTqaHVMGh0UqTJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="31447802"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="31447802"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 02:26:18 -0700
X-CSE-ConnectionGUID: QbH07uCiQbunJJ1WDPGiWA==
X-CSE-MsgGUID: WEHdadCsQqKiwyOhiccm3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="53855396"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 02:26:15 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [i-g-t V2 4/6] tests/kms_flip: Force joiner support in bigjoiner
 checks
Date: Thu, 18 Apr 2024 14:49:57 +0530
Message-ID: <20240418091959.781560-5-bhanuprakash.modem@intel.com>
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
 tests/kms_flip.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 15c3b5ba2..57f6cff7a 100755
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

