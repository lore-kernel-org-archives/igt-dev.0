Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7966BD116FE
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 08:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D5210E5C6;
	Tue,  2 Dec 2025 08:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BQRlXx7p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC3A10E5C6
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 08:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764664944; x=1796200944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nYmiAUxUSWHTm/mFVUzC5B/1Uw99uANS1rXJDRP0wo4=;
 b=BQRlXx7pLKKdEP3bAWEQ97WtIUCHkbvkudmAmixkpmGN5oNxdNh8zBDK
 pehi90tZat+mxVFbCWkaO8fNRnAUzB8OInn6tqDVpZpUwmsXyXzrTo2R5
 vAbRAQwiharzed3U9RjT7ZB4IeRB25J4i0GSuoVs1sglNvw8c4im2mMWn
 L8rf2p2p8fSrMplVs3KxVbPYpxR8nGL+kPEKzl6jzCp8lwJpsnCrnjCkt
 VQ6RyLZfLJMfNi16Jt6cQN49q6NTD4+H1dfclDd4QwbNFvd0CGSJJ9JfO
 +Df0OEi1QfXstbFWQJF4653cY84n4rGwuEbec69PydMOnembyTFMieAGX A==;
X-CSE-ConnectionGUID: Gl8kFWLqRnuy5MuSic92yQ==
X-CSE-MsgGUID: RZnzZzpMS62a6IGAFtIrrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="76943133"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="76943133"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 00:42:24 -0800
X-CSE-ConnectionGUID: M8xytnOxS9i+xt1njAMnsQ==
X-CSE-MsgGUID: yg2cAYQnRNGjkTdxSglXeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="198693503"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 00:42:22 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, kamil.konieczny@linux.intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/intel/kms_joiner: Add function for pretest
 checks
Date: Tue,  2 Dec 2025 14:12:43 +0530
Message-ID: <20251202084243.2677718-3-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202084243.2677718-1-karthik.b.s@intel.com>
References: <20251202084243.2677718-1-karthik.b.s@intel.com>
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

Move igt_require checks in individual subtests to a function which is
called from all subtests to avoid code duplication.

