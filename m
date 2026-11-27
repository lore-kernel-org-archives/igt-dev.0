Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C6B606A31E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 12:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AxrCdoOR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88C710E568;
	Fri, 27 Nov 2026 12:25:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C9B10E568
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 12:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795782262; x=1827318262;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SBckZniqmbi6pKKwNyQCQPfQRZ2qQ7h1si86bI8ZCwg=;
 b=AxrCdoORifA5fPcAybEZZU50/4vkSJLuPMGbWczMdv430xXLeJw8rdWP
 LY12iskMqMwqpzZ8poscAzJ9ZBRNsPd0pCL/JProxWVL+xTlbwfCVvGq1
 vAyDhZPEtc5eNBhvpjrweBN0sZqSk9XcYkLRYqOu9jUsAuXmyHPwdEvB4
 tX5r8fLnCNT18ERprH8ko5qsfqfS00wUaBR6JFyhj+os8I592Gv4hZGxW
 HtPPAzDNnBDJA91r33aNz5B+U6pnY4AOr+MRvDDHovTXjizvCKa6KD6Sl
 RbM/48YTBUl5lzNDpxt58GCq5TZ5tcXrFPjLGYFqqzJ0rCJGKtWksnMXA w==;
X-CSE-ConnectionGUID: dNYEJIrYTHqfKNaEY/X5QA==
X-CSE-MsgGUID: AMYKjYzNRXqybaRfVPIu8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4538580"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4538580"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:24:22 -0800
X-CSE-ConnectionGUID: mqzA7PHWSeuAsnBrNVVGbg==
X-CSE-MsgGUID: 2v7Il33KRRWBsT0tQbtYbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12525164"
Received: from vmuppidi-nuc8i7beh.iind.intel.com ([10.223.55.76])
 by fmviesa005.fm.intel.com with ESMTP; 27 Nov 2026 04:24:20 -0800
From: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramadevi.gandi@intel.com, himanshu.girotra@intel.com,
 Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
Subject: [PATCH i-g-t v2] intel-ci: Update blocklist for CRI core
Date: Fri, 27 Nov 2026 17:58:18 +0530
Message-ID: <20261127122818.5410-1-venkateswara.rao.muppidi@intel.com>
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

Add two more valid skips to the CRI core blocklist:

- xe_evict@evict(-beng)?-large-multi-vm(-cm)?: bo_size is 3/8 of VRAM,
  which exceeds the usable system memory on CRI. The working set size
  evaluates to zero and the test skips.
- xe_survivability@runtime-survivability: csc_hw_err debugfs support is
  not currently required on CRI, so the test is skipped.

V2:
CPU-bind implementation replaced the legacy GPU-bind mechanism on CRI,
so the test is not applicable.

Signed-off-by: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
---
 tests/intel-ci/xe.cri.core.blocklist.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-ci/xe.cri.core.blocklist.txt
index 6b77523d6..2a708e50e 100644
--- a/tests/intel-ci/xe.cri.core.blocklist.txt
+++ b/tests/intel-ci/xe.cri.core.blocklist.txt
@@ -76,3 +76,17 @@ igt@xe_mmap@small-bar
 ##################################################################
 igt@xe_vm@single-op-map-mirror-over-bound
 ##################################################################
+#Valid Skip: bo_size (3/8 of VRAM) exceeds usable system
+# memory -> ws==0 -> skip
+##################################################################
+igt@xe_evict@evict(?:-beng)?-large-multi-vm(?:-cm)?
+##################################################################
+# Valid Skip: csc_hw_err debugfs support is currently not required
+##################################################################
+igt@xe_survivability@runtime-survivability
+##################################################################
+#Valid Skip: CPU-bind implementation replaced legacy GPU-bind
+# mechanism
+##################################################################
+igt@xe_vm@bind-array-enobufs
+##################################################################
-- 
2.43.0

