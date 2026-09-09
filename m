Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1C8C79F82
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 00:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F5210ECCD;
	Wed,  9 Sep 2026 00:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NK05s+9S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98ABC10E183
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 00:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788913631; x=1820449631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vi5VSDei1EWJVZ4WzZd4dTroCXR6ZFWaK8ko05CmT9Y=;
 b=NK05s+9SXmBDKh1UUO2aV13otXzELelju+a9RCWRESC1+BlNtfydKArV
 Wto/7LelJPeBgNJSiW87S0eJX17X1h4ULJRWstokghNKmRqLRx3ll64IX
 zWdtXLhtec8l5KtBohWe17i6XqOvwrhqzxmWIjudlnF+/188ViUg8fE9L
 h1CAXDCNMMpbX8CsJ+FU6/WfkyTAPWzTBflrhUMjNQhqX3j+7HRG+4qIj
 Bc94Q2aeCUs73PCiocxX+he9vunforO2XXlhMtrx4ONEZTPX6ah+huG5i
 Chki5YLl/FQeieE1mW7XppTVn9Z40IMaya+QmLyf8buT+q4bnOd5UFJGQ w==;
X-CSE-ConnectionGUID: cE2MVlYkRhyLYfIqbGLRfg==
X-CSE-MsgGUID: eQZ/itU5TAmKXrqb3Cij2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88265128"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="88265128"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 17:27:11 -0700
X-CSE-ConnectionGUID: 8Xq8ID2zSGKN7InHRW4cLA==
X-CSE-MsgGUID: vBGT/h1FRyCHbOxaZo1ZUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="267905637"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by fmviesa007.fm.intel.com with ESMTP; 08 Sep 2026 17:27:11 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH i-g-t v2 3/3] tests/intel-ci: Allow PXP negative testing on
 CRI.
Date: Tue,  8 Sep 2026 17:27:06 -0700
Message-ID: <20260909002705.431136-8-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909002705.431136-5-alan.previn.teres.alexis@intel.com>
References: <20260909002705.431136-5-alan.previn.teres.alexis@intel.com>
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

igt:xe_pxp:pxp-bo-alloc/pxp-queue-alloc subtests should be run
on platforms that don't support PXP since they would perform
negative testing.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/intel-ci/xe.cri.core.blocklist.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-ci/xe.cri.core.blocklist.txt
index 12085c4df..4172f055b 100644
--- a/tests/intel-ci/xe.cri.core.blocklist.txt
+++ b/tests/intel-ci/xe.cri.core.blocklist.txt
@@ -9,11 +9,11 @@ igt@fbdev@.*
 # Valid skip: Features / hardware blocks not present on CRI
 #   - xe_huc_copy@: No HuC support on CRI.
 #   - xe_oa@oa-tlb-invalidate: valid only for older gen12 platforms.
-#   - xe_pxp@.*: No PXP (Protected Xe Path) support on CRI.
+#   - xe_pxp@.*: No PXP on CRI so skip except negative-pxp tests
 ##################################################################
 igt@xe_huc_copy@.*
 igt@xe_oa@oa-tlb-invalidate
-igt@xe_pxp@.*
+igt@xe_pxp@(?!pxp-bo-alloc$|pxp-queue-alloc$).*
 ##################################################################
 # Valid skip: multigpu runs in separate config
 ##################################################################
-- 
2.43.0

