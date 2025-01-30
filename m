Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD94C0218A
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 23:37:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794EB10E9FA;
	Thu, 30 Jan 2025 23:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gxf53RwU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3408610E9FA
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 23:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738280237; x=1769816237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Z+PONyzHhD9s1v3QSbabUywA/rpSvm8BEtSiTU/ezw=;
 b=Gxf53RwU3T2WdbK0kRU5vw0kZY3ANqRU36LTNQKnGuXgTECFXkB/AOZe
 xLhHuOOAsAuoljRZftYcgLEjwUWsIEZZ02lLVWft66avJw17pG2H0OYd8
 Pk6HXBHz3aUsCho5pPCQTafYkawKjg9n4QdhZVGYdPd1Bh8EKkoybjjEq
 UJEDLFtYV0P5s2p0o8H8f5mP5THRzb1MID44RQHxWGwg1g8/uOnf1EghO
 /V8hYSHG+q9TTASMVaICpbhpGErNzHXHum1rdfDRLnR4TSchkd5a8SAOl
 TqZnPu3rRxyrwfrj4s5EQzfgOq1+VXFtv2daNxgIY2MGK9DLyRUV8XMMn g==;
X-CSE-ConnectionGUID: NZJq2eFzQDugHUpmrZbPQw==
X-CSE-MsgGUID: NHMzP9/ySamII6LXbt6NPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="56278811"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="56278811"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 15:37:17 -0800
X-CSE-ConnectionGUID: BgLHjx1KSjGV4mKKJZp8nw==
X-CSE-MsgGUID: nV76zaobSuuLvs8/jTtnAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="109619118"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 15:37:15 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/kms_vrr: Add DRRS verification in seamless
 RR test
Date: Fri, 31 Jan 2025 05:22:46 +0530
Message-Id: <20250130235246.4142758-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250130235246.4142758-1-ramanaidu.naladala@intel.com>
References: <20250130235246.4142758-1-ramanaidu.naladala@intel.com>
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

Add a check to see if DRRS has switched to a lower refresh rate
when the display is idle.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 43 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index fac7cb4f7..731f0c77a 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -707,6 +707,12 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	vtest_ns_t vtest_ns;
 	uint64_t rate[] = {0};
 	bool vrr = !!(flags & TEST_SEAMLESS_VRR);
+	uint64_t last_vb_event_us, vb_event_us;
+	uint64_t diff_us[5];
+	uint64_t result_us, min_rate_us;
+	uint64_t threshold = 1000;
+	bool drrs_flag;
+	int i;
 
 	igt_info("Use HIGH_RR Mode as default (VRR: %s): ", vrr ? "ON" : "OFF");
 	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
@@ -717,6 +723,7 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	if (vrr)
 		set_vrr_on_pipe(data, pipe, false, true);
 	else {
+		set_vrr_on_pipe(data, pipe, false, false);
 		/*
 		 * Sink with DRRS and VRR can be in downclock mode.
 		 * so switch to High clock mode as test preparation
@@ -749,12 +756,36 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
 	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
 
-	rate[0] = vtest_ns.rate_ns;
-	result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
-	igt_assert_f(vrr ? (result > 75) : (result < 10),
-		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold %s, result was %u%%\n",
-		     ((data->range.max + data->range.min) / 2), rate[0],
-		     vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
+	if (vrr) {
+		rate[0] = vtest_ns.rate_ns;
+		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
+		igt_assert_f(vrr ? (result > 75) : (result < 10),
+			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold %s, result was %u%%\n",
+			     ((data->range.max + data->range.min) / 2), rate[0],
+			     vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
+	} else {
+		min_rate_us = (vtest_ns.min/1000);
+
+		sleep(5);
+
+		last_vb_event_us = vb_event_us = wait_for_vblank(data, pipe);
+
+		for (i = 0; i < 5; i++) {
+			vb_event_us = wait_for_vblank(data, pipe);
+			diff_us[i] = vb_event_us - last_vb_event_us;
+			last_vb_event_us = vb_event_us;
+		}
+
+		for (i = 0; i < 5; i++)
+			result_us += diff_us[i];
+
+		result_us = (result_us/5);
+
+		drrs_flag = (llabs((long long)(result_us - min_rate_us)) <= threshold);
+
+		igt_assert_f(drrs_flag, "DRRS not switch to lower RR\n");
+		igt_info("DRRS switch to lower RR\n");
+	}
 }
 
 static void
-- 
2.25.1

