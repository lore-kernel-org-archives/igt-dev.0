Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689F9D68B2B
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 14:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B5210E34B;
	Thu, 14 Nov 2024 14:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HVdToFJK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1751F10E34B
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 14:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731595349; x=1763131349;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xkAlwYbbmcLyH0lRX03Ph83j9Erff7VSMCQy0c1HvOM=;
 b=HVdToFJKyQQuo+0Al3Yg5wzfY39D99nirro9xCdwF4FFrA7sPUnhFf6f
 rrAdo3Fajz9vzUk11NPCovmM+qnwBemc6ShRgvXYHjgANe/g8u2ppVL9q
 3C1BnnB1Mn8UnQvlz4pez8CAYjrSpVM9KIt3XUtEXCR6y9vS5rzvKB7Sz
 E3GIT+ZFjtHwXlsA0jyZb8ZakbgbqgLWlzaH51mb2b2hw0m33bVPNuG6Q
 mgQqo9I+P8zpEO/aaElnlKPLCHnBzivaDFM7STfdhe6Bn647UHhW6cXRK
 WyS3pkd5TPAa9Hunmtlgy6QBs8uJ5O9soDN4BIlGgVcqLnapbq1T7xcYW w==;
X-CSE-ConnectionGUID: B+7fSI1dRTymS77anEb/9g==
X-CSE-MsgGUID: HRv2B6GYR82VThoCcnmAeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="35257946"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="35257946"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 06:42:26 -0800
X-CSE-ConnectionGUID: PEme8M/kQputEEoFH+p0ng==
X-CSE-MsgGUID: Hr/bKfXQRqSPZ2Xn8XEexg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="119158445"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO dgrzegor-mobl2..)
 ([10.245.246.14])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 06:42:24 -0800
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t] tests/xe_eudebug: Convert comments to be C-styled
Date: Thu, 14 Nov 2024 15:41:56 +0100
Message-Id: <20241114144156.82071-1-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Change two comments in xe_eudebug testcase to be properly formatted.
This was pointed in the review, but the patch has been merge before
correcting mentioned nits.

Fixes "05659c7f2 tests/xe_eudebug: Validate exec queue placements"

Reported-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 39db16457..e9765d06e 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -474,13 +474,13 @@ static void placements_client(int fd, struct xe_eudebug_client *c)
 		xe_eudebug_client_exec_queue_create(c, fd, &create);
 		xe_eudebug_client_exec_queue_destroy(c, fd, &create);
 
-		// every other instance (logical_mask ~ 1010, 0101)
+		/* every other instance (logical_mask ~ 1010, 0101) */
 		create.width = 2;
 		create.num_placements = count/2;
 		xe_eudebug_client_exec_queue_create(c, fd, &create);
 		xe_eudebug_client_exec_queue_destroy(c, fd, &create);
 
-		// logically contigous placement (logical_mask ~ 1100, 0110, 0011)
+		/* logically contigous placement (logical_mask ~ 1100, 0110, 0011) */
 		for (i = 0; i < count * count - 2; i++)
 			eci[i].engine_instance = i / 2 + i % 2;
 
-- 
2.34.1

