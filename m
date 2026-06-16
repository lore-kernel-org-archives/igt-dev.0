Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B01CD98CF
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 09:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34E110E944;
	Tue, 16 Jun 2026 09:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9VOMtSA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63E010E944
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 09:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781600785; x=1813136785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OmM8ok2Py9tckDM6RyAjftdAF/kNPuy6wXTEb3mNDEc=;
 b=P9VOMtSANggNN5qt+QgG64yMktPncBk5CxoHxKDR3fE5rHxF4TsGdiQs
 2f+ulVohQG7BSmf1IMBleevB65bFskwDKez8Wiu/aDR7WbhnIyRwpUIVV
 EqWZK/HDjhjZIZCPGqzgd2gq3rGvzJcUUhY3MZJsHwPtXAXoiLLEa333l
 vgH19FUdp00pSAHcnGE/j2q6E/gDxeiPTyLKiV1Ow+lFpZohTCZvkCu86
 vDVd7KjNke48u110FsPqtE+x9LiUNLBqKwzsE04nEZXlT2H1Zj2pnJ6Y1
 ZQ84qORYp899g0e/O9n1LvzetZDA3aJZlJz0NjmJl6XU3m0QFxdw1Y/j7 g==;
X-CSE-ConnectionGUID: s+zev/sQRbmPkp1cplUaRw==
X-CSE-MsgGUID: yepLjCAVQa+PeH7rqXqBug==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82558821"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82558821"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 02:06:25 -0700
X-CSE-ConnectionGUID: xGXpUdLQQvSkkgkdtnJ3fA==
X-CSE-MsgGUID: aQ378ABFQfKAfQkeNe4DGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="246832317"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.167])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 02:06:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 3/3] tests/kms_content_protection: remove unused max_pipe
Date: Tue, 16 Jun 2026 12:06:10 +0300
Message-ID: <20260616090610.2106378-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616090610.2106378-1-jani.nikula@intel.com>
References: <20260616090610.2106378-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

The test is counting the number of CRTCs (which is nowadays available
direcly with igt_display_n_crtcs()) but it's also not using the result
for anything. Remove unused max_pipe.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_content_protection.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index d1b7c5863255..d931ce7682be 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -917,14 +917,11 @@ test_content_protection_mst(int content_type)
 {
 	igt_display_t *display = &data.display;
 	igt_output_t *output;
-	int valid_outputs = 0, dp_mst_outputs = 0, ret, count, max_pipe = 0, i;
+	int valid_outputs = 0, dp_mst_outputs = 0, ret, count, i;
 	igt_crtc_t *crtc;
 	bool pipe_found;
 	igt_output_t *hdcp_mst_output[IGT_MAX_PIPES];
 
-	for_each_crtc(display, crtc)
-		max_pipe++;
-
 	for_each_connected_output(display, output) {
 		if (!output_is_dp_mst(output, dp_mst_outputs))
 			continue;
-- 
2.47.3

