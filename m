Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63FACD98E2
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 06:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7715910E94E;
	Wed, 17 Jun 2026 06:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i//jZLxv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E610610E0A5
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 06:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781678976; x=1813214976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=09k2KsuClb2WfYZtZVvDiogGFj07TMLS9GGuUtVmIeo=;
 b=i//jZLxvT21QJ6Xi72hOKZqiH0c5aTFtuC10gmviacx8c1RqvgR1AeOT
 PmWe6lPmoYZsiwfXvc1tJfJgqcmRFAQy5plO0V58Ed6R90wCrSy7mB3Pv
 G6aY19tiFEZyE3i8E+G/CQWxpLv1Mdukvm0HCQ1uU/DG1vHPqK+/IBeY1
 2KKb3rkGzKJYHMzvlidt5NeRtpUHptnYeo5kGGNYXynkfdGvvhgbsZE4F
 U387oo51DPBbItWOXQ+Yu7PPNNr0+Q5Q8WgqV7rfCRAyA7V+HOJx95TMq
 0IDvX3Dr1TuVyErDgbelncb80Oe/Uih6/q5wJ2TOWiUlIWuL/8LwESaCp g==;
X-CSE-ConnectionGUID: oIyjqStxRnaqycJIgWfOJw==
X-CSE-MsgGUID: qCWl1R4XSRW8OSPb5aaJOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="86305074"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="86305074"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 23:49:36 -0700
X-CSE-ConnectionGUID: IVa78t1xQEqItS9J33D0iQ==
X-CSE-MsgGUID: 71rdjH4/Spug+E694kWSYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="248046600"
Received: from shawnle1-z890-eagle-wifi7.itwn.intel.com ([10.225.64.208])
 by orviesa007.jf.intel.com with ESMTP; 16 Jun 2026 23:49:34 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lee Shawn C <shawn.c.lee@intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH v9 1/2] Revert "tests/kms_vrr: Start virtual RR test above
 midpoint to avoid mode fallback"
Date: Wed, 17 Jun 2026 07:48:46 +0100
Message-ID: <20260617064847.860438-2-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617064847.860438-1-shawn.c.lee@intel.com>
References: <20260617064847.860438-1-shawn.c.lee@intel.com>
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

This reverts commit 862eb176244feac8ee711f381fe1be1fdc6a7ede.

The following patch will do full range testing. So no need to start at midpoint.

Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 6043d40f1d74..8f5c4a7c1501 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -786,16 +786,7 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
 	/* Switch to Virtual RR */
 	virtual_mode = *igt_output_get_mode(output);
 
-	/*
-	 * Start virtual RR testing from above the midpoint of the VRR range when multiple
-	 * modes are available. This avoids the driver mode adjustment. which can cause an
-	 * unintended clock change.
-	 */
-	vrefresh = (output->config.connector->count_modes > 1) ?
-		   (((data->range.max + data->range.min) / 2) + step_size) :
-		   data->range.min + step_size;
-
-	for ( ; vrefresh < data->range.max; vrefresh += step_size) {
+	for (vrefresh = data->range.min + step_size; vrefresh < data->range.max; vrefresh += step_size) {
 		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
 
 		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
-- 
2.53.0

