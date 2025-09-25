Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4C1CAC5A7
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 11:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB6C10E8CA;
	Thu, 25 Sep 2025 11:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ek9+J3gs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3E010E8CA
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 11:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758798722; x=1790334722;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=adTA2pa9yuGM4liuztffAHIbwztHR40pi6Mw/O6pAQ0=;
 b=ek9+J3gsl2ag5o7QV9U22iAgZ3o6/JcL3D4w7giheGgRJZxnKVooeRhY
 LQPARfHxaA61kbMCbGr5iBBTJ3V86FkeTy0Hmc98Nbp1Jkk7VJVtpOqO2
 Iaw3O9HBqQZx8RgK+fQKE0LEWOX2+yrdLxsTMlWOMjoFNnqtSBfaLJ9cE
 5m7fijPbRtjaS4HbS0IRFGSIbtQprt/O/lUwNBpleid5a+SVO19sRhhwa
 pK6BEyspYTt5WYewlzAJlOs6QEITW8yLThTV7EVhcNNFflDEwrJEqa9Oj
 hg2c0xQSRkT9KxdajFcgkyARTmMRgmlcrl1IyINz+qjObV5+Xa/tN4d9g Q==;
X-CSE-ConnectionGUID: BQBhco0NQDK6s6Rx+16png==
X-CSE-MsgGUID: mjMDF1F4R6ePyu3KIBU0zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="72540015"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="72540015"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 04:12:01 -0700
X-CSE-ConnectionGUID: 6IQwqEnhT7GQyu8ch1azkA==
X-CSE-MsgGUID: 6vvq/YF6RP2Vl3O19bGkxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="176878481"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 04:12:00 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com, kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_joiner: Check DSC slices for force
 ultra joiner
Date: Thu, 25 Sep 2025 16:39:13 +0530
Message-Id: <20250925110913.430704-1-santhosh.reddy.guddati@intel.com>
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

Check for DSC slice count before enabling force joiner mode.
This ensures that force joiner is only applied when the sink
supports at least 8 DSC slices, preventing invalid commits.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_joiner.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index d1ddbeb60..4cbc03cf3 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -187,16 +187,18 @@ static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *o
 	bool ultrajoiner_found;
 	enum pipe pipe;
 	bool force_joiner_supported;
+	int dsc_slice_count;
 
 	drmModeConnector *connector = output->config.connector;
 
 	ultrajoiner_found = ultrajoiner_mode_found(data->drm_fd, connector, max_dotclock, &uj_mode);
 	force_joiner_supported = igt_has_force_joiner_debugfs(data->drm_fd, output->name) &&
 				 is_dsc_supported_by_sink(data->drm_fd, output);
+	dsc_slice_count = igt_get_dsc_sink_max_slice_count(data->drm_fd, output->name);
 
 	if (ultrajoiner_found) {
 		igt_output_override_mode(output, &uj_mode);
-	} else if (force_joiner_supported) {
+	} else if (force_joiner_supported && dsc_slice_count >= 8) {
 		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector,
 							JOINED_PIPES_ULTRA_JOINER);
 		igt_assert_f(status, "Failed to toggle force joiner\n");
-- 
2.34.1

