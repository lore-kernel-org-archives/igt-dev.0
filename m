Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94773C61DD3
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 21:52:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1D810E535;
	Thu,  3 Sep 2026 21:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bmZGcSjL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B7810E094
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 21:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788472163; x=1820008163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vi5VSDei1EWJVZ4WzZd4dTroCXR6ZFWaK8ko05CmT9Y=;
 b=bmZGcSjLewi8IyqhK6WfbpmPWCntucG3gbkHekVAKax8TJEDyLtb+e7b
 ZR2765HYyUS1+BJsosE0ns/+xToJF8w3DwIH0gtlDtUDyaDzUFpc0nxMG
 QBpb4Fm2Go1u8yT0X/ArSak4HvFnBI+xQiFnaN4Z+rwt2Hlv1X95Cr84R
 V8s3Cqzb/c6tIvW3gUEWP//kikTPLE74TH1il6dCgdK7nW5xapD3NQ8TX
 Mkvd4qCwhoUOTZUSuE6sNkMpY48cX6vmrOUAyw0N6WG/u7R+FHZVyVMEO
 BGNogtZU5S95YJpJ/xp/0CooSYEjv67zej0L4U12GW8//5Yz+rQbRO5ki w==;
X-CSE-ConnectionGUID: X0j21MeUTg2himdh9iqYMg==
X-CSE-MsgGUID: Y6lj2ybmRYqkkpRxcd26Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="89003168"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="89003168"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 14:49:23 -0700
X-CSE-ConnectionGUID: Qw5W7WYNTFiDhWa+yV5KXg==
X-CSE-MsgGUID: K6sV7i1aRXihsSo9/2Ny2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="299707533"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by orviesa002.jf.intel.com with ESMTP; 03 Sep 2026 14:49:23 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel-ci: Allow PXP negative testing on CRI.
Date: Thu,  3 Sep 2026 14:49:20 -0700
Message-ID: <20260903214919.1005742-8-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903214919.1005742-5-alan.previn.teres.alexis@intel.com>
References: <20260903214919.1005742-5-alan.previn.teres.alexis@intel.com>
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

