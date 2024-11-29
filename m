Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947BFD6EBEE
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 08:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4345410E33A;
	Fri, 29 Nov 2024 08:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OZZ38Fkq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C784010E33A
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2024 08:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732870794; x=1764406794;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+piqdNPFpv4+eMS2NDF1pUv2FPZKV9zi5DByRnmM8tE=;
 b=OZZ38FkqUE92TmhjRbCyuINDOLeyZz7L421DdbrxfyRdaOJCKNdypt8Z
 md2WmOfUM5w75NGx+va1Dm2jS6sU4QZFrQyA0CsS4I+tLuv9F7PGXXvWt
 XnCSEjEAA5wIw1C0ffC8aDeJ/7yPV4+1+A89Q7N1AKAUuhjzXCPX9TjqN
 W/HbqxpFV3zB6AN8HnjF8uve38NdRcvj869FFp0PLcc7QCFEIqq5qJaXP
 SvdO1aS/aigBQ48Lrecn42+BytMogyzKjjU2kF+mbxr0vWosKkUmiycoa
 r50NNonmn6sQbJL0DkGYqngl3XlodnegON3vnnsjswVDtCV1t/vlOS9nC Q==;
X-CSE-ConnectionGUID: zSihhvgWRVKJtDRhoONgog==
X-CSE-MsgGUID: hz1P4wFZSVOw9vI9dehEsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="44479305"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; d="scan'208,223";a="44479305"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 00:59:53 -0800
X-CSE-ConnectionGUID: NibBzsIvQ029Q6csFhZPLQ==
X-CSE-MsgGUID: 97MAkTOzRB2jOzd7VQSvJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; d="scan'208,223";a="96857867"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa005.fm.intel.com with ESMTP; 29 Nov 2024 00:59:52 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/lobf: Remove lobf supported check
Date: Fri, 29 Nov 2024 14:10:06 +0530
Message-Id: <20241129084006.3448688-1-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
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

From kernel driver debugfs support is not present so remove
the lobf supported check from igt.

Cc: Jeevan B <jeevan.b@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 tests/kms_vrr.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index f0564bb6a..e7d2ff1db 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -890,11 +890,6 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
 		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
 			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
-
-		if (igt_get_i915_edp_lobf_status(data->drm_fd, output->name)) {
-			igt_info("%s: LOBF not supported.\n", igt_output_name(output));
-			return false;
-		}
 	}
 
 	/* Reset output */
-- 
2.29.0

