Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF53EC143C
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 13:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55C110E10B;
	Tue,  3 Mar 2026 13:26:24 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D807910E10B
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 13:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772544378; x=1804080378;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lvkaAn2viwfqGSKnjNNlqQuC3roM5/8VcPMG/vX/XIc=;
 b=QkyzsfP7T/SQR7PiZ5jEZr7TDH48YYClyp58IxtlHJovIKYAFECSxPvp
 bpoDF6BlcSJCGi592ZpnbrNleaPisUG6AcV6IcQGMRwDNTBHpF8165+Qc
 hyyV8PLwGLEvP8aafU1wQj6j9F3B3vD+866tJB36Y6nWZTpAu1OXCkJ5N
 hT20PpEm1zmc+zK2K/qOqYSdvU8xEO0W1yOqpN4sLjdMSrI+93fp9zxGe
 N+UpnTWgLQMh8g/Pfgmk5LvphQH/WSYG1z9pbH65KCayP1Y+gk9+O/Zt9
 0Fh5V0H/GPNRVd3HNocWSbW9Vqx1Q1o95d9vloFqxDsociKS2IBKorBTl Q==;
X-CSE-ConnectionGUID: vGincDjbSECVTpc/ytMApg==
X-CSE-MsgGUID: XwD9dd35Qxy4yJcFVQWJBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="99053650"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="99053650"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:24:10 -0800
X-CSE-ConnectionGUID: 7ar5Rr4vSmiHBqxBOv5Jhw==
X-CSE-MsgGUID: Bz0kz5K4RSCQN5m9v9FXiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="218110905"
Received: from skishor1-nuc12snki73.iind.intel.com ([10.227.88.189])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:24:06 -0800
From: sumit kishore <sumit.kishore@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	sumit kishore <sumit.kishore@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_plane_alpha_blend : print reason for test
 skips
Date: Tue,  3 Mar 2026 18:53:13 +0530
Message-ID: <20260303132313.225994-1-sumit.kishore@intel.com>
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

Print debug message when tests are skipping on headless display systems

Signed-off-by: sumit kishore <sumit.kishore@intel.com>
---
 tests/kms_plane_alpha_blend.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 41a3b71c3..82d8eac62 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -753,9 +753,11 @@ const char *help_str =
 int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	data_t data = {};
+	bool active_display = false;
 
 	igt_fixture() {
 		igt_crtc_t *crtc;
+		igt_output_t *output;
 
 		last_pipe = 0;
 
@@ -764,6 +766,13 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		igt_display_require(&data.display, data.gfx_fd);
 		igt_require(data.display.is_atomic);
 
+		/* Check if at least one active display connected */
+		for_each_connected_output(&data.display, output) {
+			active_display = true;
+			break;
+		}
+		igt_require_f(active_display, "No active display connected, skipping test\n");
+
 		/* Get active pipes. */
 		for_each_crtc(&data.display, crtc)
 			active_pipes[last_pipe++] = crtc->pipe;
-- 
2.43.0

