Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B64CCFA1B
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 12:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E1710EAAD;
	Fri,  7 Nov 2025 12:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldmF4B3v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B0710E0AA
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 12:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762518275; x=1794054275;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=VMfG//4JfULIXyJicJK1QoO3UoVIkX1yAm9E0wucDdM=;
 b=ldmF4B3vl8Oi/rAplo1AOQZFZpFXMwvRf4CtvVzzq8zjrqzKsHU7i2KJ
 8oXyCr7JM1w6DU8oGCZfOtMY14Xtiw84u/9Ajiw8hona+//efh5gHR1s4
 azh0x49CKj3isPA9SqrjnIyVfCFMAtsfgge4e85oBMxXyPGkuIJKM6Dck
 Oi821iwNkqC5aQGOTB7/cXovz1lcp00CzZpM3Vvsolzd+4/ESlea3kx43
 t2O9BlhGx6B5+MHYiVMqksCybcSdXQkTJUY2bqkT232IXzUIOgOYBPjtV
 tTkB6xtZDlawN00f2U499VZdr0gzbbykz/2nbAD7wlH+2hPTXWe2tfiI/ w==;
X-CSE-ConnectionGUID: co1uyMCsQ+ae2c+FQHrlqQ==
X-CSE-MsgGUID: WpMqtbbzTJiv0Chj7QT3lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64365673"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="64365673"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 04:24:34 -0800
X-CSE-ConnectionGUID: /YcESNHzTVCYIGZL9lCBbw==
X-CSE-MsgGUID: fIwplrJbT5GV1JsQEWlD0g==
X-ExtLoop1: 1
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 04:24:34 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 07 Nov 2025 13:23:15 +0100
Subject: [PATCH v2 2/8] tests/intel/xe_eudebug_online: use helper to get
 hwconfig value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-xe_query_helpers-v2-2-ec66ba6af1c1@intel.com>
References: <20251107-xe_query_helpers-v2-0-ec66ba6af1c1@intel.com>
In-Reply-To: <20251107-xe_query_helpers-v2-0-ec66ba6af1c1@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=VMfG//4JfULIXyJicJK1QoO3UoVIkX1yAm9E0wucDdM=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpDeS6VIw8b/Tqun7ybyOxVi3cf+HId5XJXdPTQ
 f3FquWTUkGJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaQ3kugAKCRAjYrKT3hD9
 11zlC/4k+3VdmFs1FgL46J3HytVwJdwf7FoTeKyBBf8i4rI1GTJW5zPiAhvOaAWFj77KUEEmgLI
 iG4HBAJG2GeIcscdFuAryowXKcUZzrVbTiNHdVZZjZ1CUgewxq3j38qCgc/LWY05T+GYtG6rs77
 MfveWBJYZZP/XV6y22qsX6e8U6vu3N813cdEOX54McPW+hiK/UdndrqYMKcywRE3+s5ASzbOOo2
 1TQMYb4cm/tjYBel5ol7u1IdqOZRJ0Uq/CEsgsIXU7KHPCcaNQmuSrW6fa2XZbUs1xwE6zUC9Jy
 7VVOIKmFRa31J+IzmVfMf6VIOljp68Y0u13ZdZluuqYIbTlrmnJPkZtS4qm0nLhhgEND4Fvgqyv
 hecIfp134YgMLBVF3gkihotIeQoUXSPLYTC91QONMhpcP5mYlvCB+SF2X6p5fr2sW5aNfgL7OHz
 Gz++CaNbYrStAbZO8NT8UGqxYeh62Imkv+D9hRlUjChecorp7pPOYb2OW4DUlxMQSPJb0=
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
---
 tests/intel/xe_eudebug_online.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index e1516c202f15d9bb90d3cf0f6ed30700b5479af9..ef700c2591291f9a22849c2995c83cc5ec0ac6d9 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1182,9 +1182,7 @@ static bool intel_gen_has_lockstep_eus(int fd)
 
 static int query_attention_bitmask_size(int fd, int gt)
 {
-	uint32_t thread_count_len;
-	uint32_t *thread_count_ptr;
-	uint32_t threads_per_eu = 8;
+	uint32_t threads_per_eu = xe_hwconfig_get_u32(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU, 8);
 	struct drm_xe_query_topology_mask *c_dss = NULL, *g_dss = NULL, *eu_per_dss = NULL;
 	struct drm_xe_query_topology_mask *topology;
 	struct drm_xe_device_query query = {
@@ -1197,13 +1195,6 @@ static int query_attention_bitmask_size(int fd, int gt)
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

