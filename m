Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450ADC3065B
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 05:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0724C10E2E5;
	Mon,  1 Jul 2024 05:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RuiJAWFA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2741510E2E5
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 05:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719810882; x=1751346882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RbFNMS8qadP8BP9/0K6zhvTXrr1zrH8+fqVWKmcOeAI=;
 b=RuiJAWFA0B3GSjK/FF1j6johaGa/uN63N6oZ2sK9miUdQe462bpQNJPY
 xEucUZDpzY9SJL64xWarRuZU35E4aOSLfcxGfmRfeQkXIQN4b5MkqcLB9
 oh7enyr2JP1iHLsJYVh+FNOY12BKj95npTAoOcfCRMCixrEwZ30Y0rT1X
 0xINiTRn9wkfybsPwYN4wYLbbHKf3eqxyhCmAzo6cRk07kGT18ihqNmvR
 Rjfyt1or+Rss6Pes7aiyrrROxGPt3FQiAsyA3+DSrqzbTbFSjdEAuXcdq
 L2kLgDduccFfGVj63/KU+dsqdA6S8YXfl96nUVWoLv3HvXvtap+5RdHvn A==;
X-CSE-ConnectionGUID: ZqaNlxOAQlOI3h6oHbxP/A==
X-CSE-MsgGUID: XO8Va97gTi2HuJ7yjHeSsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="17046099"
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="17046099"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 22:14:42 -0700
X-CSE-ConnectionGUID: GFr71wHST5+NvDSOPZEOiw==
X-CSE-MsgGUID: eVtkLiytREu+WfaH8Hnk8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="46129567"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.15])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 22:14:40 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/kms_dirtyfb: Check features after
 rendering
Date: Mon,  1 Jul 2024 08:13:01 +0300
Message-Id: <20240701051301.3344927-4-jouni.hogander@intel.com>
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

Check each feature after rendering and flush. Also add new check for
possible PSR errors.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/intel/kms_dirtyfb.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 75047ec63..35df9be3b 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -145,7 +145,7 @@ static void enable_feature(data_t *data)
 	}
 }
 
-static void check_feature(data_t *data)
+static void check_feature_enabled(data_t *data)
 {
 	switch (data->feature) {
 	case FEATURE_NONE:
@@ -171,6 +171,33 @@ static void check_feature(data_t *data)
 	}
 }
 
+static void check_feature(data_t *data)
+{
+	switch (data->feature) {
+	case FEATURE_NONE:
+		break;
+	case FEATURE_FBC:
+		igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
+							  data->pipe),
+			     "FBC disabled\n");
+		/* TODO: Add compression check here */
+		break;
+	case FEATURE_PSR:
+		igt_assert_f(psr_wait_entry(data->debugfs_fd, PSR_MODE_1, data->output),
+			     "No PSR entry\n");
+		psr_sink_error_check(data->debugfs_fd, PSR_MODE_1, data->output);
+		break;
+	case FEATURE_DRRS:
+		igt_assert_f(!intel_is_drrs_inactive(data->drm_fd, data->pipe),
+			     "DRRS INACTIVE\n");
+		break;
+	case FEATURE_DEFAULT:
+		break;
+	default:
+		igt_assert(false);
+	}
+}
+
 static void disable_features(data_t *data)
 {
 	intel_fbc_disable(data->drm_fd);
@@ -232,7 +259,7 @@ static void prepare(data_t *data)
 
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	check_feature(data);
+	check_feature_enabled(data);
 }
 
 static void cleanup(data_t *data)
@@ -298,6 +325,8 @@ static void run_test(data_t *data)
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
 	igt_assert_crc_equal(&crc, &data->ref_crc);
 
+	check_feature(data);
+
 	igt_spin_free(data->drm_fd, spin);
 	intel_bb_destroy(ibb);
 	intel_buf_destroy(src);
-- 
2.34.1

