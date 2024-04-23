Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5961CC4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 10:51:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2EF10FBC3;
	Tue, 23 Apr 2024 10:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRbetdho";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E038F10FBC3
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 10:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713869481; x=1745405481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3qK6Y2z6q3cOg8lwWhN6sQj8bLZ+WMpNEUFFq/dwRMk=;
 b=NRbetdhoOtW0aljca+SLdAc98Te1eNl0g5b5bUmJT644xZowh3r5w8J3
 y2maBKnpY+AJyzw6KONVG8K0ABNYOwKH1X0MpUMU7GiKC96dou+LW9CWP
 26Ip3wQkGMWmZ8ykCA4Ma+57zgalc6vM2nsj1wMBVDXYeOq8PDbVhSIjn
 9Mzka58AgrmiBd4URc+eM5nES7xj5SQJZmxW3WR7uWZbQI/7hZhvB+1T1
 xXcaJfJ8UT08uSV7Fp6KLF4sxVyEK62+eFy75O5gpI3sQW7j/s/Hg+U9w
 0FlPsOY1duIW7jogc2v5qSREFTh2TK9q//i9+TZsGSgJ6TwakV9rWZ8OJ A==;
X-CSE-ConnectionGUID: zgRBdla6TF+WF4NM/zM3xA==
X-CSE-MsgGUID: z6RaWhh1SqiAiYTUX5W6OA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20864814"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20864814"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 03:51:21 -0700
X-CSE-ConnectionGUID: HjbzfCg2R4+QBfDnUHxRYA==
X-CSE-MsgGUID: 2Y9V7ZMTQDW9/5JzwbMixw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="47614708"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 03:51:19 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t v2 12/16] tests/intel: Introduce Render Mega feature
Date: Tue, 23 Apr 2024 10:49:09 +0000
Message-Id: <20240423104913.3559587-13-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423104913.3559587-1-katarzyna.piecielska@intel.com>
References: <20240423104913.3559587-1-katarzyna.piecielska@intel.com>
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

Add mega feature to Render tests.
Group:
	SUBTEST
	Description
	Category
	Mega feature
	Sub-category
	Functionality

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
CC: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
---
 tests/intel/gem_render_copy.c       | 5 +++--
 tests/intel/gem_render_copy_redux.c | 3 ++-
 tests/intel/xe_render_copy.c        | 1 +
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/intel/gem_render_copy.c b/tests/intel/gem_render_copy.c
index 0b5a0ac4a..e9a82c465 100644
--- a/tests/intel/gem_render_copy.c
+++ b/tests/intel/gem_render_copy.c
@@ -51,10 +51,11 @@
 /**
  * TEST: gem render copy
  * Description: Basic test for the render_copy() function.
- * Feature: mapping
- * Sub-category: Render copy
  * Category: Desktop client
+ * Mega feature: Render
+ * Sub-category: Render copy
  * Functionality: render_copy
+ * Feature: mapping
  *
  * SUBTEST: linear
  * Description: Test render_copy() from a mixed-tiled to a linear buffer.
diff --git a/tests/intel/gem_render_copy_redux.c b/tests/intel/gem_render_copy_redux.c
index 60366fd42..6dcd3145d 100644
--- a/tests/intel/gem_render_copy_redux.c
+++ b/tests/intel/gem_render_copy_redux.c
@@ -51,8 +51,9 @@
 /**
  * TEST: gem render copy redux
  * Description: Advanced test for the render_copy() function.
- * Sub-category: Render copy
  * Category: Desktop client
+ * Mega feature: Render
+ * Sub-category: Render copy
  * Functionality: render_copy
  *
  * SUBTEST: flink
diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index 4f98cb7df..184662a17 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -18,6 +18,7 @@
 /**
  * TEST: Copy memory using 3d engine
  * Category: Software building block
+ * Mega feature: Render
  * Sub-category: 3d
  * Functionality: render
  * Test category: functionality test
-- 
2.34.1

