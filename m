Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26054C83030
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 06:26:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C214210E12C;
	Thu,  3 Jul 2025 06:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GptMRTzS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB29D10E12C
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 06:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751524014; x=1783060014;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0/XU0zfvLMzxm/f505DARaEvJZ9/7bca1rUAiXDE2ok=;
 b=GptMRTzSO9AFunslNgTkVitB9s8VfJQEfU4QbBVhLOlj4h0ctLtme7D9
 21CbZxEFVwQ2vNEVgfPJflxNtccLxQja4pbGVsRSqeodnirXx1bYqMX0k
 E5jwUEvZMM3Oh6YmL3EPVECsBNxHHpQp9r4Pk4U2tQdEqUnymWGcvnHAH
 KCQ/NuQQ5PPwLrhmaaQldswX2W9g4UH9BYAcVjYVGYjzyZQDyLaMB0rOY
 PLbxP74ZQuTFCiSIVi4IfMgL8R1PxEOCU7H2olDBix1elAR/jL+XVriBl
 S93RlrAyWs0fq8Yk0u/pa2BOLBCWMI3ekSpEOn/kNTcHc42ZkrdAionjU A==;
X-CSE-ConnectionGUID: kYXittG6R1G6TYHh1uPJYg==
X-CSE-MsgGUID: oj2tDob3S7+ihKh+TtoEEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="41463050"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="41463050"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:26:54 -0700
X-CSE-ConnectionGUID: SiniR+jYRkWf8T1JE9+YAA==
X-CSE-MsgGUID: hZKaAyVZSFWuIvnfnBGl1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="155027792"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:26:52 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, ankit.k.nautiyal@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_joiner: Update ultra joiner supported
 platforms
Date: Thu,  3 Jul 2025 11:56:54 +0530
Message-ID: <20250703062655.894129-1-karthik.b.s@intel.com>
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

Currently, Ultrajoiner is supported only on Xe2_HPD.
Update the check to reflect the same.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel/kms_joiner.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 22c7c6d85..d1ddbeb60 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -572,7 +572,7 @@ igt_main
 
 		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
 		display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
-		if ((is_dgfx && display_ver == 14) || (display_ver > 14))
+		if (is_dgfx && display_ver == 14)
 			ultra_joiner_supported = true;
 
 		for_each_connected_output(&data.display, output) {
-- 
2.43.0

