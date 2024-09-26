Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BB0CDE029
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 18:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C140610EBCC;
	Thu, 26 Sep 2024 18:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4gkUDs7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6107310EBCC
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 18:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727374357; x=1758910357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lgs2P+mKEunfidmGmC2Qes3fpIGfTrntnGseQIGz0sY=;
 b=O4gkUDs70mHm2oIjiVQhZYydQfQAmhE64HPPzJYNS/O5o+BtqfHG3aOM
 0eFKAUa9hGC1TWUJ/96K+ZCFYmq1F7l0FZ1HrOz8floIZ/32xZXGR/qUs
 NVpVcS1ocYyWbdSCEhn1PfB/bA4AYZw/Ntfzlh8bP09GYElKnY2eDz0UD
 NnDgo/YE5DU0bYova8J6zOLAy71HCLHxX4qVmZysunPoFoHwGncjpmNFh
 Fe1WbeeQ08MDbqOMrwLgGgJbt7ZvXs5U05M5I50GJmuM5ZtPxLvjHc6fL
 RDb/AuFtwVSm0hfi63BXt5TmKlcwRVMUhtqb4K9fwEZqNJvt8XbaLP1/9 w==;
X-CSE-ConnectionGUID: iGnNwb/8S8K/pSAFkLjJqA==
X-CSE-MsgGUID: p0/xAQbhSwabJ9B/6fQ61A==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26303767"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="26303767"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 11:12:37 -0700
X-CSE-ConnectionGUID: iL4V5DLgSz+hwZkeL3VHdw==
X-CSE-MsgGUID: JEJgG6heSYGrFh5COdrvIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="76327212"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 11:12:35 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 1/3] tests/kms_plane_scaling: Add mode override in
 scaling test
Date: Thu, 26 Sep 2024 23:41:48 +0530
Message-ID: <20240926181150.2148704-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240926181150.2148704-1-ramanaidu.naladala@intel.com>
References: <20240926181150.2148704-1-ramanaidu.naladala@intel.com>
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

Add a call to igt_output_override_mode to ensure the correct mode
is set for each connector. Modify check_scaling_pipe_plane_rot
function to include igt_output_override_mode. This change helps
in accurately testing the scaling functionality by explicitly
setting the mode before running the tests.

Fixes: 27926dd5792a ("tests/kms_plane_scaling: Find display mode fitting in BW for rotations")
Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_plane_scaling.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index bc9114acd..96ceedee2 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -585,6 +585,7 @@ check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 
 	for_each_connector_mode(output) {
 		mode = &output->config.connector->modes[j__];
+		igt_output_override_mode(output, mode);
 		igt_debug("Trying mode %dx%d\n",
 			  mode->hdisplay, mode->vdisplay);
 
-- 
2.43.0

