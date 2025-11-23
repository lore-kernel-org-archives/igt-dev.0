Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E680CFD2F6
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D2410E186;
	Sun, 23 Nov 2025 15:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1hjH3wO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B0610E056
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910533; x=1795446533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bNpey3g/T7kzjhslSw3anD0OdrT70oCkAu/tkt7auYQ=;
 b=d1hjH3wOcUtNkp7wJSJPT8FyLnvpve0ucDfPY5W1b1yIBE/yY1PVl80n
 CU+e0UCVDi3n/1gSL0pATk0t1q2foxoXZbnq+O58Nanpf8FnqFFPDVVZ2
 lYPnPAcY19WU7kE4j3/XgKKERRFbVKRJsybjcGAjjjhpt/KgqT3030B72
 3Kud3aFJNVWlg727nzS9ZVhgXoNiSQuEKR3E4pQQTEzLAGQ7wpHz6HPdj
 OLwYg0/G+xSNoMYp9wh+YbgQHf7bfiM2VcXIinq3oQOQNpbSJwjMlZWe9
 N6sp9NuFYiGZlZy3hCEppCQaVsJY05HzKv6p2vU7aSI85meahCOuzugmx g==;
X-CSE-ConnectionGUID: lOxu8bLHTZez1gZgHFdO9g==
X-CSE-MsgGUID: 1bjyHI09ScORjmBIYbw3Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615213"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615213"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:52 -0800
X-CSE-ConnectionGUID: A43KJ2ExSN2aKG4HmuOf2w==
X-CSE-MsgGUID: zcwE7GWbTv6GyPMAaHqqqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903827"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:52 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 24/35] tests/kms_frontbuffer_tracking: use display-aware
 pipe CRC helper
Date: Sun, 23 Nov 2025 20:54:01 +0530
Message-Id: <20251123152412.599801-25-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251123152412.599801-1-kunal1.joshi@intel.com>
References: <20251123152412.599801-1-kunal1.joshi@intel.com>
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

Switch kms_frontbuffer_tracking CRC setup to igt_pipe_crc_new_for_display so the underlying CRTC index is derived from the display state instead of assuming the pipe index matches the CRTC index.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 0f162d9a5..5bf7ba9a1 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1942,8 +1942,9 @@ static void init_blue_crc(enum pixel_format format, enum tiling_type tiling)
 	igt_display_commit(&drm.display);
 
 	if (!pipe_crc) {
-		pipe_crc = igt_pipe_crc_new(drm.fd, prim_mode_params.pipe,
-					    IGT_PIPE_CRC_SOURCE_AUTO);
+			pipe_crc = igt_pipe_crc_new_for_display(&drm.display,
+						       prim_mode_params.pipe,
+						       IGT_PIPE_CRC_SOURCE_AUTO);
 		igt_assert(pipe_crc);
 	}
 
-- 
2.25.1

