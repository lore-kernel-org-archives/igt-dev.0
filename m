Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FF7EE0209
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 05:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDB310E968;
	Wed, 11 Sep 2024 05:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IApdDgr1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1710410E968
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 05:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726033834; x=1757569834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=23eV2YmiLJLoRVFltqT70dHUYQdLIXeqRLrt+zBL96g=;
 b=IApdDgr1J53HEUBoyw3wR2BoaHLhJcYGXWL2AwPBbKRYJSrthkiWuW36
 HRQ8mbRE4lude6AKOPMDva5jOkuizv2a0XjSC0Yo+7UJYVyQOCK9yInQZ
 2W/05Qf64m4h2de/9/zVc6M7kIUXPd79PG5eqQs6g2QQut9fqFaYC9PJs
 pZJQCewSo54Ss67kl9HaYYpeyjGsCg+DTK5bhYeGT/9EOHSTyRL3KHkuS
 V9S3IHZiee+uXgvfxEHico+jP/3R1JxkEFARsqDslpFOuwvSPfuw6LrWD
 YtiCToQp2ZcXRi+1tROoFRYDm4t+8QoKoFUUDbLs1Wwp5u7nh874mR56Y w==;
X-CSE-ConnectionGUID: DlVrkU32SHGrXF4SGbSljg==
X-CSE-MsgGUID: XzcpFbYZTZmnbylfayzBAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="25009385"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="25009385"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 22:50:34 -0700
X-CSE-ConnectionGUID: U9GQPWNQRT6KALDTzv0f9A==
X-CSE-MsgGUID: Pzk4sGprRQmJAr4pTe5HAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="67540699"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 jhogande-mobl1..) ([10.245.244.65])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 22:50:33 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v2 2/5] tests/intel/kms_psr*: Add psr_sink_error_check
 to PSR tests
Date: Wed, 11 Sep 2024 08:49:55 +0300
Message-Id: <20240911054958.1023925-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911054958.1023925-1-jouni.hogander@intel.com>
References: <20240911054958.1023925-1-jouni.hogander@intel.com>
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

Currently we are ignoring possible errors detected by the sink in our
PSR testcases. Fix this by add psr_sink_error_check to each of them.

v2: split kms_fbt and kms_pm_dc to separate patches

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/intel/kms_psr.c             | 2 ++
 tests/intel/kms_psr2_sf.c         | 2 ++
 tests/intel/kms_psr2_su.c         | 2 ++
 tests/intel/kms_psr_stress_test.c | 1 +
 4 files changed, 7 insertions(+)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index cf0ce4bb8..2badeeddd 100644
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

