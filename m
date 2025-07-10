Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462E1C83F21
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 19:00:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA25110E94D;
	Thu, 10 Jul 2025 19:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IyP9LjkA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5FC10E94D
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 19:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752174034; x=1783710034;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D/7m2iFdq3A3FXXhnGe7dJSSW6UJTxFtioZU05RR75Q=;
 b=IyP9LjkAU6BaxdxsOxnAnqsL7XfCMLEcYCHS4L817To64wDEME0+7T4G
 n/rsu9kfNidDS9k1EKOuyAVpwFZ/+aos4/iihsDCvhQWdjzQznT2GlQIg
 +QWqSVrZqWcxUWf0xSs7WwDMGGiGopUwY7w+OiHoh9yTTYvz19jXO9gFJ
 O/3u5DFHBtTVDHmwVoRu5OYglLHgnWh6CQK3PJLisQUQcPOyASdpyICsF
 MUk45BGOmt4wi/b7GxuTzUq/5Zwch2e+Wl1sdsgBHCZ0dLHdrEd5Y2JdY
 nJfPWeCUTBNGxp4kbpJ1HgRFqAcTzZyQQrpRPxZ9+/dU4phVaneCWym5n A==;
X-CSE-ConnectionGUID: R/F+Mkq8QlyzMCcZyMH3jw==
X-CSE-MsgGUID: 6TCgdtzxQIaBBHf5wjmPVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="53685856"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="53685856"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:00:34 -0700
X-CSE-ConnectionGUID: eiwuvvwOT7ywes4mwWGqkQ==
X-CSE-MsgGUID: Og9WSZINTG+DFqlYGojO7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="179864971"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.100])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:00:32 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zlice555@gmail.com,
	Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 2/3] lib/xe/xe_sriov_debugfs: fix musl libs compilation
Date: Thu, 10 Jul 2025 21:00:11 +0200
Message-ID: <20250710190017.167735-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250710190017.167735-1-kamil.konieczny@linux.intel.com>
References: <20250710190017.167735-1-kamil.konieczny@linux.intel.com>
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

Fix gcc compilation on Void Linux with musl C libs, where
igt header misses limits.h

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/xe/xe_sriov_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
index 9b743f657..e12e12c8c 100644
--- a/lib/xe/xe_sriov_debugfs.c
+++ b/lib/xe/xe_sriov_debugfs.c
@@ -5,6 +5,7 @@
 
 #include <dirent.h>
 #include <fcntl.h>
+#include <limits.h>
 
 #include "drmtest.h"
 #include "igt_debugfs.h"
-- 
2.50.1

