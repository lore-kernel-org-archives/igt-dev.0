Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4CEECE582
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 09:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573EB10E758;
	Tue, 10 Sep 2024 09:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOQE95RP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6AC10E758
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 09:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725961679; x=1757497679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ir2E0imeAGGg45W0MDqQ/SSvUu7kIryllXzqaFWKA60=;
 b=aOQE95RPpZyE3wtPAI1mEgePXHW1VqVEVtMnrxZWLMES8cotjk/CCIrY
 k0k0HCxqVTTzg/lftJsn95NlDXBWdmx8doL15iJlhv2DiPXScJ6Dv2lFF
 sHpItW7FLB5zNfQWbL/ZU0qRtqRwxjO7mRxYU7f8LRfBQMul4ir4+bwj1
 7PDP1zgpcx3GOECgebO8ZzQ9kTqjFFjkqvmpejp8ii6V6CJGckXgrXMVc
 NJHpSgr+iOrRXSMPhxWwTM7YO7/n0xlnFJJKt3BNB/BFJEWODxLMG4Fxv
 ZBzgPTfAnoKyMVWz5yjZnlwNrw57YdsrTyctMqan6ZtfocGbJEzwtRuS7 g==;
X-CSE-ConnectionGUID: 8Kb3yc6gRL2tm0s0Nh+ZCw==
X-CSE-MsgGUID: l0vPS9uURWWHXYvmcsTocA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="36043774"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="36043774"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 02:47:59 -0700
X-CSE-ConnectionGUID: UZiOkhe9QyOeUhwuBT89Hg==
X-CSE-MsgGUID: MwRND1CoSoOVImQRWq7jPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="67269520"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orviesa006.jf.intel.com with ESMTP; 10 Sep 2024 02:47:58 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, karthik.b.s@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 2/3] tests/kms_content_protection: Print correct output
Date: Tue, 10 Sep 2024 15:15:27 +0530
Message-ID: <20240910094529.545064-3-suraj.kandpal@intel.com>
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

We should be printing the output we are waiting for
which is first_output rather than printing the 0th output.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
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

