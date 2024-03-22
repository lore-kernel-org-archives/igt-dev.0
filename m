Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FE2C54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 12:42:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E81F10F818;
	Fri, 22 Mar 2024 12:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T0HjtyCi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C39210F812
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 12:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711111366; x=1742647366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xZR+ZxsoUriBXYRW69ovkO6tBWteGcJ1etlfk5l2aZk=;
 b=T0HjtyCimEZx7tOqUNYntSuJkfHJR3X15uz+qCzprdxHm9g4P4pl7DvW
 SUgK3Ez0ujA67x28YzSs1Fs98GLAneEelXVsWQvsQcJPSz3pEzm4qd2Ei
 wiLE3/a0IkebgFnUeDM6/XsSXZfH/MIW9fWCLYRjMxlv8d9mRcvn1x6Ap
 B+iDY1lRR8BwNRzkxetsuoxYiFRZO4vJh4ANmKSD7wE4uAVeNx4R6X5Kg
 PkXzInXe18Gg6Ly+CsJMGCvYge9HNy+FkUomOcoA9q+F1clN0YJaq5QKt
 7aQYhDuNmWxXB7aV6OTidZp0a8tU7e+Fp052cKAPgJkf8LJJwRy7Z39SL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="23645155"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="23645155"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:42:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="14994410"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:42:44 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t 08/12] tests/intel: Add xe_spin_batch to IGT Lib
 Sub-category
Date: Fri, 22 Mar 2024 12:41:04 +0000
Message-Id: <20240322124108.1825345-10-katarzyna.piecielska@intel.com>
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

Let's align Sub-categories for xe_spin_batch and gem_spin_batch.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
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

