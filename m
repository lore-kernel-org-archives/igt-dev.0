Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7E5FEA838
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 09:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8E510E84B;
	Wed, 25 Mar 2026 09:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqSpgqRY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168BF10E84B
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 09:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774430509; x=1805966509;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lMn78SLUAO9uK3r19deYY6PnvcZfRfgM4kCZRJZtt0E=;
 b=gqSpgqRYf8dhOim9Lz7R+otVk98DFtEVCg8H5vCuVNHGcyoTsGnG2ADD
 L5VCl1/4HUOK72mS37A2MRzqwpvU0ZKl/Sd/HH9SGTY/OSxWGZ/w70typ
 rZoh7SZwyHYtNy/tnC8GRytjJTgHiWMiRS6xqR6qR21vmSGdSMD/dFrj7
 jHCKrnH7rbqLVoHu2+xSNKCvAcnF1qP5kY0oqAIBVcNSe951kcWqJdI8B
 3khEHwLcpVtPfBMN4X2cnBE8KoUIV7knpIkDJvCRf4NcPfoor3qt3qW0c
 wJw/7tOkM5kBmNcY+6iGm+lPZCt8Sv8H07aahG+02VmXM1z4jcALT9vZk g==;
X-CSE-ConnectionGUID: eqPfG0uwSBygkkv/KHRLIA==
X-CSE-MsgGUID: afd7r8zQTN2UNIEBIXhVsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="93038973"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="93038973"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 02:21:49 -0700
X-CSE-ConnectionGUID: 2rI5Fp/wSgyox9FhhweM8A==
X-CSE-MsgGUID: hGZ5pESxT5W3Muh6RtoUBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="221295403"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.58])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 02:21:47 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Xin Wang <x.wang@intel.com>
Subject: [PATCH i-g-t] lib/intel_pat: Fix typo PAT_MODE -> PTA_MODE
Date: Wed, 25 Mar 2026 10:21:35 +0100
Message-ID: <20260325092134.112722-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

PAT table contain PTA mode so fix PAT typo as parsing this line
isn't working properly.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Xin Wang <x.wang@intel.com>
---
 lib/intel_pat.c | 4 ++--
 lib/intel_pat.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 525d9ad24a..b202a62419 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -64,10 +64,10 @@ int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
 			} else {
 				igt_warn("Failed to parse PAT entry line: %s\n", line);
 			}
-		} else if (strncmp(line, "PAT_MODE", 8) == 0) {
+		} else if (strncmp(line, "PTA_MODE", 8) == 0) {
 			p = strstr(line, "(");
 			if (p && sscanf(p, "(%x", &value) == 1)
-				xe_pat_cache->pat_mode = value;
+				xe_pat_cache->pta_mode = value;
 		} else if (strncmp(line, "PAT_ATS", 7) == 0) {
 			p = strstr(line, "(");
 			if (p && sscanf(p, "(%x", &value) == 1)
diff --git a/lib/intel_pat.h b/lib/intel_pat.h
index e5dd8a0af7..1772785205 100644
--- a/lib/intel_pat.h
+++ b/lib/intel_pat.h
@@ -25,7 +25,7 @@ struct intel_pat_cache {
 	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and later*/
 	uint8_t max_index;
 	struct xe_pat_entry entries[XE_PAT_MAX_ENTRIES];
-	uint32_t pat_mode;
+	uint32_t pta_mode;
 	uint32_t pat_ats;
 };
 
-- 
2.43.0

