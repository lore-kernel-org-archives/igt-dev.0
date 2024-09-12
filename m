Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DD2EE645B
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 07:58:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E1D10EA9E;
	Thu, 12 Sep 2024 07:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BwVaghyR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F80410E9DF
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 07:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726127888; x=1757663888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EYu9Vv+6eo/98r0Iwihad80goAKBHtXyXzY+Gk3Ebhs=;
 b=BwVaghyRNehxvRJ1Q4ycYl7uRWgQcTAQy+X2+tlmdr/sLADDPbfxlLHi
 v0c5koJzCXxi7qH91lTsyjbjWUa5O4+F6mmTKrdBsuARFveqIRjg4pD4O
 vRIZaHneYSXa4SMswSnCRH2G+NLTt21TvZBTxWRMX1RmOnkq9ECHNNlZk
 FN7ZI1qL334e2VrELvNR/7WjAcqfR6PkaCLFk5hDa9J5rXmu5vEEoN3f5
 o5h/wo4YPLNajJp0mIcGax4Lx9wLJ+1Z1GDstqfObKqmhgaZqDJfborGW
 YahxOsNfrpPI2q/rLnYhDI8SsLgo+vOHP8ulO3Dm7fJm85qAlj55yLoBk Q==;
X-CSE-ConnectionGUID: pZRjVFj1T9OmezF7Jm+VpA==
X-CSE-MsgGUID: DsFQOBaMTt+IRc9jzEUjrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25095461"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="25095461"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 00:58:08 -0700
X-CSE-ConnectionGUID: QcxYF/qaRoqG+tTcaBCaBA==
X-CSE-MsgGUID: PB6Wtd0xSQyAvcWIsw3pNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="67248421"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa006.fm.intel.com with ESMTP; 12 Sep 2024 00:58:06 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, karthik.b.s@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 3/3] test/kms_content_protection: Move color change code.
Date: Thu, 12 Sep 2024 13:25:35 +0530
Message-ID: <20240912075536.710350-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240912075536.710350-1-suraj.kandpal@intel.com>
References: <20240912075536.710350-1-suraj.kandpal@intel.com>
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

