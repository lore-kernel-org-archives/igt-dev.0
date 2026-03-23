Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC85CEC01A6
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 09:13:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47A410E3DB;
	Mon, 23 Mar 2026 09:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/gGS1ey";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF7110E3D6
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 09:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774257219; x=1805793219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KFc3KK2n5NBBcS75zENlohTklWTxWIRKlZvc9psIFJ8=;
 b=O/gGS1eyY/5wkF2ovd+3hvq+dKDeMlU+r1ziYqyVyTXm2QP0b1hEKhg7
 3YG0srY+pqx7kLOhXPyjkM1QVrfe/Sqx4ftDKFrEHTWtDzvCrWGKoBPEi
 90IJhFzIpsSkLT/2fM/Q/FxxYzAAE3beGBO1tbh5ub3YHJC6SjY44KwR+
 clhqwe0moFteis/PVCPwXQzxN3uE1vMh2zucmyMp0WagfJ8nQ3MIJhSBh
 5cSNxhadiP8RcI5Q7miBzHA75jwszQwN1JULMvJ81csEh+XHjoybs94sk
 g6mKH6Dvw4f6yw6fvTYVMwKiHVBmpZU0CYjBTRtKrv+dCaS9TQ5wGNa01 g==;
X-CSE-ConnectionGUID: Kjv+irfySESv7FaPzf31rQ==
X-CSE-MsgGUID: eYGn6dLmQk+MQ9lb5umQ0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75371580"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75371580"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:13:39 -0700
X-CSE-ConnectionGUID: fT2bgZXgRn6ooSGbuGPf7w==
X-CSE-MsgGUID: Z2hP2SfmQsysTbCd/HOQgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="219164571"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:13:38 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 3/4] tests/intel/kms_psr_stress_test: Select PSR-capable
 output
Date: Mon, 23 Mar 2026 14:42:04 +0530
Message-ID: <20260323091205.100585-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323091205.100585-1-jeevan.b@intel.com>
References: <20260323091205.100585-1-jeevan.b@intel.com>
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

