Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED2FC54E5D
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 14:15:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB66911227B;
	Tue, 12 Mar 2024 14:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aMWZd4Wa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411A7112E5D
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 14:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710252957; x=1741788957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F1BlH9SF/IWEuI4oM1+tRmSwxN16A+Fvrz7tqlM2dkc=;
 b=aMWZd4WaEpWh24Li52lMBPlE+hHptefVjs89XkF7xYzCE6V9CrTI6w07
 TTpsCoHadGCzwXf2JtGbcKgnw64nrjXrUmCgN2zUc2CrQsNbnflxMN+/B
 Vh9A5Gf9kSNUczzvpcNG6Pm4SKhGk3P20/4MfRcCLu4ozF39KHlOR49LQ
 ZihAJrlzvQkEb9XwNvo2Szrjx4dZU7eV3063SMfarDVHtV1J7wKMnNHcE
 yIllXz1zZLiU5t7FQ5gYwfS+HAyqapHxmwSMCH7cwdNND0oHK1z5a9RzZ
 O9ViwaViKnB1tUnCIheNvyAia3r1NuvkKy+YHKUTiXqPylW92OXwzoOLy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5085600"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5085600"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:15:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11474556"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:15:17 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v3 05/25] tests/intel: Let's introduce Workarounds
 subcategory
Date: Tue, 12 Mar 2024 14:13:59 +0000
Message-Id: <20240312141419.1277931-6-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
References: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
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

There is gem_workaround test that deserves it's own subcategory.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_workarounds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
index d83c0a1db..43146f4b9 100644
--- a/tests/intel/gem_workarounds.c
+++ b/tests/intel/gem_workarounds.c
@@ -36,8 +36,8 @@
  * TEST: gem workarounds
  * Category: Infrastructure
  * Feature: workarounds
- * Functionality: workarounds
- * Sub-category: Context
+ * Functionality: context
+ * Sub-category: Workarounds
  * Test category: GEM_Legacy
  * Run type: FULL
  *
-- 
2.34.1

