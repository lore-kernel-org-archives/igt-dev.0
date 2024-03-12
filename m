Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE747C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 14:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9359D112CE9;
	Tue, 12 Mar 2024 14:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4eHYAY5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36232112E50
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 14:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710252963; x=1741788963;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VNBjWeBcvAnnv/P47h3V89pygDW3leT+Q1Z7+22JgPQ=;
 b=U4eHYAY5qrCbM6KDDkrcSZyDWewmCIXXNJncFLY8eZWE95Z7r0oRI709
 fC5Wak6zAT1ngYa0Jv/cikS7mNUlHl6OeLMpbVgTYmnERzlE6um7jt5Zi
 Q9nFR1Q9wXxCd0QWPgH3byIZOP0KNu1UDLY1TXrPz+IEVWwbFNu3cgRGI
 Pk76NrnecR9C87nEVOSICLiTUatXxs11n8hCUYAReSf6jcCuBRwZhWSQf
 NcZ9RyIMnO73JIMgUwOZjU15VgjNWzEcZtHoJ38dxJ802QCrrd5/4ooAE
 u8QRUaeLKBwIOymw/NTKEwr8QsbuedGRb3tEmGyk8tKwzIvM0cKVgbg7r Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5133394"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5133394"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:15:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11522046"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:15:35 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v3 07/25] tests/intel: Introduce GPGPU subcategory
Date: Tue, 12 Mar 2024 14:14:01 +0000
Message-Id: <20240312141419.1277931-8-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
References: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
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

