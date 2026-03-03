Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C075EC1449
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 13:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95A810E80F;
	Tue,  3 Mar 2026 13:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2Ci2cEg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBEC110E80F
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 13:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772545113; x=1804081113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S+qCfe09EhLIeoS0WnHtUTtRD9zmEP5eG9bSSwhIaRQ=;
 b=H2Ci2cEghngnIchwYKoxcSussKiohHr5xpBMOjJ+EseZYvtmepKeinhk
 w5QnXtY2hDIM294BGo5L1NHG4visi4lhuphoNpIaisI/rfv4SCzlXWXEk
 NzkQBvyYtjJETR7FYsx5s7KeuS3tR7iQGNMy43nHweN3veqTYcPknfH6a
 wTq7dRSttWTxwTMX1kunEdYZzENIie1fDnOY1UF0xO+kvEQMuygJpokrf
 AqIdZflu1nF3dcOzYWcUJMAuPzHDQhciR5x/y2RIsi8u8PmK0X3tlFE/l
 wsTQqyR5hMnPal7nbXjbhgYqt82OoaAEkj9Ed/12WqyfxTbkG7b98uLY4 A==;
X-CSE-ConnectionGUID: od/WshoTQk6y973sc6Mqnw==
X-CSE-MsgGUID: rp/mTbDlTp+GX7mMfMYfdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="90977808"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="90977808"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:38:33 -0800
X-CSE-ConnectionGUID: KP6b7x+XS6mbCIYqNRZiIw==
X-CSE-MsgGUID: m3eI5FjkT3ygHHYjd2aJwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="248496876"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.58])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:38:31 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 5/5] tests/xe_compute: Use appropriate feature in
 compute-square tests
Date: Tue,  3 Mar 2026 14:38:04 +0100
Message-ID: <20260303133758.36553-12-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303133758.36553-7-zbigniew.kempczynski@intel.com>
References: <20260303133758.36553-7-zbigniew.kempczynski@intel.com>
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
index d46cc4208b..27acc1d0e6 100644
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

