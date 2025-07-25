Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10499C87FCE
	for <igt-dev@archiver.kernel.org>; Fri, 25 Jul 2025 11:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B860A10E9DB;
	Fri, 25 Jul 2025 11:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gijxhb9h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76FE10E9DB
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jul 2025 11:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753443712; x=1784979712;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7eaNvKyoqYahKp89R6KwAn8UkD6+dTklhUuKSXiZF/A=;
 b=Gijxhb9hRqJ2b+08f/OdMQExwkOyMNZnIh1EFASzwTRMOnaOH+1VvUKp
 1ha6YQDUZ4F7xgYZ4hEpG7fipEqWWPI+12CiQlKqPkcZUiAYKfgPcM1EG
 SbUM37aL8dcMf8O8PloLG4rbJwa0ZwsDXfoAB1oP1LQR5WBqdP7mboqMJ
 NpiRrEzJXYw8KMWc8fuv2y1E/1+UCTiDeqjWysvzFIt9G4k/5ieI+HrXy
 6NKVRBFDItmL72VcjsFnN/OWYZ0b99iG8/1suCUWoYrrEf/hOnjLdHepy
 QN/G1o92tYkwJRQLqwFEprKk25uStHypA5XSwZwm+7OSCaLum4U7S5gF2 w==;
X-CSE-ConnectionGUID: GTPhaIl7TwKX35DuSuPBfw==
X-CSE-MsgGUID: U/n1+DxyTVqRrCA9FC1ONg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73358579"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="73358579"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 04:41:52 -0700
X-CSE-ConnectionGUID: 39/Gd0SjSyuTHHEZZIAqtA==
X-CSE-MsgGUID: AGgNb3MKRyypH67xATlccA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="160040613"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 04:41:50 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org,
	anshuman.gupta@intel.com
Cc: soham.purkait@intel.com, riana.tauro@intel.com, lucas.demarchi@intel.com
Subject: [PATCH i-g-t v1] tools/gputop/xe_gputop: Keep engine activity
 percentage between 0 and 100
Date: Fri, 25 Jul 2025 17:05:02 +0530
Message-Id: <20250725113502.3180536-1-soham.purkait@intel.com>
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

Engine activity percentage within the valid range of 0 to 100 prevents
out-of-bound values that could lead to undefined behavior during runtime.
One typical scenario could be during a GT reset, where the engine activity
percentage might spike to a very high value, potentially leading to a
segmentation fault while setting the progress bar.

v1:
 - Use clamp for clearer and shorter percentage bounding (Lucas)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tools/gputop/xe_gputop.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
index 9757369a8..bb2caa6ea 100644
--- a/tools/gputop/xe_gputop.c
+++ b/tools/gputop/xe_gputop.c
@@ -281,7 +281,8 @@ static double pmu_active_percentage(struct xe_engine *engine)
 	double percentage;
 
 	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
-	return percentage;
+
+	return clamp(percentage, 0., 100.);
 }
 
 static int
-- 
2.34.1

