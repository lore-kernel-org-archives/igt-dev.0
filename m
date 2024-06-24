Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38E7C2BD09
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 18:06:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8125810E53D;
	Mon, 24 Jun 2024 18:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UxH5FivP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E6D10E51C
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 18:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719252412; x=1750788412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0sk/g2kUEbopLl9ByaziSjpfV/WGSE0cx+sfBs9pCOk=;
 b=UxH5FivPP9CPWk8XcIzf80sAMef5y5dQFUZUcAwcXMk1OE415hyrFLLP
 YNipNO0WAhrN+6I92hExpKr/TFPv746VuX6QcNnPHaQvEemQaiUTvdOdV
 JdxUtZr9EKiDABDfd2WhUgg1qFvTRFDl9oX1d9W2rpxEekR6pFeQ3BZ95
 zjriVlgVWGZMgktSWSpfSvVx2yQ8MPvH8NAjFB572mRTZq+B+b7v1tSM3
 1GwEy32tI++CpG4GAwYKNfA4PEbvClyGh1hXD57pUY36Chvyc+R+jEo9r
 46xIzXHPP7KRpE6i+rWvV5G4pvl66jpdfT/DUT+qPiVMwsVeZrvB4SKj5 A==;
X-CSE-ConnectionGUID: 1H29shwjTP6dNlCivQxNPw==
X-CSE-MsgGUID: xHkxgrNuR92kD/K/ap6hPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="15930199"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="15930199"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 11:06:52 -0700
X-CSE-ConnectionGUID: opEMoZnGT0Khe0kGhcgaTg==
X-CSE-MsgGUID: lHDbT65aS32Y9GoWNSsqYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="80919447"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 11:06:51 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com, kamil.konieczny@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_psr2_sf: Add checks for early
 transport
Date: Mon, 24 Jun 2024 23:45:33 +0530
Message-Id: <20240624181533.1600552-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240624181533.1600552-1-jeevan.b@intel.com>
References: <20240624181533.1600552-1-jeevan.b@intel.com>
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

Add checks weather early transport if supported then
we check if early trasport is working.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_psr2_sf.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 4c3e34aa0..e612b8266 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -168,6 +168,7 @@ typedef struct {
 	igt_plane_t *test_plane;
 	bool big_fb_test;
 	bool fbc_flag;
+	bool et_flag;
 	cairo_t *cr;
 	uint32_t screen_changes;
 	int cur_x, cur_y;
@@ -184,11 +185,23 @@ static bool set_sel_fetch_mode_for_output(data_t *data)
 {
 	bool supported = false;
 
+	data->et_flag = false;
+
 	if (psr_sink_support(data->drm_fd, data->debugfs_fd,
-						 PR_MODE_SEL_FETCH, data->output)) {
+						 PR_MODE_SEL_FETCH_ET, data->output)) {
+		supported = true;
+		data->psr_mode = PR_MODE_SEL_FETCH;
+		data->et_flag = true;
+	} else if (psr_sink_support(data->drm_fd, data->debugfs_fd,
+							PR_MODE_SEL_FETCH, data->output)) {
 		supported = true;
 		data->psr_mode = PR_MODE_SEL_FETCH;
 	} else if (psr_sink_support(data->drm_fd, data->debugfs_fd,
+							PSR_MODE_2_ET, data->output)) {
+		supported = true;
+		data->psr_mode = PSR_MODE_2;
+		data->et_flag = true;
+	} else	if (psr_sink_support(data->drm_fd, data->debugfs_fd,
 							  PSR_MODE_2, data->output)) {
 		supported = true;
 		data->psr_mode = PSR_MODE_2;
@@ -916,6 +929,9 @@ static void run(data_t *data)
 		igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
 							  data->pipe),
 							  "FBC still disabled\n");
+	if (data->et_flag)
+		igt_assert_f(early_transport_check(data->debugfs_fd),
+			     "Early Trasport Disbaled\n");
 
 	data->screen_changes = 0;
 
-- 
2.25.1

