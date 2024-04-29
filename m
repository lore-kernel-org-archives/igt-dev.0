Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809CFC4345F
	for <igt-dev@archiver.kernel.org>; Mon, 29 Apr 2024 09:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156D410FE32;
	Mon, 29 Apr 2024 09:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OhCDEmoI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8978010FE32
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Apr 2024 09:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714382170; x=1745918170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nMwcvvaaqLqNV+sa/Cfza5Ea7P6r6WxfA6sCB5bN+ok=;
 b=OhCDEmoIaZirHIk3mXO+WbXkCtkK1/ViB0snYJW4K0k9fPFElMxrW04z
 mqOYDihRGNLE7D9ZmfTto4CLI32hHL1bCNLyfbtGLcKJFlFDdZy5VSoZC
 VI7DrNlSjo81Re7ocwYyVG/4kbQ+bbPBPv1lg440QUAfOGoiU6yYZ2+Ww
 nVyvteWarxdLrmXwvuSsEfDUfXQFnHq4KF59ZL90rcRz130i8mD1xfGhP
 f4yOk3S9RglS93PY3DVoYcpuDTcfp5BVqubLl0oBIAat/4o9RsdXEyWCu
 9dVuCajVwlbQytOno4kEJMUWBc1SqroevfKwUCjqelrJJ1rAB9OZNlUzK Q==;
X-CSE-ConnectionGUID: Ab/V415BSgOwxQ3sNydQxQ==
X-CSE-MsgGUID: BplWRgJZRfCczfgOhzg+aA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="35428326"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="35428326"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:16:10 -0700
X-CSE-ConnectionGUID: mD10X3XJT9WHx9wxVo4HRg==
X-CSE-MsgGUID: +ooYISB7RtqAut1hh+wB7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26059879"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:16:09 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [i-g-t V5 6/8] tests/kms_flip: Force joiner support in bigjoiner
 checks
Date: Mon, 29 Apr 2024 14:39:28 +0530
Message-ID: <20240429090930.1905110-7-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240429090930.1905110-1-bhanuprakash.modem@intel.com>
References: <20240429090930.1905110-1-bhanuprakash.modem@intel.com>
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

