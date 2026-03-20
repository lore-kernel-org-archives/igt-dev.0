Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F228A108B901
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 11:31:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A296F10EAD8;
	Fri, 20 Mar 2026 11:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YnZI8i2F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872F810EAD7
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 11:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774006312; x=1805542312;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5nxB1DH5PQXVzBVvEIH0aqqGajOtbk/0xl9OeuHM1FY=;
 b=YnZI8i2FEVVUd49dGzBEaIJfc9EyMyzoS5XqzTpgXSaO8Wk3KuKU3dFV
 iw8ZDEW/EkBst4iip9M1XddFuCttgh+kW53gvyaAagcEoV5sAvHatczv6
 SKBE8NolC+Wo7FagJvYheACOnymBA7m5ah3xH5UdlszA7mAPZTGGyeehM
 CKfhYtLAC6+qPFbgnttH/nYNSVu9PRYRB/E6lEGsYaFFNpgc0QtIjgaXb
 iljCp2+jqH/qwzKlo63sYhf46QwL/VaJaXYYkQ63UOe0iqYa+hxe4SgAi
 AYyhg/FWUz1xEFli1OjBzKhTMtnA1gLLUwG7DEVnCrWZ8Q4U5hEaMDXb8 Q==;
X-CSE-ConnectionGUID: wUMgqnDnRhm97rLnNEhw0A==
X-CSE-MsgGUID: gVzXkVE0Ro2kS1r2jMavDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="85404318"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="85404318"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:31:52 -0700
X-CSE-ConnectionGUID: hmS/MzEPSwuT8I9z+oYVqQ==
X-CSE-MsgGUID: miir1lTSSCyQ7rJNLnkWRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227989127"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:31:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/kms_pipe_stress: use CRTC index not
 pipe for vblank ioctl
Date: Fri, 20 Mar 2026 13:31:42 +0200
Message-ID: <20260320113143.2882422-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

The vblank ioctl expects CRTC index, not pipe. Fix the pipe vs. CRTC
index mixup by switching to use igt_crtc_get_vblank().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/intel/kms_pipe_stress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 85ab2ec50621..a0ce3c4d7ecb 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -591,7 +591,7 @@ static void stress_pipes(struct data *data, struct timespec *start,
 
 		igt_pipe_crc_start(data->pipe_crc[pipe]);
 		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc[pipe], &crc);
-		kmstest_get_vblank(data->display.drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
+		igt_crtc_get_vblank(crtc, DRM_VBLANK_NEXTONMISS);
 		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc[pipe], &crc2);
 		igt_pipe_crc_stop(data->pipe_crc[pipe]);
 		igt_assert_crc_equal(&crc, &crc2);
-- 
2.47.3

