Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CC3E77183
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 06:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16D110E673;
	Wed, 18 Dec 2024 06:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZ4Oissb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CB110E673
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 06:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734502057; x=1766038057;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1ixU36n0/y6y95Jja2oyQigxgabYLQ4ZgDd0ZOLQFnQ=;
 b=HZ4OissbAwhy08hbPlDIlRuFAJevK+X96sUItqzgrMub9aXjnD778Uyt
 Iv+0B2v3+UYudxOz02zTgYpkX689xZXoxPXwlPH9nOG7d7PLNrfmd8PdX
 4Z6Xem345Ae9dqv4ri0H4zDZsf8n1VqVkOmFusgYbr/Fl58ZbNZvG/cdA
 5/iac+hIl3xJdEnU4qSkQPZKf4UmwbWmGCoZsHowNdJd4qDTqb3IxxxRz
 dsI0MiXzk1kBZLxhrPhjnBujH20tfdCoAsYt2Ds3GoarhbpdeJ9ERGoPA
 f1azkrQVi3H2de8hZqRxYTIx1WufFCacTW4wU1Ec0A2N0BhHq8tfUQU8+ A==;
X-CSE-ConnectionGUID: BLYYtF34T3aZwTjNfRYOmw==
X-CSE-MsgGUID: AtSVHx74QImTumHvKAMyLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="46353277"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="46353277"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 22:07:37 -0800
X-CSE-ConnectionGUID: MnOcx7/ZTRag+weCs0pNpA==
X-CSE-MsgGUID: YD/ZucAwTNOx7JUupEAlDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121014498"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.90])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 22:07:36 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Ilia Levi <ilia.levi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3] lib/igt_core: fix overflow in micro/nano-seconds
 calculations
Date: Wed, 18 Dec 2024 07:07:30 +0100
Message-Id: <20241218060730.18961-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Multiplication without using casting to long (long) for at least
one argument in expression may cause overflow especially when we're
using this for calculating timeouts in nanoseconds precision.

Ensure we're picking valid ul/ull suffix for base definitions for
all dependents.

Reported-by: Ilia Levi <ilia.levi@intel.com>
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/163
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Ilia Levi <ilia.levi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Link: https://lore.kernel.org/r/20241217105807.94489-1-zbigniew.kempczynski@intel.com
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

---
v2: Define __WORDSIZE if not defined (Lucas)
v3: Eh, forgot to reprase the title (Kamil)
---
 lib/igt_core.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index 90f57402f0..f0ba1a3818 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1517,11 +1517,21 @@ void igt_kmsg(const char *format, ...);
 #define le32_to_cpu(x)  (x)
 #endif
 
-#define MSEC_PER_SEC (1000u)
+#ifndef __WORDSIZE
+#define __WORDSIZE (__SIZEOF_LONG__ * 8)
+#endif
+
+#if __WORDSIZE == 64
+#define MSEC_PER_SEC (1000ul)
+#define USEC_PER_MSEC (1000ul)
+#else
+#define MSEC_PER_SEC (1000ull)
+#define USEC_PER_MSEC (1000ull)
+#endif
+
 #define USEC_PER_SEC (1000u * MSEC_PER_SEC)
 #define USEC_PER_DECISEC (100u * MSEC_PER_SEC)
 #define NSEC_PER_SEC (1000u * USEC_PER_SEC)
-#define USEC_PER_MSEC (1000u)
 #define NSEC_PER_MSEC (1000u * USEC_PER_MSEC)
 
 #define for_if(expr__) if (!(expr__)) {} else
-- 
2.34.1

