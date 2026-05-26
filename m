Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D0ACD5BB4
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 08:29:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A3E10E609;
	Tue, 26 May 2026 08:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zkfi3LPZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BEB10E609
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 08:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779784164; x=1811320164;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XHHcrTtrOi3QGnRce0K5l95oxfIXrCXqPjRaghMVASQ=;
 b=Zkfi3LPZR6X34mdTZ1S2s9ReEWj7l4UZ4d7Cd/NjFWp2CXUN++D/Ip3I
 CyBVUA53aLZ3FwmYoKlEgaANW9PDjIoPUI0yCjVzvCDTp6YBl35emSYMO
 K4djzsKc/h6UDYus5V/T9z8HsPS6WY3pTuLYyM+11PUGitS1ZzjwoFXna
 yIu+yL9gie9GV8h/YH8YuFIwav7RObxluHnn9A4UHXciSJAy+/I5OcNzx
 nDv4jLnktVNoj/a83NVs09Dn+CdaE7YMvusKGIfvFcjJDOs+8YJrW7DwN
 0HbTWgtf08f1ZXdcd2K5j6+jJjvzpf0r/XJZ0EyOVo5pQlR9csrrAIX3x A==;
X-CSE-ConnectionGUID: rwbLHq3bQpKzANqwcUvBHQ==
X-CSE-MsgGUID: 3nyXcB8eSQ6iDCPJHcHitw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80776440"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="80776440"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 01:29:24 -0700
X-CSE-ConnectionGUID: qAKF5ggrT2uYFnm7Z836Nw==
X-CSE-MsgGUID: 9IKSzjoNTXWuIw3WwRWCrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="246944363"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 01:29:22 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_rotation_crc: Remove verbose debug logging
 from rotation paths
Date: Tue, 26 May 2026 13:57:51 +0530
Message-ID: <20260526082751.1852524-1-jeevan.b@intel.com>
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

The multiplane rotation tests were emitting per-iteration debug
output, which can grow logs quickly and hit runner limits.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_rotation_crc.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 4a249ed21..4a7bf3f4d 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -470,8 +470,6 @@ static void test_single_case(data_t *data, igt_crtc_t *crtc,
 	igt_crc_t crc_output;
 	int ret;
 
-	igt_debug("Testing case %i on pipe %s, format %s\n", rect,
-		  igt_crtc_name(crtc), igt_format_str(format));
 	prepare_fbs(data, output, plane, rect, format);
 
 	igt_plane_set_rotation(plane, data->rotation);
@@ -918,7 +916,6 @@ static void test_multi_plane_rotation(data_t *data, igt_crtc_t *crtc)
 	drmModeModeInfo *mode;
 	bool have_crc; // flag if can use previously logged crc for comparison
 	igt_crc_t crclog[16] = {}; //4 * 4 rotation crc storage for packed formats
-	char *str1, *str2; // for debug printouts
 	int logindex;
 
 	static planeconfigs_t planeconfigs[] = {
@@ -1053,20 +1050,6 @@ static void test_multi_plane_rotation(data_t *data, igt_crtc_t *crtc)
 						}
 						igt_pipe_crc_get_for_frame(data->gfx_fd, data->pipe_crc, fliphw, &retcrc_hw);
 
-						str1 = igt_crc_to_string(&retcrc_sw);
-						str2 = igt_crc_to_string(&retcrc_hw);
-
-						igt_debug("crc %.8s vs %.8s -- %.4s - %.4s crc buffered:%s rot1 %d rot2 %d\n",
-							str1, str2,
-							(char *) &multiplaneformatlist[p[0].formatindex],
-							(char *) &multiplaneformatlist[p[1].formatindex],
-							have_crc ? "yes" : " no",
-							(int[]) {0, 90, 180, 270} [ctz(planeconfigs[i].rotation)],
-							(int[]) {0, 90, 180, 270} [ctz(planeconfigs[j].rotation)]);
-
-						free(str1);
-						free(str2);
-
 						igt_assert_crc_equal(&retcrc_sw, &retcrc_hw);
 
 						lastroundjformat = multiplaneformatlist[p[1].formatindex];
-- 
2.43.0

