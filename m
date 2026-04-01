Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF8410F6FBF
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 15:45:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6372710ED42;
	Wed,  1 Apr 2026 15:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KJK1XtbV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED8010E5BD
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 15:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775058310; x=1806594310;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zgSap+nIh+4AIJRbxshuGI7VexVIAShcdr2rwL6Dx2U=;
 b=KJK1XtbVELwrETOlo+MeKS+oNoJV8BBr2wu3J+rai2uIh8/+Or3jA7Bh
 FAyiI4bE/J41FhGpULh5YkBHN8ql0MxadicqxMvTytoYnS+Xaay2+QsQe
 zhVcQQrye2XjzsBT30m3VpT2rnICF8Vzgk/AalUWatHi97PoA223haucl
 NE1P8QlAj9lfHCfJ2VpA8756pR+dO2bdLrZm2KJwyKgVjmxiMY9RFaRwg
 DN5P5EZvzYUmbf+/XtmOZ063LKHpvwnhVWGKEWbJ/ie8dX1p8bksIgY40
 Cwa664IYh1L+KL+gm8I3XQXWmJK0nByAn1IgrIZXlx5nNE5xI62SLoKRw A==;
X-CSE-ConnectionGUID: s3HSKEq9SP6oubEKpFZQNA==
X-CSE-MsgGUID: rf8kmSniRTCZc17r7E6Vow==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79988964"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="79988964"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 08:45:09 -0700
X-CSE-ConnectionGUID: 3kkhVWbySOuIPVeb42aMOA==
X-CSE-MsgGUID: xCwLAHGcQfWHPmigJde91Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="226960035"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 08:45:08 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 1/7] tests/intel/kms_mst_helper: Add kernel-doc for
 existing function
Date: Wed,  1 Apr 2026 21:36:21 +0530
Message-Id: <20260401160627.1338526-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260401160627.1338526-1-kunal1.joshi@intel.com>
References: <20260401160627.1338526-1-kunal1.joshi@intel.com>
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

Convert the doc comment on igt_find_all_mst_output_in_topology
to proper kernel-doc.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_mst_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_mst_helper.c b/tests/intel/kms_mst_helper.c
index aef74cd31..38859cffc 100644
--- a/tests/intel/kms_mst_helper.c
+++ b/tests/intel/kms_mst_helper.c
@@ -5,11 +5,12 @@
 
 #include "kms_mst_helper.h"
 
-/*
+/**
+ * igt_find_all_mst_output_in_topology:
  * @drm_fd: DRM file descriptor
  * @display: pointer to #igt_display_t structure
  * @output: target output
- * @mst_outputs: filled with mst output of same toplogy as @output
+ * @mst_outputs: filled with mst output of same topology as @output
  * @num_mst_outputs: filled with count of mst outputs found in topology
  *
  * Iterates over all connected outputs and adds each DP MST
-- 
2.25.1

