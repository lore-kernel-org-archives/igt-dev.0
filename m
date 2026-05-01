Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3CFCD3424
	for <igt-dev@archiver.kernel.org>; Fri,  1 May 2026 12:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9528C10E539;
	Fri,  1 May 2026 12:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcGEQkYa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3C710E539
 for <igt-dev@lists.freedesktop.org>; Fri,  1 May 2026 12:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777638535; x=1809174535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PAsF3rNIKC+pi1MFGdJNk7cnJiqMHEqB8wS7G4rXCdo=;
 b=LcGEQkYaimuaT03kRedvCE0lBC6zR3CcrUMxy9pG/LlKOYPk2UrH88Vr
 6EUMrUKq+1n97SvDSTLKNohnAGUc0kA3TnCGHf/+cpwER4VTGIWV+iSrR
 GaqogV2pt72CcIk8KbXe8Bxm7pbD3T+5hDE4mcT+FfeH8Okg6/RIgemSC
 uSKY5W7texB0uA+nDc01D70wbxWai9jvEe8qiphhc+OsIePuQLjoDxTMZ
 ptLCo99T2gVmhJxfczgnbK2q40ph274yhSWQI3AwgaKeQLJ/yL0KJ4cpD
 3Ni9NM7vwwAN7yP3EOg0b5WuGiPP4oiq6Zc4xX65tObo9+PG7v1xYMqqX Q==;
X-CSE-ConnectionGUID: Gr5skhhPRFKh6X68+mQ3CA==
X-CSE-MsgGUID: qWAegl+DQ9qwCD35+LMmHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="104050044"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="104050044"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 05:28:55 -0700
X-CSE-ConnectionGUID: gnBKv5HYQY6yhyEUz8ZWDQ==
X-CSE-MsgGUID: x3cQMKkvRdaLSJdvItEvSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="258203333"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 05:28:53 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, juhapekka.heikkila@gmail.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel/kms_sharpness_filter: Add CRC
 comparison for positive tests
Date: Fri,  1 May 2026 18:07:37 +0530
Message-Id: <20260501123738.2360414-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260501123738.2360414-1-swati2.sharma@intel.com>
References: <20260501123738.2360414-1-swati2.sharma@intel.com>
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

Add a CRC comparison that verifies the sharpness filter produces a
different CRC from a reference CRC captured with the filter disabled.

Skip the comparison for negative (invalid-*) tests since the commit
was expected to fail.

Co-developed-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 96eec8919..062a9691c 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -418,7 +418,7 @@ static void test_sharpness_filter(data_t *data, enum test_type type)
 {
 	igt_output_t *output = data->output;
 	drmModeModeInfo *mode = data->mode;
-	igt_crc_t ref_crc, crc;
+	igt_crc_t ref_crc, crc, no_sharp_crc, sharp_crc;
 	igt_pipe_crc_t *pipe_crc = NULL;
 	int ret;
 
@@ -438,6 +438,18 @@ static void test_sharpness_filter(data_t *data, enum test_type type)
 	if (needs_extra_planes(type))
 		set_planes(data, type);
 
+	/*
+	 * For positive tests, capture a reference CRC with the sharpness
+	 * filter still disabled before applying the filter. After the filter
+	 * is enabled and committed, the resulting CRC must differ.
+	 */
+	if (!is_invalid_test(type)) {
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		pipe_crc = igt_crtc_crc_new(data->crtc,
+					    IGT_PIPE_CRC_SOURCE_AUTO);
+		igt_pipe_crc_collect_crc(pipe_crc, &no_sharp_crc);
+	}
+
 	set_filter_strength_on_pipe(data);
 
 	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
@@ -460,9 +472,14 @@ static void test_sharpness_filter(data_t *data, enum test_type type)
 		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 	}
 
+	if (!is_invalid_test(type)) {
+		igt_pipe_crc_collect_crc(pipe_crc, &sharp_crc);
+		igt_assert_f(!igt_check_crc_equal(&sharp_crc, &no_sharp_crc),
+			     "Sharpness CRC matches reference CRC; filter had no effect on pipe %s\n",
+			     igt_crtc_name(data->crtc));
+	}
+
 	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
-		pipe_crc = igt_crtc_crc_new(data->crtc,
-					    IGT_PIPE_CRC_SOURCE_AUTO);
 		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
 
 		if (type == TEST_FILTER_DPMS) {
@@ -479,9 +496,11 @@ static void test_sharpness_filter(data_t *data, enum test_type type)
 
 		igt_pipe_crc_collect_crc(pipe_crc, &crc);
 		igt_assert_crc_equal(&crc, &ref_crc);
-		igt_pipe_crc_free(pipe_crc);
 	}
 
+	if (pipe_crc)
+		igt_pipe_crc_free(pipe_crc);
+
 	if (is_invalid_test(type))
 		igt_assert_eq(ret, -EINVAL);
 	else
-- 
2.25.1

