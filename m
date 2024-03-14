Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8DCC54E60
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 14:36:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006C310FBB3;
	Thu, 14 Mar 2024 14:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CcwJ9BQQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA4A10FBB3
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 14:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710427008; x=1741963008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NhaZheHfCyz1/PgBULxh+DVWoGfYV8DClKYswM1fuJI=;
 b=CcwJ9BQQafeFxDU70FxJFLqLSTWTCWGhp96C91WG544Y/1yx6SWcfOZ7
 8udPUswAM4dWZzW9oydJpa6qt0nSGW9Rpx34FNtL3MC2XBur727y7Iwc1
 qKh+PDCD6yCzNVVQUMjkB++EZ59bAHsFppJ2gSuJHkHwHC0gU4qa7FoC5
 JLvb5p9PGpDPTzBs6EXFMjHoru2g/fUT0MQA7PaineUkTDPWh1TB6bTE7
 nZI4rCnHNqmaIDzI6Bd53WMuYHEw8HVR0F7I0Ca1nk1IZ214HFhr4m72b
 Tt+L2fkeAuZeJL8wWS9RkpCgYG2d+X9o3Jzlt8XtiBq7eiUEbS4JF4Wew A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="16697771"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16697771"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:36:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12883679"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:36:46 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v4 10/25] tests/intel: Introduce Flat-ccs subcategory
Date: Thu, 14 Mar 2024 14:34:40 +0000
Message-Id: <20240314143455.1436688-11-katarzyna.piecielska@intel.com>
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

Let's introduce flat-ccs subcategory.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
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

