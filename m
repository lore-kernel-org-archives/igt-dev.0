Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021EAC53219
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 06:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A647610E52A;
	Tue, 28 Jul 2026 06:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dnBEGLCm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA57D10E522
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 06:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785218424; x=1816754424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pykfJkztKpr5NMzgt600QD9P/r0AwiFWg4dkYFUmQLI=;
 b=dnBEGLCmwo9yV59gXp4g44MKNuv59QtUeQCZxhDosG8daR02/1F3HvSe
 0WoUX/7ngP5qceFF9x3u9JRLuuGf28nVS9MFM2wWWY5j4CUSHiTGQtddn
 +K6rqWBzJ3IZGypgop39wk0mr5oG9noVikwyPaLrvhbln7Lhf7wX1kOwW
 23UMAPeA3aPwCkh84eVzUrSMieMJw4ZqKwfr8eUW8G42doqtkJHGfGexp
 ksXPe6V32ZfVX1eymQRmJPcnXmEOitIUId3nmVuBnvzbFRpA4VFNlnOIf
 m2BIH6iCaElH1d9YbsVW1mWyzEDKGi7UVGWzHs92hNY+8tjcxuLVKEXRU w==;
X-CSE-ConnectionGUID: 5VIKoGroQsmAhzbpa7RepQ==
X-CSE-MsgGUID: iH4DDGxuRjKJju6QTpOnhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="84921065"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="84921065"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:00:24 -0700
X-CSE-ConnectionGUID: AGlYpRMIRi+mIdkbsPEd7g==
X-CSE-MsgGUID: IHceVZo9QqKvJabvPadIqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="255670909"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:00:21 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, santhosh.reddy.guddati@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 2/2] lib/igt_kms: Skip joiner exception modes in
 boundary non-joiner search
Date: Tue, 28 Jul 2026 11:30:03 +0530
Message-ID: <20260728060003.392870-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060003.392870-1-sowmiya.s@intel.com>
References: <20260728060003.392870-1-sowmiya.s@intel.com>
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
index d591e696d..2475f0916 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7192,7 +7192,8 @@ bool intel_boundary_non_joiner_mode_found(int drm_fd, drmModeConnector *connecto
 		drmModeModeInfo *current_mode = &connector->modes[i];
 
 		if (current_mode->hdisplay == max_hdisplay &&
-		    current_mode->clock < max_dotclock) {
+		    current_mode->clock < max_dotclock &&
+		    !mode_needs_joiner_exception(drm_fd, current_mode)) {
 			*mode = *current_mode;
 			return true;
 		}
-- 
2.51.0

