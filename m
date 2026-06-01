Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29143CD5BD1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 05:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7A1112DA1;
	Mon,  1 Jun 2026 05:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gsxiy6L3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D231112DA1
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 05:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780292063; x=1811828063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UOsKjXrRQtsrGWpvwfFN44BE5XpTTozEaovMiY8yeqY=;
 b=gsxiy6L3gJxTU09VpbfZAJdfBgqokaUKQlGxOwvse9F85Vy1PQEcDMxe
 qPlM/TKdqr1hEebFvH0K6BvnPO2YIEdCr3XZUp4kZjQK5D6anUfPhIk4/
 V/uXSZDeBfMU5hwhcyk428+huSMQ/8tsYU/JNzpOi/i5c7/kwnp0280+Z
 A5vTUnGz/7byQp3cmVs0gWN4t1m0wiCbomx9XNt4bqBgUesLGDYAyZeyv
 FDh0A75zj2KMum5B6CMiAZZwW/EkJRgv0wWMTRUjZ7jsnyaTF8HB8lAAu
 na5g+79hH7UkcL9kY2pmSiJU7Q58bY/L0JgX/lUM4Zdqsa/USr/FwjqfL A==;
X-CSE-ConnectionGUID: jQuYlLmmTdm2hPggZ+cl4Q==
X-CSE-MsgGUID: WBuFa/snR5qbotXvDe2Guw==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="103712755"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="103712755"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2026 22:34:22 -0700
X-CSE-ConnectionGUID: ptQs3380QeSbkb0O+7rsrQ==
X-CSE-MsgGUID: pYOnZejQS++DBODLYSSwKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="243310128"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 22:34:21 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 1/6] tests/intel/kms_mst_helper: Add kernel-doc for
 existing function
Date: Mon,  1 Jun 2026 11:25:40 +0530
Message-Id: <20260601055545.1982351-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260601055545.1982351-1-kunal1.joshi@intel.com>
References: <20260601055545.1982351-1-kunal1.joshi@intel.com>
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
to proper igt-doc.
While at it fix typo (toplogy->topology)

v2:
- Change to proper IGT doc (Kamil)
- note about a typo fix (Kamil)

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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

