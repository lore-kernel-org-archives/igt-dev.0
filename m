Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C888C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 12:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0FA10E036;
	Wed, 26 Mar 2025 12:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DKII/y1c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FAB10E036
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 12:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742990542; x=1774526542;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EAFsbsNj/AT0rzmZv0lqX6msEyTMVOCQP209F9xSkqk=;
 b=DKII/y1cSgs1sa7qCuqu9bJO4epX3EP5+kMoDCaJYxIwlxkFI4vMWmpD
 SCABSOd8sX8BoBlsTSzA9nvm+SlF623RlWS+/BShTcxzc5nNYWXqqE4AK
 T60JxNFaiTg7eg0M3SY490lVx3amIkwarI/xeahyi2s9eeMrerNOUb8Ee
 VHAd5QWR+t6rRzcCjOFzZoZRJRvvI4m1tYtuNOpKMAijan9KgJx+gw6MY
 8tMbP7u/BvQRr2Kayu86IciOBA84n0aTHNghnq4yaGq0AcmkYFRYSCRcu
 kyPMdrbdC42pFV5LS/VJB4Rz7+DGV89s9yeM2wQdkxWoZp6WcRnG+1LIX w==;
X-CSE-ConnectionGUID: HQuDe48wRGWVSaXXbjBAXg==
X-CSE-MsgGUID: 2Jj6PMLDT+ehSga/JpPHsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44161517"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="44161517"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 05:02:22 -0700
X-CSE-ConnectionGUID: TCPp8jW/S2eX8iYxox7eQQ==
X-CSE-MsgGUID: escSqPsRSzqFZX94P2a+PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="155754744"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.3.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 05:02:20 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Subject: [PATCH i-g-t] tests/intel-ci/xe-sriov-vm.blocklist.txt: Blocklist for
 SR-IOV VM runs
Date: Wed, 26 Mar 2025 13:02:14 +0100
Message-Id: <20250326120214.180586-1-marcin.bernatowicz@linux.intel.com>
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

This file contains tests that are not applicable for QEMU Virtual Machine
(VM) runs. It extends xe.blocklist.txt and should be kept as minimal as
possible.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel-ci/xe-sriov-vm.blocklist.txt | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 tests/intel-ci/xe-sriov-vm.blocklist.txt

diff --git a/tests/intel-ci/xe-sriov-vm.blocklist.txt b/tests/intel-ci/xe-sriov-vm.blocklist.txt
new file mode 100644
index 000000000..e55fcd3f8
--- /dev/null
+++ b/tests/intel-ci/xe-sriov-vm.blocklist.txt
@@ -0,0 +1,7 @@
+##################################################################
+# Block list for VM runs
+##################################################################
+#
+# VLK-69956 - rtcwake does not wake the VM from s2idle
+#
+igt@xe_pm@s2idle.*
-- 
2.31.1

