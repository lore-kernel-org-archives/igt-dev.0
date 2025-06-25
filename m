Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE6AC77B7C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 20:08:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F96210E7FF;
	Wed, 25 Jun 2025 20:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UpgR3n9+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A91710E7F8
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 20:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750882118; x=1782418118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XISU1gvRjMOl0GEI1cfwB2rcwUhvtMt4ZPM55lBFCKE=;
 b=UpgR3n9+pBLvCozlz8S3tArmbvjmO2twm8XoHbaSfGoTmI73wrm+N4Ql
 RXRM9FZu/xXelYE55CUb9aOS0axJvmKRLPdh2Y+kGyF7jjcbguA8iKVTW
 hmcSHCF70Kf3P86RWFPQNbo9vb6vfdzJUAUfIlMLTQrVQqAaOeBzzPmFQ
 horZ+YeeU6DsjaTlBP2ohTGUNIeGEMt0QmdXlmGOz3G+a1iBP+xlYC+pR
 XfJGkcYhKnxcqavppdUrHauLjkAalLkFOFLzALlYpdwA3Wcznd3SmhmUj
 KbR9mmjQ35PFMmTMD4c9HCTMYNZmR/DY3v80LZQNWnsEm6RbwikQwG8sv g==;
X-CSE-ConnectionGUID: J2nvqeg4TUu9nBCrO0GggA==
X-CSE-MsgGUID: ZzqfhDvvQcCoYKW5lI5UMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63766199"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="63766199"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 13:08:38 -0700
X-CSE-ConnectionGUID: 6N1KrnGxS8qCrsUuygG2gg==
X-CSE-MsgGUID: d9Ogxp1CRImK4tXc9EY7FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="153033400"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by fmviesa010.fm.intel.com with ESMTP; 25 Jun 2025 13:08:37 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 7/7] tests/intel/kms_psr2_sf: Enable the tests support
 variations based on the WAs
Date: Thu, 26 Jun 2025 01:37:38 +0530
Message-Id: <20250625200738.34381-8-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625200738.34381-1-mohammed.thasleem@intel.com>
References: <20250625200738.34381-1-mohammed.thasleem@intel.com>
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_psr2_sf.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 68842b020..3c328923e 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -179,6 +179,8 @@ IGT_TEST_DESCRIPTION("Tests to verify PSR2 selective fetch by sending multiple"
 
 #define MAX_SCREEN_CHANGES 5
 
+#define WA_FBC_DISABLED "16023588340"
+
 enum operations {
 	PLANE_UPDATE,
 	PLANE_UPDATE_CONTINUOUS,
@@ -561,6 +563,11 @@ static void prepare(data_t *data)
 	igt_plane_set_position(primary, 0, 0);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
+	/* FBC disabled: Wa_16023588340 */
+	igt_skip_on_f(data->op_fbc_mode == FBC_ENABLED &&
+		      !intel_is_fbc_supported(data->drm_fd, WA_FBC_DISABLED),
+		      "WA has disabled FBC on BMG\n");
+
 	if (data->coexist_feature & FEATURE_DSC)
 		igt_require_f(igt_is_dsc_enabled(data->drm_fd, output->name),
 			      "DSC is not enabled\n");
-- 
2.34.1

