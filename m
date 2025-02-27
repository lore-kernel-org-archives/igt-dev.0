Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285FAC19F32
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 13:04:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E058210E369;
	Thu, 27 Feb 2025 13:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FWMhf/NT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB55D10E369
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 13:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740661468; x=1772197468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+iLXqC78Hc93Ui7r2fF8NJi89GhoYj5jESVYi/DV/zI=;
 b=FWMhf/NTzbiM2TnvWWybYFpBW33K5qTl+Pxaj0ammbasSFvPIMX4s4Z9
 b1X72ld8XFMknpWI1YXrSmFmDpDl421GPLoYpybUjkGu7QXoubPpWMGuL
 Isw33J4Ztd94tQWw02id/pDE9eIA3Vs8QkldnJ7/dwh2FD9fJG3IYZiNL
 gg01r/HSwihRNO7bNZ2+mYwxy0DF2zynQvHGk+u6sd6Y1QywfzP6GC3HY
 M3TNXwbDMiY4DZErkmpYVE4jiwM9SFz6HfQilzasszg11J7w6WD0NBmtl
 W+vlOzxsipruylCvIviHgbCy0SLPP9APcRS/FndwIQlC+Ex6p+lVpo7lw g==;
X-CSE-ConnectionGUID: VAIIilaDQoWA7Lt4dMeLRQ==
X-CSE-MsgGUID: 7nVJ9ubcRFSAzwXejJnKHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41570198"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="41570198"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 05:04:28 -0800
X-CSE-ConnectionGUID: kIP5bK8URqOB+b/ntyoO9g==
X-CSE-MsgGUID: Q4X16rzEQFOg63eCyDKfmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="117026718"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.211.135.227])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 05:04:26 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 1/2] tests: xe_compute* Update test documentation
Date: Thu, 27 Feb 2025 13:03:53 +0000
Message-Id: <20250227130354.1169897-2-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227130354.1169897-1-katarzyna.piecielska@intel.com>
References: <20250227130354.1169897-1-katarzyna.piecielska@intel.com>
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

Our documentation scripts need to have unique pairs 'Mega
feature - Sub-category', e.g. example below is causing warnings:

Mega feature: WMTP
Sub-category: CMD submission
&&
Mega feature: General Core features
Sub-category: CMD submission

There is a need to make sure that pairs are unique, so let's make change
in xe_compute* tests.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
---
 tests/intel/xe_compute.c         | 4 +++-
 tests/intel/xe_compute_preempt.c | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 558b46eba..7daf6209d 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -163,7 +163,9 @@ test_compute_kernel_with_ccs_mode(int num_gt)
 
 /**
  * SUBTEST: compute-square
- * Sub-category: Compute square tests
+ * Mega feature: WMTP
+ * Sub-category: wmtp tests
+ * Functionality: OpenCL kernel
  * GPU requirement: TGL, PVC, LNL, PTL
  * Description:
  *	Run an openCL Kernel that returns output[i] = input[i] * input[i],
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index d4c243c16..876e53823 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -7,7 +7,7 @@
  * TEST: Check compute-related preemption functionality
  * Category: Core
  * Mega feature: WMTP
- * Sub-category: Compute tests
+ * Sub-category: wmtp tests
  * Functionality: OpenCL kernel
  * Test category: functionality test
  */
-- 
2.34.1

