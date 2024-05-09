Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEB1C10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 14:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D298310EB2A;
	Thu,  9 May 2024 14:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CF3cNCHM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C594F10EB2A
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 14:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715264163; x=1746800163;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=USir7/h89b5K985i20qeHmtb59a6DtpxAz4s23r9jPg=;
 b=CF3cNCHMkcOrVIxnX+4ut8v94CX76n6FD4TyNqEZuqTvJr4VM2nCLwOm
 uT98Ok4LA68XQcbMMCSTtmf2bD6ANc3SoiFpjHd/VBz/NFa8d0NbKN53a
 iJMG+BDRtDacjX31+nWKwdcECYI/pQO5V9dZpkvbl+aksTYWpmnFL+sId
 OhsvMNbHm1zTb3+CeRtz/43c1kQjwgUOxx57/YliN0RhyzrV4hUGMsJc9
 wnIrO8sqQsWQ5SLfRwiUNizlBJnf/bMZeXbdPZ8IjWfXX8/eYTIt8+Fvq
 ajiUut49wuY0rUufmTtqPys2iMSIAhTZXGhl45U7Zy31GiN6u7GafbPTR g==;
X-CSE-ConnectionGUID: 6yJAK5mfQVKUFw8bNA59Ww==
X-CSE-MsgGUID: k19li0pDRSa4hYt5U4N3aw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11448006"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="11448006"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 07:16:03 -0700
X-CSE-ConnectionGUID: OnunJYi6SO2zMaB7T4mqIA==
X-CSE-MsgGUID: RMcCplcqTh2RaxZBLq1zBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="33805217"
Received: from mbernato-z370.igk.intel.com (HELO localhost) ([10.91.214.41])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 07:16:01 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH i-g-t] lib/igt_sriov_device: Adjust the igt_sriov_is_pf
 function
Date: Thu,  9 May 2024 14:15:56 +0000
Message-ID: <20240509141556.4128166-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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

A device is considered a PF if it supports the creation of one or more
VFs. This capability is indicated by the presence of the sriov_totalvfs
attribute in the device's sysfs entry, with a value greater than zero.
The igt_sriov_is_pf function checks for this attribute and its value to
confirm the device's PF status.
This adjustment streamlines the process for tests that manipulate Virtual
Functions (VFs) by consolidating prerequisite checks into a single
`igt_require(igt_sriov_is_pf)`.

Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/igt_sriov_device.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index a0ef05d5c..8d59bfdca 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -19,23 +19,25 @@
  * igt_sriov_is_pf - Check if device is PF
  * @device: device file descriptor
  *
- * Determine if device is PF by checking existence of sriov_totalvfs file.
+ * Determines if a device is a Physical Function (PF) by verifying
+ * the presence of the sriov_totalvfs attribute and ensuring its
+ * read value is greater than zero.
  *
  * Return:
  * True if device is PF, false otherwise.
  */
 bool igt_sriov_is_pf(int device)
 {
+	uint32_t value = 0;
 	int sysfs;
-	bool ret;
 
 	sysfs = igt_sysfs_open(device);
 	igt_assert_fd(sysfs);
 
-	ret = igt_sysfs_has_attr(sysfs, "device/sriov_totalvfs");
+	__igt_sysfs_get_u32(sysfs, "device/sriov_totalvfs", &value);
 	close(sysfs);
 
-	return ret;
+	return value > 0;
 }
 
 static bool __pf_attr_get_u32(int pf, const char *attr, uint32_t *value)
-- 
2.31.1

