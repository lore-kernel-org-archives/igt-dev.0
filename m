Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A1FC54E41
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 07:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092AB10E13F;
	Thu, 29 Feb 2024 07:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TnX2o1oM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CE410E13F
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 06:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709189998; x=1740725998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding:sender;
 bh=rbNjjU9ES00gL4Lo3w/9wYpantm0CABX8oQEikMUnbI=;
 b=TnX2o1oMA1Yd/750xEgmv7yacBscsKQyJMnC9SRQbqUKFGQWHEwLvfeX
 qR0k66UpghmZkipLTijK6/vg5RkU/o7l25wW/hO4TUBhL0Jg9Bmgu7umE
 e7rKfLHUnNIyR5KmbKr8Sz+ESWDvAvX73FbbuYrT1OFSobRg1V5BzUvkV
 dR7hZEOD4pvMNCDkAfvXIKmmf/jGJMZ83qSCBci5hr4qJm3yIf4OLRAPj
 8uFOz0Waob2jjeXdBsyaad42ZXvD3PI4KQ30gs4FZo/X9gryAtTOBupf7
 p4p780Wqodi2L2fGqX8URCu3r3mSjDJRg6phGQ8IGp8lD3DX/x1Q8KoEH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3755979"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="3755979"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 22:59:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="7640490"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 22:59:57 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 44984580DAB;
 Wed, 28 Feb 2024 22:59:57 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rfaOY-00000002GEj-3g4X; Thu, 29 Feb 2024 07:59:54 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 1/4] tests/intel/xe_query: use Hardware building block
 for MultiGPU
Date: Thu, 29 Feb 2024 07:56:16 +0100
Message-ID: <20240229065953.538861-2-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240229065953.538861-1-mauro.chehab@linux.intel.com>
References: <20240229065953.538861-1-mauro.chehab@linux.intel.com>
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Currently, the MultiGPU sub-category is defined category to be either:

	- Hardware building block; or
	- Software building block

As this is a hardware feature, use the first for all such tests.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel/xe_query.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 9a6799c8473a..5807fe3ed27f 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -176,6 +176,7 @@ const char *get_topo_name(int value)
  * Test category: functionality test
  *
  * SUBTEST: multigpu-query-engines
+ * Category: Hardware building block
  * Description: Display engine classes available for all Xe devices.
  * Test category: functionality test
  * Sub-category: MultiGPU
@@ -203,6 +204,7 @@ test_query_engines(int fd)
  *	and alignment.
  *
  * SUBTEST: multigpu-query-mem-usage
+ * Category: Hardware building block
  * Test category: functionality test
  * Sub-category: MultiGPU
  * Description: Display memory information for all Xe devices.
@@ -267,6 +269,7 @@ test_query_mem_regions(int fd)
  * Description: Display information about available GT components for xe device.
  *
  * SUBTEST: multigpu-query-gt-list
+ * Category: Hardware building block
  * Test category: functionality test
  * Description: Display information about GT components for all Xe devices.
  * Sub-category: MultiGPU
@@ -309,6 +312,7 @@ test_query_gt_list(int fd)
  * Description: Display topology information of GT.
  *
  * SUBTEST: multigpu-query-topology
+ * Category: Hardware building block
  * Test category: functionality test
  * Description: Display topology information of GT for all Xe devices.
  * Sub-category: MultiGPU
@@ -358,6 +362,7 @@ test_query_gt_topology(int fd)
  * Description: Display xe device id, revision and configuration.
  *
  * SUBTEST: multigpu-query-config
+ * Category: Hardware building block
  * Test category: functionality test
  * Description: Display config information for all Xe devices.
  * Sub-category: MultiGPU
@@ -412,6 +417,7 @@ test_query_config(int fd)
  * Description: Display hardware configuration of xe device.
  *
  * SUBTEST: multigpu-query-hwconfig
+ * Category: Hardware building block
  * Test category: functionality test
  * Description: Display hardware configuration for all Xe devices.
  * Sub-category: MultiGPU
@@ -451,6 +457,7 @@ test_query_hwconfig(int fd)
  * Description: Check query with invalid arguments returns expected error code.
  *
  * SUBTEST: multigpu-query-invalid-query
+ * Category: Hardware building block
  * Test category: negative test
  * Description: Check query with invalid arguments for all Xe devices.
  * Sub-category: MultiGPU
@@ -474,6 +481,7 @@ test_query_invalid_query(int fd)
  * Description: Check query with invalid size returns expected error code.
  *
  * SUBTEST: multigpu-query-invalid-size
+ * Category: Hardware building block
  * Test category: negative test
  * Description: Check query with invalid size for all Xe devices.
  * Sub-category: MultiGPU
@@ -497,6 +505,7 @@ test_query_invalid_size(int fd)
  * Description: Check query with invalid extension returns expected error code.
  *
  * SUBTEST: multigpu-query-invalid-extension
+ * Category: Hardware building block
  * Test category: negative test
  * Description: Check query with invalid extension for all Xe devices.
  * Sub-category: MultiGPU
@@ -661,6 +670,7 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
  * Description: Query CPU-GPU timestamp correlation
  *
  * SUBTEST: multigpu-query-cs-cycles
+ * Category: Hardware building block
  * Description: Query CPU-GPU timestamp correlation for all Xe devices.
  * Sub-category: MultiGPU
  */
@@ -681,6 +691,7 @@ static void test_query_engine_cycles(int fd)
  * Description: Check query with invalid arguments returns expected error code.
  *
  * SUBTEST: multigpu-query-invalid-cs-cycles
+ * Category: Hardware building block
  * Description: Check query with invalid arguments for all Xe devices.
  * Sub-category: MultiGPU
  */
-- 
2.43.2

