Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0D2C47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 12:41:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2851310E85E;
	Fri, 22 Mar 2024 12:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwgBiGjk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F65E10F08D
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 12:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711111295; x=1742647295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=46gz/4+OlQF24v7xXvVZu9rwa0x1KyiH0bEo+lxm4JI=;
 b=MwgBiGjkSHYhck7YQwsJ4myhUEVRKTYVetKv2sZTKA+84Xf06lEotKJ4
 bPWgC6Kn1R2MibXgVNX0fY/kn/5VWoJwM8YZiM/9MNIq7KcqiqYHJ/AIk
 PN00WJWC/erSm3P1w562grLnkZPHi8IncaCgXWmgsnTBbgu8s9zHUCC53
 rxjpm/B4/8vWdosPjuGsO2WDXylx9415DbYUjAXUm2IZUy3BrYGtc6XnO
 27We5yxrfpggjmRwlVbBoT5YcfULXjS/yfse5V0IfPgQuLOQvWUyTK6uk
 M6E5PW+mMvLcgyv3tOnaXptUKs2j0J6lRZl1M5J/Pf+ULjpfdKN7U0BiH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6762427"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6762427"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:41:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="52330317"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 05:41:33 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 01/12] tests/intel: Unify Blitter subcategory for i915
 and Xe
Date: Fri, 22 Mar 2024 12:40:56 +0000
Message-Id: <20240322124108.1825345-2-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
References: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
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

After cleaning up test documentation for i915 tests some Xe tweaks are
needed. Let's unify Blitter subcategory between Xe and i915.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_ccs.c        | 2 +-
 tests/intel/xe_copy_basic.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index aec83a057..7d0f2f2a1 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -21,7 +21,7 @@
 /**
  * TEST: xe ccs
  * Category: Hardware building block
- * Sub-category: blitter
+ * Sub-category: Blitter
  * Functionality: flat_ccs
  * Description: Exercise gen12 blitter with and without flatccs compression on Xe
  * Test category: functionality test
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index 66c666eac..25e8adca0 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -22,8 +22,8 @@
 /**
  * TEST: Test to validate copy commands on xe
  * Category: Software building block
- * Sub-category: Copy
- * Functionality: blitter
+ * Sub-category: Blitter
+ * Functionality: copy
  */
 
 /**
-- 
2.34.1

