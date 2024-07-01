Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C62C41513
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 01:41:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6B010E2D1;
	Mon,  1 Jul 2024 01:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBZTPn5Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A58610E2AF
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 01:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719798106; x=1751334106;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lSUjxKXQzXfJXt6cyM2NTDFCGBoWj0en1MdYqmT+IyI=;
 b=mBZTPn5YRO4V8MXg1IVbe0/7/dNs6BShLiOE4d5jhNFCqjxCg7oql2JN
 EDI4gopFtKb6KsTfgNcGRXaA+Ny6tgsCuJP5ig1vgmxQln9Q4Tc8cBJZF
 okLukXZktaRg5UutFhIMKRmU1/968t0qGQ6RKkasrAZOdBLwZsk7TklYk
 sl6tz6E3k71IiHjPaOtm/3my0z9o6A8UvLREOPZJ5Y1hCgICXqOBldZB8
 NBqxjRo1oiTq7LrSvKilRJXWOzSlVWXKIpyZSoMXq5K2IK5cFtZNY6Ykh
 7yezcKTL1gpEnz7vfvl5yQWDfHtP35TRgoTXvFtr89YakGhfUTW1wRJSG w==;
X-CSE-ConnectionGUID: VTDEae6MTDy7mPMR8FtNtg==
X-CSE-MsgGUID: PQ78ul0gSSm5QaD0i1sltg==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="19801056"
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="19801056"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 18:41:45 -0700
X-CSE-ConnectionGUID: /h+LjIZESEua8sluHkywaw==
X-CSE-MsgGUID: rEK0F0I+S86AfDtineC1kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="46091841"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 18:41:44 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 12/13] tests/intel/xe_oa: Drop "xe-ref-count" subtest
Date: Sun, 30 Jun 2024 18:41:34 -0700
Message-ID: <20240701014135.2412560-13-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240701014135.2412560-1-ashutosh.dixit@intel.com>
References: <20240701014135.2412560-1-ashutosh.dixit@intel.com>
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

Sometime other modules (such as those for child devices) take or drop
references on the xe module. This results in "xe-ref-count" subtest unable
to accurately predict what the module refcount should be, resulting in
frequent false positives in the test.

Drop the test till we are able to devise a robust method to predict xe
module refcount.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 107 --------------------------------------------
 1 file changed, 107 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 965ea05d9a..9d4402d9bf 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -3371,36 +3371,6 @@ test_single_ctx_render_target_writes_a_counter(struct drm_xe_engine_class_instan
 	} while (WEXITSTATUS(child_ret) == EAGAIN);
 }
 
-static unsigned read_xe_module_ref(void)
-{
-	FILE *fp = fopen("/proc/modules", "r");
-	char *line = NULL;
-	size_t line_buf_size = 0;
-	int len = 0;
-	unsigned ref_count;
-	char mod[8];
-	int modn = 3;
-
-	igt_assert(fp);
-
-	strcpy(mod, "xe ");
-	while ((len = getline(&line, &line_buf_size, fp)) > 0) {
-		if (strncmp(line, mod, modn) == 0) {
-			unsigned long mem;
-			int ret = sscanf(line + 5, "%lu %u", &mem, &ref_count);
-			igt_assert(ret == 2);
-			goto done;
-		}
-	}
-
-	igt_assert(!"reached");
-
-done:
-	free(line);
-	fclose(fp);
-	return ref_count;
-}
-
 /**
  * SUBTEST: rc6-disable
  * Description: Check that opening an OA stream disables RC6
@@ -4116,80 +4086,6 @@ test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
 		   WEXITSTATUS(ret) == 0);
 }
 
-/**
- * SUBTEST: xe-ref-count
- * Description: Check that an open oa stream holds a reference on the xe module
- */
-static void
-test_xe_ref_count(void)
-{
-	uint64_t properties[] = {
-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
-
-		/* Include OA reports in samples */
-		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
-
-		/* OA unit configuration */
-		DRM_XE_OA_PROPERTY_OA_METRIC_SET, 0 /* updated below */,
-		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(0), /* update below */
-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, 0, /* update below */
-	};
-	struct intel_xe_oa_open_prop param = {
-		.num_properties = ARRAY_SIZE(properties) / 2,
-		.properties_ptr = to_user_pointer(properties),
-	};
-	unsigned baseline, ref_count0, ref_count1;
-	uint32_t oa_report0[64];
-	uint32_t oa_report1[64];
-
-	/* This should be the first test before the first fixture so no drm_fd
-	 * should have been opened so far...
-	 */
-	igt_assert_eq(drm_fd, -1);
-
-	baseline = read_xe_module_ref();
-	igt_debug("baseline ref count (drm fd closed) = %u\n", baseline);
-
-	drm_fd = __drm_open_driver(DRIVER_XE);
-	if (is_xe_device(drm_fd))
-		xe_device_get(drm_fd);
-	devid = intel_get_drm_devid(drm_fd);
-	sysfs = igt_sysfs_open(drm_fd);
-
-	/* Note: these global variables are only initialized after calling
-	 * init_sys_info()...
-	 */
-	igt_require(init_sys_info());
-	properties[5] = default_test_set->perf_oa_metrics_set;
-	properties[7] = __ff(default_test_set->perf_oa_format);
-	properties[9] = oa_exp_1_millisec;
-
-	ref_count0 = read_xe_module_ref();
-	igt_debug("initial ref count with drm_fd open = %u\n", ref_count0);
-
-	stream_fd = __perf_open(drm_fd, &param, false);
-        set_fd_flags(stream_fd, O_CLOEXEC);
-	ref_count1 = read_xe_module_ref();
-	igt_debug("ref count after opening oa stream = %u\n", ref_count1);
-
-	drm_close_driver(drm_fd);
-	close(sysfs);
-	drm_fd = -1;
-	sysfs = -1;
-	ref_count0 = read_xe_module_ref();
-	igt_debug("ref count after closing drm fd = %u\n", ref_count0);
-
-	read_2_oa_reports(default_test_set->perf_oa_format,
-			  oa_exp_1_millisec,
-			  oa_report0,
-			  oa_report1,
-			  false); /* not just timer reports */
-
-	__perf_close(stream_fd);
-	ref_count0 = read_xe_module_ref();
-	igt_debug("ref count after closing oa stream fd = %u\n", ref_count0);
-}
-
 /**
  * SUBTEST: sysctl-defaults
  * Description: Test that perf_stream_paranoid sysctl exists
@@ -4621,9 +4517,6 @@ igt_main
 		igt_require(!stat("/proc/sys/dev/xe/perf_stream_paranoid", &sb));
 	}
 
-	igt_subtest("xe-ref-count")
-		test_xe_ref_count();
-
 	igt_subtest("sysctl-defaults")
 		test_sysctl_defaults();
 
-- 
2.41.0

