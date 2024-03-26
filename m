Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E257CD11DF
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 09:30:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C9410EDF3;
	Tue, 26 Mar 2024 09:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/dC3V2W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD41A10EDF3
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 09:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711445402; x=1742981402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8ekSNfuzaJ5cILYRVHcwp00Cg6fyb04dT53bQpv/324=;
 b=S/dC3V2WK9sVb5RkMg1LHabEvqNKE31YzuYMrmzuq4EIo3fWUrvpNOPA
 CQ4Enz1H1qHDhz2Cfi0dQXFcT/AKIbweZFfHXBy/AEaxRLf+sPSRIK/4w
 a16JAV/MPNVscxvjXY1YOthhtxY17uT5L/04fw/tZ6avMrN/p0H0zjT4r
 hQtGHR0tSuAh47hphV1D7kNG7qgKk6w9UxqZSM/uPLuGlpKOCIpcLywpT
 VCgt9J5rwJhqFV4mxIO9By+7cz7tHiJINkoj19kNRd7pP39wFV2b5DFtN
 EsLiOrlVyTKJcY9uaBtLI5ZW6BsxRRJyFx/kTZajoMsNagrCak453BEmV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6378610"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6378610"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="15964940"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:29:59 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t v2 05/13] tests/intel: Let's have Firmware subcategory
 in Xe tests as well
Date: Tue, 26 Mar 2024 09:28:59 +0000
Message-Id: <20240326092907.1979345-6-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240326092907.1979345-1-katarzyna.piecielska@intel.com>
References: <20240326092907.1979345-1-katarzyna.piecielska@intel.com>
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

Let's put HUC test to Firmware subcategory to align with i915 docs.
Also change functionality name s/HuC copy/huc copy/ to align with i915
test docs.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_huc_copy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
index ca045c41b..339cf6e5f 100644
--- a/tests/intel/xe_huc_copy.c
+++ b/tests/intel/xe_huc_copy.c
@@ -6,8 +6,8 @@
 /**
  * TEST: Test HuC copy firmware.
  * Category: Firmware building block
- * Sub-category: HuC
- * Functionality: HuC copy
+ * Sub-category: Firmware
+ * Functionality: huc copy
  * Test category: functionality test
  * TODO: make the test more generic, getting rid of the PCI ID list
  * GPU requirements: This test currently requires TGL, and runs only if the
-- 
2.34.1

