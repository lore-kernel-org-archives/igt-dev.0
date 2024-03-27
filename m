Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEFEC54E67
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 12:29:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E7410FCEE;
	Wed, 27 Mar 2024 12:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YqboSLXn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438FE10FCEE
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 12:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711542588; x=1743078588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=byyZT/S1hHEp1Zluj5m17f02r6q/Bs1Ri8qPCX84tFs=;
 b=YqboSLXnhir5axELTOKOGp1Bq80Aq9tf0U/90HM/hh8jFKepXogtzjus
 /QS5F68dqvboWAxXCX9MwskcMZq7bViY+zvNvxKEFPDzGv68e+q9//Mf2
 AyBlKX8fafu8wxiYFhev4gYf9WAk5tHHldgSFn3murcRWTkpk9JwOWH9E
 VR4BBHrQsMbGFK8S77apLGum9OjYg30PdGaHFx3Mh04K89D2vC0PnsAlC
 gGgU/6TVj5rlALoV7ovmaKB1kpXGgsQza7WOLL7untWvCf67Ksut+KbIc
 PRwLTFWiBj1LMU84ch+T+223LE7q78npU5IgG1ytcSNQ4LdC4T6nvLc06 g==;
X-CSE-ConnectionGUID: vZ0uv1y4Tu+qmLsFAn7dFg==
X-CSE-MsgGUID: ssuWGOSYT9++A20L7D3Jow==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17781520"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="17781520"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="20982359"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:29:46 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t 13/16] tests/intel: Introduce GPGPU mega feature
Date: Wed, 27 Mar 2024 12:27:28 +0000
Message-Id: <20240327122731.2104614-14-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327122731.2104614-1-katarzyna.piecielska@intel.com>
References: <20240327122731.2104614-1-katarzyna.piecielska@intel.com>
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

Add mega feature to GPGPU tests.
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
 tests/intel/gem_gpgpu_fill.c | 3 ++-
 tests/intel/xe_gpgpu_fill.c  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
index 14811abce..1c0188b5a 100644
--- a/tests/intel/gem_gpgpu_fill.c
+++ b/tests/intel/gem_gpgpu_fill.c
@@ -51,8 +51,9 @@
 /**
  * TEST: gem gpgpu fill
  * Category: Server
+ * Mega feature: GPGPU
+ * Sub-category: GPGPU tests
  * Functionality: gpgpu_fill
- * Sub-category: GPGPU
  * Test category: GEM_Legacy
  * Feature: compute
  *
diff --git a/tests/intel/xe_gpgpu_fill.c b/tests/intel/xe_gpgpu_fill.c
index a359f9f55..320bcfdee 100644
--- a/tests/intel/xe_gpgpu_fill.c
+++ b/tests/intel/xe_gpgpu_fill.c
@@ -6,7 +6,8 @@
 /**
  * TEST: Basic tests for gpgpu functionality
  * Category: Software building block
- * Sub-category: GPGPU
+ * Mega feature: GPGPU
+ * Sub-category: GPGPU tests
  * Functionality: gpgpu_fill
  * Test category: functionality test
  */
-- 
2.34.1

