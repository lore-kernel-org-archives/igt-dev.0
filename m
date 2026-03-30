Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD22FF492D
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 03:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEA010E0FF;
	Mon, 30 Mar 2026 03:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Gm2XNQ8P";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260BB10E0DD
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 03:22:13 +0000 (UTC)
X-UUID: a199c3fa2be711f19a16598d5ca7f8ec-20260330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8e9VxII5Hf/uDmQhSL8I/87Pd0sQjw1QxPDv/F4jvGA=; 
 b=Gm2XNQ8Pgz0qofu6rp8/bkQv7W19sAMya+F0NJCIJe3JG0qH+r9xdAdw0Bo6NiPNAaaDB1nhhf6cTcccfD4B04HrJYl+drQ3NZMw9hwrtZj7/iTTgMPkMa0of33n9IQ0HETv7/f5Pz+E7NGOjOaFzG3asJ+waLGBk2EurDszPvs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:417bd383-1e28-4227-806f-024e1b1f6815, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:e7bac3a, CLOUDID:83e35994-f8ef-4ca8-bea0-143568f9ca1d,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
 0|15|50,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:
 0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a199c3fa2be711f19a16598d5ca7f8ec-20260330
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1855705765; Mon, 30 Mar 2026 11:22:07 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 30 Mar 2026 11:22:06 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 30 Mar 2026 11:22:06 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>,
 Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t v5 2/3] tests/kms_content_protection: Pass crtc
 parameter and use per-CRTC FBs
Date: Mon, 30 Mar 2026 11:20:40 +0800
Message-ID: <20260330032205.467130-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260330032205.467130-1-jason-jh.lin@mediatek.com>
References: <20260330032205.467130-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
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

Refactor functions to accept crtc parameter and use per-CRTC
framebuffers (data.fbs[crtc->crtc_index]).

Modified: modeset_with_fb(), test_cp_enable/disable(),
test_cp_enable_with_retry(), test_mst_cp_disable(),
prepare_modeset_on_mst_output(), test_fini(),
test_content_protection_cleanup().

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 tests/kms_content_protection.c | 74 ++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 31 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index df9ff5efcaa2..b302d4cfd47d 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -263,7 +263,7 @@ commit_display_and_wait_for_flip(enum igt_commit_style commit_style)
 	}
 }
 
-static void modeset_with_fb(igt_output_t *output,
+static void modeset_with_fb(igt_output_t *output, igt_crtc_t *crtc,
 			    enum igt_commit_style commit_style)
 {
 	igt_display_t *display = &data.display;
@@ -273,18 +273,19 @@ static void modeset_with_fb(igt_output_t *output,
 	mode = igt_output_get_mode(output);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	igt_plane_set_fb(primary, &data.red);
-	igt_fb_set_size(&data.red, primary, mode->hdisplay, mode->vdisplay);
+	igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].red);
+	igt_fb_set_size(&data.fbs[crtc->crtc_index].red, primary, mode->hdisplay, mode->vdisplay);
 
 	igt_display_commit2(display, commit_style);
 
-	igt_plane_set_fb(primary, &data.green);
+	igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].green);
 
 	/* Wait for Flip completion before starting the HDCP authentication */
 	commit_display_and_wait_for_flip(commit_style);
 }
 
-static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_style,
+static bool test_cp_enable(igt_output_t *output, igt_crtc_t *crtc,
+			   enum igt_commit_style commit_style,
 			   int content_type, bool type_change)
 {
 	igt_display_t *display = &data.display;
@@ -307,7 +308,7 @@ static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_st
 	ret = wait_for_prop_value(output, CP_ENABLED,
 				  KERNEL_AUTH_TIME_ALLOWED_MSEC);
 	if (ret) {
-		igt_plane_set_fb(primary, &data.green);
+		igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].green);
 		igt_display_commit2(display, commit_style);
 	}
 
@@ -320,13 +321,15 @@ static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[],
 {
 	igt_display_t *display = &data.display;
 	igt_plane_t *primary;
+	igt_crtc_t *crtc;
 	bool ret;
 	int count;
 	u64 val;
 
 	for (count = 0; count < valid_outputs; count++) {
+		crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
 		primary = igt_output_get_plane_type(hdcp_mst_output[count], DRM_PLANE_TYPE_PRIMARY);
-		igt_plane_set_fb(primary, &data.red);
+		igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].red);
 		igt_output_set_prop_value(hdcp_mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION,
 					  CP_UNDESIRED);
 	}
