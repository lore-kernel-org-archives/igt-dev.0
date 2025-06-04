Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8EFC61CE8
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 17:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B6710E773;
	Wed,  4 Jun 2025 17:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NIqkNqVe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E0010E773
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 17:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749057572; x=1780593572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h/ys446EhI39GuzL/M5IKwa91/NKhwLF+irBH034zhY=;
 b=NIqkNqVehmd8YrXTrocv9LJJkCdtB9OStrY1inzmLT1UdRkoB2jVCJZm
 0KwTOJ0qs93tcIde0rY7pbrA5+aOWXebjPhOWIth4KotDC9+VoVwqi1kW
 a1p9PrgcEsHOT9iY6XYiGdpyYyiq1+1POXmdfsMrWuSDuZUWST/QNrDqR
 Muh9YYr9YBKvZD2atmnwDxRARL6H+Lq0siLd91YxMmhr3//EsQ8akMrbO
 aHWOj77C903Cc/odALMvBXiSuHDC/PcExIgPzRVJdozkQsyrhIWInfDnD
 ZCBPhbDlZoFAKzVPjYot1PvYqZDQ0JbCrc4QFtz6/GTqYgBKl/bk/qpDr g==;
X-CSE-ConnectionGUID: myTnhmkwQXuW+2JFPAgt+Q==
X-CSE-MsgGUID: 2HNzU97DQ8Kq1EM0aHE37A==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68595976"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="68595976"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 10:17:47 -0700
X-CSE-ConnectionGUID: +NoqCFoBQs6uwlgVYcJB0Q==
X-CSE-MsgGUID: SR/oB81lQpuFgGC73LSb2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145203321"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 04 Jun 2025 10:17:45 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v15 8/9] tests/intel/xe_create: Conditionally define PAGE_SIZE
 for non-Android platforms
Date: Wed,  4 Jun 2025 17:16:55 +0000
Message-ID: <20250604171656.31559-9-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
References: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
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

