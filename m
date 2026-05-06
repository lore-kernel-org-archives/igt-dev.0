Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23479CD3439
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 16:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7C410EE1C;
	Wed,  6 May 2026 16:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JxpcpWm8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB5B10EE1C
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 16:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778086054; x=1809622054;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p/ZKvxYKs6zQUUSiO7fmozI92uJxi+5u0KQ/L8LEJ0g=;
 b=JxpcpWm8JLg0sYPGAinAtAYs+xaXaA+GMV174ZBov/7qBuBOhcNctBTO
 3yRN5OAF/njoIpDw4A8zds4cy2CppSF8qnq7xc0ojuj2rRzRCf0HCEJpf
 TZA0YI0N8zU5MYmYDbmUR3Ox+y7pgGKRukML4QdeGS9Pah/kh4Pga6Xwk
 vr7uW9GwZS3cj4059poqCQ89iAdpugDxYdkUteQSve9jcneYhMcGhM3Sv
 xNAriK+zSJOCnxhabTIAW7E7CNF4sb2G0nQ82a+8vF/ZedjjKrH7Z6G4x
 9oOIO3pB1FmENIQlY+mdgcrDUQVDJdyZAIYwh/1IQmCF6EaPIQ8VYeZJ2 A==;
X-CSE-ConnectionGUID: IrBVzyI5T1uMN8g7oJNAYQ==
X-CSE-MsgGUID: r+WV1VlHRSWBW+WS5yGjMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="96595519"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="96595519"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 09:47:34 -0700
X-CSE-ConnectionGUID: UNrryiYEQzO3ksvpFnqHaA==
X-CSE-MsgGUID: SQcTN9HDQGm7wxPPRvPYnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="238017460"
Received: from tmistat.igk.intel.com ([10.91.34.58])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 09:47:32 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t v2] lib/igt_sriov_device: Update igt_sriov_enable_vfs
 helper
Date: Wed,  6 May 2026 17:38:11 +0000
Message-ID: <20260506173811.157330-1-jakub1.kolakowski@intel.com>
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

V2:
 - replace __pf_attr_set_u32() with igt_sysfs_printf to reduce layers of
   helper functions and increase reliability of checking for errno

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 lib/igt_sriov_device.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index 1f4c3ac04..4be57deea 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -174,10 +174,22 @@ unsigned int igt_sriov_get_enabled_vfs(int pf)
  */
 void igt_sriov_enable_vfs(int pf, unsigned int num_vfs)
 {
+	int sysfs;
+	int ret;
+
+	igt_assert(igt_sriov_is_pf(pf));
 	igt_assert(num_vfs > 0);
 
+	sysfs = igt_sysfs_open(pf);
+	igt_assert_fd(sysfs);
+
 	igt_debug("Enabling %u VFs\n", num_vfs);
-	pf_attr_set_u32(pf, "device/sriov_numvfs", num_vfs);
+	ret = igt_sysfs_printf(sysfs, "device/sriov_numvfs", "%u", num_vfs);
+	close(sysfs);
+
+	igt_require_f(ret != -ENOENT, "SR-IOV not supported\n");
+	igt_assert_f(ret > 0, "Failed to write %u to device/sriov_numvfs (%s)\n",
+		     num_vfs, strerror(abs(ret)));
 }
 
 /**
-- 
2.43.0

