Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE75FF8868
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 10:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D190910E30B;
	Tue, 28 Apr 2026 10:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGd3g/7Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD12710E30B
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 10:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777373280; x=1808909280;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A86X1bJMB3F2tCazNjQzBvJtZBdZc7bSG8Xh0Bd8pGA=;
 b=JGd3g/7Q+oImJO6eeh+WnzFfhc+4qm885nSCi5X1QaJqJZGBE51UuaLB
 mMWhzJxuKe3//r0kQxbtSpclEV11UHXe7QT8j64y98AGhtbQyAzmbb+fL
 14aK4eJyHXnBrpPoMlt1v9goo4aS324eKYCgZQgoigzoAy2UbleLH7vNN
 JzXspmFh7s6cr65xdPimDMauiiGKVTFCMaJO6eTWoDboqktyjafk6a6CQ
 ZHrDjd7MjY+aq0mvtB13l1BQ3iSnG7NdictFp8LsJcSB6VF+cgghFcE/q
 EF8gZCaT+Q7Inyjv9jkZa1++TqjxEXnsOVGNIA44gg9JI6prbFQ+dPfgh A==;
X-CSE-ConnectionGUID: fsI9lGKZRmG5A/8b/3esog==
X-CSE-MsgGUID: SXUNJOhoS+CL1KhrJjujSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="89658124"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="89658124"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 03:47:43 -0700
X-CSE-ConnectionGUID: Qmc0wqEMR2i8XEa4XvVWag==
X-CSE-MsgGUID: rTebG7wfR6Go21VWVC590Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="232911977"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by orviesa006.jf.intel.com with ESMTP; 28 Apr 2026 03:47:43 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] tests\intel\xe_configfs: Fix ctx_restore BB path for post and
 mid variants
Date: Tue, 28 Apr 2026 16:21:09 +0530
Message-ID: <20260428105109.1146213-1-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
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

Fixed the hardcoded "ctx_restore_post_bb" write with the computed
file name ("ctx_restore_%s_bb") in test_ctx_restore_invalid so the
invalid-case tests work for both "post" and "mid" variants.

Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
---
 tests/intel/xe_configfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index f024235f2..39762e030 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -234,7 +234,7 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
 	char file[64] = { };
 
 	snprintf(file, sizeof(file), "ctx_restore_%s_bb", type);
-	igt_sysfs_set(configfs_device_fd, "ctx_restore_post_bb", "");
+	igt_sysfs_set(configfs_device_fd, file, "");
 
 	/*
 	 * These only test if command parsing is correct,
-- 
2.43.0

