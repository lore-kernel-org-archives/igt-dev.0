Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A953DC44507
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 03:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB1810E3D9;
	Fri, 17 Jul 2026 03:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cBamdglU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87D310E3D9
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 03:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784260631; x=1815796631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rO8KWCc1SSdau1eLqiKjcHjqfWnXRlRi2Af+fRuBrEg=;
 b=cBamdglUhWdFS9P+Gdd6cY63NkfjficqupLUlbQcntwiYLHOqcKUrQNT
 dyOGuL70oXzg/BHKHyxtdrNEwB4pjXfxgVWVOPcpS4+2X1e3EWFaO5R4u
 MPrXaokv6kXOhoxYVddlnQ6m+NB0Ngo4cO8OOuTbahohDSM7A/97uXVFo
 ZI35qASNHKgqi41oUNAkkoW/e4MzL4DdveBTRk9+D4ogMxdjMphR8mVqX
 zB5uSRmXyv+8MzmFRcr5hnODygdZCvLyCTApOUvaRgQtIiqqVsWBp1F6u
 ppbZPUInC+1Pd8/lldqL6PYD1sFFGA9g7eRic0cb3Dioh02rNi0u/S4n5 Q==;
X-CSE-ConnectionGUID: T4sVzOauTL2hsaWQy1y7fA==
X-CSE-MsgGUID: aefmd2HiREGe6F55uO4pmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="110480307"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="110480307"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 20:57:10 -0700
X-CSE-ConnectionGUID: 4dcb19JYTSyduh10wIycwA==
X-CSE-MsgGUID: 707/7M69TFK2CpdbsmL4mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="261626395"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 20:57:09 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/kms_pm_dc: Fix PSR/PR entry timeout in
 dynamic subtests
Date: Fri, 17 Jul 2026 09:26:57 +0530
Message-ID: <20260717035658.857405-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717035658.857405-1-jeevan.b@intel.com>
References: <20260717035658.857405-1-jeevan.b@intel.com>
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

After cleanup_dc3co_fbs disables the primary plane, later dynamic
subtests can wait for PSR2/Panel Replay entry without any valid plane
content, causing entry checks to time out.

Add commit_initial_dc3co_frame and call it before setup_dc3co in
all DC3CO test paths to ensure a valid framebuffer is present when
PSR2/Panel Replay entry is verified.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index ef53c5f96..018def5e4 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -315,6 +315,16 @@ static void setup_videoplayback(data_t *data)
 	create_color_fb(data, &data->fb_rgr, red_green_red);
 }
 
+static void commit_initial_dc3co_frame(data_t *data)
+{
+	igt_plane_t *primary;
+
+	primary = igt_output_get_plane_type(data->output,
+					    DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, &data->fb_rgb);
+	igt_display_commit(&data->display);
+}
+
 static void check_dc3co_with_videoplayback_like_load(data_t *data)
 {
 	igt_plane_t *primary;
@@ -356,8 +366,9 @@ static void test_dc3co_vpb_simulation(data_t *data)
 {
 	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
 	setup_output(data);
-	setup_dc3co(data);
 	setup_videoplayback(data);
+	commit_initial_dc3co_frame(data);
+	setup_dc3co(data);
 	check_dc3co_with_videoplayback_like_load(data);
 	cleanup_dc3co_fbs(data);
 }
@@ -436,8 +447,9 @@ static void test_dc3co_framedrop(data_t *data)
 {
 	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
 	setup_output(data);
-	setup_dc3co(data);
 	setup_videoplayback(data);
+	commit_initial_dc3co_frame(data);
+	setup_dc3co(data);
 	detect_dc3co_framedrop(data);
 	cleanup_dc3co_fbs(data);
 }
@@ -493,8 +505,9 @@ static void test_dc3co_vpb_framegap(data_t *data)
 {
 	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
 	setup_output(data);
-	setup_dc3co(data);
 	setup_videoplayback(data);
+	commit_initial_dc3co_frame(data);
+	setup_dc3co(data);
 	check_dc3co_with_framegap_load(data);
 	cleanup_dc3co_fbs(data);
 }
@@ -706,9 +719,10 @@ static void test_dc3co_after_dc6(data_t *data)
 	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC6);
 
 	setup_output(data);
+	setup_videoplayback(data);
+	commit_initial_dc3co_frame(data);
 	setup_dc3co(data);
 	test_dc_state_dpms(data, IGT_INTEL_CHECK_DC6);
-	setup_videoplayback(data);
 	check_dc3co_with_videoplayback_like_load(data);
 	cleanup_dc3co_fbs(data);
 }
-- 
2.43.0

