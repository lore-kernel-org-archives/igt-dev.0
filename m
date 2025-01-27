Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF61C02188
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 10:14:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB2810E4F5;
	Mon, 27 Jan 2025 10:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ElVy+As6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148E610E38B
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 10:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737972877; x=1769508877;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CnywKpMCDoDw/PjQLzZgDVGrGbOM1FanS4HTguze3QQ=;
 b=ElVy+As6VDhTM6GVITSV5a685DZ0zZUhFp94Q+vNvk3mzxaabCCSqJff
 4UVjTrdicSWFExQKDf+q1fpKnR61bWWnqoWnDu2dL6nXOkHLo76e1+pCp
 ttf2v6JeyiA/sFnVm+asYoEP2Y1K8pbdKJ7ZaTx/0BVAYvMYRbXtA0Yk6
 VxDu7uleGEJ/3di2fYXtJ/xIwPHdrDvaFJiuZpcids4gyqqAKNcavGxYC
 Wjdpiy5xlj8Ct2+xbF4EbJuLiBu8s32kw0kiagf9ElHluep+mZiVP4aNM
 vHmWDVKwmUtiEHIYDfkajIvNeqhe5155wCD/RJje6d2GiWSjn2DPf0uA7 g==;
X-CSE-ConnectionGUID: 6aB0XQz5TAKUEEii38/Gyg==
X-CSE-MsgGUID: oLeG9DCaRS2K9cc1P3NmOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="49819440"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="49819440"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 02:14:35 -0800
X-CSE-ConnectionGUID: e0fBnE4aQ7aN0vQSjKcY3A==
X-CSE-MsgGUID: apcO8wV9SCClM2l9c9tKuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="139269601"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.242])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 02:14:33 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_mix_modes: Use IGT comparison
 functions
Date: Mon, 27 Jan 2025 11:14:25 +0100
Message-ID: <20250127101425.21082-1-francois.dugast@intel.com>
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

With igt_assert() the logs were only telling us that the comparison had
failed. With igt_assert_lt() the logs provide the actual values that
were compared, which helps debugging.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_exec_mix_modes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
index 0bcd49cc0..59887d2aa 100644
--- a/tests/intel/xe_exec_mix_modes.c
+++ b/tests/intel/xe_exec_mix_modes.c
@@ -169,10 +169,10 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
 			 * depending on the execution mode.
 			 */
 			if (engine_execution_mode == EXEC_MODE_LR)
-				igt_assert(igt_nsec_elapsed(&tv) < 0.5 * duration_ns);
+				igt_assert_lt(igt_nsec_elapsed(&tv), 0.5 * duration_ns);
 			else if (engine_execution_mode == EXEC_MODE_DMA_FENCE &&
 				 job_type == SPINNER_INTERRUPTED)
-				igt_assert(igt_nsec_elapsed(&tv) > duration_ns);
+				igt_assert_lt(duration_ns, igt_nsec_elapsed(&tv));
 		}
 	}
 
-- 
2.43.0

