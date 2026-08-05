Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BF5C55174
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 08:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A569310ED7E;
	Wed,  5 Aug 2026 08:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a9UtCU4F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE38910ED7E
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2026 08:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785918911; x=1817454911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R/thU7QL0yU14oxO3U2eYPX1a+gvG9xzDpwbCF3YFCU=;
 b=a9UtCU4FdCru65jp4obIQQQwdfVvlrU2HMuFeKKh5yPeGUldgIvUSnna
 O4VVjNzE2R+o7P+qvK+3pfaoYT/khEYU3zioXr1mcWr+P7G37TX8Pt9yf
 Wals/LestYmJo3mwSp/XVkuHNx4oDuuhw+7pR/19rDgFwSi+IFo8smxhl
 zULA79tgkrj1HWr80COLikXhJCwyZt9jv3FnMLgAtyuVAWgBXQmaEh5ng
 RGlS1szAefo/O6emrd/YKn2OyyO0KPmocJ/X7tPimGeYJWIFAtRimk7lu
 IAmEIdBcnqBauUzOXfegzUnrGEKxbaczdKB9u+uRRc+SImq8GlKvqbYCa A==;
X-CSE-ConnectionGUID: TnQk4f52Qs2AbiwWQupsWw==
X-CSE-MsgGUID: fuBiTLayQKe6YfmMroESig==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="85612014"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="85612014"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 01:35:10 -0700
X-CSE-ConnectionGUID: gYBidGujSeKXgfvhnKiZtg==
X-CSE-MsgGUID: 0khqlJ6lRZWrCZcHi0wfOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="261809508"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 01:35:08 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, santhosh.reddy.guddati@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3 2/2] lib/igt_kms: Skip joiner exception modes in
 boundary non-joiner search
Date: Wed,  5 Aug 2026 14:04:54 +0530
Message-ID: <20260805083454.708311-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805083454.708311-1-sowmiya.s@intel.com>
References: <20260805083454.708311-1-sowmiya.s@intel.com>
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
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_kms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 8b197e5ec..42cc7c3bd 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7190,7 +7190,8 @@ bool intel_boundary_non_joiner_mode_found(int drm_fd, drmModeConnector *connecto
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

