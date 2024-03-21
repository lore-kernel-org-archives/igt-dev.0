Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79076C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:40:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1599710ECDC;
	Thu, 21 Mar 2024 15:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSBSvMPp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D877610ECDC
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711035639; x=1742571639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NhaZheHfCyz1/PgBULxh+DVWoGfYV8DClKYswM1fuJI=;
 b=DSBSvMPpLi4HjXZZLGUClGBZe6iQhz/oJ2P2DDTIVhzL1Hwf3TMeOrqG
 a2mX4YWCsBw/o6LeuRd6QpaxcdghFSoV/4c9bZenUTApeJXf5r2a/nlQy
 Ge32yn7OSiDZ9DA9o9L0wmM/2LcV2GWWKmJK0h2Oud1O8k9CF+4XYLIwe
 elJJD1Pqya7xKoxNTL2YOkt9PNvAIgvXB6sbfBURZ28x55hmBgaxbEl/G
 LHjXu+ybN9zDYj2ez/5Kwxcf7ubuTGTmmCokSyst+U9tpRUlMIeZD43cY
 O3RBTwgvWHPfFHkroldo4hEbn1UUrNyBpGColrWUZrbMKWph/tvSs783H Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="23527440"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="23527440"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:40:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="45538469"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:40:33 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v5 09/24] tests/intel: Introduce Flat-ccs subcategory
Date: Thu, 21 Mar 2024 15:38:32 +0000
Message-Id: <20240321153847.1787625-10-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
References: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
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

