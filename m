Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41443EE645E
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 07:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B738C10E9DB;
	Thu, 12 Sep 2024 07:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+G5nT6K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDF510E9DB
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 07:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726127884; x=1757663884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ovcRjfj6HaqmJwQSYS+Ox6TD6i1DavLsvobBAySkCPc=;
 b=P+G5nT6K9zR2nOxTHyQUv5VQIhjHJqMT13m7Dmhitkj7xhjVND21mi4c
 WKpnGwOF5vYnezo0dMshQhwF2v+fTmrE3ZXcHpvGeMQWbppPGTF5SIlea
 GKTkvT2BpUuwXlpcxcdr2NyEIbrN01igBcEE6E5O2nRaphxZyNiMupfeR
 sZBx64uZEICWfN0w1j3Z0iH+McJJnhmXwTEq52Csq74XX8HrYp44DpVqV
 z8Ac/eG/83/GX/RJGBdxQjN5UOhrvYnmgd3zMFh6jIW1iBj0q0V7eU5V2
 hemhvDQEagOdxpkPIkCKQqptbL3gPxtrE4JTO/nYzsKP6EUkQ0OfmX2r7 A==;
X-CSE-ConnectionGUID: x6XaVophRRqsXJbzw4n6mQ==
X-CSE-MsgGUID: WNP3Cuf8RP+6uHoxrxYeXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25095447"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="25095447"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 00:58:04 -0700
X-CSE-ConnectionGUID: ypG13gwHRpyaC5x1Fr5O5w==
X-CSE-MsgGUID: CEvg/jkVTRe/E17iAuLlrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="67248408"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa006.fm.intel.com with ESMTP; 12 Sep 2024 00:58:02 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, karthik.b.s@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 1/3] test/kms_content_protection: Fix variable
 declaration
Date: Thu, 12 Sep 2024 13:25:33 +0530
Message-ID: <20240912075536.710350-2-suraj.kandpal@intel.com>
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

