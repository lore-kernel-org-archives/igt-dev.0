Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DB6E73158
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 11:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B24710E46D;
	Mon,  2 Feb 2026 11:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bI99bPBP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4123110E46D
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 11:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770032856; x=1801568856;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Blr6eacAknuN2Z0xXgk4484rsz5NvxG/OVVaNmXFDyQ=;
 b=bI99bPBPrtEotoCZNdjfI65ncC/PCT1Y9GEpmLMqWxtCLxxW/TTDYodI
 Ci4iXKZv4kLddOnFugP+E8fX++kyT+9NRMbZZb8abKddW6zWR2E36zs+e
 FA6o9Ogu/0FS52zEdu868oI2q6qIbR9gOnFBhMSb6C8+wnebgjtYCxO0W
 CkccHjHnp7fZaMGPj0Yp/KCJC0zSdvvf2DNHmtbFPFdo2k0c+rDxSjTPv
 ZoIqJMlidPXfsVD+/biUcg37VkIMZOX6Q6Zs2OerrJVYOInFT628uFkdB
 X5vFB44x6demAkMRMijoLpR11zPSe0D/R3cs5Cam2bgQmhlweFDd9iHTS A==;
X-CSE-ConnectionGUID: eYsrmJVHScWx4+dHtULD+A==
X-CSE-MsgGUID: aIZA/5JGSHa0IVQuxvZkHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="82296478"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="82296478"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 03:47:35 -0800
X-CSE-ConnectionGUID: y/dLoCM2QnyAUFDv/PC9kA==
X-CSE-MsgGUID: bioCdFbSSHyLW/9DzmwGMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="240183140"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 03:47:32 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, kamil.konieczny@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2] lib/xe_gt: Handle non-C6 states with debug message
Date: Mon,  2 Feb 2026 17:16:41 +0530
Message-ID: <20260202114640.3366549-2-sk.anirban@intel.com>
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

When GT C-state is not "gt-c6", return false with a debug message
showing the actual C-state value instead of silently failing the
"gt-c6" comparison.

v2: Refactor code changes (Kamil)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 lib/xe/xe_gt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
index ed19bec74..8f54b6e25 100644
--- a/lib/xe/xe_gt.c
+++ b/lib/xe/xe_gt.c
@@ -220,7 +220,12 @@ bool xe_gt_is_in_c6(int fd, int gt)
 	igt_assert(igt_sysfs_scanf(gt_fd, "gtidle/idle_status", "%s", gt_c_state) == 1);
 	close(gt_fd);
 
-	return strcmp(gt_c_state, "gt-c6") == 0;
+	if (!strcmp(gt_c_state, "gt-c6"))
+		return true;
+
+	igt_debug("GT%d C-state is %s\n", gt, gt_c_state);
+
+	return false;
 }
 
 /**
-- 
2.43.0

