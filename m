Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA10FEC1449
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 13:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7F610E819;
	Tue,  3 Mar 2026 13:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6fHWg+Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E90C10E819
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 13:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772545654; x=1804081654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iVXbvZxQdxZXtRjoq1geFylmB/qaPX6R88004bsyPQg=;
 b=j6fHWg+Z128xRgSvJAsGWtyzG877wK0QcBCMsbZR6o0aH5xtDL2p/Ug4
 MQsVxfLE3kkojlIrMh13NQnAZQcAEPhT5HetcMron3jnEQEDHUgIgpSLn
 mF0FqAfGcuQMLONIxNOXt+0zlWHNT+1FrwSQsO0tYKA/MR78P9tO7s/+w
 M5G9XN9IKyzeaTejUqFYoJkz+O0N+4hyMQUjEdZC23Sy2ylz/AgqpBx9c
 49A2rfEgZ5+9cIY7gw6p1DBQSS6YMQvEi9t8KdDkw6qAwJU1bspS336K1
 sLdUE3fK2W8YlCzFdi+jVykifXMbcJZbbAugt0Kvp4YOYNqWrFBlxeMSf w==;
X-CSE-ConnectionGUID: e5tcg1v9RGCCnrtKQl8AIQ==
X-CSE-MsgGUID: NwyWBWddREqV+tg8qlK1ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84927591"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="84927591"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:47:34 -0800
X-CSE-ConnectionGUID: i4kvTE9NSEm/HDTgyf5oEg==
X-CSE-MsgGUID: LS/DjyoHTPy/D1o+QGYoiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="215512913"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.58])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:47:32 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v4 5/5] tests/xe_compute: Use appropriate feature in
 compute-square tests
Date: Tue,  3 Mar 2026 14:47:12 +0100
Message-ID: <20260303134706.41948-12-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303134706.41948-7-zbigniew.kempczynski@intel.com>
References: <20260303134706.41948-7-zbigniew.kempczynski@intel.com>
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

Test is doing compute-square calculation so pick 'Compute' instead
of 'WMTP' is better choice.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_compute.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 738ad8cd33..0063283c23 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -495,8 +495,8 @@ test_eu_busy(uint64_t duration_sec)
 
 /**
  * SUBTEST: compute-square
- * Mega feature: WMTP
- * Sub-category: wmtp tests
+ * Mega feature: Compute
+ * Sub-category: compute tests
  * Functionality: OpenCL kernel
  * GPU requirement: TGL, PVC, LNL, PTL
  * Description:
-- 
2.43.0

