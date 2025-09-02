Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABFBCA0FFE
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 13:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66A710E1D2;
	Tue,  2 Sep 2025 13:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQ2Qc1wX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF9810E1D2
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 13:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756818070; x=1788354070;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=otJFnrJqX6ffrkZ2aial5tYkStb0j44zVYlTndwEeZo=;
 b=IQ2Qc1wX2tQMC04JqgSSaKmgyRGmpbc9IRAD+8PaXl21PxSX323L78+x
 jV15XrlZUEkvHX8de9lR32IVy9LPwCAqs29rz+Zx7GPWOnyAdPCJy7c6F
 uOOHppRV1l5R9WhbBtTmjMwN3s6GzTSqZbURG23ZllV0YHjrvl/91RD8g
 FM8/2hJ8j5T3LfcA4Xu95AR8oyIa4SBsTMbdxgm8sxtB8HKSKRsmDD6uB
 /VaT5fnVnqs6yuFNhR2hgFZd1S0Rt4wel3tD+lyEAVvxMPTswam05vBwD
 R5j69sw0HN3v+tkrS+fl/GcyLjjqFQ6hkxkVMyeRYVAYUwPfSIUCBaLE3 g==;
X-CSE-ConnectionGUID: r7IMz9mGQYyjftgSLUtmVA==
X-CSE-MsgGUID: VWCfOxH7TMSIe0apuSxGvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59156088"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59156088"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 06:01:10 -0700
X-CSE-ConnectionGUID: pw/t3SyoQYmodhT1ZUpVww==
X-CSE-MsgGUID: OtUqDYvURL+Zg2RKgEPM9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="175407132"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.245.33])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 06:01:09 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t] intel-ci: Unblock the xe_evict multi-thread tests
Date: Tue,  2 Sep 2025 15:00:29 +0200
Message-ID: <20250902130029.70621-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

With xe exhaustive eviction nearing merging, unblock the
xe_evict tests that saw failures due to lack of exhaustive eviction.

Initially this patch will be used with Test-with: tags.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 14e0b9482..47cb7458a 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -110,10 +110,3 @@ igt@sriov_basic@enable-vfs-autoprobe-on$
 igt@sriov_basic@enable-vfs-bind-unbind-each$
 igt@sriov_basic@bind-unbind-vf$
 ##################################################################
-# Exclude xe_evict tests that are not expected to succeed
-# due to missing TTM exhaustive eviction
-##################################################################
-igt@xe_evict@.*-multi-vm-cm.*
-igt@xe_evict@.*-threads-.*
-# igt@xe_evict@.*-cm.* # Rebind and VM_BIND may race.
-##################################################################
-- 
2.50.1

