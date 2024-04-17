Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F0FC001CC
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 11:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E57E11340D;
	Wed, 17 Apr 2024 11:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbMAgYlZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B5B10E1A2
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 11:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713353563; x=1744889563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2toh5D3vO3zwezJaJik78IFEU9hLhjKETD0+zem+rJ4=;
 b=dbMAgYlZAXIZXUKUvYXDP9ZlpXAHJuAp7rkm3aRNAOxzQQLTWZuuqLNo
 31FQfP0NW+j8z6VEfKXp1aJNZKfxuo8fmsgx2SSsyNtAFv7v4Qai3Fe7Q
 nkneHu5RZhvZuenZvb1/CYjkc0G2EtwjoZFS92zvAyY8xQTBEVC7H6kEt
 Vc4UL2bI6hHXjBf0Bqbx+BuRFFNh3FpI135dEBBjluFSDNpMmtmq6Blmd
 RhXnzx/1dv+h7ckUhBy5zBy/IOX0tswg0MBonGGiKtA28m6HE8wHD7y9D
 FPzGWIcFD93LxAwRwIQ4+iIpepkkK07F6/OxkvYPS6ihgAJrqTnWvHAzG Q==;
X-CSE-ConnectionGUID: fajfLYQnRHKPyKi+lLo2Lg==
X-CSE-MsgGUID: fJdd++DiTxGnOoZFTEvVbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8719255"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8719255"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 04:32:43 -0700
X-CSE-ConnectionGUID: Fqmq5Dz3QSKrZbA31Edheg==
X-CSE-MsgGUID: iax+jfC8S7SGTwABTSqHeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="22658145"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 04:32:41 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 4/6] tests/intel/kms_big_joiner: use
 kmstest_force_connector_bigjoiner
Date: Wed, 17 Apr 2024 17:13:24 +0530
Message-Id: <20240417114326.2245087-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240417114326.2245087-1-kunal1.joshi@intel.com>
References: <20240417114326.2245087-1-kunal1.joshi@intel.com>
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

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_big_joiner.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index f325a9839..a9301c611 100644
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
+			igt_reset_force_joiner_state();
 		}
 		if (data.non_big_joiner_output_count > 1) {
 			igt_dynamic_f("multi") {
-				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
+				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
 				test_multi_joiner(&data, data.non_big_joiner_output_count, true);
-				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
+				igt_reset_force_joiner_state();
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
+				igt_reset_force_joiner_state();
 			}
 		}
 		if (data.non_big_joiner_output_count > 1) {
 			igt_dynamic_f("invalid_combinations") {
-				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
+				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
 				test_invalid_modeset_two_joiner(&data, false, true);
-				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
+				igt_reset_force_joiner_state();
 			}
 		}
 	}
@@ -422,5 +422,6 @@ igt_main
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
+		igt_reset_force_joiner_state();
 	}
 }
-- 
2.25.1

