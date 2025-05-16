Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F89C3ABC9
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 16:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B1F10EB15;
	Fri, 16 May 2025 16:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n7bgXwb0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8565B10EB23
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 16:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747411612; x=1778947612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c30f9w4gwit8nY81ngE6AnPMSZU0AbU9GQonoQSa58o=;
 b=n7bgXwb0RAwRWn0RUjMjwyN6Qu1YRlignEVcHE8mGYIVWO6L5oaCrmNL
 RUm2K3ttt5W4n2z9iosKqIpZRycIDk8OwSfdLocmcXSX2P0IYuL7C2Y/H
 fgn8Lkrq5xYBgZVi2J4crE56uRaDtiVBo4KRDocPBA/JZLI++ubCx150B
 GUJDg8krzg1EIkDiECIBJSX2Sbt7YQb7uxXLW8iQ4qLKEs0Zs4nJa1VoK
 cModEFN8QVI65EuZXxNisL4J/+mutn5kHJuGqFWg7NeaYXgVbk85s7Y7s
 5AkmdkVs+xszkzJ7DXtYrbXepPaFLZC+LER6kgRCmuNWnLFN4ySYE1mZG g==;
X-CSE-ConnectionGUID: du9f5NAaTZOrQzziNsQvRA==
X-CSE-MsgGUID: Q575nwGIRpmhGAdhCFvU3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="66941186"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="66941186"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 09:06:50 -0700
X-CSE-ConnectionGUID: xZg4NckuSP+VPjhxR5tcKQ==
X-CSE-MsgGUID: ORNz2DbJSGqJt4/3jVCtig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="169772629"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 09:06:47 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v6 13/14] lib/igt_device_scan: Replace rindex with
 strrchr
Date: Fri, 16 May 2025 16:05:50 +0000
Message-ID: <20250516160551.58760-14-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
References: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
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

