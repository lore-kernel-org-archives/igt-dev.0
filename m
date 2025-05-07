Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B279BC3ABC0
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 16:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA7710E861;
	Wed,  7 May 2025 16:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9vsdTJd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0239610E866
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 16:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746633899; x=1778169899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+TUu9iw7WbHqrCmnkQmHKO0shDOprxSHUxR0208DOb8=;
 b=e9vsdTJdQ4jNAV7qPV/4tTS21QkSytvxYLlyZ4RCTCtI/8l10S036TZh
 8zNbf4goSVk1nqQWabirZqTDq72ZXvTh375yXaPgwpzHL1TmPqQck8os7
 IoPQMZqbdieU0KkChq6UepJFNGVLzPeEVJjzTpfKkAotqjYTzq1kXW7ct
 RSLzI4FWGCrPjdejVDoLqWcKvKTMdlqmvC3eazD500biIYm0oeCPfoXIi
 u2CsX4g4AhF0O3MH5iQqFkTNFPBC2sEQ8lvpz0TQ5Pk3sP16mIZP9laZ6
 a1tzHqvqGVp/YyNEzaAqIwiSh9QGH1Xj3aGiivgdny3fddRX0hT+q73h9 g==;
X-CSE-ConnectionGUID: 4lnosTCHS/yERtldStDU6Q==
X-CSE-MsgGUID: aflmqZwmTk+6BidsQE8VMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48519593"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="48519593"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:04:16 -0700
X-CSE-ConnectionGUID: 7eoRL8JQQXKYWwy1wiu8VQ==
X-CSE-MsgGUID: PKbmhcMPSMuFqqUAt+gQDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="173201397"
Received: from unknown (HELO 0a83d5f6e242.iind.intel.com) ([10.66.234.123])
 by orviesa001.jf.intel.com with ESMTP; 07 May 2025 09:04:13 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH v4 14/15] lib/igt_device_scan: Replace rindex with strrchr
Date: Wed,  7 May 2025 16:01:47 +0000
Message-ID: <20250507160148.53857-15-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
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
---
 lib/igt_device_scan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 7e9614429..e23943a10 100644
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
2.34.1

