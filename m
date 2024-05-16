Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832A4C25B74
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 10:28:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237DE10E502;
	Thu, 16 May 2024 10:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hIIS0yD0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DAC10E502
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2024 10:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715855306; x=1747391306;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rkaq7xok3QPGvUPNkb7ZHI8bY2QlO7LmXWA7fmdol1Y=;
 b=hIIS0yD05qDzQI7gnBrfrn9vLXTRxq7NLZg/rrMq91Rl9BkOwrj4Ac4d
 fgLSojun0DtkJ69yixqYQM5Z4sCWLsirpv9AbO+3a3uqUjiokUdbx0CEl
 aeFrshxv8KjctJH9S3T9J+M303GeUMSh52lflRqDjx7/3qtp9UYLhWPTa
 ggXq8XwfRQnYvJNllwnP6VRJ2qmi5pH4fMoBzxwmxXafRLFv8jNFi7cin
 nmiSepwv2tM3xBHo5El4qoC6jcJiq5zdpdEn+NN6clPLNAPdI6v11srWU
 DB5qhDwAtGi8bqiVqDEEPR4XFbk5CrtA331moqk+emg7rSTEik4x7RD+i w==;
X-CSE-ConnectionGUID: UsJ8/I/vTXict6xnjydrZA==
X-CSE-MsgGUID: ecQUYYyFTEe1N8NPlhYVfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12119551"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="12119551"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 03:28:25 -0700
X-CSE-ConnectionGUID: 9G/p9SNYSYyv34/TSwjLbg==
X-CSE-MsgGUID: PeGED0VSSj671iv6V2EGgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="31313606"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa007.fm.intel.com with ESMTP; 16 May 2024 03:28:22 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2] tests/intel/kms_big_fb: Introducing this restriction
 to optimize the test execution time on simulation
Date: Thu, 16 May 2024 15:58:17 +0530
Message-Id: <20240516102817.424967-1-pranay.samala@intel.com>
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

This test executes on only one pipe and all the availble planes with
set of 6 coordinates. Due to this, test takes long duration to execute
on simulation and gets timeout.

Restricting the test to execute only on primary plane with one of the
coordinates for simulation.

v2:
- Breaking the loop instead of using variable m to test only one
  coordinate for simulation (Kamil)
- Removed the variable m (Kamil)
- By default the test is running on only one pipe (Kamil)
- Testing on (0,0) coordinate (Kamil)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_big_fb.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 1e45d8e42..f1207e21f 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -455,6 +455,11 @@ static bool test_plane(data_t *data)
 		{ w, h, },
 	};
 
+	if (igt_run_in_simulation()) {
+		plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_set_fb(plane, NULL);
+	}
+
 	if (!igt_plane_has_format_mod(plane, data->format, data->modifier))
 		return false;
 
@@ -529,6 +534,9 @@ static bool test_plane(data_t *data)
 
 		igt_assert_crc_equal(&big_crc, &small_crc);
 		igt_pipe_crc_stop(data->pipe_crc);
+
+		if (igt_run_in_simulation())
+			break;
 	}
 
 	return true;
@@ -595,10 +603,14 @@ static bool test_pipe(data_t *data)
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
-	for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
+	if (igt_run_in_simulation())
 		ret = test_plane(data);
-		if (ret)
-			break;
+	else {
+		for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
+			ret = test_plane(data);
+			if (ret)
+				break;
+		}
 	}
 
 	if (data->format == DRM_FORMAT_C8)
-- 
2.34.1

