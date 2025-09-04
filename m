Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23824CA1014
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 04:58:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28C510E056;
	Thu,  4 Sep 2025 04:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cYLOlA+Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98A210E056
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 04:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756961931; x=1788497931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oZPil5cAIBqaB5Jbve04SDZVtAYgZDWD1VcZbTw7UDE=;
 b=cYLOlA+YgziOxDVGPY4NgOhtnoK4+btRIWCyeWW0cXcEwp2a+dk21Kmm
 u6aMn9O7hrUMfJwmhK0BgQAofhRIEp+JxnC4jZGGMioOFye8gAtKDwkni
 F0+0yK6U085MZGkxZkkfnoMPYPoujyOGT60sc0VTer/K/PbO2lo+Nxmk4
 wKRdbGlmYMrDl3rgg2HFIIDUi3+OedxKVtN08o+o66BYWYqhbg2ul7ApE
 gyFymPW+ljjo31Xcj1Oadvglsgo5MWJ1/8yQZweOVUTlw5XlSlPI6mMDP
 n2kAgV+eVx9HjNNk9VL7NcmEcUu9vzyNx7iVa4wor7M3qYaQLrOiRQR+T A==;
X-CSE-ConnectionGUID: e9DiUM6mR3eYOOk+CFmKVg==
X-CSE-MsgGUID: rRxH7XBMRYmQJuYMoNFOfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59230596"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="59230596"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 21:58:51 -0700
X-CSE-ConnectionGUID: G50K4R9eSjq2/sMiGKvoxw==
X-CSE-MsgGUID: TP+4DHRqQXCjwwLeCjL16A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="171718483"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 21:58:49 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com, swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_async_flips: Optimise subtests for
 simulation platforms
Date: Thu,  4 Sep 2025 10:27:31 +0530
Message-Id: <20250904045731.152767-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250826025517.1108243-1-santhosh.reddy.guddati@intel.com>
References: <20250826025517.1108243-1-santhosh.reddy.guddati@intel.com>
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

Restrict the crc,dpms,hang subtests to execute on a single pipe on
the simulation platforms as the crc calculations are slow.
This avoids timeouts on CI during execution while ensuring
functionality of the test is verified with single pipe.

V2: Update commit message, refactor logic to use single pipe (Karthik)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 17c737483..cbe38889e 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -151,6 +151,7 @@ typedef struct {
 	bool linear_modifier;
 	unsigned int plane_format;
 	bool async_mod_formats;
+	bool single_pipe;
 } data_t;
 
 struct format_mod {
@@ -935,6 +936,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
 			test_init_fbs(data);
 			test(data);
 		}
+		/* Restrict to single pipe in simulation */
+		if (data->single_pipe)
+			break;
 	}
 }
 
@@ -1213,8 +1217,10 @@ igt_main
 		test_init_ops(&data);
 		/* Devices without CRC can't run this test */
 		igt_require_pipe_crc(data.drm_fd);
-
+		if (igt_run_in_simulation())
+			data.single_pipe = true;
 		run_test(&data, test_crc);
+		data.single_pipe = false;
 	}
 
 	igt_describe("Use CRC to verify async flip scans out the correct framebuffer "
@@ -1223,9 +1229,11 @@ igt_main
 		test_init_ops(&data);
 		/* Devices without CRC can't run this test */
 		igt_require_pipe_crc(data.drm_fd);
-
+		if (igt_run_in_simulation())
+			data.single_pipe = true;
 		data.atomic_path = true;
 		run_test(&data, test_crc);
+		data.single_pipe = false;
 	}
 
 	igt_describe("Verify the async flip functionality after suspend and resume cycle");
@@ -1246,16 +1254,22 @@ igt_main
 		igt_require(is_intel_device(data.drm_fd));
 		test_init_ops(&data);
 		data.hang = true;
+		if (igt_run_in_simulation())
+			data.single_pipe = true;
 		run_test(&data, test_async_flip);
 		data.hang = false;
+		data.single_pipe = false;
 	}
 
 	igt_describe("Verify the async flip functionality after dpms cycle");
 	igt_subtest_with_dynamic("async-flip-dpms") {
 		test_init_ops(&data);
 		data.dpms = true;
+		if (igt_run_in_simulation())
+			data.single_pipe = true;
 		run_test(&data, test_async_flip);
 		data.dpms = false;
+		data.single_pipe = false;
 	}
 
 	igt_fixture {
-- 
2.34.1

