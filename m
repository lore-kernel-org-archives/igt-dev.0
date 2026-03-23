Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F853D58CB1
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 06:35:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4DA10E3D5;
	Mon, 23 Mar 2026 06:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F++TkAVu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B98A10E30D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 06:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774247693; x=1805783693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KFc3KK2n5NBBcS75zENlohTklWTxWIRKlZvc9psIFJ8=;
 b=F++TkAVu4B+RNVGQdN9taFFrXAlRooxd8ccqJ3WJxXEuCFyxL9d3fosh
 YPEDqlTTFB3yDYYTOHCaap3E1hvlnHdArpYamamzfDRL2BZG358yAQEU2
 OYz+YNpHLP70meVKpxodJDFCzDJaRJa6yQbJP2M0P5iloWAXnAP1Tekqo
 tmZbEa+vwVWlqe9q/UD4F/gBhOf0enAJBSwBuORdoRn2oR3d9sVafweh5
 k6bSQTRphkJXDW4jDf5IPFRZ0zVXcUHedJnszyMNAllB3xLfPKT+kHNGo
 I9hwCwX6SLU3UfkLOtkbA6cN3du3X8cdQl1XjjiAPlhjtYwF2asdpcxgp w==;
X-CSE-ConnectionGUID: m5JLZOHpQf+rT2EsBADZqw==
X-CSE-MsgGUID: PMNef8mCTEe3a4/KhvWDew==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75123265"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="75123265"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 23:34:45 -0700
X-CSE-ConnectionGUID: J0Mno7qaRK2BcGv/C9bSFw==
X-CSE-MsgGUID: WCeSXKhrS16w/WcgvJM1AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="228008514"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 23:34:44 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/kms_psr_stress_test: Select PSR-capable
 output
Date: Mon, 23 Mar 2026 12:03:09 +0530
Message-ID: <20260323063309.99649-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323063309.99649-1-jeevan.b@intel.com>
References: <20260323063309.99649-1-jeevan.b@intel.com>
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

Iterate over all eDP outputs and select one that supports PSR
instead of picking the first available eDP. Skip the test only
if no PSR-capable output is found.

Previously, the test relied on a global PSR capability check and
could select an eDP panel without PSR support on systems with
multiple eDPs. This could lead to incorrect behavior. this ensures
the test runs only on a valid PSR sink and avoids unnecessary
failures on multi-eDP systems.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_psr_stress_test.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
index 09e73bd49..7ef076e1c 100644
--- a/tests/intel/kms_psr_stress_test.c
+++ b/tests/intel/kms_psr_stress_test.c
@@ -84,6 +84,7 @@ static void setup_output(data_t *data)
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	igt_crtc_t *crtc;
+	bool found = false;
 
 	igt_display_require(&data->display, data->drm_fd);
 
@@ -93,6 +94,10 @@ static void setup_output(data_t *data)
 		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
+		if (!psr_sink_support(data->drm_fd, data->debugfs_fd,
+				      PSR_MODE_1, output))
+			continue;
+
 		igt_display_reset(display);
 		igt_output_set_crtc(output,
 				    crtc);
@@ -103,11 +108,12 @@ static void setup_output(data_t *data)
 
 		data->output = output;
 		data->mode = igt_output_get_mode(output);
+		found = true;
 
 		return;
 	}
 
-	igt_require(data->output);
+	igt_require_f(found, "No eDP output with PSR support found\n");
 }
 
 static void primary_draw(data_t *data, struct igt_fb *fb, uint8_t i)
@@ -232,7 +238,7 @@ static void prepare(data_t *data)
 	r = timerfd_settime(data->completed_timerfd, 0, &interval, NULL);
 	igt_require_f(r != -1, "Error setting completed_timerfd\n");
 
-	data->initial_state = psr_get_mode(data->debugfs_fd, NULL);
+	data->initial_state = psr_get_mode(data->debugfs_fd, data->output);
 	igt_require(data->initial_state != PSR_DISABLED);
 	igt_require(psr_wait_entry(data->debugfs_fd, data->initial_state, data->output));
 }
@@ -345,7 +351,7 @@ static void run(data_t *data)
 	}
 
 	/* Check if after all this stress the PSR is still in the same state */
-	igt_assert(psr_get_mode(data->debugfs_fd, NULL) == data->initial_state);
+	igt_assert(psr_get_mode(data->debugfs_fd, data->output) == data->initial_state);
 	psr_sink_error_check(data->debugfs_fd, data->initial_state, data->output);
 }
 
@@ -359,10 +365,6 @@ int igt_main()
 		data.bops = buf_ops_create(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 
-		igt_require_f(psr_sink_support(data.drm_fd, data.debugfs_fd,
-					       PSR_MODE_1, NULL),
-			      "Sink does not support PSR\n");
-
 		setup_output(&data);
 
 		data.invalidate_timerfd = timerfd_create(CLOCK_MONOTONIC, 0);
-- 
2.43.0

