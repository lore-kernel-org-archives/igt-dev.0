Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77417C8303C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 22:04:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D5210E1D6;
	Tue,  8 Jul 2025 22:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWOvmRlM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CAC10E1D6
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 22:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752012294; x=1783548294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SGa+n8QesvjVFVVQmeHJSGjDdVx2Bf2KBB4HiKUe5aI=;
 b=mWOvmRlMeZfqFmvfYk9TFXqPaITwgDht7Oz5GFnA8SgTyasZNr7A/xeu
 aBE4/bokolZCfSiPPwZj1JAzotSlG0MLTsuUaFyBn1goQLRm9GRFiurFU
 1SUSdU7zdw3kII9pWv90AQcQLEPipSBmYJ+JY94oir7a+h1kLvpNVQbSi
 q0QBJ3I7Z0WAqjlPvzoulSCsPZxOL7l8ixFdVC9w0JmeP6Ar8YOWBrnhC
 Bm2QcZnp049xBLBNaN2GnVYrYATbEd5mtqbRlIo+A1KoVhO0sHsJWJP2y
 nQ7kMKS42b7cBgutQIpXfOHqgwI+EkWjRPB0Xa4JRz3EcDZRUnCWPrzrh g==;
X-CSE-ConnectionGUID: WJArMcsoSPmN24Z/DtCS+w==
X-CSE-MsgGUID: Hl5F9QLLQ3WCTcvmmRdW1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64848999"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="64848999"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 15:04:54 -0700
X-CSE-ConnectionGUID: uxZ8B2aRQY6vFQhO/+500w==
X-CSE-MsgGUID: yDXaBHWzRk+guJlZ/ypLPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="159920406"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 15:04:52 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 karthik.b.s@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/kms_vrr: Refactor VRR test to use global
 refresh rate from cmdline
Date: Wed,  9 Jul 2025 03:35:02 +0530
Message-ID: <20250708220502.803610-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708220502.803610-1-ramanaidu.naladala@intel.com>
References: <20250708220502.803610-1-ramanaidu.naladala@intel.com>
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

Applies the refresh rate provided via the `-r` command-line option
consistently to each display configuration during VRR testing.
This change improves test consistency and allows users to control
refresh rate behavior across all connected outputs.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index a24f413de..b789a0a4f 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -156,6 +156,8 @@ typedef struct data {
 	bool static_image;
 } data_t;
 
+uint32_t opt_rr;
+
 typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, uint32_t);
 
 /* Converts a timespec structure to nanoseconds. */
@@ -1090,6 +1092,8 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 	for_each_connected_output(&data->display, output) {
 		enum pipe pipe;
 
+		data->vtest_ns.rate_ns = igt_kms_frame_time_from_vrefresh(opt_rr);
+
 		if (!config_constraint(data, output, flags))
 			continue;
 
@@ -1111,6 +1115,7 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 				test(data, pipe, output, flags);
 
 		}
+		data->vtest_ns.rate_ns = 0;
 		igt_output_set_pipe(output, PIPE_NONE);
 		igt_output_override_mode(output, NULL);
 	}
@@ -1125,7 +1130,7 @@ static int opt_handler(int opt, int opt_index, void *_data)
 		data->duration_ns = atoi(optarg) * NSECS_PER_SEC;
 		break;
 	case 'r':
-		data->vtest_ns.rate_ns = igt_kms_frame_time_from_vrefresh(atoi(optarg));
+		opt_rr = atoi(optarg);
 		break;
 	case 's':
 		data->static_image = true;
-- 
2.43.0

