Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E24CD8CB9
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 09:26:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953BC10E83B;
	Wed, 10 Jun 2026 09:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KoXLyB+h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8145710E83A
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 09:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781083536; x=1812619536;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZfjdZZp5j4K2ogZZmyWhwCvP07JT4laJf3rl5/R0YVA=;
 b=KoXLyB+huK/1NAO50VhFwpngTjPlm2DGnW/D+UoGZvoJ3dGyrZUrCMhL
 761iI4t7Z66K8cMyjM7xht2P1D1rsDqf8go4LJAvZTb2RgiDNbg8YVHtv
 H1o7rdTAIk4yOyJaherw//vqxmJYbkdXbYA9Au6Dp0E6GwJFoVkGr5pqC
 urrYrFBc7r2yjKlOOfEiDWzlS3NL3CnOuiB9+rqGPGQ9QpekRObOnWHls
 9E57H2D9n8ytI2xvBuFJyi1kaR3al+vr5t/Jbbr+q6SH23HGBoEuWe5FS
 3HwQ2df0SpsHRPUxT25Z94Z2QOAkwzTvTz+XX8IghJecwD/ERiNi+F9Cw w==;
X-CSE-ConnectionGUID: rmle3hNNRPu8eO3ysxnd5w==
X-CSE-MsgGUID: PmQ7ABiETVCgCh/LcsfVFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81849595"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81849595"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 02:25:36 -0700
X-CSE-ConnectionGUID: s1YJMKzBSF6HvYYQfnQb3w==
X-CSE-MsgGUID: Nd01NP2USQWS2JxiXoDLvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="243653716"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 02:25:35 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_concurrent: Skip mode_lo if it requires
 bigjoiner
Date: Wed, 10 Jun 2026 15:17:09 +0530
Message-ID: <20260610094710.3410268-1-sowmiya.s@intel.com>
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

get_lowres_mode() may return a high-refresh mode
(e.g. 1080p@480Hz) that requires bigjoiner, while
the preferred mode (e.g. 2560x1440@60Hz) does not.
Committing such a mode on pipe-D (last pipe, no pipe-E)
causes a hard test failure. Fix this by calling
igt_check_bigjoiner_support() after setting the
mode_lo override, and skipping the iteration if
the pipe cannot satisfy it.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_concurrent.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 158a13923..10e6b06ef 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -296,6 +296,16 @@ test_resolution_with_output(data_t *data, igt_crtc_t *crtc, int max_planes,
 		/* switch to lower resolution */
 		igt_output_override_mode(output, mode_lo);
 		free(mode_lo);
+		/*
+		 * If mode_lo requires bigjoiner support that this pipe cannot
+		 * satisfy (e.g. a high-refresh mode on pipe-D with no pipe-E
+		 * available), skip this iteration.
+		 */
+		if (!igt_check_bigjoiner_support(&data->display)) {
+			igt_output_override_mode(output, NULL);
+			i++;
+			continue;
+		}
 		if (is_amdgpu_device(data->drm_fd))
 			igt_output_set_crtc(output, NULL);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
-- 
2.43.0

