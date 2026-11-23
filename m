Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B2B606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 07:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GICU5jOT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C45710E165;
	Mon, 23 Nov 2026 07:28:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547DB10E61E
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 07:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795418762; x=1826954762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DbqN5nUYkA5otzMPqN4kXAdZku8MEQ3QcRaCmuWgy9s=;
 b=GICU5jOTWs1Tw1h9ALWuW/b35KjfoI5meKGDfkw95gWua/FXMOYshRs+
 7cqbYnCdaulu03IYHFFlfNXPRI2tjnub+xG09pVWQ68VQ11Ov/43ATw66
 PK5lxl38DuFagpK5mhxaUdIwNlbmT5Xe7G89hcDtlT5hTJYb4jcKirHes
 E9eLGglXswZ4WAyAfLhMPrLtYF5wOejba7MEPLiNY5ps89z0xfYoo0DDh
 2eE/zOyLDimxVp6EGCNtv0dqNZ2KjWoQX9w6PFGsswBxNMPsH/rMm97oU
 VNz52FQ3PPfVGYowgXro+4hBiC4Q/mPxHWZJWw1jRA+N0fAzVrD/2gnpx Q==;
X-CSE-ConnectionGUID: 70qxRXFXQc6eEqlD+Al/VA==
X-CSE-MsgGUID: OA1JdWFQSw+QpIjxzmL8RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4225360"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4225360"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 23:26:01 -0800
X-CSE-ConnectionGUID: EokfZ0fMQdOu+cVCD5QVEw==
X-CSE-MsgGUID: MntEF6ZfSliO1mCl/v/8Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11241554"
Received: from shawnle1-z890-eagle-wifi7.itwn.intel.com ([10.225.64.208])
 by orviesa002.jf.intel.com with ESMTP; 22 Nov 2026 23:26:01 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lee Shawn C <shawn.c.lee@intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH v11 1/2] Revert "tests/kms_vrr: Start virtual RR test above
 midpoint to avoid mode fallback"
Date: Mon, 23 Nov 2026 07:24:08 +0000
Message-ID: <20261123072409.294287-2-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123072409.294287-1-shawn.c.lee@intel.com>
References: <20261123072409.294287-1-shawn.c.lee@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This reverts commit 862eb176244feac8ee711f381fe1be1fdc6a7ede.

The following patch will do full range testing. So no need to start at midpoint.

Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index a02106fa7599..0102afe203dc 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -1023,16 +1023,7 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
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

