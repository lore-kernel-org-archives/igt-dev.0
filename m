Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD98FED2D1
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 04:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8010C10E955;
	Thu, 12 Mar 2026 04:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BEON+cBP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612C210E955
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 04:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773290716; x=1804826716;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zx6lOSwc56KSQnTjRrha/cgp4AHc8+7Q5Xx0YU9NAjI=;
 b=BEON+cBPNqcW+KkaZgyLrnMZ537hPuXmLtv536q7+QhIsN+wXetABZHr
 swPPyhTFPEWSPfA/IzS0dd3/+J4fi3BB6ndLBmYMUgdVt+YY1j+Z3pHpp
 ElFmEbT5uBZOQZ1TIoC+/Bqx7UZrpT46YAcPtmwGXoOXYHqX4Q5CCeunt
 tyr5MfzR3Wc+ftcHizmSHeIBZKf0WKlmoTitnqvReS9fDMAUDVi/bvca1
 DylsU9RbzaTydAU/vXb7Q/wI/7JxLNhdxpIvY5YyVu3Y2blva2CXv7GXL
 lZf9j6sBrlPjHT8qi1ocM3FGU3PlpHgGB8uxvnOVj6HPy7JQ3MVUw1qrx Q==;
X-CSE-ConnectionGUID: EwibAjCrTv2yhMHddOyIMw==
X-CSE-MsgGUID: cO4tZfu9QD+caM5npfeL5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85727371"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="85727371"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 21:45:14 -0700
X-CSE-ConnectionGUID: M2ilGc5mRdu44jDeHWQ6LQ==
X-CSE-MsgGUID: oq5JXkIKSZWpIZ9m3ZKNiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="219964090"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 21:45:11 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, ramanaidu.naladala@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_rotation_crc: Drain queued CRCs to avoid
 stale comparisons
Date: Thu, 12 Mar 2026 10:36:13 +0530
Message-ID: <20260312050613.375306-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Clear any queued CRCs before computing the target vblank and reading a sample.
This ensures the next CRC corresponds to the first frame after the caller’s
commit, reducing rare stale-CRC mismatches seen around modesets/PSR/DRRS/DSC
transitions and DP link retrains. Improves determinism of
CRC-based tests.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_rotation_crc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 4420053f1..9d308f5b6 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -1022,6 +1022,7 @@ static void test_multi_plane_rotation(data_t *data, igt_crtc_t *crtc)
 								continue;
 
 							igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+							igt_pipe_crc_drain(data->pipe_crc);
 							flipsw = igt_crtc_get_vblank(crtc,
 										     0) + 1;
 							have_crc = false;
@@ -1036,6 +1037,7 @@ static void test_multi_plane_rotation(data_t *data, igt_crtc_t *crtc)
 							continue;
 
 						igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+						igt_pipe_crc_drain(data->pipe_crc);
 						fliphw = igt_crtc_get_vblank(crtc,
 									     0) + 1;
 
-- 
2.43.0

