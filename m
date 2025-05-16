Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D8AC3ABC9
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 17:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FE410EB4B;
	Fri, 16 May 2025 17:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hs+L02U4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DA510EB52
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 17:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747415566; x=1778951566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c30f9w4gwit8nY81ngE6AnPMSZU0AbU9GQonoQSa58o=;
 b=hs+L02U4GyKBjUQaDksmd2Ay6cxuyRs7wM465r7HI2hGqRldi2lFnBML
 Xk3WMlYikwYRYYWmHl7rpGJQC/uiJra7flgQoOCew8vnaJSsCxpXTYDoP
 sxROHFIxPcwV/qBwG9PtLr9gTgLKHFL8IoyJXViu7rc6+sGDzPXqMG5AB
 9aT3efX22COdIWfZbVr28FTZ7kmgoGzQbZ1TOOlrSTIRHj22PpAInRGr+
 kUDRFSsuXtjEaPz0RugOH7qwFPItnVZqjuCw4AxA0fOaZl5Vwz5Pefhjb
 8PPAWB9jNo45Od416X8HpAAb4VQ18c3yzXOHBU2XuhQ2R/l1w0RvwDTI7 w==;
X-CSE-ConnectionGUID: s9QinjPETi6w31LB+4LKhg==
X-CSE-MsgGUID: B29cPDoiTOmKyTR0FNyTbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49297149"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="49297149"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 10:12:46 -0700
X-CSE-ConnectionGUID: JmodFW5JRl6qepOd9SIxgA==
X-CSE-MsgGUID: pIBgd73PTjKfx6BpZuCr7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="138793572"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 16 May 2025 10:12:42 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v7 13/14] lib/igt_device_scan: Replace rindex with
 strrchr
Date: Fri, 16 May 2025 17:11:52 +0000
Message-ID: <20250516171153.74079-14-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516171153.74079-1-jeevaka.badrappan@intel.com>
References: <20250516171153.74079-1-jeevaka.badrappan@intel.com>
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

As rindex is deprecated, replace index with strrchr.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_device_scan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 3f26a1737..45faabc45 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -1258,7 +1258,7 @@ igt_devs_print_user(struct igt_list_head *view,
 		if (!dev->drm_card || dev->drm_render)
 			continue;
 
-		drm_name = rindex(dev->drm_card, '/');
+		drm_name = strrchr(dev->drm_card, '/');
 		if (!drm_name || !*++drm_name)
 			continue;
 
@@ -1306,7 +1306,7 @@ igt_devs_print_user(struct igt_list_head *view,
 			if (strcmp(dev2->parent->syspath, dev->parent->syspath))
 				continue;
 
-			drm_name = rindex(dev2->drm_render, '/');
+			drm_name = strrchr(dev2->drm_render, '/');
 			if (!drm_name || !*++drm_name)
 				continue;
 
-- 
2.49.0

