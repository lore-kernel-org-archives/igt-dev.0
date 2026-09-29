Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F66CA5FA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 09:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F114D10EDBB;
	Tue, 29 Sep 2026 09:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nvjl4S5D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF1B10EDB8
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 09:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790672712; x=1822208712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RzYB5Oavy5TeEsBtNs0mQboLrF3klQrJVAJPTO7/bEw=;
 b=nvjl4S5DR8avxfo95hSKrLqi/o+jQg9CuaLq3AHFtGFZwJJExTe57Lfx
 vD5i2LjqFjvlj5ip+1np1E5nlMvBJFieAVbwLZfI4TjIJGJBogBCvsADz
 k96iIjA7CEWu6PmYRzClDflgGC6zVCMYaMZz5Dw+Vbs10pimUktGcracW
 2GZKSpp17zIYL/WOEv0fOPLQscsxqwXSnnsPB3hQbN5CKn3Egd4HtUYLe
 nkuxFlMiTEKbUHM7djAquXq5HnuIUxsNxjUUazPUYzSWke6YhFY5W5yVn
 TPS0CCQ2Wc1Ggh0qSFfmbuJKgbdP7YoL5ltnK9ER9KzbEysshl1MP2SYH Q==;
X-CSE-ConnectionGUID: 1o1Io7wVRZyBdE6Xlm0pBA==
X-CSE-MsgGUID: ZmTAHwJoSxyQblj6IW8yUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91483791"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="91483791"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:05:12 -0700
X-CSE-ConnectionGUID: aNoWI1VDQnGSuyXD7w9HrA==
X-CSE-MsgGUID: 0sCewqIbSoWjMY64lj/D1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="275462966"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:05:10 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 3/5] tests/intel/kms_alpm: add ALPM test harness
Date: Tue, 29 Sep 2026 14:34:48 +0530
Message-ID: <20260929090454.2796967-4-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929090454.2796967-1-sowmiya.s@intel.com>
References: <20260929090454.2796967-1-sowmiya.s@intel.com>
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

Add test_setup()/test_cleanup(), which light up the output under test
with a pattern FB and tear it back down, and run_test(), the
igt_dynamic_f() harness that enumerates ALPM-capable outputs and CRTC
pairings and drives a subtest's test function over them. Used by the
ALPM subtests added in the following patches.

require_alpm_capable() is now called from run_test(), so it no longer
needs the __maybe_unused marker from the previous patch. test_setup()
and run_test() itself have no caller yet at this point, so they are
marked __maybe_unused until the subtests added in the following
patches call them.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Assisted-by: Gnai_Claude:sonnet-5
---
 tests/intel/kms_alpm.c | 81 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_alpm.c b/tests/intel/kms_alpm.c
index dfdccd74e..b38e7f8ce 100644
--- a/tests/intel/kms_alpm.c
+++ b/tests/intel/kms_alpm.c
@@ -306,6 +306,51 @@ static void alpm_dump_status(int drm_fd, igt_output_t *output)
 		 status.lobf ? "enabled" : "disabled");
 }
 
+/*
+ * Light the output up. ALPM on an idle link is reached via LOBF, which
+ * requires a fixed refresh rate (intel_vrr_is_fixed_rr()), so the mode is
+ * committed without ever setting VRR_ENABLED; the driver still runs the VRR
+ * timing generator on the platforms that support ALPM.
+ */
+__maybe_unused
+static void test_setup(data_t *data)
+{
+	igt_output_t *output = data->output;
+	drmModeModeInfo *mode;
+	igt_plane_t *primary;
+
+	igt_output_set_crtc(output, data->crtc);
+
+	mode = igt_output_get_mode(output);
+	igt_assert(mode);
+
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+	igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			      &data->fb);
+	igt_plane_set_fb(primary, &data->fb);
+
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
+static void test_cleanup(data_t *data)
+{
+	igt_output_t *output = data->output;
+	igt_plane_t *primary;
+
+	/* Clear any output mode override left behind by the mode under test. */
+	igt_output_override_mode(output, NULL);
+
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_crtc(output, NULL);
+
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	igt_remove_fb(data->drm_fd, &data->fb);
+}
+
 /*
  * Preconditions shared by every subtest that expects ALPM to actually engage.
  *
@@ -319,7 +364,6 @@ static void alpm_dump_status(int drm_fd, igt_output_t *output)
  * skips. A sink that can't actually support it is instead caught indirectly,
  * by the subtest's own post-modeset wait for ALPM/Panel Replay/LOBF failing.
  */
-__maybe_unused
 static void require_alpm_capable(data_t *data, igt_output_t *output)
 {
 	unsigned int ver = intel_display_ver(data->devid);
@@ -354,6 +398,41 @@ static void require_no_audio(data_t *data, igt_output_t *output)
 		      output->name);
 }
 
+__maybe_unused
+static void run_test(data_t *data, void (*test)(data_t *))
+{
+	igt_output_t *output;
+
+	for_each_connected_output(&data->display, output) {
+		igt_crtc_t *crtc;
+
+		if (!output_is_alpm_capable_type(output))
+			continue;
+
+		for_each_crtc(&data->display, crtc) {
+			igt_display_reset(&data->display);
+			igt_output_set_crtc(output, crtc);
+
+			if (!intel_pipe_output_combo_valid(&data->display)) {
+				igt_output_set_crtc(output, NULL);
+				continue;
+			}
+
+			data->output = output;
+			data->crtc = crtc;
+
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      output->name) {
+				require_alpm_capable(data, output);
+				test(data);
+			}
+
+			test_cleanup(data);
+			break;
+		}
+	}
+}
+
 int igt_main()
 {
 	data_t data = {};
-- 
2.43.0

