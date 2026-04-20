Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9FEF557FE
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 09:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E61910E493;
	Mon, 20 Apr 2026 09:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ss8fE0fW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2019B10E493
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 09:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776678988; x=1808214988;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2Fvfxz6PkCPnJA8qg6UFocTD5/PjdkjCYN4KIS3aprk=;
 b=Ss8fE0fWTl6LSu1BZY0ahRVbKrR+DDUuvo/XFzX1m+EMojrN4FAJDflu
 Ok5B1aIpqych35H7cXnY1ZV9vlYPJvZfLaHEPQQcoQftCDcaG4d2VlqVN
 F4oWZ45f6SxW2RHCQexz+BeVxQvia7ywU0hch/dm3a6jt5CfEaG5G5mAE
 HgakT1HPVbbn95xY4aHRoHOXFjbphNm9JNPVFjp46m3hou5SKOxWAHOMM
 gfvH+qZJD9ETkl5oPc5486qLrq/8AJfB4jWngRn2WjpD0PICrKor1sSTj
 CH0xJQT/+h5lUK5ertov3O8k6BBIR/DntTm9wHpUVrYHIikrRTJGzUIIe w==;
X-CSE-ConnectionGUID: 3YOIIFCjT3eZP6HLOQEK5w==
X-CSE-MsgGUID: LfbwbX/ARdOijUSBYefPlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81198781"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="81198781"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 02:56:26 -0700
X-CSE-ConnectionGUID: fIyqtgGBSIC5pQoWFj4zRQ==
X-CSE-MsgGUID: LIIlXj/zQZSqlXZyIpUAng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="236671062"
Received: from tmistat.igk.intel.com ([10.91.34.58])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 02:56:19 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t] lib/igt_sriov_device: Update igt_sriov_enable_vfs helper
Date: Mon, 20 Apr 2026 10:47:20 +0000
Message-ID: <20260420104720.14881-1-jakub1.kolakowski@intel.com>
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

Some platforms may expose sriov capability and sriov_totalvfs will be
greater than 0 while the driver actually doesn't support the platform.
In such case igt_sriov_is_pf() helper that checks for sriov_totalvfs
will pass.
Add additional check within igt_sriov_enable_vfs() function to check if
writing to sriov_numvfs was successfull and what errno was returned
during this operation. ENOENT will mean that SR-IOV isn't supported for
given configuration. In such case test will skip instead of failing.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 lib/igt_sriov_device.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index 1f4c3ac04..3fadcf0aa 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -174,10 +174,16 @@ unsigned int igt_sriov_get_enabled_vfs(int pf)
  */
 void igt_sriov_enable_vfs(int pf, unsigned int num_vfs)
 {
+	bool ret;
+
 	igt_assert(num_vfs > 0);
 
 	igt_debug("Enabling %u VFs\n", num_vfs);
-	pf_attr_set_u32(pf, "device/sriov_numvfs", num_vfs);
+	ret = __pf_attr_set_u32(pf, "device/sriov_numvfs", num_vfs);
+
+	igt_require_f(!(ret == false && errno == ENOENT), "SR-IOV not supported\n");
+
+	igt_assert_f(ret, "Failed to write %u to device/sriov_numvfs (%s)\n", num_vfs, strerror(errno));
 }
 
 /**
-- 
2.43.0

