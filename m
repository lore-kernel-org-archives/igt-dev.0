Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091E5606A32A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 09:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZaF3+XTn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB30F10EC19;
	Wed, 18 Nov 2026 09:25:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FE910E77D
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 09:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794993857; x=1826529857;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P5DR8uB7x9hx9QWba6yWEhvVzsbD2KaA76axrXnWn0s=;
 b=ZaF3+XTn6jKHkU0+yOqwMKYOh/WlR4cWt/7lg/zs6vP+H8pwSoDg5zhB
 D2avZ68VePVSSSA0BtM3nVDJ8tYlom0g45oMD9Sg8mI6yGLbXygqcS/7R
 BrFYMlFYpiBMZXIxxAZmRbQ6Xv9/pinAZJ7kWgIWITozAA/9ugEKUnJeb
 h/53nBchDhfAz1HPDzX7vuZ3rwEb8cFd/tqA51JSoHgp5FfPqf86w7u5P
 YEs3eldoO0E4Vcq+/jH9wA9kSwf4kyU74RF53zcHTYAIKx0DBrnjNsaZw
 EZ1Sd6hvKbuTypD37ba9Tmj0/PQ4ntyyIaJQzJqoSPHNmHri6K4zWT2RB A==;
X-CSE-ConnectionGUID: pFx1DHY4QDSS9eqw4TgD7w==
X-CSE-MsgGUID: +Kqh5lmHSsarVVcM2rP95w==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3834937"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3834937"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 01:24:14 -0800
X-CSE-ConnectionGUID: qREzTGP1TPmvpnQIF7LCjw==
X-CSE-MsgGUID: uyHt3CnGRFu/dwKFspWz5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10624831"
Received: from vmuppidi-nuc8i7beh.iind.intel.com ([10.223.55.76])
 by fmviesa010.fm.intel.com with ESMTP; 18 Nov 2026 01:24:11 -0800
From: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramadevi.gandi@intel.com, himanshu.girotra@intel.com,
 Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
Subject: [PATCH i-g-t] intel-ci: Update CRI and NVL core blocklists
Date: Wed, 18 Nov 2026 14:57:18 +0530
Message-ID: <20261118092718.503212-1-venkateswara.rao.muppidi@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add below entries to the CRI/NVL core blocklist for tests that are not
applicable on this platform:

CRI:
- xe_vm@overcommit.*: the overcommit subtests create an eviction
  footprint larger than 50% of system RAM, which is not valid on
  current CRI system.
- xe_mmap@small-bar: the subtest requires the CPU-visible VRAM size
  to be smaller than the total VRAM. On current CRI
  systems vram_bar_size = total VRAM by default, so the precondition
  is never met and the subtest always skips.
- xe_vm@single-op-map-mirror-over-bound: SCRATCH_PAGE combined with
  FAULT_MODE is not supported on Xe3+ and is rejected by the KMD.

NVL:
- xe_vm@single-op-map-mirror-over-bound: same SCRATCH_PAGE + FAULT_MODE
  restriction as above.

Signed-off-by: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
---
 tests/intel-ci/xe.cri.core.blocklist.txt | 14 ++++++++++++++
 tests/intel-ci/xe.nvl.core.blocklist.txt |  5 +++++
 2 files changed, 19 insertions(+)

diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-ci/xe.cri.core.blocklist.txt
index 41328186c..6b77523d6 100644
--- a/tests/intel-ci/xe.cri.core.blocklist.txt
+++ b/tests/intel-ci/xe.cri.core.blocklist.txt
@@ -62,3 +62,17 @@ igt@xe_page_reclaim@.*
 igt@xe_pat@l2-flush-opt-svm-pat-restrict
 igt@xe_pat@xa-app-transient-media-(off|on)
 ##################################################################
+# Valid skip: when eviction footprtint > 50 % of RAM
+##################################################################
+igt@xe_vm@overcommit.*
+##################################################################
+# Valid skip: Current CRI systems CPU-visible (vram_bar_size)
+# is set to total vram as default
+#################################################################
+igt@xe_mmap@small-bar
+##################################################################
+# Valid Skip: SCRATCH_PAGE + FAULT_MODE not supported on Xe3+
+# and rejected by KMD
+##################################################################
+igt@xe_vm@single-op-map-mirror-over-bound
+##################################################################
diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
index 91f9b1a47..8ce0b09b5 100644
--- a/tests/intel-ci/xe.nvl.core.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
@@ -111,3 +111,8 @@ igt@xe_wedged@cold-reset-wedged
 ##################################################################
 igt@xe_err_injection@.*
 ##################################################################
+# Valid Skip: SCRATCH_PAGE + FAULT_MODE not supported on Xe3+
+# and rejected by KMD
+##################################################################
+igt@xe_vm@single-op-map-mirror-over-bound
+##################################################################
-- 
2.43.0

