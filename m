Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187D7C54791
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 11:59:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16EB10F76C;
	Wed, 13 Mar 2024 11:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gnP9CwpN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522CB10F75E
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 11:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710331157; x=1741867157;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vuPUgr8dRnzP4yp6Yku2jQjA+IpGvItuP6mCXkPvbCY=;
 b=gnP9CwpNHra0AHVWsADb6huPZDJ7TrswYkB/AGJnPJ/J3aaEFtNqOXzX
 K9Bs4VITJ3aX8JoAigJR4pPHd3blJC5bkppCSNgrMqgYtgyPqSC2PpcPk
 waO7IP1P47qhHSAerBUO2OFnH47ZR6Y/O7nUsrgxMJXkRlDHPoq47YECk
 ZyPF7Y0SFu/yv5AoQVSCYeMHNTNcT0c/K/nwUpQiXXpSK3i+I4P8iNwaf
 ltPW/YH7E4+4bD83rrOvhiNvytE4QgiwKUIE1TJepBT2FqHczglKlgwOj
 wfTxZH7eYS5HB3mHIROHKRwQdC/IVXlY6oFcZChzC1AjuPC0wV1Ziot1h g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4945989"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="4945989"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 04:59:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="42833291"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.0.122])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 04:59:14 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
	lukasz.laguna@intel.com
Subject: [PATCH i-g-t] SRIOV: lib/igt_sriov_device: Cache xe device at open
Date: Wed, 13 Mar 2024 12:59:11 +0100
Message-Id: <20240313115911.22870-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Be consistent with other drm_open_xxx functions.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/igt_sriov_device.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index f20761669..f425a5ecf 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -12,6 +12,7 @@
 #include "igt_device.h"
 #include "igt_sriov_device.h"
 #include "igt_sysfs.h"
+#include "xe/xe_query.h"
 
 /**
  * igt_sriov_is_pf - Check if device is PF
@@ -232,6 +233,7 @@ int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num)
 	DIR *dir;
 	struct dirent *de;
 	bool found = false;
+	int fd;
 
 	if (!vf_num)
 		return -1;
@@ -258,7 +260,11 @@ int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num)
 	if (!found)
 		return -1;
 
-	return __drm_open_device(dev_name, DRIVER_ANY);
+	fd = __drm_open_device(dev_name, DRIVER_ANY);
+	if (fd >= 0 && is_xe_device(fd))
+		xe_device_get(fd);
+
+	return fd;
 }
 
 /**
-- 
2.31.1

