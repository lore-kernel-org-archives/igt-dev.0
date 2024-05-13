Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9C4C25B75
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 10:50:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705D210E636;
	Mon, 13 May 2024 10:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4+6rfEY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB1710E636
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 10:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715597455; x=1747133455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rc8M1c5yadvEKGv5VV/gmjf6PHJrA9oEr2Jexss3qpM=;
 b=O4+6rfEYgE8B2WiHvMlxovdZyFSQGsHOMoytho54LLrHmFbsgQPApk/f
 Sq5Inypa9eEYEjm67pCPaNdvtXfKboRm1R3A1kdDRzRPD+8WhT61hzhPJ
 6LAlWTOtfsHQVOSeZHx3JZj0G8F3W/SPYQnTxb0Ji3NBmX6NYWqoHNLFv
 JTl8LBeXFH2Lc+amaYOfsTAaSH+FXyDkkHNH8iK80dtBCrDc7rw1nRGJK
 6SIUhJvvRiW6E7SMSNEZpN4Jq0zunzmdRh+xy1WuouyKNZ4GXBFo7/zy5
 nNP39nzn/ONMNJWyeZCDYEpQ+TfuXf1Kun3c/NTJ8eszH0VN8+D28wmye g==;
X-CSE-ConnectionGUID: pKsD48c0SdyoJju7MOebsw==
X-CSE-MsgGUID: apKMiZmtROej4R0pdUBQig==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22125163"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22125163"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:50:54 -0700
X-CSE-ConnectionGUID: M6HhW6ofTfa8hFFZiVFfzQ==
X-CSE-MsgGUID: n08nflr5TOWSxI2UYAxGHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="34719912"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:50:53 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t v3 12/16] tests/intel: Introduce Render Mega feature
Date: Mon, 13 May 2024 10:48:42 +0000
Message-Id: <20240513104846.362332-13-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240513104846.362332-1-katarzyna.piecielska@intel.com>
References: <20240513104846.362332-1-katarzyna.piecielska@intel.com>
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
 tests/intel/xe_render_copy.c        | 3 ++-
 3 files changed, 7 insertions(+), 4 deletions(-)

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
index 4f98cb7df..7adff1860 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -18,8 +18,9 @@
 /**
  * TEST: Copy memory using 3d engine
  * Category: Software building block
+ * Mega feature: Render
  * Sub-category: 3d
- * Functionality: render
+ * Functionality: render_copy
  * Test category: functionality test
  *
  * SUBTEST: render-square
-- 
2.34.1

