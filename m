Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8E8C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 07:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD18110E071;
	Thu, 18 Jan 2024 07:29:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A30610E11E
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 07:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705562980; x=1737098980;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vk0CyR8IXRfX44uqC2CLZoqv99kZFLiol/uyLQ6RU9Y=;
 b=hLMawxedbR3XBsGubdFTk9LNO8ULuQ6/q8mt0H3q1wNsaQdW+6uIZBJC
 91zORTmEftlweoD0rQqBn86jt+F3UAIt7IyOKc+I+glrZgUWXzzvOOOLU
 fiUc3OgP8p0734yZ8C5X2y2tnjn3wfU+aswAIQ0sbBFXt2s/8kiJSipyz
 XT8IngYsBP7Tog0pofXw40jQh4cgyBhuSpmacpKujXeuzQsUDXzVaQE68
 /tJS9sXuaVWQDlqzeWJcgP4PguqC+TWymW/vV9QGOxF23ueQSi3segEHb
 QCKdfSOpXVOkgBY+T8lpwcFTnYomCibuxkOFmDk3pWPlH//JrWlj6Oa1B w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="399244904"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="399244904"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 23:29:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="252361"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orviesa003.jf.intel.com with ESMTP; 17 Jan 2024 23:29:35 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/kms_content_protection: Add LIC Type 1 scenario
Date: Thu, 18 Jan 2024 12:57:22 +0530
Message-Id: <20240118072721.458334-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240116112335.353869-1-suraj.kandpal@intel.com>
References: <20240116112335.353869-1-suraj.kandpal@intel.com>
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
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Currently LIC is done only for type0 content this patch
adds LIC for type1 content too.

--v2
-Use arg[1] [Swati]
-Mention Functionality [Swati]

--v3
-Move back to prev version of comment as type 0 and type 1
dont have the same functionality [Swati]

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_content_protection.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 6d472ee02..3fc575634 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -43,8 +43,13 @@
 #include "igt_kmod.h"
 
 /**
- * SUBTEST: lic
- * Description: Test for the integrity of link.
+ * SUBTEST: lic-type-0
+ * Description: Test for the integrity of link for type-0 content.
+ * Functionality: hdcp1.4, hdcp2.2
+ *
+ * SUBTEST: lic-type-1
+ * Description: Test for the integrity of link for type-1 content.
+ * Functionality: hdcp2.2
  *
  * SUBTEST: content-type-change
  * Description: Test the content type change when the content protection already
@@ -783,11 +788,16 @@ static const struct {
 	  .cp_tests = CP_DPMS,
 	  .content_type = HDCP_CONTENT_TYPE_0
 	},
-	{ .desc = "Test for the integrity of link.",
-	  .name = "lic",
+	{ .desc = "Test for the integrity of link with type 0 content.",
+	  .name = "lic-type-0",
 	  .cp_tests = CP_LIC,
 	  .content_type = HDCP_CONTENT_TYPE_0,
 	},
+	{ .desc = "Test for the integrity of link with type 1 content",
+	  .name = "lic-type-1",
+	  .cp_tests = CP_LIC,
+	  .content_type = HDCP_CONTENT_TYPE_1,
+	},
 	{ .desc = "Test content protection with content type 1 "
 		  "that can be handled only through HDCP2.2.",
 	  .name = "type1",
-- 
2.25.1

