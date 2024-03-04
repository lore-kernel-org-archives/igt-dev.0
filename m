Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1797C48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 11:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F985112003;
	Mon,  4 Mar 2024 11:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/AUXZSQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF131112003
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 11:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709551047; x=1741087047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rzYNboGZeGRSG3uWcbPYJBvyVvzCfF2QTS2SNnAlmMg=;
 b=A/AUXZSQj1etxpEw61YsNyDWTo0z4notXLB7xEf/l7K9FOIqWU4Ldia4
 EWY8Wo/U0UNDSkLH3XLvthQP1BLNJepRz1EaJ6nOlhzovOExk/VKAo1hE
 KaTD/doxY0VyTty69+pGHU3sJKLSwgz/FVbUbrcYDqWoUiCt/eUBp9Wwr
 YlaJQ9LibdiiAGboFJjxEfDoQiPZ0WHXtx8cWxD+2NFtUKvJRNQVUgiCf
 edG2DiLcnSWPJZm8GtegXU++5Kps96WTbHGJ3Dz3UJ2ho+5ScEljN37dN
 XFfk3hS9aSjHhF/ZYEH31eFoNl3vJxKxtAR+CcteZ6Pwbll/EXeVQSidi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="15444938"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="15444938"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:17:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8840408"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:17:24 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: [PATCH i-g-t 05/24] tests/intel: Introduce Caching subcategory
Date: Mon,  4 Mar 2024 11:15:58 +0000
Message-Id: <20240304111617.849785-6-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
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

Let's have 'Caching' subcategory to show where we are testing cashing.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/gem_caching.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/gem_caching.c b/tests/intel/gem_caching.c
index 4a8f69e97..4a95cf528 100644
--- a/tests/intel/gem_caching.c
+++ b/tests/intel/gem_caching.c
@@ -45,9 +45,9 @@
  * Category: Desktop client
  * Description: Test snoop consistency when touching partial cachelines.
  * Feature: caching
- * Functionality: data coherency
+ * Functionality: coherency
  * Run type: FULL
- * Sub-category: i915
+ * Sub-category: Caching
  * Test category: GEM_Legacy
  *
  * SUBTEST: read-writes
-- 
2.34.1

