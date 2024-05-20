Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73584C04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 17:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A076210E1E7;
	Mon, 20 May 2024 17:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kTJIM0nB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE2710E1E7
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 17:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716226102; x=1747762102;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KS8FGo8RbWC/0M/4JsCoQD9ygH3niTUR8zRVeRvGKPM=;
 b=kTJIM0nBh688dBMAX+RPWEjP4uajnXzS0sHuRLmNVYsoPEJ/PWmdmu+e
 Xj0Mw1eI2ImFBqXJobLk8+Yefs9v69Cl0Q7+teEW95TK2J7DXWmgxP7Dx
 Mn8okxcrcCO3mJOsuo8Ky8cBBaz3/1V9dziKcd9jZmcCTmfVbL7ZCZd/k
 E6JKJ7X35vdGDvRw5tmqaUbr3RgSunJY3ZagqFTkJGWglOWf9OYenMSAU
 OzZ/wOKhh2PZd8g5Ue9iKx7hJ6F8iFnlY2fNUv93nuZgEMnQUmscpWDvK
 d3uQgLaECczBCPikfUk44BQSjTif69m8B+T3ic6PJnvmQB4RxpoxvBKDq Q==;
X-CSE-ConnectionGUID: RAsIbE01S5+MPRYZ+zA4aQ==
X-CSE-MsgGUID: SAHa6jrpQgiTv+/aUr3bEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12559452"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="12559452"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 10:28:14 -0700
X-CSE-ConnectionGUID: yCjvcydZQAux8/m2a7+yig==
X-CSE-MsgGUID: xcpKrn0GTXW85j4llBSEBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32648669"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa009.fm.intel.com with ESMTP; 20 May 2024 10:28:12 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v4] tests/intel/kms_big_fb: Restrict runs on simulation
Date: Mon, 20 May 2024 22:58:10 +0530
Message-Id: <20240520172810.455947-1-pranay.samala@intel.com>
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

This test executes on only one pipe and all the available planes with
set of 6 coordinates. Due to this, test takes long duration to execute
on simulation and gets timeout.

Restricting the test to execute only on one of the coordinates for
simulation.

v4:
- Inserted simulation check right after for loop (Kamil)
- Executing only on 1 coordinate (w, h) on simulation

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_big_fb.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 1e45d8e42..605813f7f 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -443,6 +443,7 @@ static bool test_plane(data_t *data)
 	struct igt_fb *big_fb = &data->big_fb;
 	int w = data->big_fb_width - small_fb->width;
 	int h = data->big_fb_height - small_fb->height;
+	bool run_in_simulation = igt_run_in_simulation();
 	struct {
 		int x, y;
 	} coords[] = {
@@ -467,8 +468,13 @@ static bool test_plane(data_t *data)
 
 	for (int i = 0; i < ARRAY_SIZE(coords); i++) {
 		igt_crc_t small_crc, big_crc;
-		int x = coords[i].x;
-		int y = coords[i].y;
+		int x, y;
+
+		if (run_in_simulation)
+			i = ARRAY_SIZE(coords) - 1;
+
+		x = coords[i].x;
+		y = coords[i].y;
 
 		/* Hardware limitation */
 		if (data->format == DRM_FORMAT_RGB565 &&
@@ -540,6 +546,7 @@ static bool test_pipe(data_t *data)
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	bool ret = false;
+	bool run_in_simulation = igt_run_in_simulation();
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
 		 kmstest_pipe_name(data->pipe), igt_output_name(data->output));
@@ -597,7 +604,7 @@ static bool test_pipe(data_t *data)
 
 	for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
 		ret = test_plane(data);
-		if (ret)
+		if (ret || run_in_simulation)
 			break;
 	}
 
-- 
2.34.1

