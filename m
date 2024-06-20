Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED86C27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 04:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3427210E264;
	Thu, 20 Jun 2024 04:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZnY7GOup";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3E710E25C
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 04:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718857516; x=1750393516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0sk/g2kUEbopLl9ByaziSjpfV/WGSE0cx+sfBs9pCOk=;
 b=ZnY7GOupC3Ir5orHUk0S34zZ2W/r20/nndrJeAAWNHqMWaikwF2h/N0e
 sQl2FOLBwzBzUK+XOKmRxzEYQyaujTl6phxAy58k34ylaDe4mR5MtJ4uX
 wEHDO/1LrlryZKnvBj0vlQURK971TczYYHQylDPx7QIC8x7FQtQ7+IooM
 /xfz8KDAsQyjJjLpHXxZzlI1a/Qsz9bZaDgt+0S0SUV5CYBVfIAdpFcME
 HofSlYGvvR7vf0DTnEgo7/i8ODnJYIHfAyOo94mFfVGsR7GEhkT3xWKZy
 kz+OFm9f7ARqrbn+jcTNk0LQNqBY8Ka/p8GnuNEZzqwub6mVgOZd68+mx w==;
X-CSE-ConnectionGUID: MM1SJrvhQvigc4cHOZow5A==
X-CSE-MsgGUID: OMYeGGuXS4O+YE6ertvciQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="19692108"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="19692108"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 21:25:16 -0700
X-CSE-ConnectionGUID: GZsnTje3S2mY6/wwpyC5Vg==
X-CSE-MsgGUID: iZbDlUamTLad4EnRtYxGTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="72850651"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 21:25:14 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_psr2_sf: Add checks for early
 transport
Date: Thu, 20 Jun 2024 10:03:41 +0530
Message-Id: <20240620043341.1438736-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620043341.1438736-1-jeevan.b@intel.com>
References: <20240620043341.1438736-1-jeevan.b@intel.com>
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

