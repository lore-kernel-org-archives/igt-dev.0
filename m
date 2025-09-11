Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72A9CA1016
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 10:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5574E10E0AD;
	Thu, 11 Sep 2025 10:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eF9E9fUz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2769C10E0AD
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 10:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757588246; x=1789124246;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7opZlC40fHE19cloHJrcTlUqS7RqAGXmi3VsMij8Ys4=;
 b=eF9E9fUzOhsg2QASDtcCHDwlAl4yeXGE9wcb+XDxKiCyTdkZgBuxXyqu
 pQWNznq8FNaGhbB9zENU6cuszhEM/t0f2mJYwXRpL0LofhUrxIfOgYan4
 wZrYCtAqt1y9NLRTmEVvgglIfBNgC8ZJjZHJN8A0Xu+qCyELIz0Y9f8KA
 nGafFntRrinuJu33YiPxy9E0IXhnKo2vjTvDK83TPoPx00crl/AnTyrqG
 vRugSZmDQLs/iZn6Ai/PzERWBHhjPmObelsuCWrYOO4/GW9UTQolQ5bUp
 lvpaER3oA/pLqxhz9bmcT2Ev0M4nmJ2lcxYVy3KHyTTyKl/Rg+EyrFcXo g==;
X-CSE-ConnectionGUID: tpMtOTd8Q/yRg9VQ8r8msQ==
X-CSE-MsgGUID: kWlIwEh8SYW1n7itCI8sDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59147569"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="59147569"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 03:57:26 -0700
X-CSE-ConnectionGUID: SXNqZxDrTjaErHnr1v7Opg==
X-CSE-MsgGUID: xlVjm6u/ROeGiZp5s8OB1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="204422232"
Received: from dev.igk.intel.com ([10.211.135.225])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 03:57:24 -0700
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH i-g-t] drm-uapi-experimental: adjust eudebug ioctl numbers
Date: Thu, 11 Sep 2025 12:57:39 +0200
Message-Id: <20250911105739.2374050-1-maciej.patelczyk@intel.com>
X-Mailer: git-send-email 2.35.0
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

Adjust DRM_XE_EUDEBUG ioctls not to conflict with drm-tip
DRM_XE_MADVISE 0x0c and DRM_XE_VM_QUERY_MEM_RANGE_ATTRS 0x0d.

Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 include/drm-uapi-experimental/xe_drm_eudebug.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/drm-uapi-experimental/xe_drm_eudebug.h b/include/drm-uapi-experimental/xe_drm_eudebug.h
index f66de2ff5..5aeb6a735 100644
--- a/include/drm-uapi-experimental/xe_drm_eudebug.h
+++ b/include/drm-uapi-experimental/xe_drm_eudebug.h
@@ -19,9 +19,9 @@ extern "C" {
  */
 
 /* XXX: BEGIN section moved from xe_drm.h as temporary solution */
-#define DRM_XE_EUDEBUG_CONNECT		0x0c
-#define DRM_XE_DEBUG_METADATA_CREATE	0x0d
-#define DRM_XE_DEBUG_METADATA_DESTROY	0x0e
+#define DRM_XE_EUDEBUG_CONNECT		0x0e
+#define DRM_XE_DEBUG_METADATA_CREATE	0x0f
+#define DRM_XE_DEBUG_METADATA_DESTROY	0x10
 
 /* ... */
 
-- 
2.35.0

