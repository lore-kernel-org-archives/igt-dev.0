Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBD3C3ABB0
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 10:06:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB44C10E07D;
	Mon,  5 May 2025 10:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ip4Hzbiw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29F010E07D
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 10:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746439601; x=1777975601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pdmP+qglJU9K6S1cC8Tb3J0ntV63WH4P4cGPPL8rqxY=;
 b=ip4Hzbiwnaidas0tBj4I1NpFFh4IDkfFnoqSELik4u+mRhzSdKAShizx
 NAAi4qNQH9gzPy/3aLiQyDA3Oy/3Z+v1GNa+sSYrNm3GWsEVbLpcj5p6r
 BWA/1h/xgkj2kY6owGr4AMAPnO2lL2+P2hq957l4FlN2i6X3JE/pFE4cO
 piG9xzrsqYLYaPFvOvUWZKuLebsatcKXFPnid/3mTonbAZeTfN5usbXeY
 wYTZyazgyQtLhP93Ae7tGsa7jeSCHsI8GD2wtwmx2iGh7NJkaP5JZS4H1
 3THB5ldimNTHnowA7Q6DC8rFE2J+1A44TboZRzYeM1XHttyxf7iL2h2GS w==;
X-CSE-ConnectionGUID: x/tft4UjQHGNyE7snF4NvA==
X-CSE-MsgGUID: wO89X8iYSBS3F5bV87lcDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="47947354"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="47947354"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 03:06:40 -0700
X-CSE-ConnectionGUID: Vnz/+7CXRi645JAWSAQXsg==
X-CSE-MsgGUID: PMUI3tw9SFWpFIdStPwMmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="172437770"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.239.27])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 03:06:37 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t 1/5] tests/intel/xe_pmu: Add a helper function to check
 and end cork
Date: Mon,  5 May 2025 15:59:42 +0530
Message-ID: <20250505102946.159655-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250505102946.159655-1-riana.tauro@intel.com>
References: <20250505102946.159655-1-riana.tauro@intel.com>
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

Add a helper function to check if cork is active and
end cork

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 094dc0c6c..03a966708 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -134,6 +134,12 @@ static uint64_t get_event_config_fn(unsigned int gt, int function,
 	return get_event_config(gt, eci, event) | add_format_config("function", function);
 }
 
+static void check_and_end_cork(int fd, struct xe_cork *cork)
+{
+	if (cork && !cork->ended)
+		xe_cork_sync_end(fd, cork);
+}
+
 /**
  * SUBTEST: engine-activity-idle
  * Description: Test to validate engine activity shows no load when idle
@@ -172,8 +178,8 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
 		xe_cork_sync_end(fd, cork);
 	pmu_read_multi(pmu_fd[0], 2, after);
 
-	if ((flags & TEST_LOAD) && !cork->ended)
-		xe_cork_sync_end(fd, cork);
+	if (flags & TEST_LOAD)
+		check_and_end_cork(fd, cork);
 
 	engine_active_ticks = after[0] - before[0];
 	engine_total_ticks = after[1] - before[1];
-- 
2.47.1

