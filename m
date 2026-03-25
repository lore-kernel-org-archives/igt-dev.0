Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D8E109C046
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 16:53:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E9B10E160;
	Wed, 25 Mar 2026 16:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYlkHMPG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5BC10E160
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 16:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774457594; x=1805993594;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jqKgS+HAQq6BYQsZ1zPaL+oG+GRGsrvcUGGITjCF5lg=;
 b=QYlkHMPGU2ft3QwzNtjMpjyhBodo9MiHfh9lblBG+dn+nG7bWaQDB5XU
 QNz2othncUH0FtZbgHa4JG6KGKiUYJDllAwe4LS4777l+FfQP5XTXx/G7
 16+3jKL2iCGF0vcyKxZvl8LrVLvbUsiw3S2SZBIKsa3wxtSDic5FK2tLS
 PVfX02zyp7oA7t4gPErTkYGnF0fDnGmey0iFFKRGS3c1MM1NfWmvOm0Oa
 TBcmgiObnbKPurF0icOHPSTy0L21y2yUgNe8G1veADMXIrmH2Okb53m01
 yYh0/hiQ8Gbl7H5W6wHh2wR8XjZzmJcBmdgvzcm55zxXSsu6ZiHqhVlkY A==;
X-CSE-ConnectionGUID: UIxENyRZQUujfQpu2NcDMg==
X-CSE-MsgGUID: +xRG6iNKRCykCtlpxV36NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="92880611"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="92880611"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 09:53:13 -0700
X-CSE-ConnectionGUID: RICdKCfDQM2c8A63micutA==
X-CSE-MsgGUID: 3ug1rV84RIqwg1IX+HrfNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="224991856"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 09:53:12 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 3/4] tests/intel/kms_psr_stress_test: Select
 PSR-capable output
Date: Wed, 25 Mar 2026 22:21:39 +0530
Message-ID: <20260325165140.115520-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325165140.115520-1-jeevan.b@intel.com>
References: <20260325165140.115520-1-jeevan.b@intel.com>
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

v2: Drop redundant 'found' variable.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_psr_stress_test.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
index 09e73bd49..0c9f0a0ef 100644
--- a/tests/intel/kms_psr_stress_test.c
+++ b/tests/intel/kms_psr_stress_test.c
@@ -93,6 +93,10 @@ static void setup_output(data_t *data)
 		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
+		if (!psr_sink_support(data->drm_fd, data->debugfs_fd,
+				      PSR_MODE_1, output))
+			continue;
+
 		igt_display_reset(display);
 		igt_output_set_crtc(output,
 				    crtc);
@@ -107,7 +111,7 @@ static void setup_output(data_t *data)
 		return;
 	}
 
-	igt_require(data->output);
+	igt_require_f(data->output, "No eDP output with PSR support found\n");
 }
 
 static void primary_draw(data_t *data, struct igt_fb *fb, uint8_t i)
@@ -232,7 +236,7 @@ static void prepare(data_t *data)
 	r = timerfd_settime(data->completed_timerfd, 0, &interval, NULL);
 	igt_require_f(r != -1, "Error setting completed_timerfd\n");
 
-	data->initial_state = psr_get_mode(data->debugfs_fd, NULL);
+	data->initial_state = psr_get_mode(data->debugfs_fd, data->output);
 	igt_require(data->initial_state != PSR_DISABLED);
 	igt_require(psr_wait_entry(data->debugfs_fd, data->initial_state, data->output));
 }
@@ -345,7 +349,7 @@ static void run(data_t *data)
 	}
 
 	/* Check if after all this stress the PSR is still in the same state */
-	igt_assert(psr_get_mode(data->debugfs_fd, NULL) == data->initial_state);
+	igt_assert(psr_get_mode(data->debugfs_fd, data->output) == data->initial_state);
 	psr_sink_error_check(data->debugfs_fd, data->initial_state, data->output);
 }
 
@@ -359,10 +363,6 @@ int igt_main()
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

