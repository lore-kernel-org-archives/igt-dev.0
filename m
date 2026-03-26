Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B618E10A1E7E
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 11:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6617910E96A;
	Thu, 26 Mar 2026 11:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qmlnh7rL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01D110E969
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 11:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774524876; x=1806060876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ezwM0yl0A0CUbgMNWs6LoD7sZWvP03ma9g+GVMi1psE=;
 b=Qmlnh7rLycFITDrcO1FdI+K2QXEqJ7sRy/CIJ8br4nR7TDAJtwhuX5LC
 xGf2xwWOvHCkbA8h/s8KTd/jW8B9oSGd0ibbRCAEQqyBBOx4cBQAb14Hw
 AsYVMnrGsMberZVyEkEBbOGQy5g6GN8auAdz7nYdAEGEbzuMYXo6zBYdS
 jXe/37Gui41NgvPQOszVYt4CpJt/1XOb8ZRHK6sP4qHNJpWPWRWtK98T8
 3GqnIAV1wbAxneuFO14uGd7SmnYwpN5J1N0xUZml1BAMUn9NfPmYpMsGj
 uyaRa4S20qN6L50RajDy9SfqraEyg+HA8RMxVJ0xdCsDfpWLGZbS9sVYS w==;
X-CSE-ConnectionGUID: iJThoG+fShaQniCUVDQgqA==
X-CSE-MsgGUID: z0vEMMjJSd2mZiBqRQk5Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75647918"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75647918"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:34:36 -0700
X-CSE-ConnectionGUID: ldwO9bdORAiNU1fNAZ4VTg==
X-CSE-MsgGUID: k89/1i3ORKy8jaGXGk7QPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="221675604"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.222])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:34:34 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 1/2] lib/intel_pat: Support other than gt0 during
 parsing debugfs PAT
Date: Thu, 26 Mar 2026 12:34:27 +0100
Message-ID: <20260326113425.520545-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326113425.520545-4-zbigniew.kempczynski@intel.com>
References: <20260326113425.520545-4-zbigniew.kempczynski@intel.com>
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

Main and media GTs may define different PTA entries so add gt as an
argument during debugfs pat config selection.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 lib/intel_pat.c      | 7 +++++--
 lib/intel_pat.h      | 2 +-
 lib/xe/xe_query.c    | 2 +-
 tests/intel/xe_pat.c | 2 +-
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index b202a62419..2bbea46f71 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -14,11 +14,12 @@
  *
  * @drm_fd: DRM device fd to use with igt_debugfs_open
  * @xe_pat_cache: Pointer to a struct that will receive the parsed PAT configuration
+ * @gt: gt id number
  *
  * Returns: The number of PAT entries successfully read on success, or a negative error
  *          code on failure
  */
-int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
+int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt)
 {
 	char *line = NULL;
 	size_t line_len = 0;
@@ -26,8 +27,10 @@ int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
 	int32_t parsed = 0;
 	int dbgfs_fd;
 	FILE *dbgfs_file = NULL;
+	char config[64];
 
-	dbgfs_fd = igt_debugfs_open(drm_fd, "gt0/pat_sw_config", O_RDONLY);
+	snprintf(config, sizeof(config), "gt%d/pat_sw_config", gt);
+	dbgfs_fd = igt_debugfs_open(drm_fd, config, O_RDONLY);
 	if (dbgfs_fd < 0)
 		return dbgfs_fd;
 	dbgfs_file = fdopen(dbgfs_fd, "r");
diff --git a/lib/intel_pat.h b/lib/intel_pat.h
index 1772785205..a658c6ffeb 100644
--- a/lib/intel_pat.h
+++ b/lib/intel_pat.h
@@ -37,6 +37,6 @@ uint8_t intel_get_pat_idx_wb(int fd);
 
 uint8_t intel_get_pat_idx_uc_comp(int fd);
 
-int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache);
+int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
 
 #endif /* INTEL_PAT_H */
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 3afca353ea..00331c628b 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -314,7 +314,7 @@ struct xe_device *xe_device_get(int fd)
 	 */
 	xe_dev->pat_cache = calloc(1, sizeof(*xe_dev->pat_cache));
 	igt_assert(xe_dev->pat_cache);
-	if (xe_get_pat_sw_config(xe_dev->fd, xe_dev->pat_cache) <= 0) {
+	if (xe_get_pat_sw_config(xe_dev->fd, xe_dev->pat_cache, 0) <= 0) {
 		free(xe_dev->pat_cache);
 		xe_dev->pat_cache = NULL;
 	}
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index b385a678c8..2e2d7e01e7 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -173,7 +173,7 @@ static bool pat_entry_is_compressed(unsigned int gfx_ver, uint32_t pat)
 
 static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)
 {
-	int32_t parsed = xe_get_pat_sw_config(fd, pat_sw_config);
+	int32_t parsed = xe_get_pat_sw_config(fd, pat_sw_config, 0);
 
 	igt_assert_f(parsed > 0, "Couldn't get Xe PAT software configuration\n");
 
-- 
2.43.0

