Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A65F53D8B
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 18:51:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1205710E34E;
	Mon, 16 Mar 2026 18:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="biASa7A1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D3610E34A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 18:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773687100; x=1805223100;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X1Gs6BK+R0zefCkp7Oe6DPvr4thG1T030pyt1KS4bDo=;
 b=biASa7A14qm/dfOqKG3TSzF8AEVtg2qFRiQ8OVIuRZa4IFemnepSEZME
 6G53XyythvK+yZ7dJj1jtk9+ThdF6g/G6+2LXUHSWXCoJ/EqHEq9Q/QxF
 IkthFTmT1DOJBw5DpoI0FUI/slri9p7emZXESq48jX70ovHT/9cS08W/U
 Opdey16nanLi8/RPNWsJbzwJRoPQJESBk/5akph/QP1KPvCgKGAyRxsBH
 c8rRu4QDwB4v8thVAWex5G4PWf7A3/4vPDIMiGbZuD6dTlH30s3dD1MSO
 TPqC0KZcVf1A4X5Uw6aFRGBa4UgD8X8+C0MUvMmL+XFTZVJHzaJYzK2Ls g==;
X-CSE-ConnectionGUID: y0NTKikjQHqaRKUoeKIGrA==
X-CSE-MsgGUID: D+KKwGolTci9++42T8hchQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="97322519"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="97322519"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 11:51:39 -0700
X-CSE-ConnectionGUID: snb33bz1SPaS2m8+GEW7sw==
X-CSE-MsgGUID: iyIi1FCiTYmAIbEcy4nhxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="222222418"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 11:51:37 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_plane_scaling: Use selective modes for
 scaling checks
Date: Tue, 17 Mar 2026 00:22:18 +0530
Message-ID: <20260316185218.700329-1-ramanaidu.naladala@intel.com>
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

Update the scaling test to try only three representative modes:
the first, one from the middle, and the last. This decreases test
runtime while maintaining adequate coverage.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index ab619fb2b..33546d5bf 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -584,9 +584,15 @@ check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 	int commit_ret;
 	int w, h;
 	int width, height;
+	uint32_t mod_count = output->config.connector->count_modes;
+	uint32_t index[3] = {0, mod_count/2, mod_count - 1};
 
-	for_each_connector_mode(output) {
-		mode = &output->config.connector->modes[j__];
+	for (int j = 0; j < 3; j++) {
+
+		if ((mod_count <= 2) && (j > 1))
+			break;
+
+		mode = &output->config.connector->modes[index[j]];
 		igt_output_override_mode(output, mode);
 		igt_debug("Trying mode %dx%d\n",
 			  mode->hdisplay, mode->vdisplay);
-- 
2.43.0

