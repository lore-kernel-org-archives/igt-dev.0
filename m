Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83824C2BD09
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 05:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D8C10E2E3;
	Mon,  1 Jul 2024 05:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PAyKjQbd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FEC10E23B
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 05:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719810880; x=1751346880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tol9H8tnoA5gDDgsnX/146wAzumPXe78sk9SCJWLJjw=;
 b=PAyKjQbd6psgKkzU2kxFqYM9/u5T/255FBT9awB0Tl2ykVLoPxzzxWTK
 U7RsvrIhUwdT2EW+jpwWFVwUhFcHUrVyY8/jQDqY+i5V6fpT9qQJCjqa2
 8WbuMDK05zJ4e9lZgM131D/xDtyNO6zB+vWL1B+8IusDGgvadPMDeW/mI
 22g/Zzsy4zofLnCmB+AcF96sZ/wwyi824gCiRNrTuzHW0i6HluAotZksj
 6DdhS61yLvoTtfANgYOjWnGk6rKeytb4Ht4kA9qkaEGgKp+jVKhzdi/UD
 H+cBQWCqSFZSE+qNgzroKMRHhdkjPdnvp5EOGK8pK2gji1mg1IhxMaRaM A==;
X-CSE-ConnectionGUID: CElZ+xWwTXmkL73yWRW/dQ==
X-CSE-MsgGUID: 79NapC/YRVKPGEMjyZMiIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="17046098"
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="17046098"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 22:14:40 -0700
X-CSE-ConnectionGUID: AnfkTaXxQY62+8ZvlveTqQ==
X-CSE-MsgGUID: MjJTapfDREmqxNIWf/Y28A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="46129563"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.15])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 22:14:39 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel/kms_psr*: Add psr_sink_error_check to
 PSR tests
Date: Mon,  1 Jul 2024 08:13:00 +0300
Message-Id: <20240701051301.3344927-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240701051301.3344927-1-jouni.hogander@intel.com>
References: <20240701051301.3344927-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Currently we are ignoring possible errors detected by the sink in our PSR
testcases. Fix this by add psr_sink_error_check to each of them.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 5 +++--
 tests/intel/kms_pm_dc.c                | 2 ++
 tests/intel/kms_psr.c                  | 2 ++
 tests/intel/kms_psr2_sf.c              | 2 ++
 tests/intel/kms_psr2_su.c              | 2 ++
 tests/intel/kms_psr_stress_test.c      | 1 +
 6 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index e45d17dd6..913c7b234 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2722,10 +2722,11 @@ static void do_status_assertions(int flags)
 						   prim_mode_params.pipe));
 	}
 
-	if (flags & ASSERT_PSR_ENABLED)
+	if (flags & ASSERT_PSR_ENABLED) {
 		igt_assert_f(psr_wait_entry(drm.debugfs, PSR_MODE_1, NULL),
 			     "PSR still disabled\n");
-	else if (flags & ASSERT_PSR_DISABLED)
+		psr_sink_error_check(drm.debugfs, PSR_MODE_1, prim_mode_params.output);
+	} else if (flags & ASSERT_PSR_DISABLED)
 		igt_assert_f(psr_wait_update(drm.debugfs, PSR_MODE_1, NULL),
 			     "PSR still enabled\n");
 }
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index e1318bfa6..d5753ad32 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -407,6 +407,7 @@ static void test_dc_state_psr(data_t *data, int dc_flag)
 	igt_require(!psr_disabled_check(data->debugfs_fd));
 	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL));
 	check_dc_counter(data, dc_flag, dc_counter_before_psr);
+	psr_sink_error_check(data->debugfs_fd, data->op_psr_mode, data->output);
 	cleanup_dc_psr(data);
 }
 
@@ -675,6 +676,7 @@ static void test_pkgc_state_psr(data_t *data)
 	igt_wait((cur_value = read_pkgc_counter(data->debugfs_root_fd)) > prev_value,
 		  timeout_sec * 1000, 100);
 	igt_assert_f(cur_value > prev_value, "PKGC10 is not achieved.\n");
+	psr_sink_error_check(data->debugfs_fd, data->op_psr_mode, data->output);
 	psr_dpms(data, DRM_MODE_DPMS_ON);
 	cleanup_dc_psr(data);
 }
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index f3caa9ecc..c59476137 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -650,6 +650,8 @@ static void test_cleanup(data_t *data)
 {
 	igt_plane_t *primary;
 
+	psr_sink_error_check(data->debugfs_fd, data->op_psr_mode, data->output);
+
 	igt_output_override_mode(data->output, NULL);
 
 	primary = igt_output_get_plane_type(data->output,
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 03ff1cddb..a9be1a1ec 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -972,6 +972,8 @@ static void run(data_t *data)
 	default:
 		igt_assert(false);
 	}
+
+	psr_sink_error_check(data->debugfs_fd, data->psr_mode, data->output);
 }
 
 static void cleanup(data_t *data)
diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
index 437ee36f6..0099daf1d 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -273,6 +273,8 @@ static void run(data_t *data, igt_output_t *output)
 
 	igt_assert_f(result,
 		     "No matching selective update blocks read from debugfs\n");
+
+	psr_sink_error_check(data->debugfs_fd, PSR_MODE_2, output);
 }
 
 static void cleanup(data_t *data, igt_output_t *output)
diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
index d6e2340b8..73a6eb56d 100644
--- a/tests/intel/kms_psr_stress_test.c
+++ b/tests/intel/kms_psr_stress_test.c
@@ -344,6 +344,7 @@ static void run(data_t *data)
 
 	/* Check if after all this stress the PSR is still in the same state */
 	igt_assert(psr_get_mode(data->debugfs_fd, NULL) == data->initial_state);
+	psr_sink_error_check(data->debugfs_fd, data->initial_state, data->output);
 }
 
 igt_main
-- 
2.34.1

