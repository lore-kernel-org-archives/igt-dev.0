Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757D0CAC5AA
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 08:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19D910E29D;
	Thu, 25 Sep 2025 08:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EcKMzGLS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBB610E29D
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 08:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758790142; x=1790326142;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XhJohDNLfqwlXId78yOKmetDjUJ5p5dE+XYvtOBml8I=;
 b=EcKMzGLSDSkfwcENFl5ExYJg6b634af7NYgV9EJHQrmftzPbQ/a5AJjf
 j3KDHFyXg2G626fn8YHJQGcEf1kXE2wIWYl0frQujbbUyoBcViHRHaH1g
 OqTUww+gZkmtDsbqMxic89E33IqQCTc6reE4nLvwtx8ICge4B7RuBC3P9
 /+1y1G5lWb6SMk4iLgO8IAGtkZSQ/VqKXQexwmaWkRjiFpH8p+zAznegJ
 gyTRwqeGW4AHkzg1ZuFDGLAdkp/NV7tdLrN7Rz8fJuoEBfwDmfTWD5bSv
 8DHllB0MqJQUf48CmWo42IQac+WyowfYO1rKhK4IcoVo3SCeXGiF43tM0 w==;
X-CSE-ConnectionGUID: PIfcySBGQKCe0D26t35nVQ==
X-CSE-MsgGUID: w/2a9ybZRTaQ43AEsdIYIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="64738517"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="64738517"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 01:49:01 -0700
X-CSE-ConnectionGUID: TVr1deuRRN2+q0f61bizcw==
X-CSE-MsgGUID: OasYWop6TpWurpniuq6KzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="177671976"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 01:48:59 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com, kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_joiner: Check DSC slices for force
 ultra joiner
Date: Thu, 25 Sep 2025 14:16:14 +0530
Message-Id: <20250925084614.430161-1-santhosh.reddy.guddati@intel.com>
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
index d1ddbeb60..3f4c430e7 100644
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
+	dsc_slice_count = get_dsc_sink_slice_count(data->drm_fd, output);
 
 	if (ultrajoiner_found) {
 		igt_output_override_mode(output, &uj_mode);
-	} else if (force_joiner_supported) {
+	} else if (force_joiner_supported && dsc_slice_count >= 8) {
 		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector,
 							JOINED_PIPES_ULTRA_JOINER);
 		igt_assert_f(status, "Failed to toggle force joiner\n");
-- 
2.34.1

