Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730A8F8A14D
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 09:28:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D2810E84B;
	Thu, 16 Apr 2026 09:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="akPbNDsx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B34310E84B
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 09:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776331605; x=1807867605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=816JZR7ONAFI1yAgU3/HBU8aMFz/7QQwB1p91trWlk4=;
 b=akPbNDsxlhKmgORoMXHs6cmRLGUViojY7gYbumf2VMEPLCLwzDLgg2y5
 ITAVFJYwZzqdguZ6fa7bcwtIycBV0KlXeGk2eyWDSq750YKWxZcN/KwVL
 ks/HWtYl+UGcUQlFwpD5+s+/bQxlmkUgHDpkEq2i9bWMwHb8aB5Ehh5Y0
 0Qok//BQPz1AiFQEn+QmFdNHkg1OCyzBvPYLy/IWpBIcvBSe3s/00rx6c
 S8wGNsiGjWWvs9rpyRSF/d+qIyK13V0aS1ib3QcatOknJE7WrNAkgsRn5
 wGy8J3zrGlvkaq4yqV6egoKgAiGHLdiq/dsfAUzFjlJrgYkIWIqHOjBTV Q==;
X-CSE-ConnectionGUID: MuFySy8yRrq/+2nPCx8A9w==
X-CSE-MsgGUID: /tiQkwpcSkacm9TLW889VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88775930"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="88775930"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:45 -0700
X-CSE-ConnectionGUID: rKyr8sxVSDqUQ2dp01zj5Q==
X-CSE-MsgGUID: zfULsbxKQDGbv00zbIa/9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235063064"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.194])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:43 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jani.nikula@intel.com
Subject: [PATCH i-g-t v3 10/11] tests/intel/kms_fbcon_fbt: find the correct
 fbc status of a pipe
Date: Thu, 16 Apr 2026 12:25:58 +0300
Message-ID: <20260416092559.88735-11-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416092559.88735-1-vinod.govindapillai@intel.com>
References: <20260416092559.88735-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

Use the right function for access the fbc status from crtc debugfs
entry.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_fbcon_fbt.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 96136f8ff..f738e243f 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -83,12 +83,9 @@ static void wait_user(const char *msg)
 static bool fbc_supported_on_chipset(struct drm_info *drm)
 {
 	char buf[FBC_STATUS_BUF_LEN];
-	int ret;
 
-	ret = igt_debugfs_simple_read(drm->debugfs_fd, "i915_fbc_status",
-				      buf, sizeof(buf));
-	if (ret < 0)
-		return false;
+	intel_fbc_get_fbc_status_crtc_index(drm->fd, drm->crtc_index, buf,
+					    sizeof(buf));
 
 	return !strstr(buf, "FBC unsupported on this chipset\n") &&
 		!strstr(buf, "stolen memory not initialised\n");
@@ -103,8 +100,9 @@ static void fbc_print_status(struct drm_info *drm)
 {
 	static char buf[FBC_STATUS_BUF_LEN];
 
-	igt_debugfs_simple_read(drm->debugfs_fd, "i915_fbc_status", buf,
-				sizeof(buf));
+	intel_fbc_get_fbc_status_crtc_index(drm->fd, drm->crtc_index, buf,
+					    sizeof(buf));
+
 	igt_debug("FBC status: %s\n", buf);
 }
 
@@ -112,8 +110,9 @@ static bool fbc_check_status(struct drm_info *drm, bool enabled)
 {
 	char buf[FBC_STATUS_BUF_LEN];
 
-	igt_debugfs_simple_read(drm->debugfs_fd, "i915_fbc_status", buf,
-				sizeof(buf));
+	intel_fbc_get_fbc_status_crtc_index(drm->fd, drm->crtc_index, buf,
+					    sizeof(buf));
+
 	if (enabled)
 		return strstr(buf, "FBC enabled\n");
 	else
-- 
2.43.0

