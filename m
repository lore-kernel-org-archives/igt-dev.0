Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92412C5CFDB
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 07:57:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219E310F1D9;
	Thu, 13 Aug 2026 07:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iBF/n2wH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D0110F1D9
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 07:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786607784; x=1818143784;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=knzjQ6d/U+XAN1gakR1nicKJH0+TGmHQnhRBO+a2ynI=;
 b=iBF/n2wHcG+1ol0Ft52t2io3Innd74KlTp1NWrgGg6uY7Jb2JwpKA6l6
 ijCUsO6OvDeGVglyi0szkxnzOOCkZOVkOm2X2Z6C5LEnWdoOQL8lPEhSJ
 GXUi7b1wah53UxtPFJ6ETZSXoFmUFapIJQrzCUDvcUsrbcV/SLviyndgq
 TgDu3gX1D4UJMo4wpnlIFpKorBcrvcahr6amZ+EWRUGG38g6LJdpm4GX0
 15yvgPT3KXuWNyy1CKSWCPHzECcTcn/0xVPYzXhNfA30pEEffxHihS/wA
 DIqCXBcJ19+TtnTsSZNTX1fOD/jCO2iOmlerTr3Fgk2iV/mW8V8wQ/yhO A==;
X-CSE-ConnectionGUID: NY1UC+WkSPegVGxN8VQy4w==
X-CSE-MsgGUID: alGPRUqNTH2rRbuPgOuK3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87299912"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="87299912"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 00:56:24 -0700
X-CSE-ConnectionGUID: yaOmYAPkRQ64d8Sm1DPi+g==
X-CSE-MsgGUID: idhbiBeIQ260QbgCLswWmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="261251359"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 00:56:22 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com, ankit.k.nautiyal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/intel/kms_joiner: vblank test for joiner
 secondary crtc
Date: Thu, 13 Aug 2026 13:24:09 +0530
Message-ID: <20260813075409.57087-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.43.0
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

In joiner mode, add new subtests to validate vblank events are delivered
on secondary crtc.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_joiner.c | 94 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index dfcb24004..ff33256a3 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -76,6 +76,10 @@
  * SUBTEST: basic-max-non-joiner
  * Description: Validate basic max non-joiner modeset by selecting the max mode
  *		supported on single pipe.
+ *
+ * SUBTEST: vblank-joiner-secondary
+ * Description: Verify that vblank interrupts are generated on all pipes in a
+ *		joiner configuration including the secondary pipe.
  */
 IGT_TEST_DESCRIPTION("Test joiner / force joiner");
 
@@ -275,6 +279,74 @@ static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *o
 	}
 }
 
+static void test_joiner_vblank(data_t *data, bool force_joiner)
+{
+	int i;
+	enum pipe pipe, master_pipe;
+	uint32_t available_pipe_mask = BIT(data->n_pipes) - 1;
+	igt_output_t *output;
+	igt_plane_t *primary;
+	igt_output_t **outputs;
+	igt_fb_t fb;
+	drmModeModeInfo *mode;
+	int count;
+	drmVBlank wait_vbl;
+	uint32_t pipe_flag;
+
+	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
+	count = force_joiner ? data->non_big_joiner_output_count : data->big_joiner_output_count;
+	igt_display_reset(&data->display);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	for (i = 0; i < count; i++) {
+		output = outputs[i];
+		for (pipe = 0; pipe < data->n_pipes - 1; pipe++) {
+			igt_crtc_t *primary_crtc, *secondary_crtc;
+			int ret;
+
+			master_pipe = setup_pipe(data, output, pipe, available_pipe_mask);
+			if (master_pipe == PIPE_NONE)
+				continue;
+
+			mode = igt_output_get_mode(output);
+			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+					      DRM_FORMAT_XRGB8888,
+					      DRM_FORMAT_MOD_LINEAR, &fb);
+			igt_plane_set_fb(primary, &fb);
+			igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+			primary_crtc = igt_crtc_for_pipe(&data->display, master_pipe);
+			secondary_crtc = igt_crtc_for_pipe(&data->display, master_pipe + 1);
+
+			/* Verify vblank works on the primary joiner pipe */
+			igt_wait_for_vblank(primary_crtc);
+			igt_info("Pipe %s (primary): vblank wait OK\n",
+				 kmstest_pipe_name(master_pipe));
+
+			/* Verify vblank works on the secondary joiner pipe */
+			pipe_flag = kmstest_get_vbl_flag(secondary_crtc->crtc_index);
+			memset(&wait_vbl, 0, sizeof(wait_vbl));
+
+			wait_vbl.request.type = DRM_VBLANK_RELATIVE | pipe_flag;
+			wait_vbl.request.sequence = 1;
+			ret = drmWaitVBlank(data->drm_fd, &wait_vbl);
+
+			igt_assert_f(ret == 0,
+				     "Pipe %s (joiner secondary): vblank wait timed out - "
+				     "no vblank interrupt delivered\n",
+				     kmstest_pipe_name(master_pipe + 1));
+			igt_info("Pipe %s (secondary): vblank wait OK\n",
+				 kmstest_pipe_name(master_pipe + 1));
+
+			igt_plane_set_fb(primary, NULL);
+			igt_output_set_crtc(output, NULL);
+			igt_display_commit2(&data->display, COMMIT_ATOMIC);
+			igt_remove_fb(data->drm_fd, &fb);
+		}
+	}
+}
+
 static void test_single_joiner(data_t *data, int output_count, bool force_joiner)
 {
 	int i;
@@ -836,6 +908,28 @@ int igt_main()
 			test_basic_max_non_joiner(&data);
 	}
 
+	igt_describe("Verify vblank interrupts arrive on joiner secondary pipes");
+	igt_subtest_with_dynamic("vblank-joiner-secondary") {
+		igt_require_f(data.n_pipes >= 2, "Minimum 2 pipes required\n");
+		igt_require_f(data.big_joiner_output_count > 0 ||
+			      data.non_big_joiner_output_count > 0,
+			      "No big joiner or force big joiner output found\n");
+
+		if (data.big_joiner_output_count > 0) {
+			igt_dynamic_f("big-joiner") {
+				test_joiner_vblank(&data, false);
+			}
+		}
+
+		if (data.non_big_joiner_output_count > 0) {
+			igt_dynamic_f("force-big-joiner") {
+				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
+				test_joiner_vblank(&data, true);
+				igt_reset_connectors();
+			}
+		}
+	}
+
 	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.43.0

