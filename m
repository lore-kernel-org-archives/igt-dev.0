Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E16AC04FF6
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 05:24:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00447112782;
	Mon, 22 Apr 2024 05:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y4CD/G9v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB39112781
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 05:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713763453; x=1745299453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=up42BSTEdpL6jnyWeCxBrnm24QNSMGKPAY0T88zOssc=;
 b=Y4CD/G9vr7wsRq3vEYw0dkJ8m5ysDtirovFqdecS63Uu27AeIgjKH6HQ
 JMNC9qyOp5LqYhDDDWLrreAg197rUelN2sYlMLgOUbtKwv7XDUeGhOTRS
 D9Zxou+7iWdf/CzATkxOfhj387sZmVQi6Q33rj5eHK3gakFcaOJvZa+8x
 k6t3iq5LOZE0tQOWvgrfDwuTjs8XgWjV3vSDjWgI4Ja3bkBEJTphS0gQH
 9g38CVEuaOSY69DNzThs32UtXhmhTpqcW7LsOYhVza+jsbLnZlnsXCjSt
 gKPzjbDghR3LHPFpuf+5s+iFli78mkZ685Cx87bKHobF9krDGdrcJdOYs g==;
X-CSE-ConnectionGUID: unLbjBbRTm2l0scBR70nmQ==
X-CSE-MsgGUID: FZi7HO4tTfmQmgIOmqYk8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9113797"
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="9113797"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2024 22:24:13 -0700
X-CSE-ConnectionGUID: ZQQnVatjSR2i3+t2+VcaYw==
X-CSE-MsgGUID: x1c/UEjXT6q41IlBEvSTkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; d="scan'208";a="23981147"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2024 22:24:11 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 5/7] tests/intel/kms_big_joiner: use
 kmstest_force_connector_bigjoiner
Date: Mon, 22 Apr 2024 11:04:52 +0530
Message-Id: <20240422053454.2523989-6-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240422053454.2523989-1-kunal1.joshi@intel.com>
References: <20240422053454.2523989-1-kunal1.joshi@intel.com>
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

