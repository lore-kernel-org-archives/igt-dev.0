Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB559EED609
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 13:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B071410EB85;
	Thu, 12 Sep 2024 13:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LeSfji05";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910DC10EB85
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 13:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726148213; x=1757684213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HALJXAXbvIuIt6dlljw92KNmgnbGM3cpo4ODbYU8NBA=;
 b=LeSfji05ldUpt6bbXT6okJrPDOiRxNT8i0gtm2kxng9LjK2Ip15CMNqV
 Rz1cFHB6ozx/MglhYbamW4fxv+zO+kkYas1wo60azzp9ymRx7toVv+JFy
 LpS14+MABC0BvHG551FreobgvdYSk115OFZMVFm/MT1HaB0om+EaaElST
 OADoNR6hpF7avCxTqS494UY5eP6Ml6FpGUeBt1ExtYFBiVrC+sFbqeVgO
 qtmXGhAidSUG728mVLHErpGp0XrhvTDrpo7+3CluXosNo/E+cY9GwsEDF
 uru3KdUcmOyxHTctkE3tyPIMK7RrblNv2dCej59ZynWLVoYm8TFKO7W0k w==;
X-CSE-ConnectionGUID: Deax0tPbT0CRTiFr3cUejQ==
X-CSE-MsgGUID: 2kBi+HLNRsmLF+Th56uKig==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24484248"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="24484248"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 06:36:53 -0700
X-CSE-ConnectionGUID: I/i3RXV+QzuGd4TY2LvtYg==
X-CSE-MsgGUID: pTjLQIbJQu2c+XT2guBKlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="68221037"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orviesa007.jf.intel.com with ESMTP; 12 Sep 2024 06:36:52 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, karthik.b.s@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 3/4] test/kms_content_protection: Move color change code
Date: Thu, 12 Sep 2024 19:04:20 +0530
Message-ID: <20240912133421.718496-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240912133421.718496-1-suraj.kandpal@intel.com>
References: <20240912133421.718496-1-suraj.kandpal@intel.com>
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

Move before screen color change to in the mst_cp_enable_retry
to make sure we display the correct color after every retry and to
make sure one of the monitors does not go to sleep in between
get_property waits.

--v2
-Fix commit subject [Thasleem]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index c3771fad8..f17d9f2e8 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -667,7 +667,7 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs
 			      int retries, int content_type)
 {
 	igt_display_t *display = &data.display;
-	int retry_orig = retries, count;
+	int retry_orig = retries, count, i;
 	bool ret;
 
 	do {
@@ -693,8 +693,14 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs
 						  KERNEL_AUTH_TIME_ADDITIONAL_MSEC);
 
 		retries -= 1;
+
 		if (!ret || retries)
 			igt_debug("Retry %d/3\n", 3 - retries);
+
+		for (i = 0; i < valid_outputs; i++)
+			prepare_modeset_on_mst_output(hdcp_mst_output[i], ret);
+
+		igt_display_commit2(display, COMMIT_ATOMIC);
 	} while (retries && !ret);
 
 	igt_assert_f(ret, "Content Protection not enabled on MST outputs\n");
@@ -760,13 +766,6 @@ test_content_protection_mst(int content_type)
 
 	ret = test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs, 2, content_type);
 
-	if (ret) {
-		for (i = 0; i < valid_outputs; i++)
-			prepare_modeset_on_mst_output(hdcp_mst_output[i], true);
-
-		igt_display_commit2(display, COMMIT_ATOMIC);
-	}
-
 	if (data.cp_tests & CP_LIC)
 		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
 
-- 
2.43.2

