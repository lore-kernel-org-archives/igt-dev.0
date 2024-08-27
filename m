Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ADAC5320E
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 06:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646B310E245;
	Tue, 27 Aug 2024 06:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K9j0qQmE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5AF10E245
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 06:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724739697; x=1756275697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aqavaC+RPirIv34a3aOO9cnfE9UIcTmnKUqG6KTb9JA=;
 b=K9j0qQmE8DK8bjey4CMUUNvRwHPLLisa8FMelrYgUH9bINagD5Fy8y6S
 l2JWUO2dqis6Z6VZ6yO0tYK1cl+bYkAK+ldf6QbszT+mgsRYJSKjDryGU
 2YTON2xqmK1BpgpF4Sjty/cBPrsFSgVUTlPG6VaOId385INUszcYOE1Zw
 kZ6Nh1Mg5Nq13R6RKJBn5HSiS2gu90HGXGoVNjOZMpMibFPhsBqDbHrFV
 ll7C/oRAyBGHFhxIWgTvD1huTEQb//E/mBdp7iarGtpGJW/kno8ywGYoe
 1GyvteSIFXtrnEwjiMWoarwtkooUsUPkT6Gk/uLj1bQensrPzPgt+ouoX A==;
X-CSE-ConnectionGUID: oOmrIglPS5uno5roMV5XRw==
X-CSE-MsgGUID: a9PavseMR/um/jOSPGvqlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="40700491"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="40700491"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 23:21:37 -0700
X-CSE-ConnectionGUID: xjlzZVD/TPyT1PGiltEXHQ==
X-CSE-MsgGUID: BE5CIrXyTPefqiYjwgHpYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="62916009"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa010.fm.intel.com with ESMTP; 26 Aug 2024 23:21:35 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, ankit.k.nautiyal@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 2/5] tests/kms_content_protection: Move try commit call
Date: Tue, 27 Aug 2024 11:49:01 +0530
Message-ID: <20240827061904.4170393-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240827061904.4170393-1-suraj.kandpal@intel.com>
References: <20240827061904.4170393-1-suraj.kandpal@intel.com>
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

Currently we are calling try commit twice once in if condition and
again right after that. The correct sequence should be we call try
commit again only if the first one fails.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_content_protection.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 6bd744351..db6dc17b1 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -679,10 +679,10 @@ test_content_protection_mst(int content_type)
 
 		for (count = 0; count < valid_outputs; count++)
 			prepare_modeset_on_mst_output(hdcp_mst_output[count]);
-	}
 
-	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
-	igt_require_f(ret == 0, "Commit failure during MST modeset\n");
+		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
+		igt_require_f(ret == 0, "Commit failure during MST modeset\n");
+	}
 
 	for (count = 0; count < valid_outputs; count++) {
 		igt_output_set_prop_value(hdcp_mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
-- 
2.43.2

