Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61819EED606
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 13:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104B110EB84;
	Thu, 12 Sep 2024 13:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cLbZi3AA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B007310EB82
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 13:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726148212; x=1757684212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EqWh5OJ+FGZHtTfB7CsiXDb1JjyykBp7ZDu7P/lfRa8=;
 b=cLbZi3AAWHSI1hQroJ24BOKIYTu954Rum6U7WxBoCrBaGDqjNtXVXQtl
 XLya64TL2AcG7AOjYGdLg88H81g4sYaalwXRmHNt06HZinnOgJ6a0WDtd
 y4uyum58SGdeNHX0bnDY/8EkpKyi05a7YegZV5TvpEArxve0tTIIwQJLG
 3y28Ip5I/c6JFYMCwJyzFyj0FBxpCI7N8QlMNZkCb+IO48GLy7L/Swi+J
 mhL7XqSSW8F54RqU0Cuepy2HzMErlfx/fp/JNbIF8xN13ExVfLOvy4G8G
 dHyHGWuBMoXs/FWtUndUI7QaTJaf+w6QdrXrPwgriqwoHIRUOAzq6W+EW g==;
X-CSE-ConnectionGUID: AmEi5w3NSiqhH2YTMHP3cw==
X-CSE-MsgGUID: 5qerz08zRhmgfpsPK8BByA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24484244"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="24484244"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 06:36:51 -0700
X-CSE-ConnectionGUID: OoDkwcX5QV+K7tSEZYqiig==
X-CSE-MsgGUID: HenpOy3MTeS88a11RglusA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="68221029"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orviesa007.jf.intel.com with ESMTP; 12 Sep 2024 06:36:50 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, karthik.b.s@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 2/4] tests/kms_content_protection: Print correct output
Date: Thu, 12 Sep 2024 19:04:19 +0530
Message-ID: <20240912133421.718496-3-suraj.kandpal@intel.com>
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

We should be printing the output we are waiting for
which is first_output rather than printing the 0th output.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_content_protection.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index cad8811ea..c3771fad8 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -653,7 +653,8 @@ static void test_cp_lic_on_mst(igt_output_t *mst_outputs[], int valid_outputs, i
 
 	/* Only wait for the first output, this optimizes the test execution time */
 	ret = wait_for_prop_value(mst_outputs[first_output], CP_DESIRED, LIC_PERIOD_MSEC);
-	igt_assert_f(!ret, "Content Protection LIC Failed on %s\n", mst_outputs[0]->name);
+	igt_assert_f(!ret, "Content Protection LIC Failed on %s\n",
+		     mst_outputs[first_output]->name);
 
 	for (count = first_output + 1; count < valid_outputs; count++) {
 		val = igt_output_get_prop(mst_outputs[count], IGT_CONNECTOR_CONTENT_PROTECTION);
-- 
2.43.2

