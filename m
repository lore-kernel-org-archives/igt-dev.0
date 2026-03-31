Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E12910F92E6
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 18:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E569010E96C;
	Tue, 31 Mar 2026 18:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MFWYLPCa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C3B10E96C
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 18:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774980973; x=1806516973;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f7rw3oNgL8QGU4TwBtTdL/ZbddKt+2fqp5Krr1Ytxeo=;
 b=MFWYLPCaRx0QXwdTdedI8IkUYjfLwgU8jFrwuUfEnvNHLXDZYn4XkIrP
 33vJMCw11yg60qWuT22VYLybbBoq+wsgQh3bXmWuCTEZAefwR6RvJOIIb
 wJWfwjCvyuPva/MK4pT0GEwEA1CCwtzLuUUhbO1MDh9pYjiU1aZwqJzNc
 H5UBc8g6kPCT8KxeHMSbn8zbuBJhsiPiHq3c8GCpQrOyx8q/NmsoTADzK
 bVX+76etG1JHDfCFbJtiP5bBezSeX+lULrkF+3brBWpoQd5LUxV2/6Fqx
 apb+pwutTKGcDbX+dygy4vVRdMZEVaJJcyAGJOpNU/AlT3mmN2HgpadhZ w==;
X-CSE-ConnectionGUID: YcWDZpwlR7yDCs4+EsXNjQ==
X-CSE-MsgGUID: IuLGym9PT/yo/NGvoHhIcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75722647"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="75722647"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 11:16:13 -0700
X-CSE-ConnectionGUID: 2mHmLuOXTreatKcu6m9gFw==
X-CSE-MsgGUID: UGMwAlsTSG6d3XztveOS0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="231367823"
Received: from lnl1-rocket-lake-client-platform.iind.intel.com ([10.223.55.16])
 by orviesa005.jf.intel.com with ESMTP; 31 Mar 2026 11:16:12 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Skip runtime PM active check on
 headless systems
Date: Tue, 31 Mar 2026 23:46:06 +0530
Message-ID: <20260331181606.22367-1-mohammed.thasleem@intel.com>
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

Skip runtime PM active check on disconnected displays in DPMS_ON.
On headless systems, DPMS_ON operations don't enable CRTCs or acquire
RPM wakerefs, leaving the device suspended.
Skip the active state wait when no outputs are connected.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 39e94f36b..39d00bb6e 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -385,6 +385,17 @@ static void setup_dc_dpms(data_t *data)
 	}
 }
 
+static bool has_connected_outputs(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+
+	for_each_connected_output(display, output)
+		return true;
+
+	return false;
+}
+
 static void dpms_off(data_t *data)
 {
 	for (int i = 0; i < data->display.n_outputs; i++) {
@@ -406,7 +417,13 @@ static void dpms_on(data_t *data)
 					   DRM_MODE_DPMS_ON);
 	}
 
-	if (!data->runtime_suspend_disabled)
+	/*
+	 * DPMS_ON on disconnected connectors does not enable any pipe
+	 * or acquire a runtime PM wakeref, so the device will never
+	 * transition to active state. Skip the wait when no outputs
+	 * are physically connected.
+	 */
+	if (!data->runtime_suspend_disabled && has_connected_outputs(data))
 		igt_assert(igt_wait_for_pm_status
 			   (IGT_RUNTIME_PM_STATUS_ACTIVE));
 }
-- 
2.48.1

