Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58C6ECE58B
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 09:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A183610E757;
	Tue, 10 Sep 2024 09:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kvPiJlwo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1C810E757
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 09:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725961677; x=1757497677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AGVDWrtBSQRayLge7hz+PUmfSkjevSb5F3CVUxFeu5w=;
 b=kvPiJlwoPhSIvIbyUoN8XgMbqpKJA/S2HGiRvZsbAN4Hj1XwV3XPTONs
 WmxQaCkCG9ywKZjWIXGovolXduOXUE6cEcT5o+orlw8s6Ao+lWNyk9o83
 vlvinkx2YfxViSj2ba4KtYhpcaGWq8Jr9uCvbVLsb1s4r9KSyKF8nVp7+
 GU5Ut1bghs+OM3+UCzAjGJFndjZH7DiLyJUpUqvdT2QRQqnWYTt5aLHOb
 6bXaBPLBxizSnSChatiulKG7NvCZrc5pLIOTGfiGYVCx+0MtPeOtQoIRX
 XyvmcZRP3WJr45N7laGYHJB08nrYadJeiPfonlR9gPrKOK8edooEu4vKq g==;
X-CSE-ConnectionGUID: VHyuQ+NHQyKaQEVp+7SOJw==
X-CSE-MsgGUID: etlreHScQGSoWlMy4SGdAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="36043769"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="36043769"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 02:47:57 -0700
X-CSE-ConnectionGUID: IoD7chwbTFCpCRHagQugDA==
X-CSE-MsgGUID: eQQ/lqrURUy16kTSxrZ0FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="67269515"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orviesa006.jf.intel.com with ESMTP; 10 Sep 2024 02:47:56 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, karthik.b.s@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 1/3] test/kms_content_protection: Fix variable
 declaration
Date: Tue, 10 Sep 2024 15:15:26 +0530
Message-ID: <20240910094529.545064-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240910094529.545064-1-suraj.kandpal@intel.com>
References: <20240910094529.545064-1-suraj.kandpal@intel.com>
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

Fix first output_variable declaration to int as it accepts
only a int argument and not a bool.

Fixes: a6c718174 ("tests/kms_content_protection: Add MST subtests")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 2d9f3eebe..cad8811ea 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -646,7 +646,7 @@ static bool output_is_dp_mst(igt_output_t *output, int i)
 	return true;
 }
 
-static void test_cp_lic_on_mst(igt_output_t *mst_outputs[], int valid_outputs, bool first_output)
+static void test_cp_lic_on_mst(igt_output_t *mst_outputs[], int valid_outputs, int first_output)
 {
 	int ret, count;
 	uint64_t val;
-- 
2.43.2

