Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F301061B05
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 14:40:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC36E10E24F;
	Mon, 30 Mar 2026 14:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTveTWP7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8BA10E1F4
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 14:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774881643; x=1806417643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VPGZHpBH1AQazKpuES9+uTbtPyKuRuXj8pPQDML8b8M=;
 b=lTveTWP7JbSu87lZHnv59Ek96YHREZTT5M49SifuSZkrxI8rymMu9ZPt
 KpzOoyqR/Vej90NtxCkRaCPHKK/mezMOvCZZBxKjSrvI6WEG1QmZ136k3
 k87DBcB+5nwNlg1VGc1TGvsQESZuqZO9n9wVTpFUtOx0u9j9QWStAJXnL
 IkgufhLv/Nxma1ZpU+UuisX6IqYTNq3AElY7AxtzmJB47t784HiL+Byzx
 fdUglDCjjsOCw4amlbNJE3HADcrbhDqgg6rHYoDiAqSSJsgex6mZ0JOr/
 B5GF97UWhyUc0++NO+aivwaXBHVt+edM1HhX84sWBcKI4NbEpEAZxh1nK g==;
X-CSE-ConnectionGUID: G+NxkOvxT4CGZPN8lCuaBQ==
X-CSE-MsgGUID: st5TDitkSdC+Uy7WnS2ZCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75771086"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75771086"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:40:43 -0700
X-CSE-ConnectionGUID: LQ3TmmNxQVul7K/FD0Jk9A==
X-CSE-MsgGUID: ntb9oljsR8y3AsYfzvvsfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="264013275"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.61])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:40:42 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t v4 1/5] lib/intel_pat: Support other than gt0 during
 parsing debugfs PAT
Date: Mon, 30 Mar 2026 16:40:34 +0200
Message-ID: <20260330144032.1954771-8-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330144032.1954771-7-zbigniew.kempczynski@intel.com>
References: <20260330144032.1954771-7-zbigniew.kempczynski@intel.com>
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
index 71633b3141..2693228a73 100644
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

