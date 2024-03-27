Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF96C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 12:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F110710FCF5;
	Wed, 27 Mar 2024 12:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJDGNpWo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C8210FCF3
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 12:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711542620; x=1743078620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+oeDLIoTnQWV/y0t/QLlSD7lO830kPczKnX3o8gSuzg=;
 b=OJDGNpWokS8cW7uJ5d4mHObeWfdDRK7zm6wMkfrUU3KgRcMmjOQlGrs/
 vJl07eXeYtQuHfPMKhKAcIvA+gnag3n5Id80qYgkvsEWIVB6YHmIacpig
 Tpc8KZSaM2vb+ccNER3tr3JpWoyiZZQALQicqGG/y1IgJuo/JRZmckGSO
 4FNh6uTbPXUFbqD7a237+CjUA2tOi5PfHzG1J7fG2cZAdH3MGAIIM31mH
 vBKaV1uJZviPVMXiIAOaf1n8zPNEwbC4EbGi/5z9jQti8YhhbMUgfg4pi
 EviLyiBvohJ4I9+IaENloazjnQHpHit96q/pnEIRVkEiXDrbrxHQQvVDC w==;
X-CSE-ConnectionGUID: xuu5z40CTRqfFGOdwkY88A==
X-CSE-MsgGUID: 3lgXQCdrSuax3IANeTGvgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17781575"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="17781575"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:30:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="20982584"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:30:18 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t 16/16] tests/intel: Add display tests to General Display
 Features
Date: Wed, 27 Mar 2024 12:27:31 +0000
Message-Id: <20240327122731.2104614-17-katarzyna.piecielska@intel.com>
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

Add display tests to General Display Features.
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
 tests/intel/i915_pipe_stress.c | 4 ++--
 tests/intel/i915_selftest.c    | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/intel/i915_pipe_stress.c b/tests/intel/i915_pipe_stress.c
index 6c5e951ab..3b73a0ff8 100644
--- a/tests/intel/i915_pipe_stress.c
+++ b/tests/intel/i915_pipe_stress.c
@@ -20,13 +20,13 @@
 #include "i915/gem.h"
 /**
  * TEST: i915 pipe stress
- * Category: Display
  * Description: Stress test how gpu and cpu behaves if maximum amount of
  *              planes, cpu and gpu utilization is achieved in order to reveal
  *              possible bandwidth/watermark and similar problems.
- * Functionality: kms_core
+ * Category: Display
  * Mega feature: General Display Features
  * Sub-category: Display
+ * Functionality: kms_core
  * Test category: stress test
  *
  * SUBTEST: stress-xrgb8888-untiled
diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index aeb9deb13..217286da3 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -74,9 +74,10 @@
  *
  * SUBTEST: live@display
  * Category: Selftest
+ * Mega feature: General Display Features
+ * Sub-category: Display
  * Functionality: display sanity
  * Test category: i915
- * Sub-category: Display
  *
  * SUBTEST: live@dmabuf
  * Category: Selftest
-- 
2.34.1

