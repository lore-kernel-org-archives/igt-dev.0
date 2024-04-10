Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D310CD1296
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 06:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E951131C6;
	Wed, 10 Apr 2024 06:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UVXvtxqm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B991131C2
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 06:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712730836; x=1744266836;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sdvYUO9EEj1iKl0ipuRA0xcLvoLICjOuYCwLwjuijUw=;
 b=UVXvtxqmyZgCynQ1kCiReiU5ZqpaWHnNWrg94Yrlred7wKzY4/k+i7Xi
 KouSLsU4rqtVvJ7HoAGrvFIFw0AqunMf6ytCImez5TVc1QLheNAoeH62T
 wSmyRcpnc6uaRCLDBZVqkyQrFnZrwyU8X2APE/8ZUkxRDcnm+gXbzyZzP
 NKW/RXTglXREJz54dspWbbC5x2e0S8kGZ1FvDSo/hzu+PIj0r2jBuAlzN
 Vkz39EhnZydg2pHtX7U/uynxtFHcjXmpA5wvcUUS1VFL7jWi+bXwQjKcS
 LD+R470KjoAbb8Zk951vNXX5jgBB4LJLDRp6LBDoSlJRkbI8OXFtLikNV w==;
X-CSE-ConnectionGUID: unRgAnnXTiOBgmKMpCeIXA==
X-CSE-MsgGUID: TWNnql5TRci+j6PUixayFw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7948186"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7948186"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 23:33:56 -0700
X-CSE-ConnectionGUID: aBdKR1OhRieISNJLCOBGgg==
X-CSE-MsgGUID: gMHAXYqzR3SrsRGflu6BTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25138214"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 23:33:53 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 8/9] tests/intel/km_big_joiner: use
 kmstest_force_connector_debugfs for better cleanup functionality
Date: Wed, 10 Apr 2024 12:14:25 +0530
Message-Id: <20240410064426.1968399-9-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240410064426.1968399-1-kunal1.joshi@intel.com>
References: <20240410064426.1968399-1-kunal1.joshi@intel.com>
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

use kmstest_force_connector_debugfs instead of igt_force_and_check_bigjoiner_status
for better cleanup of i915_bigjoiner_force_enable state.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_big_joiner.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index 078f76ac1..ebeeaff9c 100644
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
@@ -95,7 +95,9 @@ static void toggle_force_joiner_on_all_non_big_joiner_outputs(data_t *data, bool
 
 	for (i = 0; i < data->non_big_joiner_output_count; i++) {
 		output = data->non_big_joiner_output[i];
-		status = igt_force_and_check_bigjoiner_status(data->drm_fd, output->name, toggle);
+		status = kmstest_force_connector_debugfs(data->drm_fd,
+							 output->config.connector,
+							 FORCE_JOINER, "1");
 		igt_assert_f(status, "Failed to toggle force joiner\n");
 	}
 }
@@ -380,15 +382,15 @@ igt_main
 		igt_require_f(data.n_pipes > 1,
 			      "Minimum 2 pipes required\n");
 		igt_dynamic_f("single") {
-			toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
+			enable_force_joiner_on_all_non_big_joiner_outputs(&data);
 			test_single_joiner(&data, data.non_big_joiner_output_count, true);
-			toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
+			igt_reset_connectors_debugfs();
 		}
 		if (data.non_big_joiner_output_count > 1) {
 			igt_dynamic_f("multi") {
-				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
+				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
 				test_multi_joiner(&data, data.non_big_joiner_output_count, true);
-				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
+				igt_reset_connectors_debugfs();
 			}
 		}
 	}
@@ -402,16 +404,16 @@ igt_main
 			      "Minimum of 2 pipes are required\n");
 		if (data.non_big_joiner_output_count >= 1) {
 			igt_dynamic_f("big_joiner_on_last_pipe") {
-				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
+				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
 				test_joiner_on_last_pipe(&data, true);
-				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
+				igt_reset_connectors_debugfs();
 			}
 		}
 		if (data.non_big_joiner_output_count > 1) {
 			igt_dynamic_f("invalid_combinations") {
-				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
+				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
 				test_invalid_modeset_two_joiner(&data, false, true);
-				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
+				igt_reset_connectors_debugfs();
 			}
 		}
 	}
@@ -419,5 +421,6 @@ igt_main
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
+		igt_reset_connectors_debugfs();
 	}
 }
-- 
2.34.1

