Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FB6C5B555
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 19:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA66310E587;
	Mon,  2 Jun 2025 19:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bi/9pUoC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C70A10E587
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 19:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748892376; x=1780428376;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h/ys446EhI39GuzL/M5IKwa91/NKhwLF+irBH034zhY=;
 b=bi/9pUoCNSVnE7TBdtva0IQeg9XOYEKQpWHX4HuqaOkksZrZZBWttJh7
 k7E67ah4/lDHPxNAcEPYqxF08ogYQk012uh5N1UCbBwDkRAh5JaiO22mF
 srnui6O3Ug72PqtkdzK/6nlsdDqqquwWQhMH5lh+Brx1GlbGq1F0JVoZ2
 /WecW/NxDPDDaHk0P3gnFM9maAPU/Z8UmVYyTdUuq2cBFOJO7h3gwioou
 x75p2MuvmQoxMpw2JLO44NsMmPeeHSUrQz7VBaJ5Gw+9+YcCXO80O4Hv1
 18B7OhI1bqq4+kvMrGymWzlns13NhFSkhZSpemwxuxlWAhZJ6tjcQzCfu w==;
X-CSE-ConnectionGUID: AIk/9Sm8S6O6j9Yd4GNsnA==
X-CSE-MsgGUID: zFSZ6B8oSSW1t1W7FfgEhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50777138"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="50777138"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 12:26:15 -0700
X-CSE-ConnectionGUID: KivCaPlnQyyty7wao5/sdg==
X-CSE-MsgGUID: mwqa91qtSmGtSphr1ZAImA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="144590259"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 02 Jun 2025 12:26:13 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v12 10/11] tests/intel/xe_create: Conditionally define
 PAGE_SIZE for non-Android platforms
Date: Mon,  2 Jun 2025 19:25:14 +0000
Message-ID: <20250602192515.95309-11-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
References: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
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

Ensure PAGE_SIZE is defined only if it is not already defined,
addressing compatibility with Android where PAGE_SIZE is predefined.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_create.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index b22084c84..e8b8bb025 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -18,7 +18,9 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+#ifndef PAGE_SIZE
 #define PAGE_SIZE 0x1000
+#endif
 
 static struct param {
 	unsigned int quantity;
-- 
2.49.0

