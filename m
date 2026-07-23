Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45013C531CA
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jul 2026 13:45:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37CA10E589;
	Thu, 23 Jul 2026 13:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V20oGhDL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F2110E589
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2026 13:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784814250; x=1816350250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rCfmz5peCqjP8FZGQIBr25/Zg0h2/L3ABXN4tHwpLn4=;
 b=V20oGhDLWYFbbn6FqYLiS+9LJFxEu+5WpRRYtDhh3If8+ty5yijn/hAm
 5yHzKFcNi8Oxnea05EcZntBoY1bgnQ8zoP130nFBe2Gc5vSvjLo/S47ym
 gfwQvl/XmuEFHUIp7QnmTE3/pP8gU2rM7MhLO82tpH7TqdMcErXyZFGO3
 OuRC24+DhSVfT/BRsGay+EkcOWLKZBLRzjCuFbPgRtSH2lmdLpgjW1zoO
 HMJ/5D6/Q6k3vO8VmAdR5bH1wPDprNbkGeOvnvFNOT+x4Av6kq3DCZbua
 CYmyxOTtzu7RWXZLhSXhRtTKVU4eOZ3F3+gKk6XGEXvFy0Vj1m0Hnlqmd g==;
X-CSE-ConnectionGUID: oTmWAVueTeurrbX7lN2tmA==
X-CSE-MsgGUID: 4Q/W2pSRQ6KoxKfxAve66w==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="95823295"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="95823295"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 06:44:10 -0700
X-CSE-ConnectionGUID: 35ZuKVBoSZaKT5LzjVXt4A==
X-CSE-MsgGUID: p9raa/jpRQuQ10FqynfiDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="255041862"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 06:44:08 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, santhosh.reddy.guddati@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 2/2] lib/igt_kms: Skip joiner exception modes in
 boundary non-joiner search
Date: Thu, 23 Jul 2026 19:13:54 +0530
Message-ID: <20260723134355.337709-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723134355.337709-1-sowmiya.s@intel.com>
References: <20260723134355.337709-1-sowmiya.s@intel.com>
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

Fix intel_boundary_non_joiner_mode_found() to skip exception modes,
preventing test_basic_max_non_joiner from incorrectly selecting a
joiner-required mode as a non-joiner boundary mode.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 lib/igt_kms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index bfa6dfc0e..5cee7db2c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7174,7 +7174,8 @@ bool intel_boundary_non_joiner_mode_found(int drm_fd, drmModeConnector *connecto
 		drmModeModeInfo *current_mode = &connector->modes[i];
 
 		if (current_mode->hdisplay == max_hdisplay &&
-		    current_mode->clock < max_dotclock) {
+		    current_mode->clock < max_dotclock &&
+		    !mode_needs_joiner_exception(drm_fd, current_mode)) {
 			*mode = *current_mode;
 			return true;
 		}
-- 
2.43.0

