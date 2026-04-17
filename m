Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33807F8DFE9
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 08:44:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E164F10E992;
	Fri, 17 Apr 2026 08:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLSJyC0N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507A710E992
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 08:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776415430; x=1807951430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dU1/Fw6MQ1FEFEXyzDa1xQZo+fkr3x+qHYs3sIK43ok=;
 b=OLSJyC0NE8g6N0u89GRz5K1pOwwVofz2HaxSFcZvO+Uh9ccFjwBtntFR
 HT+XRHpGrkDuYph/TJOk3DfWfHn51dS9gSGaZQP1DjumW5fby/cYxN+D1
 EOxuU7V1Q8GvFwjBtEN6ZCcLeule0guLkS5oU6B95i0xYwSn+g+uhYNzc
 SwJRhgt9NOOkIRnzBt9rs2XuHVvLNrDK6+U6ARUg/w+vvBaw7n+oSfEJQ
 AtuY3iZSJ1e7GoVYGyBJKkklYWJwWkKLCnwvNqPrMxP6kEPurdrEa22dC
 cg66FAUUI3c+XQJfz3pS3e8GaDzMyrqNhO+wViZJKkZPbN4GxpJYmZ4p8 w==;
X-CSE-ConnectionGUID: 7e/VmTVuQUy3wt46Wk4wTw==
X-CSE-MsgGUID: dFSBWjI2TBGd2yvTMoHLBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81308439"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="81308439"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:43:50 -0700
X-CSE-ConnectionGUID: 382gcIURQPmiV4jr+gGxqA==
X-CSE-MsgGUID: DPdwYnnDReKiUNk98ZUApA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="235361737"
Received: from unknown (HELO linux-Meteor-Lake-Client-Platform.iind.intel.com)
 ([10.223.55.75])
 by orviesa004.jf.intel.com with ESMTP; 17 Apr 2026 01:43:50 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v2 3/7] Revert "tests/intel/kms_pm_dc: Update test duration to
 4 seconds"
Date: Fri, 17 Apr 2026 14:05:02 +0530
Message-ID: <20260417083506.33404-4-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417083506.33404-1-mohammed.thasleem@intel.com>
References: <20260417083506.33404-1-mohammed.thasleem@intel.com>
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

This reverts commit 4eba89501947cf67d34475b4493489334a292f23.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index bb5f2ffc5..3f93a2a82 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -538,10 +538,8 @@ static int has_panels_without_dc_support(igt_display_t *display)
 static void test_deep_pkgc_state(data_t *data)
 {
 	unsigned int pre_val = 0, cur_val = 0;
-	time_t start = time(NULL);
-	time_t duration = (4 * SEC);
-	time_t delay;
-	igt_crtc_t *crtc;
+	time_t start = time(NULL), duration = 2, delay;
+	enum pipe pipe;
 	bool pkgc_flag = false;
 	bool flip = true;
 
-- 
2.43.0

