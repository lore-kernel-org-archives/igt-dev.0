Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE0DCD5BCF
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 06:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D58310E49A;
	Tue, 26 May 2026 06:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gVA1xSUh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC5810E4A2
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 06:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779777763; x=1811313763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3ZqHgcqMOh7IUZoZck7+j040FLQ8ydfIh1HDMbNtB7c=;
 b=gVA1xSUhbFIHSKeUmrlxycC/4EKs4SBe48XANSk1vY23oO3aOIrjjPPy
 MwJCepwqYdw6y5GazJnbHEBCUVB7StmHAGUWOQdPmOb65D6lkN2aTW7f+
 i5KBirdQOzDE5iGJKc/JTZFr0suf+Q2Rcf7M6WmInleVWxoqzUvI5n0x7
 B3dapI7O+Vmmj6oxW78wh9y8f9xt5MByHjeA7NQqhPFHwxCCoauVRSzO7
 +zh/x1j9aW/mztzshPyOp733BwSDtH2JXkPbTJQnDWR7g7NgyXvgF6TB3
 AKg6Gj7BKPJQUruD9iZUyNYctcm55TrOAySyn0Ps2GK2q7P0DktSTjqWf w==;
X-CSE-ConnectionGUID: HqPo5RjvR/C9pggizJZ0cA==
X-CSE-MsgGUID: RDHD+Ik8RseIPHowkRdpTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80617983"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="80617983"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 23:42:43 -0700
X-CSE-ConnectionGUID: d6uEJKD8SVmM1PDG1CokKw==
X-CSE-MsgGUID: cUHC1j4WQNWbppFYyM2V9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="265689289"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 23:42:41 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v7 1/7] tests: s/check_dc_counter/assert_dc_counter
Date: Tue, 26 May 2026 12:10:58 +0530
Message-ID: <20260526064105.1818876-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526064105.1818876-1-jeevan.b@intel.com>
References: <20260526064105.1818876-1-jeevan.b@intel.com>
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

Rename function name.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 423a5c4a4..c8cfa300c 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -110,7 +110,7 @@ typedef struct {
 	bool runtime_suspend_disabled;
 } data_t;
 
-static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
+static void assert_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
 
 static void set_output_on_pipe_b(data_t *data)
 {
@@ -257,7 +257,7 @@ static void create_color_fb(data_t *data, igt_fb_t *fb, color_t *fb_color)
 	paint_rectangles(data, data->mode, fb_color, fb);
 }
 
-static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count)
+static void assert_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count)
 {
 	igt_assert_f(igt_dc_state_wait_entry(data->debugfs_fd, dc_flag, prev_dc_count),
 		     "%s state is not achieved\n%s:\n%s\n", igt_dc_state_name(dc_flag),
@@ -265,7 +265,7 @@ static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count)
 		     PWR_DOMAIN_INFO));
 }
 
-static void check_dc_counter_negative(data_t *data, int dc_flag, uint32_t prev_dc_count)
+static void assert_dc_counter_negative(data_t *data, int dc_flag, uint32_t prev_dc_count)
 {
 	igt_assert_f(!igt_dc_state_wait_entry(data->debugfs_fd, dc_flag, prev_dc_count),
 		     "%s state is achieved\n%s:\n%s\n", igt_dc_state_name(dc_flag),
@@ -346,7 +346,7 @@ static void test_dc5_retention_flops(data_t *data, int dc_flag)
 	set_output_on_pipe_b(data);
 	setup_primary(data);
 	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data->output));
-	check_dc_counter(data, dc_flag, dc_counter_before_psr);
+	assert_dc_counter(data, dc_flag, dc_counter_before_psr);
 	cleanup_dc_psr(data);
 }
 
@@ -360,7 +360,7 @@ static void test_dc_state_psr(data_t *data, int dc_flag)
 	setup_primary(data);
 	igt_require(!psr_disabled_check(data->debugfs_fd));
 	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data->output));
-	check_dc_counter(data, dc_flag, dc_counter_before_psr);
+	assert_dc_counter(data, dc_flag, dc_counter_before_psr);
 	psr_sink_error_check(data->debugfs_fd, data->op_psr_mode, data->output);
 	cleanup_dc_psr(data);
 }
@@ -439,7 +439,7 @@ static void test_dc_state_dpms(data_t *data, int dc_flag)
 	setup_dc_dpms(data);
 	dc_counter = igt_read_dc_counter(data->debugfs_fd, dc_flag);
 	dpms_off(data);
-	check_dc_counter(data, dc_flag, dc_counter);
+	assert_dc_counter(data, dc_flag, dc_counter);
 	dpms_on(data);
 	cleanup_dc_dpms(data);
 }
@@ -452,7 +452,7 @@ static void test_dc_state_dpms_negative(data_t *data, int dc_flag)
 	setup_dc_dpms(data);
 	dc_counter = igt_read_dc_counter(data->debugfs_fd, dc_flag);
 	dpms_on(data);
-	check_dc_counter_negative(data, dc_flag, dc_counter);
+	assert_dc_counter_negative(data, dc_flag, dc_counter);
 	cleanup_dc_dpms(data);
 }
 
-- 
2.43.0

