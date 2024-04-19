Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAD4C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 06:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A661D10FDA4;
	Fri, 19 Apr 2024 06:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P61/k3gp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9C210FDA4
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 06:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713508165; x=1745044165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=up42BSTEdpL6jnyWeCxBrnm24QNSMGKPAY0T88zOssc=;
 b=P61/k3gpfpkIdwSJsgBPevkSfevvdq7ZNOyIZA539V4PUTpr+RpX/ywK
 bJWQy/o/DsvEMwQe6ivR28wI3rPg684B7Hhx80N3gswh1FCOl380cG2re
 eYcNGw0U0fHftvfXolswOpbwmEbTBzUYse5ZBG9PK7xuf1d7oeXY3WX0b
 J5WljanfHiUCZU2xIbwwZUq0rvPKd11haytYACUz0YWDV9UxPqgX4GTtO
 uucomj2vdJv7Vnuz8UOCZq5lNkCkRsGp2r/Iv4kdSZaQ2lavxD/vdJIba
 5KRhheq4OX3UA7RxDaxiiO11hbXD06rAe8qylAsqTn7VzfKoznp8q75+D g==;
X-CSE-ConnectionGUID: VN+i8uG4TRKqy9PBQ8pRGw==
X-CSE-MsgGUID: o2KZ+TkgRJCwizats93r/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9637605"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9637605"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 23:29:22 -0700
X-CSE-ConnectionGUID: mMhQUp4+TiOVPSeoxbPa1A==
X-CSE-MsgGUID: 5Q9QlsqgTQi8rwAMZzVq0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23310829"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 23:29:20 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 5/7] tests/intel/kms_big_joiner: use
 kmstest_force_connector_bigjoiner
Date: Fri, 19 Apr 2024 12:09:59 +0530
Message-Id: <20240419064001.2401850-6-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419064001.2401850-1-kunal1.joshi@intel.com>
References: <20240419064001.2401850-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

use kmstest_force_connector_bigjoiner instead of
kmstest_force_connector_bigjoiner

v2: use igt_reset_connectors (Bhanu)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_big_joiner.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index f325a9839..4979cac06 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -87,7 +87,7 @@ static void set_all_master_pipes_for_platform(data_t *data)
 	}
 }
 
-static void toggle_force_joiner_on_all_non_big_joiner_outputs(data_t *data, bool toggle)
+static void enable_force_joiner_on_all_non_big_joiner_outputs(data_t *data)
 {
 	bool status;
 	igt_output_t *output;
@@ -95,7 +95,7 @@ static void toggle_force_joiner_on_all_non_big_joiner_outputs(data_t *data, bool
 
 	for (i = 0; i < data->non_big_joiner_output_count; i++) {
 		output = data->non_big_joiner_output[i];
-		status = igt_force_and_check_bigjoiner_status(data->drm_fd, output->name, toggle);
+		status = kmstest_force_connector_bigjoiner(data->drm_fd, output->config.connector);
 		igt_assert_f(status, "Failed to toggle force joiner\n");
 	}
 }
@@ -383,15 +383,15 @@ igt_main
 		igt_require_f(data.n_pipes > 1,
 			      "Minimum 2 pipes required\n");
 		igt_dynamic_f("single") {
-			toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
+			enable_force_joiner_on_all_non_big_joiner_outputs(&data);
 			test_single_joiner(&data, data.non_big_joiner_output_count, true);
-			toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
+			igt_reset_connectors();
 		}
 		if (data.non_big_joiner_output_count > 1) {
 			igt_dynamic_f("multi") {
-				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
+				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
 				test_multi_joiner(&data, data.non_big_joiner_output_count, true);
-				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
+				igt_reset_connectors();
 			}
 		}
 	}
@@ -405,16 +405,16 @@ igt_main
 			      "Minimum of 2 pipes are required\n");
 		if (data.non_big_joiner_output_count >= 1) {
 			igt_dynamic_f("big_joiner_on_last_pipe") {
-				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
+				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
 				test_joiner_on_last_pipe(&data, true);
-				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
+				igt_reset_connectors();
 			}
 		}
 		if (data.non_big_joiner_output_count > 1) {
 			igt_dynamic_f("invalid_combinations") {
-				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
+				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
 				test_invalid_modeset_two_joiner(&data, false, true);
-				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
+				igt_reset_connectors();
 			}
 		}
 	}
@@ -422,5 +422,6 @@ igt_main
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
+		igt_reset_connectors();
 	}
 }
-- 
2.25.1

