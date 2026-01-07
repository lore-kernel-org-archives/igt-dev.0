Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86579CF6BE4
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 05:13:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A27F10E00B;
	Wed,  7 Jan 2026 05:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFlHdJL0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D5E10E00B
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 05:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767762800; x=1799298800;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yclE9SIapeFROjdvyuELFLbIPYosZttw30q5WPyJtw8=;
 b=CFlHdJL05JrPVdYP59B4e6WNd2kU+dBi4jb4FWmfsvdPxC6JUoHEatFD
 ooSKD+G+14PUVdur6f+DtZJ0zIONpN61OCcHb++XgDxYOxY+bcOJyzmBq
 DbHdHYWRx1HdiDFsn6ujtrj8DrqKaObjxMsTzKK8sPHlc8Rqp7ET4qmi6
 F4Srw4hD1vTrcVIPamx52xZ0N646A3nfJzNFuZEzJV94UK9opR+3cQTOk
 8T53CJgwY4TziDe1V0IqsGj3n3GgDL9BgGTHPqpeZFjAaxjt4Er+7ujIC
 YQ8GxEU55TvALTmXjlErdcHlLP/Vcn7tGeLX4M/NKs50O/I56JMVaTYg/ g==;
X-CSE-ConnectionGUID: InvjdpXFSoSrFMmniR78NA==
X-CSE-MsgGUID: Htuy2cTxSe+9I5af+3KXPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="79431553"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="79431553"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 21:13:20 -0800
X-CSE-ConnectionGUID: yQp5OSRWTP2hMJ5IsdsSOQ==
X-CSE-MsgGUID: 7sce3qT4QDS0QgangVgwZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="202593032"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 21:13:19 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_content_protection: Split
 dp-mst-suspend-resume tests
Date: Wed,  7 Jan 2026 10:41:04 +0530
Message-Id: <20260107051104.108824-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

Split the dp-mst hdcp suspend resume tests to work on sinks that
supports only HDCP 1.4 as dp-mst-type-0.

For HDCP 2.2 specific, add a new subtest dp-mst-type-1-suspend-resume.
These changes allow testing s/r on DP mst configs regardless of sink's
HDCP version.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_content_protection.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 377bab9a3..7c459978b 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -87,7 +87,8 @@
  * @lic-type-1:   Type 1 with LIC.
  * @type-0:       Type 0
  * @type-1:       Type 1
- * @suspend-resume: Suspend and resume the system
+ * @type-0-suspend-resume: Type 0 with suspend and resume the system
+ * @type-1-suspend-resume: Type 1 with suspend and resume the system
  */
 
 IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
@@ -1011,8 +1012,13 @@ static const struct {
 	  .cp_tests = CP_LIC,
 	  .content_type = HDCP_CONTENT_TYPE_1,
 	},
+	{ .desc = "Test Content protection(Type 0) over DP MST with suspend resume.",
+	  .name = "dp-mst-type-0-suspend-resume",
+	  .cp_tests = SUSPEND_RESUME,
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	},
 	{ .desc = "Test Content protection(Type 1) over DP MST with suspend resume.",
-	  .name = "dp-mst-suspend-resume",
+	  .name = "dp-mst-type-1-suspend-resume",
 	  .cp_tests = SUSPEND_RESUME,
 	  .content_type = HDCP_CONTENT_TYPE_1,
 	},
-- 
2.34.1

