Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957BEC5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 11:18:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420BD112008;
	Mon,  4 Mar 2024 11:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lIAVuGsS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13336112008
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 11:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709551097; x=1741087097;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nfNCls6gGPo90Qc2tpjEZMFkOvfUb8abIs15MxtfbIs=;
 b=lIAVuGsSbBj4K12CTd74h1WQAcAeIBEKlh+FaWgdXcvwqNaWbnsOmCsx
 jZ3V/iKafro621CutyhKMaVvD4tbrr4BT2ncQm74pvrFEvrzNgexEnEsG
 QalcziVBXpp3CPwjsMQkLq6/UxJfOyM8Jv7wsJ6DXaAi95Un0Q7j8Ip2i
 AHuDVsstX6+vqlTJ2QJ3ntOMAFg+LsbF8DUbdmzr4wPfUwRz9MqRvxRnQ
 nPa2g5F5QH/PW4yzCdGvclnB7f8i3xrayc0lekq36pOOFw0XZismjI58c
 m5KrgzlzvI4/kJDYsYUjuJ3zq0TTG65VQBD5Ntlu4fB73GXalyUkEbZEh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="15445003"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="15445003"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:18:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9104924"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:18:15 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 10/24] tests/intel: Introduce Flat-ccs subcategory
Date: Mon,  4 Mar 2024 11:16:03 +0000
Message-Id: <20240304111617.849785-11-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
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

Let's introduce flat-ccs subcategory.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/gem_ccs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
index 3442ecfd3..e6257aeac 100644
--- a/tests/intel/gem_ccs.c
+++ b/tests/intel/gem_ccs.c
@@ -20,6 +20,9 @@
  * TEST: gem ccs
  * Description: Exercise gen12 blitter with and without flatccs compression
  * Feature: flat_ccs_mapping
+ * Sub-category: Flat-ccs
+ * Category: Desktop \ Server
+ * Functionality: block-copy
  * Run type: FULL
  *
  * SUBTEST: block-copy-compressed
-- 
2.34.1

