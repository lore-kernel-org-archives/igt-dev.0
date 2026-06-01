Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B21CD5BD1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 20:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469D410E983;
	Mon,  1 Jun 2026 20:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MSfb6fdF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD5F10E978
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 20:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780346685; x=1811882685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=71RjoqoLZ6gE/k+hetQd70am+ckU1vIQiH9ZW/tocHA=;
 b=MSfb6fdF85YyyHGFjJSloU73JCBCFp+wDRJTcxz1khivlk8UE7CBnux6
 dStUHj9SZuhPlY/O0Zd2QGMl8lLYFgVQWn3vg+BJNY18RVEyqVYK9Uv6v
 VknR1UCE/oAIGd2GOxO5ZT+qk0xyYzywuPAjlC2xliky8CwFIGfshYISp
 +Mcimci6RDPInxwVbfsPxk3ruFHr7kSpJj4Tu9Am54Ipne8JnVCNEg6x5
 2aRgxiMnTYVkN9WI9OJ6sJiFAWdo3OP2UqcSDh2+WaX5WHKULmUKMnals
 nVSvT0hMU/0SOgJpsb2JXuEKaCxRya3jYyreIEkOMW/60fbEAS6CemOjD A==;
X-CSE-ConnectionGUID: NXAO8Zm0QtCASz6JuVXisQ==
X-CSE-MsgGUID: Qja5169TS46pJmsC5nr8zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="68652876"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="68652876"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 13:44:45 -0700
X-CSE-ConnectionGUID: rtt0DbjHQo2qQKZjlDFFaQ==
X-CSE-MsgGUID: 8JLg7oI2SMiV8RCaVyvmag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="267331533"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.188])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 13:44:43 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH i-g-t v4 10/12] tests/intel/kms_fbcon_fbt: find the correct
 fbc status of a pipe
Date: Mon,  1 Jun 2026 23:44:05 +0300
Message-ID: <20260601204407.39934-11-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260601204407.39934-1-vinod.govindapillai@intel.com>
References: <20260601204407.39934-1-vinod.govindapillai@intel.com>
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
index 96136f8ff..fdd8515cc 100644
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
+	intel_fbc_get_status_crtc_index(drm->fd, drm->crtc_index, buf,
+					sizeof(buf));
 
 	return !strstr(buf, "FBC unsupported on this chipset\n") &&
 		!strstr(buf, "stolen memory not initialised\n");
@@ -103,8 +100,9 @@ static void fbc_print_status(struct drm_info *drm)
 {
 	static char buf[FBC_STATUS_BUF_LEN];
 
-	igt_debugfs_simple_read(drm->debugfs_fd, "i915_fbc_status", buf,
-				sizeof(buf));
+	intel_fbc_get_status_crtc_index(drm->fd, drm->crtc_index, buf,
+					sizeof(buf));
+
 	igt_debug("FBC status: %s\n", buf);
 }
 
@@ -112,8 +110,9 @@ static bool fbc_check_status(struct drm_info *drm, bool enabled)
 {
 	char buf[FBC_STATUS_BUF_LEN];
 
-	igt_debugfs_simple_read(drm->debugfs_fd, "i915_fbc_status", buf,
-				sizeof(buf));
+	intel_fbc_get_status_crtc_index(drm->fd, drm->crtc_index, buf,
+					sizeof(buf));
+
 	if (enabled)
 		return strstr(buf, "FBC enabled\n");
 	else
-- 
2.43.0

