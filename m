Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F39FD88CB
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 22:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842B910E791;
	Tue, 10 Mar 2026 22:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lHnquIXG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA04C10E792
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 22:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773183045; x=1804719045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WaPU6mElPvdE+1ujeRA0hCO9FWZP7c9SfzjMfJHFTbk=;
 b=lHnquIXGfFqq1ZbftdzVpDY/JPnp+BOjVP1T2dIU9vuQRyq4jj11H68F
 MAH9khQJkqICmRuId5sPSXHqmDTk2GlE960hL8DytoMT2Ls6yDqhTXIkS
 yQ74J13LzSDiRBap4RmXfjae7xitX5Err6dPmQ9PPwH8WDjik0R0TC9AP
 4/yZCeJSvdGZnndlSAJmsGXYEKNsFwAbhFCAynoKDryZnccn8ViF0DNuM
 U9Rpcop4nk1ijoRjV8VKYMdsAnWc2WijbIV6rXXO3Axmh9V0CntRQQkcn
 jW1uHpPO312KD7S+H5n+K/TTRuKvSC4DizKRJOWcEI5vYWN+Dm08eQH5k g==;
X-CSE-ConnectionGUID: Kyx+brNYQ0KacFZWQgofNA==
X-CSE-MsgGUID: L3yVEW2ORsG/VKifM+2RiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74362670"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74362670"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 15:50:44 -0700
X-CSE-ConnectionGUID: /b7gJ0nOSoyDeP8W9F24Xw==
X-CSE-MsgGUID: w+iKGhXNRCiq6kd//9GrLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="219512657"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 15:50:44 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/xe_oa: Delete disabled-read-error
 subtest
Date: Tue, 10 Mar 2026 15:50:39 -0700
Message-ID: <20260310225039.2687668-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260310225039.2687668-1-ashutosh.dixit@intel.com>
References: <20260310225039.2687668-1-ashutosh.dixit@intel.com>
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

We are changing OA functionality in the kernel to allow reads even after an
OA stream is disabled. Delete "disabled-read-error" subtest since it is no
longer relevant. Also delete the read error check in "enable-disable"
subtest.

We will add additional coverage for the new functionality in the
"enable-disable" subtest in the future.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 77 ---------------------------------------------
 1 file changed, 77 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 927f3f4f20..387f29535e 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2757,12 +2757,6 @@ test_enable_disable(const struct drm_xe_oa_unit *oau)
 	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
 	set_fd_flags(stream_fd, O_CLOEXEC | O_NONBLOCK);
 
-	errno = 0;
-	ret = read(stream_fd, buf, sizeof(buf));
-	igt_assert_eq(ret, -1);
-	get_stream_status(stream_fd);
-	igt_assert_eq(errno, EINVAL);
-
 	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
 
 	/*
@@ -2927,75 +2921,6 @@ test_non_sampling_read_error(void)
 	__perf_close(stream_fd);
 }
 
-/**
- * SUBTEST: disabled-read-error
- * Description: Test that attempts to read from a stream while it is disable
- *		will return EINVAL instead of blocking indefinitely
- */
-static void
-test_disabled_read_error(void)
-{
-	int oa_exponent = 5; /* 5 micro seconds */
-	uint64_t properties[] = {
-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
-
-		/* XXX: even without periodic sampling we have to
-		 * specify at least one sample layout property...
-		 */
-		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
-
-		/* OA unit configuration */
-		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
-		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
-		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
-	};
-	struct intel_xe_oa_open_prop param = {
-		.num_properties = ARRAY_SIZE(properties) / 2,
-		.properties_ptr = to_user_pointer(properties),
-	};
-	uint32_t oa_report0[64];
-	uint32_t oa_report1[64];
-	uint32_t buf[128] = { 0 };
-	int ret;
-
-	stream_fd = __perf_open(drm_fd, &param, false);
-
-	ret = read(stream_fd, buf, sizeof(buf));
-	igt_assert_eq(ret, -1);
-	get_stream_status(stream_fd);
-	igt_assert_eq(errno, EINVAL);
-
-	__perf_close(stream_fd);
-
-	properties[ARRAY_SIZE(properties) - 1] = false; /* Set DISABLED to false */
-	stream_fd = __perf_open(drm_fd, &param, false);
-        set_fd_flags(stream_fd, O_CLOEXEC);
-
-	read_2_oa_reports(default_test_set->perf_oa_format,
-			  oa_exponent,
-			  oa_report0,
-			  oa_report1,
-			  false); /* not just timer reports */
-
-	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
-
-	ret = read(stream_fd, buf, sizeof(buf));
-	igt_assert_eq(ret, -1);
-	get_stream_status(stream_fd);
-	igt_assert_eq(errno, EINVAL);
-
-	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
-
-	read_2_oa_reports(default_test_set->perf_oa_format,
-			  oa_exponent,
-			  oa_report0,
-			  oa_report1,
-			  false); /* not just timer reports */
-
-	__perf_close(stream_fd);
-}
-
 /**
  * SUBTEST: mi-rpc
  * Description: Test OAR/OAC using MI_REPORT_PERF_COUNT
@@ -5154,8 +5079,6 @@ int igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 			test_non_zero_reason(oau, SZ_128K);
 	}
 
-	igt_subtest("disabled-read-error")
-		test_disabled_read_error();
 	igt_subtest("non-sampling-read-error")
 		test_non_sampling_read_error();
 
-- 
2.48.1

