Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782DE104C00E
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 10:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1865810E0BB;
	Wed, 11 Mar 2026 10:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lw735zUU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DE310E0BB
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 10:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773226188; x=1804762188;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jlmMOJEAMdpkAHM4cIbuXN6va0MjuRyRXzRaT1Y2kdQ=;
 b=Lw735zUUPbZPMOdFE7hZ6gwEFK2aQnml/eZBuT26jo2R6OqFhpJN9hSj
 t5PsrQ73kfiRCjXsYX9nhoWXiELgAO7u9ObSJ6Viyjn3a84s3FcO2Dm/e
 02+MraEErBwARyvzTiN94tCNG+PiE4yKIHjWxVCvDzzpu7M3hTZIYI52j
 3EygTSx12mPHPWRAmi1nHl+17PPIWREKOVfLH8uaTRJ22wf3ROttkbPpi
 gOXBl+3ewTSQDQc/UIEwHdagKbEWC1qdWx+b7Jsz/U/fOldUdTIH0fao2
 GpOGatgOej5HZgxx3y/EPIXB/7XG96zngYRsQ/AoVCfPRTGvfsIzgeo/a Q==;
X-CSE-ConnectionGUID: tss/AezcTBWSNnF44B4NiQ==
X-CSE-MsgGUID: FhpsWxAHRdynsfNXW2tPWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="91671593"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="91671593"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 03:49:47 -0700
X-CSE-ConnectionGUID: YNUf8hZqQMuMSUin2+jV2w==
X-CSE-MsgGUID: N8mgcphyR+mJJCHyjSlvPw==
X-ExtLoop1: 1
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 03:49:47 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] lib/igt_kms: Fix joiner force debugfs entry and
 expected value
Date: Wed, 11 Mar 2026 16:20:33 +0530
Message-ID: <20260311105033.220652-1-ramanaidu.naladala@intel.com>
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

Switch force-joiner detection to the update debugfs entry
i915_joiner_force_enable and adjust parsing to the new "2"
value.

Link: https://patchwork.freedesktop.org/patch/msgid/20240926134322.3728021-4-ankit.k.nautiyal@intel.com

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/igt_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0b05ddd72..7820254a3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7138,7 +7138,7 @@ bool igt_check_force_joiner_status(int drmfd, char *connector_name)
 		return false;
 	}
 
-	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
+	ret = igt_debugfs_simple_read(debugfs_fd, "i915_joiner_force_enable", buf, sizeof(buf));
 	close(debugfs_fd);
 
 	if (ret < 0) {
@@ -7146,7 +7146,7 @@ bool igt_check_force_joiner_status(int drmfd, char *connector_name)
 		return false;
 	}
 
-	return strstr(buf, "Y");
+	return strstr(buf, "2");
 }
 
 /**
-- 
2.43.0

