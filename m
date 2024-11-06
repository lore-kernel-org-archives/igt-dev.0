Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD6DD3E79A
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 09:59:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498B210E00B;
	Wed,  6 Nov 2024 09:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TbY9ehtw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7E110E00B
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 09:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730887188; x=1762423188;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QFXJpZvJPqJ2QIygluwPGh6EgmdQ+H0jcZrW6VWpZvU=;
 b=TbY9ehtwomcPBLG1VKoczuDYTFssfFuVOHZGqmoHjiV2ZTLXssP3eGcK
 7Q91oeBuc6/F/jcpclw7qXpU09/9CcEdWyqR2mEEZbMCKTrOI9hioYLbG
 iH8wHjmgo6JxiujgMHo7kWThuNIB/cz9Nvoq28OnLRcbDlKTGXCMBFhhx
 VrwzKr1JDl+W4UStUz2lZEKBEClovcDxvnQq1iPJl6aodnUXFn0A4ANog
 p+kilZe8FNSpcuAuRW7y2yZRju33kVTOqyq50noweDJ2RATHexyjkY2/x
 7U7pMjWgRxneeqXnl+BDucuyA2LI5toWZLlgNAz4ILxFFKulXvW+A6jy1 w==;
X-CSE-ConnectionGUID: cx3yr1ABQbu5289nYLLXKw==
X-CSE-MsgGUID: /Fmvvc/eQhSxdYiN0AkDCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="41268195"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="41268195"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 01:59:48 -0800
X-CSE-ConnectionGUID: kvSznoFeSRmtytSBH7CV1g==
X-CSE-MsgGUID: /FlT5EzqRtKUBJTcL9OzGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="84850853"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa007.jf.intel.com with ESMTP; 06 Nov 2024 01:59:46 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2 1/2] tests/kms_flip: Updating the skip message
Date: Wed,  6 Nov 2024 15:30:20 +0530
Message-Id: <20241106100021.1831921-1-pranay.samala@intel.com>
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

Debugging would be easier if we had logs available for
test failures and skips. This patch rephrases the skip
message for better understanding.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_flip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index cbabbe74f..88cd41083 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1896,7 +1896,7 @@ static void run_pair(int duration, int flags)
 
 	/* If we have fewer than 2 connected outputs then we won't have any
 	 * configuration at all. So skip in that case. */
-	igt_require_f(modes, "At least two displays required\n");
+	igt_require_f(modes, "At least two displays with same modes are required\n");
 
 	if (duration) {
 		duration = duration * 1000 / modes;
-- 
2.34.1

