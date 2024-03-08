Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EF3C54E4A
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 08:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EF2113601;
	Fri,  8 Mar 2024 08:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hw7fWT7s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5369F113611
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 08:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709887080; x=1741423080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xoOVqWS6Pku0IXcd3mAE2paVpX1e9SPziLntgOEKlQw=;
 b=Hw7fWT7seY7dIQ8JX6SoKqFBq5VS4pWPv6jLrng7BHbFQbF8AcVtSGL1
 /Dsdvv3LW01IurqnXjuQZsXZd/xWVxGj41/Zx3bSuFVWQKggJTt07jXnO
 BC4jeKEjvscXv3rD4euh+5lZwiElECqLx3ge6jUV+jkyrkGnSwY+x//HQ
 bb3dmzYkigdfY9Jcd3LjC1B3c/D8arcKcACZ9e4P6Mlq/iGlxqpOMpqJV
 cGhwPNSlCUgLN6ZYzAXcI+ODERVNgAdlgGh+wZjfJ5slCCGHAwM3nbgZ5
 K77+R6wmsz7VZdEUS73WhU6ho3ojxXL/cC+7we05z3Nv1gXoTVjK3Pyff g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="27071907"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="27071907"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:38:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10447095"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:37:58 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: [PATCH i-g-t v2 04/25] tests/intel: Introduce Caching subcategory
Date: Fri,  8 Mar 2024 08:36:36 +0000
Message-Id: <20240308083657.1092049-5-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
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
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Acked-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
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

