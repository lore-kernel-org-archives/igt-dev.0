Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C330C98315
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 06:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65FF10E368;
	Mon, 19 Jan 2026 06:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zrqe+V3I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C35910E368
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 06:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768802728; x=1800338728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OIRroDUvAY8YnM5fMmnMuVtXY3CtV6A1PD+ochLPIjE=;
 b=Zrqe+V3ILFS4Og4mYIcimOppB83K6MWrSlVoZQO6UHNaKiqj5Q4ZvBna
 VMdiNUnhvEGFgBcov4XzApLv7vIjBw1ZmFXTUzYTZf5Gvjv4QSpEvctfq
 U8fvSmDdXDAlqgOadsZDajei32AnYSppplpBrHXB6/6NbykQh0k+7/XjX
 axabUg/VTjZO55k1Gqh85qP2ckp31KULTeNHbISMm/lB7RZfMyLrEvCdm
 QOZXGNi8lj4vAP8fXjHHbKVoLwbmfJx49+N4I+VhR2XUS73Nk65O2LVPY
 gClJUYDzbLj3m8W7EnB4LR43o9TA0IH4uwjmpNyRT+MLcYepoIqnBiOpl w==;
X-CSE-ConnectionGUID: Qbj/JX15RdGaGLcbeeVtlQ==
X-CSE-MsgGUID: me77HOh9QwSmk4/Pmv/WwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69210271"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="69210271"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 22:05:28 -0800
X-CSE-ConnectionGUID: DCfVrKc/T6epGMc+yL98Ew==
X-CSE-MsgGUID: 1DweHYB7T+qXj7o0EPO3AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="210266762"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 18 Jan 2026 22:05:26 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, swati2.sharma@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_universal_plane: Add vblank wait for
 cursor fb leak
Date: Mon, 19 Jan 2026 11:35:24 +0530
Message-Id: <20260119060524.590227-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116060932.523060-1-suraj.kandpal@intel.com>
References: <20260116060932.523060-1-suraj.kandpal@intel.com>
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

Add the vblank wait even for i915 as the legacy path uses the
vblank worker to unpin cursor fbs.

v2
- Add closes tag [Jeevan]

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_universal_plane.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index aa5927cdf..9ac6d01b7 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -703,16 +703,17 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 			    COMMIT_ATOMIC : COMMIT_LEGACY);
 	cursor_leak_test_fini(data, output, &background_fb, cursor_fb);
 
-	/* Since unpinning of cursor fb occurs during vblank in xe, we need
+	/*
+	 * Since unpinning of cursor fb occurs during vblank in xe, i915
+	 * specially in case of legacy commit we need
 	 * to wait atleast 1 vblank for driver to remove cursor fb. We need
 	 * 1 additional vblank because vblank event is scheduled before
 	 * unpinning. Therefore add 2 vblank wait to ensure that all
 	 * cursor-related framebuffers can be removed before counting the
 	 * framebuffer.
 	 */
-	if (is_xe_device(data->drm_fd))
-		igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe),
-					  2);
+	igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe),
+				  2);
 
 	/* We should be back to the same framebuffer count as when we started */
 	count2 = intel_gem_fb_count(data);
-- 
2.34.1

