Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412B8C4829A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 04:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E995010E1E5;
	Wed, 14 Feb 2024 04:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JT3BTL0e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D225710E1E5
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 04:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707886048; x=1739422048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ttwSU8acmaoZz4u+fyh1MGHseGiFI6Yi0DmSgkwHgMc=;
 b=JT3BTL0eD6lflNuHtoEefozYowymbC0F2bKvYCuBNlUs/sIsueyj/xrp
 AQd6G9a5nuyqWMXxkUVYCJs9ekj8fgUH5Io91jLtKVyhVjYiqhFwdq8U1
 HKYFqadAsSbXTX+zag6iXSPHNU27EcbojH8CRiNeINpmld5wlZSuK7EW+
 iL+4KwZ4VqFcAMmW2cYFxstT1igT6zgqCmtXtZshQM47xqg7ZMjc92vFO
 Im7jMR9rhgV7l1TWQl+S0Knlhwbtdtq+/1+0RNRWAekE1imD80JGBI1hw
 2g3QFOsCJFON4NHITGcutwux0nFMSbe0g4qwPGikDfgE7XJ+pmDcutJFc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13307860"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="13307860"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 20:47:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="912002412"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="912002412"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmsmga002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 20:47:25 -0800
From: "Samala, Pranay" <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com,
	pranay.samala@intel.com, Samala@freedesktop.org
Subject: [PATCH 1/1] tests/kms_plane: Restricting number of pixel formats for
 simulation
Date: Wed, 14 Feb 2024 10:17:32 +0530
Message-Id: <20240214044732.24186-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240214044732.24186-1-pranay.samala@intel.com>
References: <20240214044732.24186-1-pranay.samala@intel.com>
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

Signed-off-by: Samala, Pranay <pranay.samala@intel.com>
---
 tests/intel-pre-si-ci/blocklist/display.blocklist | 1 -
 tests/kms_plane.c                                 | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel-pre-si-ci/blocklist/display.blocklist b/tests/intel-pre-si-ci/blocklist/display.blocklist
index 6dcf1be6e..5f5476227 100644
--- a/tests/intel-pre-si-ci/blocklist/display.blocklist
+++ b/tests/intel-pre-si-ci/blocklist/display.blocklist
@@ -190,7 +190,6 @@ igt@kms_display_modes@mst-extended-mode-negative
 ##########################################
 # VLK-49643 : Temp blocklist (incompletes)
 ##########################################
-igt@kms_plane@pixel-format
 igt@kms_plane@pixel-format-source-clamping
 igt@kms_plane_alpha_blend@alpha-basic
 igt@kms_plane_lowres@tiling-none
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 406aecc04..2e91eb3b5 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1080,6 +1080,9 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 		if (f.format == ref.format &&
 		    f.modifier == ref.modifier)
 			continue;
+		
+		if(f.format != DRM_FORMAT_XRGB8888 && igt_run_in_simulation())
+                        continue;
 
 		/* test each format "class" only once in non-extended tests */
 		if (!data->extended && f.modifier != DRM_FORMAT_MOD_LINEAR) {
-- 
2.34.1

