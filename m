Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C6EE7718B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Dec 2024 17:42:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F57810E13B;
	Mon, 23 Dec 2024 17:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FOoa7Aa9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F19810E13B
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Dec 2024 17:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734975731; x=1766511731;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FbIp7oV7GAoPO43usNKtFOnQAQnHChmDVL58F/f8NAM=;
 b=FOoa7Aa9G0QABlccgi0QfAgi0IS0Fg7W7X9Ti9sbc2sFfnTkfq/so5iS
 iOsZdsRfgjvPRithLDyIFlPnjLVGSBayZuZ1C8ohJCu0FBklKSb0XLAiK
 Dq0vUlbuM5Oq9MHjrrwfaAR5hlhHeMjLCRgLlnY0tIvO1QNF9gwugl0no
 IdUVKGJg38KT/bQ3TKIRSJT90SvbrBpeUqiRC84LtuZfgCISt3cJMvQZs
 FLms2GdNzfgUqQ0Usx/zhHhJ8aZJOx2h4pzlOJnH3YFQ2RITkNOjefL3U
 X1/G6NUEhPiO8KG/ct/g2mly6ALvB7Nxp8XFTTTsDmVq7rBzulRLnVP4k Q==;
X-CSE-ConnectionGUID: AtcmV7LcTa+Jwatu5HOxiQ==
X-CSE-MsgGUID: QU/QTwpLQN6PFQx3+koHMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="45939057"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; d="scan'208";a="45939057"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 09:42:11 -0800
X-CSE-ConnectionGUID: dOr1hqLhTyKX1xFhdqm2MA==
X-CSE-MsgGUID: aMiLV60pTVC6tiHk7/X8tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; d="scan'208";a="99029374"
Received: from nirmoyda-desk.igk.intel.com ([10.211.135.230])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 09:42:09 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t] tests/xe_live_ktest: Add xe_bo_shrink subtest
Date: Mon, 23 Dec 2024 19:01:16 +0100
Message-ID: <20241223180116.3857785-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

xe_bo_shrink_kunit, sub-dynamic test is now updated to be a subtest
in the kernel so update this accordingly.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_live_ktest.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
index 50af97ecc..164c90501 100644
--- a/tests/intel/xe_live_ktest.c
+++ b/tests/intel/xe_live_ktest.c
@@ -16,6 +16,11 @@
  *	being handled properly.
  * Functionality: bo
  *
+ * SUBTEST: xe_bo_shrink
+ * Description:
+ *	Kernel dynamic selftests to check BO swap path and shrinking path.
+ * Functionality: bo
+ *
  * SUBTEST: xe_dma_buf
  * Description: Kernel dynamic selftests for dmabuf functionality.
  * Functionality: dmabuf test
@@ -39,6 +44,7 @@
 
 static const char *live_tests[] = {
 	"xe_bo",
+	"xe_bo_shrink",
 	"xe_dma_buf",
 	"xe_migrate",
 	"xe_mocs",
-- 
2.46.0

