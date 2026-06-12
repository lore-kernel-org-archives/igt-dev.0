Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2B8CD98CE
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 11:41:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A113910E9D9;
	Fri, 12 Jun 2026 11:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UEajV5Q5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EA710F496
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 11:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781264459; x=1812800459;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5fUqCZI2oTQ4I3q+gPC4XXY0V+L0snbBuTEKn3yQZv4=;
 b=UEajV5Q5soIps/Dv6adDiHQF1CfJnI5u+6I1f+YK/Jvs6+FJncYGjdQX
 iyi8tlabwpdFo3h1WceLLP+NSxvwGyVYbQD5qslcqGeGhSMFGrIDzDTzE
 Q9WY4CfEOdgKUYtEhqfrZT4kv0SoPYD6vjQRt85m12oo/5dfwp4G6yBRw
 e5q0pDaOlsQr4SXm3G3TPnX3QE8L2YCHrOlwFfA+o/OoDQ1w+AqNExrwl
 AO+mNfEY1CkL93thuW2NmcgqPDfU0q0SF93u1X+d+zI24aQNyQ30MAV4X
 USJlhlkM5M2Cw1eCqVdmO/kPIYBksyLiCs/U3KrwOshwndzgI7WuvUF64 A==;
X-CSE-ConnectionGUID: aJlyWhZFRBKRZWfyeAmEvw==
X-CSE-MsgGUID: 6dWQlSGKR0CYbedu20qAhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85935285"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="85935285"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 04:40:58 -0700
X-CSE-ConnectionGUID: GmabcXxnSCu3abV4t0qR+g==
X-CSE-MsgGUID: nGMxWoaFTdmVL4+jyLV0cQ==
X-ExtLoop1: 1
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 04:40:57 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Skip downscale test
 on first commit failure
Date: Fri, 12 Jun 2026 17:19:54 +0530
Message-Id: <20260612114954.2668076-1-swati2.sharma@intel.com>
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

The first igt_display_commit2() in test_sharpness_filter() can fail
with -ERANGE/-EINVAL for TEST_FILTER_DOWNSCALE because set_planes()
already configured an overlay plane with a 75% downscale before
this commit. On high-resolution panels (e.g. eDP-1 at 2560x1600),
the kernel rejects the scaling operation due to cdclk/scaler limits.

Use igt_display_try_commit2() for the initial commit in the downscale
case and skip gracefully, matching the existing skip logic for the
second commit after the sharpness filter is applied.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 353a9a292..ff7b4540c 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -464,7 +464,14 @@ static void test_sharpness_filter(data_t *data, enum test_type type)
 	 * is enabled and committed, the resulting CRC must differ.
 	 */
 	if (!is_invalid_test(type)) {
-		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		if (type == TEST_FILTER_DOWNSCALE) {
+			ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+			igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
+				      "Scaling op not supported, cdclk limits might be exceeded.\n");
+			igt_assert_eq(ret, 0);
+		} else {
+			igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		}
 		pipe_crc = igt_crtc_crc_new(data->crtc,
 					    IGT_PIPE_CRC_SOURCE_AUTO);
 		igt_pipe_crc_collect_crc(pipe_crc, &no_sharp_crc);
-- 
2.25.1

