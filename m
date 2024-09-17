Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E93EC36014
	for <igt-dev@archiver.kernel.org>; Tue, 17 Sep 2024 11:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8EFA10E0D0;
	Tue, 17 Sep 2024 11:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DWvZUBo/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BE110E0D0
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Sep 2024 11:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726572298; x=1758108298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yL3DBDSXoVT6OBGmzmf99jR1gOOg4DinM9wGMYeBvEE=;
 b=DWvZUBo/xtXMKPwLTzAvC9LPlw7h1FupodlfolQPJzEtWQzj6h2YMuQY
 RiA5MjGHY90tn9mib+c32ucRocqkh8Lsd0k4CuiU+eJWGnOztKNMDpaJp
 PykdacGmVHCJjD5aLiIaaOEBWgQpTzbBiyek3cYjCV8av87c0Dsxu48rq
 5KDnDnb8K4ezsCPDuthUKAAxo4/b99QMt2RGAZWa3h/S86EDFnGxUfqoJ
 y9muqPtRK2TepTLzvqCufH86R74ER8Qkv4gFyVDU1dx5dgwweThqs17Ru
 mREKeRTLYkkV2FZqg6c3NB/4wmewoAQDkIfn2d/zcN53+1+3hJo58H+7W w==;
X-CSE-ConnectionGUID: 14ecO7z4R+iEZCSesMVZ2g==
X-CSE-MsgGUID: MgGmz80nQb6Ai6zPVuBzGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29207439"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="29207439"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 04:24:58 -0700
X-CSE-ConnectionGUID: RnStqqicQEuF3fefgOn06w==
X-CSE-MsgGUID: jw6YRGk1SMWU3sBdLIJd4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="73249912"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 04:24:56 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t 2/2] HAX: [DO NOT REVIEW] Add xe_pm
 idle-residency-on-exec test to fast feedback list
Date: Tue, 17 Sep 2024 17:08:59 +0530
Message-Id: <20240917113859.1499723-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240917113859.1499723-1-karthik.poosa@intel.com>
References: <20240917113859.1499723-1-karthik.poosa@intel.com>
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

Add multiple idle-residency-on-exec test to fast feedback list to check
execution time of workload of the test.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 01b01dcf9..525d64f26 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -160,6 +160,31 @@ igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
 igt@xe_pm_residency@gt-c6-on-idle
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
+igt@xe_pm_residency@idle-residency-on-exec
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
 #igt@xe_prime_self_import@basic-llseek-size
-- 
2.25.1

