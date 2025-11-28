Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027E0D116F1
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 14:14:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125C810E8E4;
	Fri, 28 Nov 2025 14:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6AjZkeR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D840A10E905
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 14:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764339270; x=1795875270;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=ClgxNvYVSOr2E7T5aQlGKiwpsLNK5QjhYEDY9lDAybo=;
 b=S6AjZkeRBx4xBh0i2DhgKNkBchpDO0Tv8uIE7R9YwEAdqEaMAv22Txpt
 xOv42Kaz3S7O8jjxaiecgCquvh/MkrPeiT98qYdcpKHR/s4EBqOGa00oy
 ATzEpKgawBGpyMEhQNCve9zL7oHsItVt3au9uufK59emH1xewVFqne70l
 2g8AU9k/WGlLlWBAnYLCt4A/VmuYWbhrEuZqox1Dd3tXSbZZ31f7IrKV/
 cepjE3VhpDEvjVJLz/CV0z72el8C4Vq0/ujOxYeoSPdFxPKOviN2zyXCf
 d1gC3f3p/RjbI1iIdhSEsTK3q7uc7tDPl1MDU0VGMVhBqQRJOyroyABDY w==;
X-CSE-ConnectionGUID: kyox0ArQQ2+xBwyWi5QjBw==
X-CSE-MsgGUID: 1095fWnOS+eoZ/cScah4QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66261607"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="66261607"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:29 -0800
X-CSE-ConnectionGUID: R1hAI+YARJ+S8kYOjlNXEw==
X-CSE-MsgGUID: vfny+ChdQ623mBtQgyQLBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="224173660"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:29 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 28 Nov 2025 15:12:10 +0100
Subject: [PATCH 06/11] tests/intel/xe_eudebug_online: use igt_bitmap_fls to
 calculate max dss count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-pagefault-one-of-many-v1-6-a8377a93da8f@intel.com>
References: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
In-Reply-To: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Jan Maslak <jan.maslak@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1993;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=ClgxNvYVSOr2E7T5aQlGKiwpsLNK5QjhYEDY9lDAybo=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpKa30EEigTfNCb52EocisCjpiCVYNYlfGNRBbi
 D7CNkIm8q6JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSmt9AAKCRAjYrKT3hD9
 1yioC/9VFfCKK5J8IM1wsmXrq6IS/PBA+iWeF8z8qjTao7B2LqzYeeMDJoZXwvgTCWFrkNanppw
 OZDsOmuHFY6bRQz83Dg4QHNg1r9vAgrp1EJNaCH2h8KIyY7j+SodW9fCq/Sq2j5YYuvmR/GPe6M
 WL5+8RQb/2lfl0BeBjpX7E0g+lEk2TMpBsXoekAyi0wvKELckkri+WeK2VuDmwgp6JrwvDbU9Qz
 gEnNa/k6iudTxwh98XAETvRCqtKGId/cOyWJGm9xm4om3H7N3ahWdUirWUBwV6TdVUhiGUG1P4A
 zu0b4YgzmvZ8yl/kjIZD+SCzDQ9lCYp+6NN1W+c4hpNxmvL9WoM705GOesEjxwoorSvqzD8gKHM
 ZTHsf2p7Y4bymgyGuVMgdBTsUyCOeiGq/3yLlNGlsSevdBGPRXDakY7Slb+KmIwMi68Od0iaAhf
 uM05F02szUBAUDk69LQ9ynMosDPG1NDQEadkRBVAdIcye8kMzMA+M3sH0IARVMlToK9ZI=
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

Simplifies the code, and makes it more readable.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel/xe_eudebug_online.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 3e446fff5604..3ed079b74216 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1195,9 +1195,8 @@ static int query_attention_bitmask_size(int fd, int gt)
 	uint32_t threads_per_eu = xe_hwconfig_lookup_value_u32(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU);
 	struct drm_xe_query_topology_mask *c_dss = NULL, *g_dss = NULL, *eu_per_dss = NULL;
 	struct drm_xe_query_topology_mask *topology, *topo;
-	uint8_t dss_mask, last_dss;
 	uint32_t size;
-	int i, last_dss_idx;
+	int i, max_eu_count;
 
 	topology = xe_query_device(fd, DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, &size);
 
@@ -1217,27 +1216,18 @@ static int query_attention_bitmask_size(int fd, int gt)
 	igt_assert(g_dss && c_dss && eu_per_dss);
 	igt_assert_eq_u32(c_dss->num_bytes, g_dss->num_bytes);
 
-	for (i = 0; i < c_dss->num_bytes; i++) {
-		dss_mask = c_dss->mask[i] | g_dss->mask[i];
-		if (dss_mask) {
-			last_dss = dss_mask;
-			last_dss_idx = i;
-		}
-	}
-
-	last_dss_idx *= BITS_PER_BYTE;
-	do {
-		last_dss_idx++;
-	} while (last_dss >>= 1);
+	for (i = 0; i < c_dss->num_bytes; i++)
+		c_dss->mask[i] |= g_dss->mask[i];
 
-	last_dss_idx *= igt_bitmap_hweight(eu_per_dss->mask, eu_per_dss->num_bytes * 8);
+	max_eu_count = igt_bitmap_fls(c_dss->mask, c_dss->num_bytes * 8) *
+		       igt_bitmap_hweight(eu_per_dss->mask, eu_per_dss->num_bytes * 8);
 
 	if (intel_gen_has_lockstep_eus(fd))
-		last_dss_idx /= 2;
+		max_eu_count /= 2;
 
 	free(topology);
 
-	return last_dss_idx * DIV_ROUND_UP(threads_per_eu, 8);
+	return max_eu_count * DIV_ROUND_UP(threads_per_eu, 8);
 }
 
 static struct drm_xe_eudebug_event_exec_queue *

-- 
2.43.0

