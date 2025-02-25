Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AA6C021BC
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 12:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74E110E669;
	Tue, 25 Feb 2025 12:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="KlRJZQbI";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6452610E669
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 12:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=61uDp9vM+afHcBspP0y6XMN27I4VktZUqDN+pMvRIRM=; b=KlRJZQbI9xmLSrI0LFyjIpvZCN
 DsJ3RRR3U9wqNwr8uZZqyOQSkS6I9DDV/Xnx5g8mPCp3VgMR1gYmld5pTILCOerMlOENRkqQAiPUy
 pJj90SfShsioBFoMUjKoKuM2fNGWaIWPg0drq3OruH3GRF/ePamI4TKWMyoqOdqdqS3rcCbh2D4s3
 toFv8A/nPTJAfaRWfSMrvqC8J88oGcHOrJgXcQSThjfuzcjoT0OrRhOUTWyUJe8wFfZQRp/Kuyxel
 njbmfm+U1i7pQngFpaCBnd+KY1vtV9Q1d9w+rXwhA1XtuUNSslwivkoSw1pYkLLaoDIfaVJDZ0a/P
 QdDd4TaA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tmuIz-000O2l-OL; Tue, 25 Feb 2025 13:45:03 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 2/2] lib/xe: Make running under Valgrind quiet
Date: Tue, 25 Feb 2025 12:44:54 +0000
Message-ID: <20250225124454.1976-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250225124454.1976-1-tvrtko.ursulin@igalia.com>
References: <20250225124454.1976-1-tvrtko.ursulin@igalia.com>
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

Let Valgrind know which memory is initialised by ioctls so running tests
under it becomes less noisy.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/xe/xe_query.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index ec2b127b7e87..0d2e4805c8ee 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -9,6 +9,15 @@
 #include <stdlib.h>
 #include <pthread.h>
 
+#ifdef HAVE_VALGRIND
+#include <valgrind/valgrind.h>
+#include <valgrind/memcheck.h>
+
+#define VG(x) x
+#else
+#define VG(x) do {} while (0)
+#endif
+
 #include "drmtest.h"
 #include "ioctl_wrappers.h"
 #include "igt_map.h"
@@ -34,6 +43,8 @@ static struct drm_xe_query_config *xe_query_config_new(int fd)
 	query.data = to_user_pointer(config);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
+	VG(VALGRIND_MAKE_MEM_DEFINED(config, query.size));
+
 	igt_assert(config->num_params > 0);
 
 	return config;
@@ -62,6 +73,8 @@ static uint32_t *xe_query_hwconfig_new(int fd, uint32_t *hwconfig_size)
 	/* Perform the query to get the actual data */
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
+	VG(VALGRIND_MAKE_MEM_DEFINED(hwconfig, query.size));
+
 	*hwconfig_size = query.size;
 	return hwconfig;
 }
@@ -84,6 +97,8 @@ static struct drm_xe_query_gt_list *xe_query_gt_list_new(int fd)
 	query.data = to_user_pointer(gt_list);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
+	VG(VALGRIND_MAKE_MEM_DEFINED(gt_list, query.size));
+
 	return gt_list;
 }
 
@@ -117,6 +132,8 @@ static struct drm_xe_query_engines *xe_query_engines(int fd)
 	query.data = to_user_pointer(engines);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
+	VG(VALGRIND_MAKE_MEM_DEFINED(engines, query.size));
+
 	return engines;
 }
 
@@ -138,6 +155,8 @@ static struct drm_xe_query_mem_regions *xe_query_mem_regions_new(int fd)
 	query.data = to_user_pointer(mem_regions);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
+	VG(VALGRIND_MAKE_MEM_DEFINED(mem_regions, query.size));
+
 	return mem_regions;
 }
 
@@ -161,6 +180,8 @@ static struct drm_xe_query_oa_units *xe_query_oa_units_new(int fd)
 	query.data = to_user_pointer(oa_units);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
+	VG(VALGRIND_MAKE_MEM_DEFINED(oa_units, query.size));
+
 	return oa_units;
 }
 
-- 
2.48.0

