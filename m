Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA0AC54E60
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 14:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7375C10FBAD;
	Thu, 14 Mar 2024 14:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="id9D6vKW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A511F10FBAD
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 14:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710426981; x=1741962981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VNBjWeBcvAnnv/P47h3V89pygDW3leT+Q1Z7+22JgPQ=;
 b=id9D6vKWzt48TjeV+X3Pc1sIOnm2n7YD6eZL06fc3GvbHEAi57nGAK94
 Tn53LauE2/btIRTP+kyJI8QaongJ8kXCx9ED42do8AYypRLW5SR73mNKI
 R38agzQj5aDZKlaTbexrASknoRne4C6SPpHI6FntUEfJ7xe9NEt8pxq1l
 jRIVe6wAkkoeLXz6Np7e9BDlcAzITtQ8vNZ871dSE2reqruqS4INJkzhy
 VDE0ZKhGp5/6JuIuOEPdpNf7T+tSrPEGP+g6pVV7dLzOZaNpmx1i3bi2j
 fsQWo4SI0n8Af1iK80lTVzO3WnysULq1y4KIex4bpvJD9Q+inLJGWKUwA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="16697638"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16697638"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:36:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12233907"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:36:19 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v4 07/25] tests/intel: Introduce GPGPU subcategory
Date: Thu, 14 Mar 2024 14:34:37 +0000
Message-Id: <20240314143455.1436688-8-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
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

Let's introduce GPGPU subcategory.

v2: functionality s/gpgpu/gpgpu_fill/ to not trouble automation tools

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/gem_gpgpu_fill.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
index ac283620e..3a6d66b35 100644
--- a/tests/intel/gem_gpgpu_fill.c
+++ b/tests/intel/gem_gpgpu_fill.c
@@ -51,13 +51,13 @@
 /**
  * TEST: gem gpgpu fill
  * Category: Server
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: Compute
+ * Functionality: gpgpu_fill
+ * Sub-category: GPGPU
  * Test category: GEM_Legacy
+ * Feature: compute
+ * Run type: FULL
  *
  * SUBTEST: basic
- * Feature: compute
  */
 
 #define WIDTH 64
-- 
2.34.1

