Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3048C624DE
	for <igt-dev@archiver.kernel.org>; Fri,  4 Sep 2026 08:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E9710F92B;
	Fri,  4 Sep 2026 08:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Co7W6B75";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF7D10F92D
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Sep 2026 08:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788509452; x=1820045452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R0Af5rkJBnKRt+0uRYzo1hlGpB1Sg0KhD3YaEqXlfpE=;
 b=Co7W6B75rRoHZgG6E490iG54CnOAdtGpsG8w5tI1I0J11TSvu1UyiXBk
 d03HNPYiPvwKsK9+Arm5BIBhUhZ02Dx4OpshKNYTXA5mVykX8C72V1z7Y
 UQhhZTFcXiyQB1eSZWhKsVZUcw3u2LdyCxOai7IR+jz3k2vKVKWZI3qYy
 QFxxyphWe95lO/hXvkdI4wcEpNxqKg2Etv1H2HT5KEc5dd0ftj+XZ0uns
 37z0aq6VyvMZdlS2aUi2NJ5/bf4K+vDBDwYhVLViPdCbd/I6N795VjuSw
 iDBf1Q3biWfcpeLKH5/Z9baAqPrv1QZ4jhTlXJz+Bl5MpYe3NLJYd2FJA g==;
X-CSE-ConnectionGUID: 8nBgBh6TSBGK5uBOnscDTQ==
X-CSE-MsgGUID: xV8E3NmIT8u38gOi8bTFPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100166341"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="100166341"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 01:10:52 -0700
X-CSE-ConnectionGUID: DIGOJV3yTWicJFboyV9X3A==
X-CSE-MsgGUID: wP9OTG32Tj2c1GJqp4dVDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="267399582"
Received: from suja-super-server.iind.intel.com ([10.190.238.52])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 01:10:50 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, andrzej.hajda@intel.com,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Subject: [PATCH i-g-t 1/2] lib/intel_pat: add intel_pat_has_wt()
Date: Fri,  4 Sep 2026 14:26:49 +0530
Message-Id: <20260904085650.98553-2-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904085650.98553-1-sujaritha.sundaresan@intel.com>
References: <20260904085650.98553-1-sujaritha.sundaresan@intel.com>
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

Not every platform has a write-through entry in its PAT table. Where
there is none the KMD reports the UC index for XE_CACHE_WT, so a test
which asks for write-through quietly gets uncached instead. Spotting
that currently means enumerating IP versions in the test, which needs
touching again for every platform added.

Add intel_pat_has_wt(), which answers the same question from the PAT
config itself: a WT index which aliases UC means there is no distinct
write-through entry to test. No functional change; the first user is
the next patch.

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 lib/intel_pat.c | 22 ++++++++++++++++++++++
 lib/intel_pat.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 2f35bb772..782201029 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -284,6 +284,28 @@ uint8_t intel_get_pat_idx_uc_comp(int fd)
 	return pat.uc_comp;
 }
 
+/**
+ * intel_pat_has_wt - Check whether the platform has a write-through PAT index
+ *
+ * @fd: DRM device fd
+ *
+ * Platforms with no write-through entry in their PAT table report the UC
+ * index for XE_CACHE_WT, so a WT index which aliases UC means there is no
+ * write-through mode to exercise. Deriving this from the PAT config rather
+ * than from a list of IP versions keeps it working for platforms added
+ * later.
+ *
+ * Returns: true if the platform has a distinct write-through pat_index
+ */
+bool intel_pat_has_wt(int fd)
+{
+	struct intel_pat_cache pat = {};
+
+	intel_get_pat_idx(fd, &pat);
+
+	return pat.wt != pat.uc;
+}
+
 uint8_t intel_get_pat_idx_wt(int fd)
 {
 	struct intel_pat_cache pat = {};
diff --git a/lib/intel_pat.h b/lib/intel_pat.h
index a31b60e86..824f8931e 100644
--- a/lib/intel_pat.h
+++ b/lib/intel_pat.h
@@ -37,6 +37,8 @@ uint8_t intel_get_pat_idx_wb(int fd);
 
 uint8_t intel_get_pat_idx_uc_comp(int fd);
 
+bool intel_pat_has_wt(int fd);
+
 int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
 int32_t xe_get_pat_hw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
 
-- 
2.34.1

