Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3EDC5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 11:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F23112006;
	Mon,  4 Mar 2024 11:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S45H0Iay";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54501112006
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 11:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709551067; x=1741087067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iIHNshTHzXXPkI3LyXznYuoOuLD2EuqNyTnRoFGcJdA=;
 b=S45H0Iay8YYm3D1PZZL+2IPH5s3J62SY0AD3pyJO/ov/XLeMLYfG5zxt
 bPAzRxNfOgCcjTBlCRkSiM1oQ7ow3I2Rf1K3jrCfILlAsLO/xCSSg8A4e
 J0nZMkVeiwdyWzodkUiRJm1xP6h4G6utMRtxR4Y1jAbIQ2Q52NoB7DKFv
 Eww+ShJLrWUpQx8qWL8BNcNZF529TLuktLeNxTvcfYPicdBQ7DgFTZqpx
 B64hnsBJyCjlEKRHBn7Zh78PsJmZdxo7Zd8SrDKHZm2iLA420f5DGfUB0
 eIJUxgcmtNOmG/Dr9DjKqLwFkEbvaDw3GdmL94ZX7ia8wAlvF21JCjVQq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="14745748"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="14745748"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:17:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="46479979"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:17:45 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t 07/24] tests/intel: Introduce GPGPU subcategory
Date: Mon,  4 Mar 2024 11:16:00 +0000
Message-Id: <20240304111617.849785-8-katarzyna.piecielska@intel.com>
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

Let's introduce GPGPU subcategory.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/gem_gpgpu_fill.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
index ac283620e..535ac0cc8 100644
--- a/tests/intel/gem_gpgpu_fill.c
+++ b/tests/intel/gem_gpgpu_fill.c
@@ -51,13 +51,13 @@
 /**
  * TEST: gem gpgpu fill
  * Category: Server
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: Compute
+ * Functionality: gpgpu
+ * Sub-category: GPGPU
  * Test category: GEM_Legacy
+ * Feature: compute
+ * Run type: FULL
  *
  * SUBTEST: basic
- * Feature: compute
  */
 
 #define WIDTH 64
-- 
2.34.1

