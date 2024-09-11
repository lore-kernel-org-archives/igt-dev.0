Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C1AEE0209
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 05:50:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492F510E96B;
	Wed, 11 Sep 2024 05:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JaixcieQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3123510E96B
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 05:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726033850; x=1757569850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nE/mC/X6N4U+P7YUUNGZMEtK/IvzlyObzritSM4ay6U=;
 b=JaixcieQvAp0urjpKNUW/GSdGm8b/CDn0wCpKDo/KkPgar9xJQCNfAUK
 nExDWod6Tarry34MGzik1GjYuucvDk3L+8b50/kvNX8Qb6jrGK4lFbWPt
 cF5vyro66xhMi6QC4gywADZfdZXKdRV+S8Q6/nG/+lglvaVzC8dpWF9Rw
 S4KSp7dn1K5BSTKTecnMiL0M7QTECuQd6oNYN4VsNrBrAbdoZQx1ZJXeI
 bPH17pEi/U67bawxkVCJD81+qdeHIro2CAmhwv4TbjcOtlSjJ79auQSwx
 Z4hfKqlQZu0r1qso/BVBeKXFCP5vKgpVN0Dvu8dxORdpBILqMrWrW1plU w==;
X-CSE-ConnectionGUID: iqjf8OQKQjy+LB2FeF+zJQ==
X-CSE-MsgGUID: wswoL03FSPS2dn2bBcwXGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="25009419"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="25009419"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 22:50:50 -0700
X-CSE-ConnectionGUID: jvtGpOsmR2iQ8DjxRaMZ2A==
X-CSE-MsgGUID: +pONr2YXQUSfKGBB2l/Ufw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="67540767"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 jhogande-mobl1..) ([10.245.244.65])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 22:50:49 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v2 5/5] tests/intel/kms_dirtyfb: Check features after
 rendering
Date: Wed, 11 Sep 2024 08:49:58 +0300
Message-Id: <20240911054958.1023925-6-jouni.hogander@intel.com>
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

Check each feature after rendering and flush. Also add new check for
possible PSR errors.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
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

