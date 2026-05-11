Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817F9CD37B5
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 09:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6D110E657;
	Mon, 11 May 2026 09:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIkIl+nd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A1C10E151
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 09:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778491686; x=1810027686;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h0LeZ0mksdGtFZBDlKmtH6J4ZZ3YSEBFG1KKiu9vwqY=;
 b=CIkIl+ndYaHhsayYpCqW7FeHM8MRPosacw2M+mFYWqnOfPGRsEEZZ2FB
 fJYZbG9040Mh0xwhNp2eaTEbzDFeqaw3GnT+wYPMstpFaIkwvIV5iAvSO
 N3jjtOiOhscxV62JsYZAJJTrpNwR5AP+7ByU6Kju74zOLsUagqS1C8Ltu
 AWiphJrKPLmIQD5usuQvUjtwSfZ4al9wYgxsppcUahj2qJIP2Bv1hMOkT
 Pmjd/cLi++Gp4Bswq8r6U4Tr+iG/P3GVkwIHV0g3RY5XwUWAfNhCPZJ8f
 iHS/9LNyBwIj/6npEtm6sHuK7wgg/sKVbZ80doaa6UMc8tAu5UMyaJSTN Q==;
X-CSE-ConnectionGUID: euKyqICtRfuPqrrNiIpO3Q==
X-CSE-MsgGUID: GfW7sK7/QKCt6YjF3vEMWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79395635"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="79395635"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 02:28:05 -0700
X-CSE-ConnectionGUID: rI3iy+0gStK2qqJ0Yq0R9A==
X-CSE-MsgGUID: y4Ic+u1WRxOh8DgX4UQ1tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="236425624"
Received: from tmistat.igk.intel.com ([10.91.34.58])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 02:28:04 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t v3] lib/igt_sriov_device: Update igt_sriov_enable_vfs
 helper
Date: Mon, 11 May 2026 10:19:30 +0000
Message-ID: <20260511101930.180154-1-jakub1.kolakowski@intel.com>
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
V3:
 - replace abs(ret) with -ret in strerror() inside the igt_assert_f()

closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/12910
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/igt_sriov_device.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index 1f4c3ac04..8f2cfa50f 100644
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
+		     num_vfs, strerror(-ret));
 }
 
 /**
-- 
2.43.0

