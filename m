Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB63CA1002
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 04:55:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C3F10E96E;
	Thu,  4 Sep 2025 04:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GpygcpMi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2F910E96E
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 04:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756961725; x=1788497725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8t/spgpGce188rgvz2cbVTcXduMORIElgFAWBHl720o=;
 b=GpygcpMiBpN3EAdWDxSTsP9naa920phw25bA8rhpkUTaI3X7l88mSXuA
 Rh8f9jBXVxKcYG/zbNK1TkvxOwsWBz/FmfaBugmuKe0WtYBCBbK+p9f04
 nsDdmvM/tBvG5K9/6WJwK5OwmxZa07QNdBIkMR8iTMvMep2vI0w2SHcj5
 yoxWcuZlfVOoSjjdfVQXIaVLLHYZQuK3z8fDScjzjR9mQXfS6EKQoMx8T
 WwKLH9YIcHNuboRL4Sk6N5EYn1iIB1a3B8Z1zcSdKwRLzrHllY7x0dzyy
 JgKVkbuKkRJdXEyPF38Lmeacffwhrc4+mf+qvIjZArbNxrlETxksgXIz4 g==;
X-CSE-ConnectionGUID: HmqvKeqMRv6kVDWSLLtxJg==
X-CSE-MsgGUID: 4DgT73apTTmVT6iQTUrTnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59356588"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59356588"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 21:55:25 -0700
X-CSE-ConnectionGUID: 2DDnaK9NRPCioBBI2N14Wg==
X-CSE-MsgGUID: FC8CWer6Tk6AsNplfcStow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="195446754"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 21:55:23 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com, swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_async_flips: Optimise subtests for
 simulation platforms
Date: Thu,  4 Sep 2025 10:24:04 +0530
Message-Id: <20250904045404.152675-1-santhosh.reddy.guddati@intel.com>
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
 tests/kms_async_flips.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 17c737483..19b0ee809 100644
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
 
@@ -1213,7 +1217,8 @@ igt_main
 		test_init_ops(&data);
 		/* Devices without CRC can't run this test */
 		igt_require_pipe_crc(data.drm_fd);
-
+		if (igt_run_in_simulation())
+			data.single_pipe = true;
 		run_test(&data, test_crc);
 	}
 
@@ -1223,9 +1228,11 @@ igt_main
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
@@ -1246,16 +1253,22 @@ igt_main
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

