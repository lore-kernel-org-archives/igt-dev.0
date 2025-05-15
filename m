Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A853FC3ABDD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 19:53:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E78710E951;
	Thu, 15 May 2025 19:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZSsoxZv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F059510E951
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 19:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747338785; x=1778874785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ySYS/saX/vj01D8Cgj263Avn5aR0TSkCImI/YRssn8I=;
 b=iZSsoxZvgGHc3Ra4+lt3+Y5MFctQtXzfwfHRxpqVNfLTrfhSIVTooSZM
 JqJNFd07VHko5v7mXzWThB1a1LEHXnjoq5MQgjMLR+PB1gTWIpRE4pAJr
 lTGKf72eIAZ3tDm5mbODkSB31Nn0WqIeVYIJQsyV9mNJGCM4amgeLTpc3
 c4l0E2B8irCMViylC6JZSZHxMpy+Q72kvu+JQDXEUlhbRVlhMg71c1+hx
 1rP2Pqas3KFJJeFNzXIrO4vCk2oSIMm68XU70sZ12PWQlJvOLy88ETsKs
 imH0iisnQbDvRoSXXmCCIuT/mwIRDDB9a4ErcMUJwHz58P2tZHqy17NDx g==;
X-CSE-ConnectionGUID: G+NRxyn3T4Wu6SwbqImV6w==
X-CSE-MsgGUID: J5Vl9xkCSrWj4lW3tajLSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49454508"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="49454508"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 12:53:05 -0700
X-CSE-ConnectionGUID: 0SeHxm2wSxebrlNzdP3v3A==
X-CSE-MsgGUID: CHm6aGHhSbOdvps+dHpmLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="138347421"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 15 May 2025 12:53:01 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH 13/14] lib/igt_device_scan: Replace rindex with strrchr
Date: Thu, 15 May 2025 19:52:06 +0000
Message-ID: <20250515195207.106414-14-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515195207.106414-1-jeevaka.badrappan@intel.com>
References: <20250515195207.106414-1-jeevaka.badrappan@intel.com>
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
2.34.1

