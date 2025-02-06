Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13875C02196
	for <igt-dev@archiver.kernel.org>; Thu,  6 Feb 2025 13:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CEF10E849;
	Thu,  6 Feb 2025 13:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Izfk2Pwp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774A610E2F7
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2025 13:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738848612; x=1770384612;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N3JaONd2Nko4FZUCe4HL/014fVE0jkkIovcWZPn9lis=;
 b=Izfk2Pwps750W6B1/DYpK78LtvsA+HcogEKUUCWrIRbuQFR6NvY+NgLs
 ERAxDJBP5LVpJskgOTQUq+X04FvPRcBSsFgSzgvFRxxN5iUx6nt6ulZcO
 8V4sQxzPWg77xdX+ZMA+ArDyv2DuADDpziVV5nqEQq4VaWcCNTcAUoI/x
 FGQbLNZKKW9Yfo7CbvTrgQgQFeh/QKBofk8EFUcj+wQs5B5B7eUglEKqB
 wHMqwMO/ezDJyX/Gt0KZ+ToH1Ki9B3iy3NLCnA0YdJql42oori8ItafCz
 YRidrLhNa8yZXakDLBiTh3K5O2Xb/DZcGWqwJpnUxl5EwDhVUbyD/zSu0 Q==;
X-CSE-ConnectionGUID: rIoWzBOJQrCCJkBGNGPuPA==
X-CSE-MsgGUID: 5NXaxpFwRxmyM+3p+UILhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43204746"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="43204746"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 05:30:11 -0800
X-CSE-ConnectionGUID: iV88GnbBRBCnbB28yk77nw==
X-CSE-MsgGUID: xeIdEjVQQvudSrxj21R+rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="111127906"
Received: from sosterlu-desk.ger.corp.intel.com (HELO dgrzegor-mobl2..)
 ([10.245.245.161])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 05:30:09 -0800
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t] xe_eudebug_online: Adjust bitmask calculation
Date: Thu,  6 Feb 2025 14:30:03 +0100
Message-Id: <20250206133003.618882-1-dominik.grzegorzek@intel.com>
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

Adjust bitmask calculation so it matches kernel changes which send also
zeros for fused out subslices.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug_online.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 30ecadfe0..2ccbd0a21 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1187,8 +1187,9 @@ static int query_attention_bitmask_size(int fd, int gt)
 		.size = 0,
 		.data = 0,
 	};
-	int pos = 0, eus;
-	uint8_t *any_dss;
+	uint8_t dss_mask, last_dss;
+	int pos = 0;
+	int i, last_dss_idx;
 
 	thread_count_ptr = xe_hwconfig_lookup_value(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU,
 						    &thread_count_len);
@@ -1231,22 +1232,27 @@ static int query_attention_bitmask_size(int fd, int gt)
 	igt_assert(g_dss && c_dss && eu_per_dss);
 	igt_assert_eq_u32(c_dss->num_bytes, g_dss->num_bytes);
 
-	any_dss = malloc(c_dss->num_bytes);
-	igt_assert(any_dss);
+	for (i = 0; i < c_dss->num_bytes; i++) {
+		dss_mask = c_dss->mask[i] | g_dss->mask[i];
+		if (dss_mask) {
+			last_dss = dss_mask;
+			last_dss_idx = i;
+		}
+	}
 
-	for (int i = 0; i < c_dss->num_bytes; i++)
-		any_dss[i] = c_dss->mask[i] | g_dss->mask[i];
+	last_dss_idx *= BITS_PER_BYTE;
+	do {
+		last_dss_idx++;
+	} while (last_dss >>= 1);
 
-	eus = count_set_bits(any_dss, c_dss->num_bytes);
-	eus *= count_set_bits(eu_per_dss->mask, eu_per_dss->num_bytes);
+	last_dss_idx *= count_set_bits(eu_per_dss->mask, eu_per_dss->num_bytes);
 
 	if (intel_gen_has_lockstep_eus(fd))
-		eus /= 2;
+		last_dss_idx /= 2;
 
-	free(any_dss);
 	free(topology);
 
-	return eus * DIV_ROUND_UP(threads_per_eu, 8);
+	return last_dss_idx * DIV_ROUND_UP(threads_per_eu, 8);
 }
 
 static struct drm_xe_eudebug_event_exec_queue *
-- 
2.34.1

