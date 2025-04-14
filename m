Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC7FC369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 08:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAE210E4E0;
	Mon, 14 Apr 2025 08:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MaKyo6Qp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B76210E4E0
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 08:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744619809; x=1776155809;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x93m/KX1u+eAPjpNzIUaEOA/08G84in/CV2yRebad4M=;
 b=MaKyo6Qp6KUpLr186U3Cno4XsYHSVhK+c7p04gIHb72AkwGl12C0z9iu
 30HtWqgGRYEdkKRA8MUPJJ5KcwakofGIbykqhOtX/xTRw4vb4eQrZFAdU
 M8bn+jmJp9PIL3QqDGwcD4/5WOCu3Gd9TTtEoooV5Cc5RRniUzrcDiCfU
 8nLwHr/IvRneBXeCjf5dEVoZR5QQpyZmDjcXm39aXIMjfsKduzhTLVQIX
 h5HE38SyT2WiI9LAx+K8CZRQgG8d4ACMG3DqaQgPVxgIp2yIx4sfARvD+
 KtZCZKkKRcqkEsRNMBOMBQXkUr30m3KHKpAim/giT/EoSAAJ+/MqMtz2i A==;
X-CSE-ConnectionGUID: fUx4J2rJTduqfDiNWOYedA==
X-CSE-MsgGUID: WJPz51e9TESgL5rug3SeTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46243009"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="46243009"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 01:36:45 -0700
X-CSE-ConnectionGUID: nCAWIy53QzWh/8o4HVv3NA==
X-CSE-MsgGUID: QzIQQ2bTQiKy8wW3Yimdzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="129695325"
Received: from unknown (HELO nakshtra-System-Product-Name.iind.intel.com)
 ([10.190.238.69])
 by orviesa010.jf.intel.com with ESMTP; 14 Apr 2025 01:36:43 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Cc: dwarakanath.ramadeva@intel.com
Subject: [PATCH] tests/intel/xe_mmap: Adding igt exercise for RO page
Date: Mon, 14 Apr 2025 14:06:27 +0530
Message-Id: <20250414083627.3264121-1-nakshtra.goyal@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Nakshtra Goyal <nakshtra.goyal@intel.com>

Map a memory then make it read-only and verify kernel out for read-only
memory

Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
---
 tests/intel/xe_mmap.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index 5fd641075..649a11544 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -338,6 +338,24 @@ static void test_small_bar(int fd)
 	gem_close(fd, bo);
 }
 
+static int
+__xe_query(int fd, struct drm_xe_device_query *q)
+{
+	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, q))
+		return -errno;
+	return 0;
+}
+
+static int
+__xe_query_items(int fd, uint32_t *items, uint32_t n_items)
+{
+	struct drm_xe_device_query q = {
+		.size = n_items,
+		.data = to_user_pointer(items),
+	};
+	return __xe_query(fd, &q);
+}
+
 static void assert_caching(int fd, uint64_t placement, uint32_t flags,
 			   uint16_t cpu_caching, bool fail)
 {
@@ -357,7 +375,16 @@ static void assert_caching(int fd, uint64_t placement, uint32_t flags,
 	map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);
 	igt_assert(map != MAP_FAILED);
 	map[0] = 0xdeadbeaf;
+	munmap(map, size);
 	gem_close(fd, handle);
+
+	/* Adding a Read-Only page check exercise */
+	map = mmap(0, size, PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0);
+	igt_assert(map != MAP_FAILED);
+	igt_assert_eq(0, mprotect(map, size, PROT_READ));
+	igt_assert_lt(__xe_query_items(fd, map, 1), 0);
+	munmap(map, size);
+
 }
 
 /**
-- 
2.34.1

