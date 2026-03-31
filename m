Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D048109B46F
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 14:06:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A45310E9D9;
	Tue, 31 Mar 2026 14:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTriZyTv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB9F10E1BC
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 14:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774965966; x=1806501966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=orFXMGW+oomEHQ8I6G0w+P3OWR/ONEYdsSoaVUWWfN4=;
 b=XTriZyTvgSSpUBi52ttCa+Ge8nXIQp3mBbl9n1/JGoNH52x5XBa8q7p8
 xhiV8gN39/U1kD4tO4q0rabE2OCj28JDS/3lWj0fJwM70wq0ZEOE5Kjiz
 MfiOcmwSp0RFdb3wbDFZC3jeNRVF9SWb5k4CX4l6yiaEQmmCNJTprO0YV
 apB2TlFWnTTmoIenShdMjL9NQpTwdEAm0mUya0G0kLv/8Mq/U+HiBGJh1
 YIDez1MVYOTYzejGpgQzNfXHIVb8eW8EOtz8I4rdQTAwrXHhGYTzDwvyl
 6eZDrsmmBRDACKMttkKZE3gij9QfKEKzGfpgNIQI6CgcAPP8L4jH51g2C A==;
X-CSE-ConnectionGUID: xOO4usJNRRSs3XywpYo4PQ==
X-CSE-MsgGUID: 6cJtkracTE+jPz9JWH/N4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="63531150"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="63531150"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 07:06:06 -0700
X-CSE-ConnectionGUID: h085FE4tRqCzEgR2ZsK+DA==
X-CSE-MsgGUID: 9qof1e6JSnaHS+s0Pb9DwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="221509992"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.212])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 07:06:05 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t v5 1/4] lib/intel_pat: Support other than gt0 during
 parsing debugfs PAT
Date: Tue, 31 Mar 2026 16:05:43 +0200
Message-ID: <20260331140541.2561104-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331140541.2561104-6-zbigniew.kempczynski@intel.com>
References: <20260331140541.2561104-6-zbigniew.kempczynski@intel.com>
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
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
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