@@ -344,7 +347,8 @@ static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[],
 	igt_assert_f(ret, "Content Protection not cleared on all MST outputs\n");
 }
 
-static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_style)
+static void test_cp_disable(igt_output_t *output, igt_crtc_t *crtc,
+			    enum igt_commit_style commit_style)
 {
 	igt_display_t *display = &data.display;
 	igt_plane_t *primary;
@@ -358,7 +362,7 @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_s
 	 */
 	igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION,
 				  CP_UNDESIRED);
-	igt_plane_set_fb(primary, &data.red);
+	igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].red);
 	igt_display_commit2(display, commit_style);
 
 	/* Wait for HDCP to be disabled, before crtc off */
@@ -367,7 +371,7 @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_s
 	igt_assert_f(ret, "Content Protection not cleared\n");
 }
 
-static void test_cp_enable_with_retry(igt_output_t *output,
+static void test_cp_enable_with_retry(igt_output_t *output, igt_crtc_t *crtc,
 				      enum igt_commit_style commit_style,
 				      int retry, int content_type,
 				      bool expect_failure,
@@ -378,16 +382,16 @@ static void test_cp_enable_with_retry(igt_output_t *output,
 
 	do {
 		if (!type_change || retry_orig != retry)
-			test_cp_disable(output, commit_style);
+			test_cp_disable(output, crtc, commit_style);
 
-		ret = test_cp_enable(output, commit_style, content_type, type_change);
+		ret = test_cp_enable(output, crtc, commit_style, content_type, type_change);
 
 		if (!ret && --retry)
 			igt_debug("Retry (%d/2) ...\n", 3 - retry);
 	} while (retry && !ret);
 
 	if (!ret)
-		test_cp_disable(output, commit_style);
+		test_cp_disable(output, crtc, commit_style);
 
 	if (expect_failure)
 		igt_assert_f(!ret,
@@ -457,16 +461,16 @@ static void test_content_protection_on_output(igt_output_t *output,
 	igt_display_t *display = &data.display;
 	bool ret;
 
-	test_cp_enable_with_retry(output, commit_style, 3, content_type, false,
+	test_cp_enable_with_retry(output, crtc, commit_style, 3, content_type, false,
 				  false);
 
 	if (data.cp_tests & CP_TYPE_CHANGE) {
 		/* Type 1 -> Type 0 */
-		test_cp_enable_with_retry(output, commit_style, 3,
+		test_cp_enable_with_retry(output, crtc, commit_style, 3,
 					  HDCP_CONTENT_TYPE_0, false,
 					  true);
 		/* Type 0 -> Type 1 */
-		test_cp_enable_with_retry(output, commit_style, 3,
+		test_cp_enable_with_retry(output, crtc, commit_style, 3,
 					  content_type, false,
 					  true);
 	}
@@ -476,14 +480,14 @@ static void test_content_protection_on_output(igt_output_t *output,
 			     "mei_hdcp unload failed");
 
 		/* Expected to fail */
-		test_cp_enable_with_retry(output, commit_style, 3,
+		test_cp_enable_with_retry(output, crtc, commit_style, 3,
 					  content_type, true, false);
 
 		igt_assert_f(!igt_kmod_load("mei_hdcp", NULL),
 			     "mei_hdcp load failed");
 
 		/* Expected to pass */
-		test_cp_enable_with_retry(output, commit_style, 3,
+		test_cp_enable_with_retry(output, crtc, commit_style, 3,
 					  content_type, false, false);
 	}
 
@@ -502,7 +506,7 @@ static void test_content_protection_on_output(igt_output_t *output,
 		ret = wait_for_prop_value(output, CP_ENABLED,
 					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
 		if (!ret)
-			test_cp_enable_with_retry(output, commit_style, 2,
+			test_cp_enable_with_retry(output, crtc, commit_style, 2,
 						  content_type, false,
 						  false);
 	}
@@ -513,7 +517,7 @@ static void test_content_protection_on_output(igt_output_t *output,
 		ret = wait_for_prop_value(output, CP_ENABLED,
 					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
 		if (!ret)
-			test_cp_enable_with_retry(output, commit_style, 2,
+			test_cp_enable_with_retry(output, crtc, commit_style, 2,
 						  content_type, false,
 						  false);
 	}
@@ -583,21 +587,24 @@ static bool sink_hdcp2_capable(igt_output_t *output)
 	return strstr(buf, "HDCP2.2");
 }
 
-static void prepare_modeset_on_mst_output(igt_output_t *output, bool is_enabled)
+static void prepare_modeset_on_mst_output(igt_output_t *output, igt_crtc_t *crtc, bool is_enabled)
 {
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	int width, height;
+	struct igt_fb *fb;
 
 	mode = igt_output_get_mode(output);
 
 	width = mode->hdisplay;
 	height = mode->vdisplay;
 
+	fb = is_enabled ? &data.fbs[crtc->crtc_index].green : &data.fbs[crtc->crtc_index].red;
+
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
-	igt_plane_set_fb(primary, is_enabled ? &data.green : &data.red);
-	igt_fb_set_size(is_enabled ? &data.green : &data.red, primary, width, height);
+	igt_plane_set_fb(primary, fb);
+	igt_fb_set_size(fb, primary, width, height);
 	igt_plane_set_size(primary, width, height);
 }
 
@@ -669,11 +676,11 @@ static void reset_i915_force_hdcp14(igt_output_t *output)
 }
 
 static void
-test_fini(igt_output_t *output, enum igt_commit_style commit_style)
+test_fini(igt_output_t *output, igt_crtc_t *crtc, enum igt_commit_style commit_style)
 {
 	igt_plane_t *primary;
 
-	test_cp_disable(output, commit_style);
+	test_cp_disable(output, crtc, commit_style);
 	primary = igt_output_get_plane_type(output,
 					    DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
@@ -769,7 +776,7 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 			if (!intel_pipe_output_combo_valid(display))
 				continue;
 
-			modeset_with_fb(output, commit_style);
+			modeset_with_fb(output, crtc, commit_style);
 			if (data.is_force_hdcp14)
 				set_i915_force_hdcp14(output);
 
@@ -783,7 +790,7 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 			if (data.is_force_hdcp14)
 				reset_i915_force_hdcp14(output);
 
-			test_fini(output, commit_style);
+			test_fini(output, crtc, commit_style);
 			/*
 			 * Testing a output with a pipe is enough for HDCP
 			 * testing. No ROI in testing the connector with other
@@ -876,8 +883,11 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs
 		if (!ret || retries)
 			igt_debug("Retry %d/3\n", 3 - retries);
 
-		for (i = 0; i < valid_outputs; i++)
-			prepare_modeset_on_mst_output(hdcp_mst_output[i], ret);
+		for (i = 0; i < valid_outputs; i++) {
+			igt_crtc_t *crtc = igt_output_get_driving_crtc(hdcp_mst_output[i]);
+
+			prepare_modeset_on_mst_output(hdcp_mst_output[i], crtc, ret);
+		}
 
 		igt_display_commit2(display, COMMIT_ATOMIC);
 	} while (retries && !ret);
@@ -919,7 +929,7 @@ test_content_protection_mst(int content_type)
 		igt_assert_f(pipe_found, "No valid pipe found for %s\n", output->name);
 
 		igt_output_set_crtc(output, crtc);
-		prepare_modeset_on_mst_output(output, false);
+		prepare_modeset_on_mst_output(output, crtc, false);
 		dp_mst_outputs++;
 		if (output_hdcp_capable(output, content_type))
 			hdcp_mst_output[valid_outputs++] = output;
@@ -982,6 +992,7 @@ static void test_content_protection_cleanup(void)
 {
 	igt_display_t *display = &data.display;
 	igt_output_t *output;
+	igt_crtc_t *crtc;
 	uint64_t val;
 
 	for_each_connected_output(display, output) {
@@ -994,7 +1005,8 @@ static void test_content_protection_cleanup(void)
 			continue;
 
 		igt_info("CP Prop being UNDESIRED on %s\n", output->name);
-		test_cp_disable(output, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+		crtc = igt_output_get_driving_crtc(output);
+		test_cp_disable(output, crtc, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	}
 }
 
-- 
2.43.0