v2: Use enum for various joiner modes (Santhosh)

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel/kms_joiner.c | 91 ++++++++++++++++++++++++----------------
 1 file changed, 55 insertions(+), 36 deletions(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 55bdef9fa..19c880cf6 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -101,10 +101,18 @@ typedef struct {
 	igt_output_t *non_joiner_output[IGT_MAX_PIPES];
 	enum pipe pipe_seq[IGT_MAX_PIPES];
 	igt_display_t display;
+	bool ultra_joiner_supported;
 } data_t;
 
 static int max_dotclock;
 
+enum joiner_mode {
+	FORCE_BIG_JOINER,
+	FORCE_ULTRA_JOINER,
+	BIG_JOINER,
+	ULTRA_JOINER
+};
+
 static void enable_force_joiner_on_all_non_big_joiner_outputs(data_t *data)
 {
 	bool status;
@@ -179,6 +187,37 @@ static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo
 	igt_remove_fb(data->drm_fd, &fb);
 }
 
+static void require_joiners(data_t *data, enum joiner_mode mode)
+{
+	bool forced = (mode == FORCE_BIG_JOINER ||
+		       mode == FORCE_ULTRA_JOINER);
+
+	switch (mode) {
+	case FORCE_ULTRA_JOINER:
+		igt_require(data->non_ultra_joiner_output_count > 0);
+		/* fallthough */
+
+	case ULTRA_JOINER:
+		igt_require(data->ultra_joiner_supported);
+		igt_require(data->n_pipes > 3);
+
+		if (!forced)
+			igt_require(data->ultra_joiner_output_count > 0);
+		break;
+
+	case FORCE_BIG_JOINER:
+		igt_require(data->non_big_joiner_output_count > 0);
+		/* fallthough */
+
+	case BIG_JOINER:
+		igt_require(data->n_pipes > 1);
+
+		if (!forced)
+			igt_require(data->big_joiner_output_count > 0);
+		break;
+	}
+}
+
 static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *output)
 {
 	drmModeModeInfo bj_mode;
@@ -554,7 +593,7 @@ igt_main
 	data_t data;
 
 	igt_fixture {
-		ultra_joiner_supported = false;
+		data.ultra_joiner_supported = false;
 		data.big_joiner_output_count = 0;
 		data.ultra_joiner_output_count = 0;
 		data.non_big_joiner_output_count = 0;
@@ -574,7 +613,7 @@ igt_main
 		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
 		display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
 		if (is_dgfx && display_ver == 14)
-			ultra_joiner_supported = true;
+			data.ultra_joiner_supported = true;
 
 		for_each_connected_output(&data.display, output) {
 			bool ultrajoiner_found = false, bigjoiner_found = false, force_joiner_supported = false;
@@ -629,32 +668,25 @@ igt_main
 
 	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
 	igt_subtest_with_dynamic("basic-big-joiner") {
-			igt_require_f(data.big_joiner_output_count > 0,
-				      "No bigjoiner output found\n");
-			igt_require_f(data.n_pipes > 1,
-				      "Minimum 2 pipes required\n");
-			igt_dynamic_f("single-joiner")
-				test_single_joiner(&data, data.big_joiner_output_count, false);
-			if (data.big_joiner_output_count > 1)
-				igt_dynamic_f("multi-joiner")
-					test_multi_joiner(&data, data.big_joiner_output_count, false);
+		require_joiners(&data, BIG_JOINER);
+		igt_dynamic_f("single-joiner")
+			test_single_joiner(&data, data.big_joiner_output_count, false);
+		if (data.big_joiner_output_count > 1)
+			igt_dynamic_f("multi-joiner")
+				test_multi_joiner(&data, data.big_joiner_output_count, false);
 	}
 
 	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
 	igt_subtest_with_dynamic("basic-ultra-joiner") {
-			igt_require_f(data.ultra_joiner_output_count > 0,
-				      "No ultrajoiner output found\n");
-			igt_require_f(data.n_pipes > 3,
-				      "Minimum 4 pipes required\n");
-			igt_dynamic_f("single-joiner")
-				test_ultra_joiner(&data, false, false, false);
+		require_joiners(&data, ULTRA_JOINER);
+		igt_dynamic_f("single-joiner")
+			test_ultra_joiner(&data, false, false, false);
 	}
 
 	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
 		     "when the pipe is active with a big joiner modeset");
 	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
-		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner output not found\n");
-		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
+		require_joiners(&data, BIG_JOINER);
 		if (data.big_joiner_output_count >= 1)
 			igt_dynamic_f("big_joiner_on_last_pipe")
 				test_joiner_on_last_pipe(&data, false);
@@ -669,9 +701,7 @@ igt_main
 	igt_describe("Verify if the modeset on the other pipes are rejected "
 		     "when the pipe A is active with a ultra joiner modeset");
 	igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
-		igt_require_f(data.ultra_joiner_output_count > 0, "Ultra joiner output not found\n");
-		igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are required\n");
-
+		require_joiners(&data, ULTRA_JOINER);
 		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
 			test_ultra_joiner(&data, true, false, false);
 		if (data.non_ultra_joiner_output_count > 0) {
@@ -682,10 +712,7 @@ igt_main
 
 	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
 	igt_subtest_with_dynamic("basic-force-big-joiner") {
-		igt_require_f(data.non_big_joiner_output_count > 0,
-			      "No non big joiner output found\n");
-		igt_require_f(data.n_pipes > 1,
-			      "Minimum 2 pipes required\n");
+		require_joiners(&data, FORCE_BIG_JOINER);
 		igt_dynamic_f("single") {
 			enable_force_joiner_on_all_non_big_joiner_outputs(&data);
 			test_single_joiner(&data, data.non_big_joiner_output_count, true);
@@ -701,10 +728,7 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
-		igt_require_f(data.non_big_joiner_output_count > 0,
-			      "Non big joiner output not found\n");
-		igt_require_f(data.n_pipes > 1,
-			      "Minimum of 2 pipes are required\n");
+		require_joiners(&data, FORCE_BIG_JOINER);
 		if (data.non_big_joiner_output_count >= 1) {
 			igt_dynamic_f("big_joiner_on_last_pipe") {
 				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
@@ -723,12 +747,7 @@ igt_main
 
 	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
 	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
-		igt_require_f(ultra_joiner_supported,
-			      "Ultra joiner not supported on this platform\n");
-		igt_require_f(data.non_ultra_joiner_output_count > 0,
-			      "No non ultra joiner output found\n");
-		igt_require_f(data.n_pipes > 3,
-			      "Minimum 4 pipes required\n");
+		require_joiners(&data, FORCE_ULTRA_JOINER);
 		igt_dynamic_f("single") {
 			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
 			test_ultra_joiner(&data, false, false, true);
-- 
2.43.0

