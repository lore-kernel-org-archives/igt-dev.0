Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18EFD64084
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 20:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626A310E291;
	Fri,  8 Nov 2024 20:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QPfjfC0J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD6A10E291
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 20:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731097142; x=1762633142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p9Q181eYQJatcu3AGecb9Edy/eyyz/Ldn55zTqTGPo8=;
 b=QPfjfC0JC1JA0sxJhcnd5yicF5cySHYpuYUGr/Qrgn78U4ejSuQ+DWmq
 kpyKkvxD0MZthOcXWZPyt2o0Y2OCBzerdW/4JRzAzWcuMkUcHSVYSJX6L
 K6Goadvgvab7EZbnGIzZRviRAw2pjOzXkOrAHbSmCOBJVOLPBPAVmgUIy
 SdT+6dwi+6Ko4hEZ+130yy47cokf/xIEsRYZ0PGv0JmGDZWh8O4wHPHdr
 FezYJj1Y9IVnkIHuWCpUu8aw6FT1vhcP2pPgFM8Cf6hYxJLEZWAtDpREV
 skUJpFCYVM+YIqvPt2bCnM/tZuFU8n/I3oCer4PpuUhc3blWdW7Cg9qoj Q==;
X-CSE-ConnectionGUID: D7oKnSPEQuWPMXszoa2frg==
X-CSE-MsgGUID: HrAXA0vnQvKK15xYC/Uf2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="30390947"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="30390947"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 12:19:01 -0800
X-CSE-ConnectionGUID: aoOUyZUxTa+YcPWLyFJNLA==
X-CSE-MsgGUID: Uans7wVFQwqkZka+y3XHPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="85621353"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.135])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 12:19:01 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 4/4] lib/igt_sysfs: improve xe sysfs checks
Date: Fri,  8 Nov 2024 21:18:39 +0100
Message-ID: <20241108201839.119079-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108201839.119079-1-kamil.konieczny@linux.intel.com>
References: <20241108201839.119079-1-kamil.konieczny@linux.intel.com>
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

Improve check for Xe sysfs failed open. While at this, make sure
it will not be closed just before unbind and also use drmtest
close function, as it will properly call xe_device_put().

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_sysfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 356b20f29..c414c57e9 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1376,7 +1376,7 @@ int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_acti
 	int sysfs;
 
 	sysfs = open("/sys/bus/pci/drivers/xe", O_DIRECTORY);
-	igt_assert(sysfs);
+	igt_assert_f(sysfs != -1, "Sysfs open failed, errno=%d\n", errno);
 	__drm_invalidate_opened_fds();
 
 	switch(action) {
@@ -1399,7 +1399,8 @@ int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_acti
 		 * We need to close the client for a proper release, before
 		 * binding back again.
 		 */
-		close(xe_device);
+		igt_assert_neq(xe_device, sysfs);
+		drm_close_driver(xe_device);
 
 		igt_assert(igt_sysfs_set(sysfs, "bind", pci_slot));
 		close(sysfs);
-- 
2.47.0

