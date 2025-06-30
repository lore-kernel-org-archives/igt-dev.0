Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0168C83029
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 13:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78EB110E457;
	Mon, 30 Jun 2025 13:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HOfxCXuS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827D210E457
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 13:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751290662; x=1782826662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ng2F3C+QeINPP2I0PANQKflzGwOEAT3Kif0ZD9E4Iwc=;
 b=HOfxCXuSqffwjKH1lYBWZyxcsgqpJzt8hW2brhPJA4cx18W+pt1LGwqi
 kuaEiinyhRQsqYd7XDYB45rvLiCPyiuHNRq1q7nNpSN4xK6eddxU/UILf
 9s+tXldDzTZuPN5u20+bnYyyuK/6qsY+qkUjoFms6vu0qiv/eH3nFFvs/
 NxtBvW+j+vYCBXGUvnKGLhapq/G2IXyLzJNwOz7q63GUD+2IvqRi2Xq9S
 kYYOYmBgvUBhklIdWpgqnUvGTZlqxAIsOGwdyJS71vBORoU73ET1ySdML
 3hRGmpYwGX8yh1R0tSmadkmKwfcSH7031F1rCm2JGBx21ZkIG32VpnbDH w==;
X-CSE-ConnectionGUID: PlLpSmv8Q66ftnj9nISm2Q==
X-CSE-MsgGUID: YncPuqv8RcqTMKU5NG+9nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57322576"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="57322576"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 06:37:42 -0700
X-CSE-ConnectionGUID: 1lioMa4fSymAwLABxpTRsQ==
X-CSE-MsgGUID: nDAz3VBZQc6mP7uplHk3iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="159188346"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.227.88.71])
 by orviesa005.jf.intel.com with ESMTP; 30 Jun 2025 06:37:41 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v3 7/7] tests/intel/kms_psr2_sf: Enable the tests support
 variations based on the WAs
Date: Mon, 30 Jun 2025 19:11:45 +0530
Message-Id: <20250630134145.836-8-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250630134145.836-1-mohammed.thasleem@intel.com>
References: <20250630134145.836-1-mohammed.thasleem@intel.com>
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

This update stops skipping fbc-* tests support variations based on the WAs.

v2: Updated function name with intel_is_fbc_disabled_by_wa. (Kamil)
v3: Updated logic at igt_skip_on_f. (Kamil)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_psr2_sf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 68842b020..12c5b4fdc 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -561,6 +561,11 @@ static void prepare(data_t *data)
 	igt_plane_set_position(primary, 0, 0);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
+	/* FBC disabled: Wa_16023588340 */
+	igt_skip_on_f(data->op_fbc_mode == FBC_ENABLED &&
+		      intel_is_fbc_disabled_by_wa(data->drm_fd),
+		      "WA has disabled FBC on BMG\n");
+
 	if (data->coexist_feature & FEATURE_DSC)
 		igt_require_f(igt_is_dsc_enabled(data->drm_fd, output->name),
 			      "DSC is not enabled\n");
-- 
2.25.1

