Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1E5CD11DF
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 09:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA91A10EE19;
	Tue, 26 Mar 2024 09:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCGnFEBM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA14810EE19
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 09:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711445439; x=1742981439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n/l+kg0VOlRZ9vHfsFBavWgSOgzXQDFBlrMninpS5Zc=;
 b=aCGnFEBMpyHmVh/PhsLa7V6Iy2bpMoPjdHq/NnSI35PkV44kbplqtyEI
 xSARNpABo6Xmhw5iBdlGQtm9xa6r0t89AnroGbBtDBA8rPLdN+zPBMMo2
 XUkdeXP2YpBQ8wUpYMU/1XulToT8Q1Ynpui8xuq8WNTEk4uFD/8LXgX6G
 CUa4PueBwCXbarvA4m1r9HZbZc5NLuh+o1mJVOavobqQUx8VbCfj6fiH/
 s2B/dkO3O1151/kcExYk6pWdPv2OBqBUX3e4xyom5+0eWHeEo8qkeVKE/
 hOzjOKmVYUZsb0OIATNikHzYt5kVtsGe49b/MXOCBMVVVe65hX7LiopxU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10279996"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="10279996"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:30:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="47064663"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:30:36 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t v2 09/13] tests/intel: Add xe_spin_batch to IGT Lib
 Sub-category
Date: Tue, 26 Mar 2024 09:29:03 +0000
Message-Id: <20240326092907.1979345-10-katarzyna.piecielska@intel.com>
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

Let's align Sub-categories for xe_spin_batch and gem_spin_batch.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_spin_batch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 9f844fa80..da8fd0a30 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -9,7 +9,7 @@
 /**
  * TEST: Tests for spin batch submissons.
  * Category: Software building block
- * Sub-category: spin
+ * Sub-category: IGT Lib
  * Functionality: parallel execution
  * Test category: functionality test
  */
-- 
2.34.1

