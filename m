Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B68210F995C
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 18:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230BC10E6B9;
	Wed,  8 Apr 2026 18:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fVBmXM4c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC1B10E6B9
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 18:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775671369; x=1807207369;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CDfOPrb3e6t4GMNu1JrXu38EM+e2N1PGDUS2vIoRFsg=;
 b=fVBmXM4c69s3lCbLsKnLJfvfL23+46sONkiZhr5VPYBW5qQxvrq7ogxn
 JetqDuF+PU6HszG1m9amG2esedfSMwgqEVRO//ZJaFiz/Ld8dULUZa7cG
 vW69S20Jfx6hW79LGDHpV5sr+sM+FPoePzTLQVdxhZvg8sQE04M5i1x/W
 bv2UVhwqFTh25d5I9T5mzG8C+8khY/GdYKtt7uEfFgxGvMiUrkny+kOIB
 SefSYIo/dxWTjQohTpVgbM1GLYpJr5mO+Xl0TBhR6GU3h3YKe7T1c4B1w
 bmfkHg/oHOJOo7+zcCZLZnWLDS4efucLhDSisWej5/TKTPjj9q7A2X0d9 w==;
X-CSE-ConnectionGUID: XhKmJGnMRv+wNmRVjsbIRg==
X-CSE-MsgGUID: XP7VBABXSbWCckF9Ki2bfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="80526474"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="80526474"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 11:02:48 -0700
X-CSE-ConnectionGUID: oE0sUhinQW+rImsTbclhoA==
X-CSE-MsgGUID: F4n/km8iSBu8rBWxSz3Qmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="258975757"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 11:02:46 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t,
 v2] tests/intel/kms_cdclk: Skip CDCLK bump validation on eDP with
 fixed clock modes
Date: Wed,  8 Apr 2026 23:41:26 +0530
Message-Id: <20260408181126.997093-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

eDP panels may expose modes with the same resolution and pixel clock
but different vtotal. Since only the vblank region differs, the CDCLK
requirement remains identical across such modes, so no CDCLK bump is
expected.

Skip CDCLK bump validation on eDP connectors where modes share the
same hdisplay, vdisplay and clock but vary only in vtotal.

Suggested-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_cdclk.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 20b8a5f0a..a015afa29 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -72,6 +72,24 @@ static bool hardware_supported(data_t *data)
 	return false;
 }
 
+static bool edp_has_fixed_clock_modes(igt_output_t *output)
+{
+	drmModeConnector *connector = output->config.connector;
+
+	if (connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+		return false;
+
+	for (int i = 0; i < connector->count_modes; i++)
+		for (int j = i + 1; j < connector->count_modes; j++)
+			if (connector->modes[i].hdisplay == connector->modes[j].hdisplay &&
+			    connector->modes[i].vdisplay == connector->modes[j].vdisplay &&
+			    connector->modes[i].clock == connector->modes[j].clock &&
+			    connector->modes[i].vtotal != connector->modes[j].vtotal)
+				return true;
+
+	return false;
+}
+
 static __u64 get_mode_data_rate(drmModeModeInfo *mode)
 {
 	__u64 data_rate = (__u64)mode->hdisplay * (__u64)mode->vdisplay * (__u64)mode->vrefresh;
@@ -329,6 +347,20 @@ static void run_cdclk_test(data_t *data, uint32_t flags)
 	igt_crtc_t *crtc;
 
 	for_each_crtc_with_valid_output(display, crtc, output) {
+		/*
+		 * eDP panels may expose modes with the same resolution and
+		 * pixel clock but different vtotal. Since only the vblank
+		 * region differs, the CDCLK requirement remains identical
+		 * across such modes, so no CDCLK bump is expected and
+		 * validating it would lead to false failures.
+		 */
+		if ((flags & TEST_MODETRANSITION) &&
+		    edp_has_fixed_clock_modes(output)) {
+			igt_info("Skipping %s: eDP has modes with same clock "
+				 "but different vtotal\n", output->name);
+			continue;
+		}
+
 		igt_output_set_crtc(output,
 				    crtc);
 		if (!intel_pipe_output_combo_valid(display)) {
-- 
2.25.1

