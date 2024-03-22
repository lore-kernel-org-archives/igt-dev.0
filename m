Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36593C54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 12:42:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE97010E9C5;
	Fri, 22 Mar 2024 12:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YtK2PLDI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E29410E9C5
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 12:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711111349; x=1742647349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9slPixjGKJoJ1Dwy8Pksi1m9uMOL9C8PHSPPIqgj9to=;
 b=YtK2PLDISKZw3Trj89QAjV1iR1sWOgOgIOv20jhrHzZTbfWv213/6j7A
 GBFMIEQ8r09adF8g3/D80RgQYdOLbtEeJ+12tBAfoVg0Bb+/R574+vIFv
 j3blfyeRwhsTQj+FxFaeFpvKZrzJm77sLST89X/IJORmkSP6NdLicdPG/
 Ao1I3gVms36DRJAFmvW7H0MPGLvruZgOp3yycIhwudsShzNd4cRZD6Ynf
 5pT1fnMorsuiletGb8OOEUCw4+SCI71M2z4PZ0t7V/hf4ME6X8cjrwrAX
 /g3q0CEoWjPF7SXc3XPC1Ds4hJkP91fJDY6IvEWapaMiT6mKmGC1QTfze w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9919383"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="9919383"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:42:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19585955"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:42:28 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t 06/12] tests/intel: Add xe_prime_self_import to DRM
 subcategory
Date: Fri, 22 Mar 2024 12:41:02 +0000
Message-Id: <20240322124108.1825345-8-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
References: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
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

Let's move xe_prime_self_import to DRM subcategory to unify with i915
test documentation.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
---
 tests/intel/xe_prime_self_import.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_prime_self_import.c b/tests/intel/xe_prime_self_import.c
index 8e7290e9e..f47733bb2 100644
--- a/tests/intel/xe_prime_self_import.c
+++ b/tests/intel/xe_prime_self_import.c
@@ -28,7 +28,7 @@
 /**
  * TEST: Check whether prime import/export works on the same device
  * Category: Software building block
- * Sub-category: drm prime
+ * Sub-category: DRM
  * Functionality: prime import/export
  * Test category: functionality test
  *
-- 
2.34.1

