Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3F3C5CFCF
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 16:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499D910E188;
	Fri, 14 Aug 2026 16:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PcEZhccc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA79210E11F
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 16:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786723612; x=1818259612;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=EuMv2Yz3818ZMV72ValEz5azWOwl3e9pWiBtB9kdHqM=;
 b=PcEZhccc7knesdegNN03fCfV8Bpf0uaKiMAuQyUOsTxo6PXb97b/+/Fz
 PBGW9cEyEav8e2Svs9fz6NEX+b8L0bfvrzuKYtICpCCJEuO7fuMAuJ6HS
 sDE6HWaSU2FPPFyxgtGC7bWW2wH22emsWKXaeEPfA4jPbwNJCTsQpANv3
 WwCnAhUSe10z6vx6K3XIEcIia1QA2VvN58Tndyn2PDPjheds8fiSkRxs8
 JZmfxLP4qBoA/QcUk7KQOYCe47prAJAk8PIbow7iATcOpf1GPaAvdmY/N
 XJqzmyXvdYaYAf1zelEYB554y0qG39SkUPcmAik1crk0qqRnQ9OrvTDDw g==;
X-CSE-ConnectionGUID: m4wffnnKS+2yXRiGKPR3LQ==
X-CSE-MsgGUID: J8b2VJEQRDuHreSSbcEGlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="97893314"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="97893314"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 09:06:52 -0700
X-CSE-ConnectionGUID: hzC/c/6HSUqOqqRTt0JWxQ==
X-CSE-MsgGUID: lPHAvGb/R5uDUwlkEm3IZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="289059945"
Received: from unknown (HELO himanshu-H97M-D3H.iind.intel.com) ([10.223.55.10])
 by fmviesa001.fm.intel.com with ESMTP; 14 Aug 2026 09:06:52 -0700
From: himanshu.girotra@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Subject: [PATCH i-g-t 2/2] intel-ci: Add xe.cri.core.blocklist to config.json
Date: Fri, 14 Aug 2026 21:36:48 +0530
Message-ID: <20260814160648.19715-3-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814160648.19715-1-himanshu.girotra@intel.com>
References: <20260814160648.19715-1-himanshu.girotra@intel.com>
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

Add xe.cri.core.blocklist to xe_test_config.json file so that
core testlists can be generated for CRI for CI execution.

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel/xe_test_config.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index 55542655c..43c758f5c 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -79,6 +79,7 @@
 		    "include": [
 			{ "LNL": "../intel-ci/xe.lnl.core.blocklist.txt" },
 			{ "BMG": "../intel-ci/xe.bmg.core.blocklist.txt" },
+			{ "CRI": "../intel-ci/xe.cri.core.blocklist.txt" },
 			{ "NVL": "../intel-ci/xe.nvl.core.blocklist.txt" },
 			{ "PTL": "../intel-ci/xe.ptl.core.blocklist.txt" },
 			{ "WCL": "../intel-ci/xe.wcl.core.blocklist.txt" },
-- 
2.50.1

