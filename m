Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01E8C04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 05:02:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CFC10E30F;
	Mon, 20 May 2024 05:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ut2wspeA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA5410E30F
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 05:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716181318; x=1747717318;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WY4wVJRdPkvQSRo7aS7FnzPaLF7lReiPMKU2m5smPxA=;
 b=Ut2wspeArLH8fLJQBd34Vizc6ak4PLcCjtb2nMTtnHOVk3JJFGbiFyeL
 EkXbW5LR1vbCzXAOqSUHHHtz9U50TVxsBapN4soWXsuVtO5hXjIpUs5WG
 th0KqURid78oPURiF280kyM35FeoNAX8KUkALQwBbRVSm3zljkQ1UKD5L
 3uRmHc74IaQIhEsc9oqFiwIhU1DRArdSN9ApSjRkq63yxOwCMGq6grwnX
 LhqqdX9TSWc64Arpc1XLTtugN6/LGd8vOeEdauxzwgeshoJYmXTXcWxEK
 +VkblCTbWWkd1dDSQLrRKQILk6oGfK4Iw58scm1FGt/YoBvee209kNGCp A==;
X-CSE-ConnectionGUID: g+lznAVxQiifY99FRUizZg==
X-CSE-MsgGUID: TH2XiShmR1uAdjYyk/0K7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="22898344"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="22898344"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2024 22:01:57 -0700
X-CSE-ConnectionGUID: 7WlSp4cxSv+PiYM+Pxulkg==
X-CSE-MsgGUID: 006v2cimR52jfVeohwFJ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="32428418"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa006.fm.intel.com with ESMTP; 19 May 2024 22:01:55 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3] tests/intel/kms_big_fb: Restrict runs on simulation
Date: Mon, 20 May 2024 10:31:55 +0530
Message-Id: <20240520050155.435110-1-pranay.samala@intel.com>
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

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_big_fb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 1e45d8e42..502905974 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -529,6 +529,9 @@ static bool test_plane(data_t *data)
 
 		igt_assert_crc_equal(&big_crc, &small_crc);
 		igt_pipe_crc_stop(data->pipe_crc);
+
+		if (igt_run_in_simulation())
+			break;
 	}
 
 	return true;
@@ -540,6 +543,7 @@ static bool test_pipe(data_t *data)
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	bool ret = false;
+	bool run_in_simulation = igt_run_in_simulation();
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
 		 kmstest_pipe_name(data->pipe), igt_output_name(data->output));
@@ -597,7 +601,7 @@ static bool test_pipe(data_t *data)
 
 	for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
 		ret = test_plane(data);
-		if (ret)
+		if (ret || run_in_simulation)
 			break;
 	}
 
-- 
2.34.1

