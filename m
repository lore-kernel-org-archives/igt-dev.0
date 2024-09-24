Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D8DCF9C6B
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 11:28:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EF710E2AA;
	Tue, 24 Sep 2024 11:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VoBlraRx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020E410E2AA
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 11:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727177290; x=1758713290;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6fCI58712lwHg2yyK7IiMsylO3NzbpoevYL95TKwMzQ=;
 b=VoBlraRx4BlkinlBhOeeG26ap7j2NlvkzwoY3OK8U1mLioz86YfxTmwG
 p0C2XbdxrXSxIZcxRCVrb1kT1hnSifWTNmtss1ZkXva3GKPbLBbMb9lUX
 B8zShD57RAFjkZJXpl6eYpr/4P921qqDyKdcAXodEVVRkQJsAmLhnAq+R
 Qd1orLlPTgFUzbEuo40lj1RgsCCIQB9gT3GTwJlPain6i1MS8/2oSKCny
 oDaFMLTQ96P3GtgQjqAjUMewCOEYHYVlVJZr6bd3gi132Sc4rvMeHjFvG
 vTMuasTnZgsJUdZnzgnKbsGOVDPhwcDwNe1DelZiK1L4fhEHe3NdpxDrU Q==;
X-CSE-ConnectionGUID: zmwgBN/+Q6esJgR9ZRJl7g==
X-CSE-MsgGUID: /MRU1O/SQB28oOogsliwiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37526230"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="37526230"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 04:28:09 -0700
X-CSE-ConnectionGUID: pr3TOlE9SUWBopOWPlSPBw==
X-CSE-MsgGUID: i1m3kfnlRXC+nZBALyWvYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="71527931"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 04:27:57 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, kunal1.joshi@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH] tests/kms_plane_scaling: Add mode override in scaling test
Date: Tue, 24 Sep 2024 16:57:17 +0530
Message-ID: <20240924112717.2091659-1-ramanaidu.naladala@intel.com>
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

Add a call to igt_output_override_mode to ensure the correct mode
is set for each connector. Modify check_scaling_pipe_plane_rot
function to include igt_output_override_mode. This change helps
in accurately testing the scaling functionality by explicitly
setting the mode before running the tests.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
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

