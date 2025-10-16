Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4A6CCD185
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 04:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DAD10E27E;
	Thu, 16 Oct 2025 04:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ni47eLz8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA1210E27E
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 04:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760589367; x=1792125367;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jQYch3MGoZ6Fm8V+GH74vEkYYYybIICaNgWXNeMXrbo=;
 b=ni47eLz8r4ANbfaa3gO/1aCg3Idk3tsdg3bbkmmbpSCtCMxGsKZ0aW6t
 Ndv6STdHaLsA/gCe+sh0rKFiNXyVbjkKQVz6f4H/B+xaT3DWsPOU+4JpM
 sX4h9y7n5CZQ5aBf5DCtPIQKcJ1wh1TJcLK7XLdAd5ZHfsC7P76sld9tO
 wBKp4mts80owUixQ528pFZ5c2HmY9byeSJSeKw7Wo5JcMUNltG2leJ92t
 9fDttlzFcqB+5mA6GkP5D4NkDmioO5KqFgbrLIh0qPNR4CAk3wKU+3IBF
 7ZivvKhtVKZ94BQxoqy1CB66S1yI4QUkUUsNJkemi0Bh77BLZE09JyiaD Q==;
X-CSE-ConnectionGUID: iIb4xPBiRtOs8MpIQEY5bA==
X-CSE-MsgGUID: RHplt5qdSbiWbSFgRjRkOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66603395"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66603395"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 21:36:06 -0700
X-CSE-ConnectionGUID: WwWsmd5cTLm/DWKuNYK3Sg==
X-CSE-MsgGUID: kybnYwYKS2SP9WOF5UyLDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="181482168"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 21:36:05 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com, kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3] tests/intel/kms_joiner: Check DSC slices for force
 ultra joiner
Date: Thu, 16 Oct 2025 10:01:57 +0530
Message-Id: <20251016043157.691206-1-santhosh.reddy.guddati@intel.com>
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

v2: Remove local variable and check inline (Swati)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_joiner.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index d1ddbeb60..55bdef9fa 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -196,7 +196,8 @@ static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *o
 
 	if (ultrajoiner_found) {
 		igt_output_override_mode(output, &uj_mode);
-	} else if (force_joiner_supported) {
+	} else if (force_joiner_supported &&
+		   igt_get_dsc_sink_max_slice_count(data->drm_fd, output->name) >= 8) {
 		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector,
 							JOINED_PIPES_ULTRA_JOINER);
 		igt_assert_f(status, "Failed to toggle force joiner\n");
-- 
2.34.1

