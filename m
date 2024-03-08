Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3F4C54E4A
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 08:38:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3373113629;
	Fri,  8 Mar 2024 08:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZTk2F3KF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588EC113611
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 08:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709887098; x=1741423098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sbSnypbUrtzohOo2s7ORwfYmUWxHFmgkHmD05YG39wA=;
 b=ZTk2F3KFY87bSks7iTUdQxX99FYJIPsN0OnZYkgF2DXfURfs/iVcEEHO
 F5wZuf+b3ZlS+5MFDxjUMhGd1k782USDYQm75Vd2cjK48ASdwgU1U4RZ7
 uVJUy2vUUhEa3UQ0QfwjbprZEYkjJl52Q54mPfSo3XlrRdMeY37Y9Kpk7
 8RfodkC7oJgdl2koOE2QQe4AC9dClRy1Qdm60xQv/p7DSPZqIfaUpRR7F
 lam8O6V1XpySQSnsmNX7gm0Gre0laVQmn4nsOGkLbEB1MU6Tu4loI3ELk
 /LIi6CTAIaOms3BJdVVv7ydLH2rtLke4695xq0O0jPuCGQCH0HQbXus6m g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="27071931"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="27071931"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:38:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10447159"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:38:17 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v2 06/25] tests/intel: Add tests to Compute subcategory
Date: Fri,  8 Mar 2024 08:36:38 +0000
Message-Id: <20240308083657.1092049-7-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
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

Let's add to Compute subcategory:
 - tests/intel/gem_compute.c
 - tests/intel/gem_vm_create.c

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/gem_compute.c   | 2 +-
 tests/intel/gem_vm_create.c | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/intel/gem_compute.c b/tests/intel/gem_compute.c
index 8d0214c4d..8bd9635ae 100644
--- a/tests/intel/gem_compute.c
+++ b/tests/intel/gem_compute.c
@@ -6,7 +6,7 @@
 /**
  * TEST: Check compute-related functionality
  * Category: Hardware building block
- * Sub-category: compute
+ * Sub-category: Compute
  * Test category: functionality test
  * Run type: BAT
  */
diff --git a/tests/intel/gem_vm_create.c b/tests/intel/gem_vm_create.c
index 8834c987f..12503c0e5 100644
--- a/tests/intel/gem_vm_create.c
+++ b/tests/intel/gem_vm_create.c
@@ -30,10 +30,11 @@
 /**
  * TEST: gem vm create
  * Category: Server
- * Functionality: context management
- * Run type: FULL
+ * Functionality: context
  * Sub-category: Compute
+ * Feature: mapping
  * Test category: GEM_Legacy
+ * Run type: FULL
  *
  * SUBTEST: create-ext
  * Feature: mapping
-- 
2.34.1

