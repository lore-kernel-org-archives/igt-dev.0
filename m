Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DF8EED608
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 13:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8C810EB82;
	Thu, 12 Sep 2024 13:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zv0/o21e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA89A10EB82
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 13:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726148210; x=1757684210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ovcRjfj6HaqmJwQSYS+Ox6TD6i1DavLsvobBAySkCPc=;
 b=Zv0/o21eL3DL4pD5joFXAgw7h0lNG8onkJLA4SluXw4awdbKs6hSb0mS
 jrtwLik9hzaDwp6TQtwWv0rb/3Z1O0bP93wA4gSeGZlhxPVhCFZwSE6GC
 NUZiqDIO+pWZ5E18RNGnlxqdLrM/qpSkPv0VIdqXTF+0w6ancMn0QcaWF
 j/6DzwA9eEpwkZiPpPPRofrEu4QL17uGdnfTmGQbVv7eRi4O5PKIX3hGd
 fsp7wnWKo+qr0gg4LDan7ROvPM06bD9DrpH3RSwmd6/ktUpl01azogwC1
 fkApIIFcmqghvHyHEq+k50+BvF1qdmh8HIFPqYLM3SoZtl+HLIpB4naRy A==;
X-CSE-ConnectionGUID: 4A0NRgdUT7a6WleDEurKuw==
X-CSE-MsgGUID: niISwgVIS5umgeb+vsJttg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24484228"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="24484228"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 06:36:49 -0700
X-CSE-ConnectionGUID: ehK1ZnGxS9KzcfURB27azA==
X-CSE-MsgGUID: vRXdOLnhROK9U+gSRyjaqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="68221022"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orviesa007.jf.intel.com with ESMTP; 12 Sep 2024 06:36:48 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, karthik.b.s@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 1/4] test/kms_content_protection: Fix variable
 declaration
Date: Thu, 12 Sep 2024 19:04:18 +0530
Message-ID: <20240912133421.718496-2-suraj.kandpal@intel.com>
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

Fix first output_variable declaration to int as it accepts
only a int argument and not a bool.

Fixes: a6c718174 ("tests/kms_content_protection: Add MST subtests")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
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

