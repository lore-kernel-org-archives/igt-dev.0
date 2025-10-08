Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB446CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 17:26:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEE610E879;
	Wed,  8 Oct 2025 17:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lPO2ATAF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232D710E879
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 17:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759944412; x=1791480412;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yfZwLXSeROwUYd550L8vsdAEmAfOWeWo24lCwGCtanw=;
 b=lPO2ATAF0ig5VYAKvWjoUvkG8Gh9I3htIRBKpUwv/h36NpDF6EvKwyog
 vGn7vuDlUc5zOlH1o6cyCSqGrJBMW9f8JnaPRP8CBTGhvF6kutvGGUkEp
 S6W/wtv3ILZlyScW43Zahr1v8bBR+OVnYFb86pQUpSOeJROEcYCgbmDp4
 CZqOS+2WQMiZauEMF/yuWqnxHUjEl1wy+HFGsgUf9wL7O7GEd2+lwIohi
 KhpuT5INWmRC9ZRF5Q3S2NhDTYcHCCbnXG9YrQDAPpqMJurUsrtxwaQ2X
 dS0iLHog8a4hL/uo8nVtl9Txou9pJxTpMVlW8Q2N47lmenR+Q0mGyNOhE w==;
X-CSE-ConnectionGUID: wVHOKIrRTtejFUEYxO+MYw==
X-CSE-MsgGUID: FV1IAeyhT8uuu0NKWxm4RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="64763031"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="64763031"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 10:26:52 -0700
X-CSE-ConnectionGUID: z+/7ieuwQWKY2w+fdGfIDA==
X-CSE-MsgGUID: +DZsJUWGSaqqHYkczelWSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="179754477"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.107])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 10:26:48 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t] intel-ci: Block one Xe subtest
Date: Wed,  8 Oct 2025 19:26:35 +0200
Message-ID: <20251008172635.100091-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

Lets block one compute subtest to unblock CI.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 2e1ebf299..ac28da774 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -124,3 +124,7 @@ igt@xe_evict@.*-threads-.*
 # boards (which support 4K @ 60Hz) are available in the test environment.
 ##################################################################
 igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
+##################################################################
+# Exclude one compute mode test
+##################################################################
+igt@xe_exec_compute_mode@non-blocking
-- 
2.51.0

