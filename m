Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2989CC79FA0
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 07:31:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFB010EA3E;
	Tue,  8 Sep 2026 07:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMhvZqLn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C670610EA25
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 07:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788852593; x=1820388593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=78F15obb5tRpdYhm8+kMwwTdppHGx+DLv6YTTd0OQNg=;
 b=gMhvZqLnUMd30ind+836wkcl5iZJJWpJet8C0pGiuFZx0IR+MiwlWFze
 LFo3daOHUR5b5MRYo9w68aQlcVkV5J82FPgPgStSofzkY3O/ZDQhoa5Ba
 n3oOegnceEyqtuhWiYkaxdF9I1uY14mHRTnzH4wwIf3gY+C5ga4JM20oS
 oh9V3GIoyvnmA0WYKdtyJRDwmAEw/mwfVFnw3+o/CXy55QVCxosCjumky
 fVtpctBPjnXubI8nELr+cbKtomM8O7czBL6/G4Gt9P3D21upTM3uO3V4o
 ILzBI5B4e0HGb9e3ZwgKMVgz+UmTVhNXkz+BaD70LhBsLLw3N0xUVQnQY Q==;
X-CSE-ConnectionGUID: M4dzLc01S/WhsQWa4waRlA==
X-CSE-MsgGUID: vOFYcGvfTsmrU7jHgna5jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106761210"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="106761210"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 00:29:53 -0700
X-CSE-ConnectionGUID: rIXUu2D+RweFoHa/QoJt3A==
X-CSE-MsgGUID: INCfMIJHTEyKUPeLKW3WRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="274702053"
Received: from suja-super-server.iind.intel.com ([10.190.238.52])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 00:29:52 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, andrzej.hajda@intel.com,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Subject: [PATCH i-g-t v2 1/2] lib/intel_pat: add intel_has_pat_wt()
Date: Tue,  8 Sep 2026 13:47:27 +0530
Message-Id: <20260908081728.119942-2-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908081728.119942-1-sujaritha.sundaresan@intel.com>
References: <20260908081728.119942-1-sujaritha.sundaresan@intel.com>
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

Add intel_has_pat_wt(), which answers the same question from the PAT
config itself: a WT index which aliases UC means there is no distinct
write-through entry to test. No functional change; the first user is
the next patch.

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/intel_pat.c | 22 ++++++++++++++++++++++
 lib/intel_pat.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 2f35bb772..da7ba1e51 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -284,6 +284,28 @@ uint8_t intel_get_pat_idx_uc_comp(int fd)
 	return pat.uc_comp;
 }
 
+/**
+ * intel_has_pat_wt - Check whether the platform has a write-through PAT index
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
+bool intel_has_pat_wt(int fd)
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
index a31b60e86..52a61e8d2 100644
--- a/lib/intel_pat.h
+++ b/lib/intel_pat.h
@@ -37,6 +37,8 @@ uint8_t intel_get_pat_idx_wb(int fd);
 
 uint8_t intel_get_pat_idx_uc_comp(int fd);
 
+bool intel_has_pat_wt(int fd);
+
 int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
 int32_t xe_get_pat_hw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
 
-- 
2.34.1

