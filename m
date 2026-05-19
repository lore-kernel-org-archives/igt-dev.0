Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DF2CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 09:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA75610EB94;
	Tue, 19 May 2026 09:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQT8KSr9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4BC10EBA1
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 09:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779181880; x=1810717880;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lkIS2xeknMSrttFqFPX0lcf+pqbugID9vH0a3VAtIGQ=;
 b=PQT8KSr9E90CqLhCwmVL5ZnspheiRhqlGQFiaTYdo17geOPeCZzuxxY3
 RtFstl2tCp7IiXMDCYvoAJhWRMuBjvialTV5QMkRvrB7AE0Lbxv2pTMbW
 jrsVwXiG55aCerkI5KG8QOFGWGtJkNkYgdfOFbLIvT7sEldyIPaYPU2bx
 1oHxrzAKnOVLkOppSZKiTiMcth4Yu5AMxTMH+U3Xrg6zuvhkoLtHOsw7m
 A2GfaNij4NDHwFum8ZwwwUynEc0aaj64hriR7gOzT66F+O9Sm0Qj3wQKS
 37OW4aKVpgK5KFuRifjAI+po3vB+68KxC+ebOJq85aKdsFws+XmCs+F5J Q==;
X-CSE-ConnectionGUID: XomCLC+JR2q1MJJTVqrbew==
X-CSE-MsgGUID: 6g4SeSDGS4Sv4OP3uaRsVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79077214"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="79077214"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 02:11:19 -0700
X-CSE-ConnectionGUID: 7LQPCTS5T4SoD004hAqGgQ==
X-CSE-MsgGUID: dAQCWTx8SyWdfPC0DH7Asw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="277823528"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.184])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 02:11:18 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t] tests/xe_pat: Use S3 instead of standby
Date: Tue, 19 May 2026 11:11:09 +0200
Message-ID: <20260519091108.106853-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
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

Standby state is not available on CI, use S3 instead.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/xe_pat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 81c28677ac..dc14565d45 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -270,7 +270,7 @@ static void pat_sw_hw_compare(int fd, enum pat_test_opts opts)
 		if (opts == PAT_RESET_GT)
 			xe_force_gt_reset_sync(fd, gt);
 		else if (opts == PAT_SUSPEND)
-			igt_system_suspend_autoresume(SUSPEND_STATE_STANDBY, SUSPEND_TEST_NONE);
+			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 
 		hw_entries = xe_get_pat_hw_config(fd, &pat_hw_config, gt);
 		sw_entries = xe_get_pat_sw_config(fd, &pat_sw_config, gt);
-- 
2.43.0

