Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C31CE83F15
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 13:55:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F5E10E07D;
	Wed,  4 Feb 2026 13:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z1kX4dOn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4642710E07D
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 13:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770213315; x=1801749315;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vbRFFyPaRjrdsCafcyWe1tonKNNkC2ATLY5Mls/p8fA=;
 b=Z1kX4dOnr8xtiFNok53on+luS91qs7TGlDjWBJGMvFtMbf+WB5eeYcKP
 glq7xi9GGNIC3ktIfwxF2Ariv2dyz1X5ZaG9A7osBRSuoPgGHDV+LZLm6
 8/epHwbSoH0T84ERvAIaGHJ6oV1Glh/xXF68coXYs5sY6L9L0JEJqjJQA
 cbhzizHou53DUqh+SJvhQbGbTltdSVmvrOUdlzzspm1I8POjl+6UmI9cD
 m87eprn2gcyV1I6UqpVmMspDJjqdzKiW+Pzl41/WQeDVhHUhF7hCO0SEh
 Vdi9kFCNzjGXf4KOyQ1fDziotMlyRVv4tREaSf8uRYmFsg1FFNJYhKevU A==;
X-CSE-ConnectionGUID: o9c3tFb3TMOrfmgjaP71MQ==
X-CSE-MsgGUID: WtBpuOFfTJSgm7ZxDKpiPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75019520"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="75019520"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 05:55:14 -0800
X-CSE-ConnectionGUID: qJkRuK9OSJqy07RgUnMf0Q==
X-CSE-MsgGUID: T0bNyLpKRX6yHA5/ia4Wew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="209270138"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.230])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 05:55:13 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] lib/igt_aux: Protect expressions from premature casting
 in aux macros
Date: Wed,  4 Feb 2026 14:55:01 +0100
Message-ID: <20260204135500.311469-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
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

Missing brackets around expressions might cause undesired behavior
during type casting, for example:

objs = 4096;
objs = min_t(int, objs, vram_size() / SZ_4K)

If vram_size() is 0x80000000 casting to int gives negative number,
so min_t also will be negative even if it wasn't our intention.

Add round brackets to ensure casting refers to whole expression.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_aux.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index 8ff182384c..56761a3b3e 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -255,8 +255,8 @@ void igt_debug_interactive_mode_check(const char *var, const char *expected);
 
 #define clamp(val, lo, hi) min(max(val, lo), hi)
 
-#define min_t(t, x, y)	__careful_cmp((typeof(t))x, (typeof(t))y, <, min_t)
-#define max_t(t, x, y)	__careful_cmp((typeof(t))x, (typeof(t))y, >, max_t)
+#define min_t(t, x, y)	__careful_cmp((typeof(t))(x), (typeof(t))(y), <, min_t)
+#define max_t(t, x, y)	__careful_cmp((typeof(t))(x), (typeof(t))(y), >, max_t)
 
 #define igt_swap(a, b) do {	\
 	typeof(a) _tmp = (a);	\
-- 
2.43.0

