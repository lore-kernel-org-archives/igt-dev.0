Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3C1C5AD49
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 17:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C466010E776;
	Thu, 29 May 2025 17:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iHAoaxqX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0922910E774
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 17:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748538814; x=1780074814;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h/ys446EhI39GuzL/M5IKwa91/NKhwLF+irBH034zhY=;
 b=iHAoaxqXUO+BJOrNVOdytrvxQaeBKohbizuUe4b1S6sSvD1HTcDJeoE/
 Zo3M5wtXY3osqLxIoPY/3LiGkpfiA0JyWtiY5Blbp814I1lbOaWWuwWQE
 QrUc8G9rV6VzqAantSJ16PF2CTOgyjMHlbB+Mk/zPFYVrwoSXDce7Db7i
 83YqE52sHjS2G3PIbkJPhsfBs6V3SGUnbPYZ+2odgjd6HdK0OeXmybF3o
 1eAdFeZtCMH1vdlyHleBqpGqPF4cq4iHlaYdQyhpa+qYc9KjQfP3RRFnT
 Xvr31awwp9ZIAJPaRq5p8HQZy3gCGZGHDYh6kJ7bSrBFQK+HpBAdKc4Ni g==;
X-CSE-ConnectionGUID: cmYPK2hITmueb9ESj+wU4w==
X-CSE-MsgGUID: qtjQp8FBRUqJjleQGIxUKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="62016811"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="62016811"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 10:13:33 -0700
X-CSE-ConnectionGUID: rO65l5jaSnKlkTSWMzguNg==
X-CSE-MsgGUID: e3M274TTTaCWv6mzemCunQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="143538040"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 29 May 2025 10:13:30 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v11 6/7] tests/intel/xe_create: Conditionally define
 PAGE_SIZE for non-Android platforms
Date: Thu, 29 May 2025 17:12:45 +0000
Message-ID: <20250529171246.74375-7-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250529171246.74375-1-jeevaka.badrappan@intel.com>
References: <20250529171246.74375-1-jeevaka.badrappan@intel.com>
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

