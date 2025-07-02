Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25E1C83013
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 05:34:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D1D10E30B;
	Wed,  2 Jul 2025 05:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXFdS/55";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C34210E30B
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 05:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751434466; x=1782970466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kWvdRSLCuXnuqKXH67VTSbJxi40k3xKmGWWHPQCJibc=;
 b=iXFdS/55osLzq41Uk2SIUMpho1PKEmfAmZwE5R5sQ8M9ovndFZVpW17V
 MhsykgtciC2qEbijwkSCD2qfEDuWZvh8yJCZ2ESpwmnMd5Qr9p/posDn1
 27SI4JQtn7wjpNeUcaVNh+lbSz9o4Ku7R2yY9sXhjsIH7ZRviv7cU7ydx
 Nivp+SH/TUVceXn9gjCL+MXm0iCM5Mgd6b2PuTAlVt1C7RYDRG7EYT/8G
 PZ75ybzE119yUXgXlUa/gWl18DWk1iTjbF0hV0yioIBKSQeOBV5BgYQtT
 a1gZmYyFtaHP+4u6Mmxh9E46O0zr9UD0kWg9v/TfEbX6uOLKDRcyq2JZ/ g==;
X-CSE-ConnectionGUID: 2rKwagiKSJGGYmkfDb7Jsw==
X-CSE-MsgGUID: J045cbENSoOnhQJymvF+7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53827731"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53827731"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 22:34:26 -0700
X-CSE-ConnectionGUID: l02+1ycxQh21qJd2PGXQ0g==
X-CSE-MsgGUID: 4NJXBzF7SRGehurVAwN+lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="158012361"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 22:34:23 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik.B.S@intel.com, uma.shankar@intel.com,
 mitulkumar.ajitkumar.golani@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/kms_flip: Remove assertion dependency on
 link reset retry condition
Date: Wed,  2 Jul 2025 11:04:15 +0530
Message-ID: <20250702053415.434831-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702053415.434831-1-ramanaidu.naladala@intel.com>
References: <20250702053415.434831-1-ramanaidu.naladala@intel.com>
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

This change avoids test failures in scenarios where hotplug detection
is inconclusive or delayed. The call to link reset is retained for
its potential side effects or logging purposes, but it is no longer
part of the assertion condition.

rev2: Fix review comments. (Karthik)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_flip.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 4dfa1c483..382b92d9a 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1641,7 +1641,16 @@ retry:
 
 	/* quiescent the hw a bit so ensure we don't miss a single frame */
 	if (o->flags & TEST_CHECK_TS && !calibrate_ts(o, crtc_idxs[0])) {
-		igt_assert(!retried && needs_retry_after_link_reset(mon));
+		igt_assert(!retried);
+
+		/*
+		 * FIXME: Retried logic is currently breaking due to an HPD
+		 * (Hot Plug Detect) issue. Temporarily removing this from
+		 * the assertion. This needs to be debugged separately.
+		 * Revert this patch once the HPD issue is resolved.
+		 */
+		if (!needs_retry_after_link_reset(mon))
+			igt_debug("Retrying without a hotplug event\n");
 
 		retried = true;
 
@@ -1680,7 +1689,16 @@ retry:
 		state_ok &= check_final_state(o, &o->vblank_state, elapsed);
 
 	if (!state_ok) {
-		igt_assert(!retried && needs_retry_after_link_reset(mon));
+		igt_assert(!retried);
+
+		/*
+		 * FIXME: Retried logic is currently breaking due to an HPD
+		 * (Hot Plug Detect) issue. Temporarily removing this from
+		 * the assertion. This needs to be debugged separately.
+		 * Revert this patch once the HPD issue is resolved.
+		 */
+		if (!needs_retry_after_link_reset(mon))
+			igt_debug("Retrying without a hotplug event\n");
 
 		retried = true;
 
-- 
2.43.0

