Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42481ECE564
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 09:48:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90BC10E75B;
	Tue, 10 Sep 2024 09:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SkH/ARVy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E291C10E75B
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 09:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725961681; x=1757497681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y1QENHzeQbVuaUdevLtYuG+C9Qey/y6RabkpiSSPS1s=;
 b=SkH/ARVyhto2gAHrIV2ne3JnfT3x4G0VcPCEWfXC5aacSkOfmsfIl+jl
 l65ziwAePEOwqJCNqWceD9hnh5MptyEEhxl1BAyF26RBsTBFLO1XT8efL
 fKyrdsL8k2EogiZglllCk9AVfIMBKvLHV+krQoaOqd6anNPqAhV3VJlKK
 n2tg6vKfS9k341cJ7CKgLaMJ2tsZWYUgACj7JEE5R3Hi2smkzi0TPgKW+
 eaqxSyBpTCYK7jXw1+g1UNn/dgKXO9Q/K5HmX7Chhc+78caewuLbTmKiY
 lI+2YgFdZo3VHgTRLKRKIH+I3FcmScIQmZ51GJwd+v6G1TFae0H6E1L+E w==;
X-CSE-ConnectionGUID: j/SWGYS/QGuaZ4a5kJdEow==
X-CSE-MsgGUID: 8r5BDbjRSzOQM39kSm57PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="36043780"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="36043780"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 02:48:00 -0700
X-CSE-ConnectionGUID: JLBBjgkvSpe9oZvOfon8YA==
X-CSE-MsgGUID: 4y6QnCQGS5C1TEm0UiL5Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="67269524"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orviesa006.jf.intel.com with ESMTP; 10 Sep 2024 02:48:00 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, karthik.b.s@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 3/3] test/kms_content_protection: Move test lic mst code.
Date: Tue, 10 Sep 2024 15:15:28 +0530
Message-ID: <20240910094529.545064-4-suraj.kandpal@intel.com>
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

Move mst lic code before screen color change to avoid upsetting
lic test as it ends up failing due to the commit that's done
without seeting CP property.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index c3771fad8..cb4d825cd 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -760,6 +760,9 @@ test_content_protection_mst(int content_type)
 
 	ret = test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs, 2, content_type);
 
+	if (data.cp_tests & CP_LIC)
+		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
+
 	if (ret) {
 		for (i = 0; i < valid_outputs; i++)
 			prepare_modeset_on_mst_output(hdcp_mst_output[i], true);
@@ -767,9 +770,6 @@ test_content_protection_mst(int content_type)
 		igt_display_commit2(display, COMMIT_ATOMIC);
 	}
 
-	if (data.cp_tests & CP_LIC)
-		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
-
 	/*
 	 * Verify if CP is still enabled on other outputs by disabling CP on the first output.
 	 */
-- 
2.43.2

