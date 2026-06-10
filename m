Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC55CD8CB2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 10:50:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003FF10E59E;
	Wed, 10 Jun 2026 10:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cou6ydDq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B01810E5C3
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 10:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781088627; x=1812624627;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GyCS3H8/R//hBm0fKZ80XxDstWfjtcwF+B2MmO8qagY=;
 b=cou6ydDqJbJyjOUiGljBMLFDQNFhMRWgW7bsflpJgTtxt6Y35/hYilRI
 I8ENVNXSr1ygofDWSpX7uBo+JPevAnl1eH8sjMuaXYRs+7Q7D6Q058txk
 TAZlsXqs+d9PuGjFDqSpkPm/9U/nepkvIrw5cG9jRCeLcxJGBC3lPB5kR
 9iEjePrNopP4pbxplSzdjUGD0d/Si/rL+tLBq9yI89zazQ2MB8GEzfbVt
 5pDk2+aHw2W2FebVFb6S9vDBctNRlD9egod1RnQDjdQMrVUEC6xf8qZ2u
 6sxPiPQDYtjPlU5Gv6J8/iPkoHkw/4u0wA9y9DdcyTE/OM0GOzVgBvMnO A==;
X-CSE-ConnectionGUID: Z3vFh+6uTZyAQSRGMlXO5w==
X-CSE-MsgGUID: x/cXMmvuRwOt73NxEtb9ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84446882"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="84446882"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 03:50:26 -0700
X-CSE-ConnectionGUID: DpV2DzKGT4uWHmIpG+DW5g==
X-CSE-MsgGUID: ZgAMwClmRqaJ/mpDIOD3CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="284215913"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 03:50:25 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_concurrent: Skip mode_lo if it requires
 bigjoiner
Date: Wed, 10 Jun 2026 16:42:07 +0530
Message-ID: <20260610111207.3423966-1-sowmiya.s@intel.com>
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
mode_lo override, and skipping the subtest if
the pipe cannot satisfy it.

v2: Add intel checks for joiner function (Karthik)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_concurrent.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 158a13923..6fb366625 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -296,6 +296,17 @@ test_resolution_with_output(data_t *data, igt_crtc_t *crtc, int max_planes,
 		/* switch to lower resolution */
 		igt_output_override_mode(output, mode_lo);
 		free(mode_lo);
+
+		/*
+		 * If mode_lo requires bigjoiner support that this pipe cannot
+		 * satisfy (e.g. a high-refresh mode on pipe-D with no pipe-E
+		 * available), skip the subtest.
+		 */
+		igt_skip_on_f(is_intel_device(data->drm_fd) &&
+			      !igt_check_bigjoiner_support(&data->display),
+			      "Skipping pipe-%s: mode_lo does not satisfy bigjoiner requirements\n",
+			      igt_crtc_name(crtc));
+
 		if (is_amdgpu_device(data->drm_fd))
 			igt_output_set_crtc(output, NULL);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
-- 
2.43.0

