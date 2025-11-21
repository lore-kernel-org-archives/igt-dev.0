Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC323CFA76D
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 11:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0C010E852;
	Fri, 21 Nov 2025 11:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FHQhCQxK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4958010E0A0
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 11:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763722830; x=1795258830;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=MxemYzqftO1mnV484PapWj/xoSQFjt0Swgc+kMaQ2Bc=;
 b=FHQhCQxKSZlvJhbBeOyKkQkwusbR/ZZnScuWgkcYTtE2QwWAztHodzZx
 UMFOD+jPmRp79rWJWXvfRPJUo/zIF4XZEFWvvDbDrdhTJsP+pxCCExi8r
 RwhhxlS5GsLsfRqgRxPAQFgJAhYZjaINnxsiBM4mmB9+zmRMxmeY9NN9s
 ZuOQHo17afK+doqpEx4maTbZ8Rd6jbCaOiCQ9qyIleKi0KkDgBDZGCmQW
 g68ChfDalHCcTIqrn+fytELsyzDUm2m8875pDpPiMShbTAabVOx/2O41n
 fgserIgzXYHS0nQsSfn/BkgV78CoAy4CtpD6M3+YmnmHpuV7jmUeiFJL9 Q==;
X-CSE-ConnectionGUID: VEdbK2xnRqme7zbc5bFP/g==
X-CSE-MsgGUID: wLKodNkuSTaCwmkxPEYtlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83203548"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="83203548"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 03:00:29 -0800
X-CSE-ConnectionGUID: tyLGcHDkRXiYgsalm5nFhw==
X-CSE-MsgGUID: l/vZLIfuSKChvGZAfIdlxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="195953839"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 03:00:28 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 21 Nov 2025 11:59:00 +0100
Subject: [PATCH v5 1/5] tests/intel/xe_eudebug_online: use helper to get
 hwconfig value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-xe_query_helpers-v5-1-d69c1c160e96@intel.com>
References: <20251121-xe_query_helpers-v5-0-d69c1c160e96@intel.com>
In-Reply-To: <20251121-xe_query_helpers-v5-0-d69c1c160e96@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 =?utf-8?q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=MxemYzqftO1mnV484PapWj/xoSQFjt0Swgc+kMaQ2Bc=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpIEYFc+ywDwnoak2BWZzyuYc+MQTSdXHctwtFT
 EEAHxg2xY6JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSBGBQAKCRAjYrKT3hD9
 14lPDACUwZnDHjZ+7Dp7vQEOGmz2Q/9W7RA167fC2PY8Xp8z7LSot5PspD0l0E26NRw21/E5OHM
 LxKDmLNzsgQTiMskCTpP2W8o85B9/bNeIohIuLtNzeXpKqPJVFpDIUo4CYhoktISM3SMZ1a4XSJ
 OKWNe+aFzmDMIMXs6ErqtkqCVecbrc6ZYYzH4bVTl6BHZiGBYs2dv5UkNWs+DgwPoPX/2sh+EJa
 pMPUZ7TUTupz+ugckgAlpgHk2dvyDW8y11A6JpDE30YnqMIR1f5sZtOWnXePByqBRWwtdayb7pK
 l0gvtScycgDs1OAlepLlj54lCyoCqsnBRPj02gVEEAQtW3m+A8FawTahVuFab4v6ojzunvJgK4Q
 FLQdT5o7EHtsLBQ114JAJc0x4At7z4O/WukMAwJzdieC1GTYsEVms9T8GoqkIArx5RX5vJceVDR
 Ycer+FYyti0480htj6Tjo8eG06HL/iQDumdxLKritcF01IF5x0dAKu7b9jRdFC+LtkGJc=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Recently introduced helper makes the code cleaner.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_eudebug_online.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 50d95988e6b3aa727f12e5d1c8ca52692de4d302..a5b2864a47a34b9051756174f73667bbc602e00b 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1206,9 +1206,7 @@ static bool intel_gen_has_lockstep_eus(int fd)
 
 static int query_attention_bitmask_size(int fd, int gt)
 {
-	uint32_t thread_count_len;
-	uint32_t *thread_count_ptr;
-	uint32_t threads_per_eu = 8;
+	uint32_t threads_per_eu = xe_hwconfig_lookup_value_u32(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU);
 	struct drm_xe_query_topology_mask *c_dss = NULL, *g_dss = NULL, *eu_per_dss = NULL;
 	struct drm_xe_query_topology_mask *topology;
 	struct drm_xe_device_query query = {
@@ -1221,13 +1219,6 @@ static int query_attention_bitmask_size(int fd, int gt)
 	int pos = 0;
 	int i, last_dss_idx;
 
-	thread_count_ptr = xe_hwconfig_lookup_value(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU,
-						    &thread_count_len);
-	if (thread_count_ptr) {
-		igt_assert(thread_count_len == 1);
-		threads_per_eu = *thread_count_ptr;
-	}
-
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 	igt_assert_neq(query.size, 0);
 

-- 
2.43.0

