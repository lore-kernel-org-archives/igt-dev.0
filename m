Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA26C54F30
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 06:41:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365FB10E7BB;
	Fri, 30 May 2025 06:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F+7TUWtr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91F210E7C4
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 06:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748587277; x=1780123277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BHj5tyVM5rBvXrogO/EHiwx2l5C292RmyV7sh/mvqzs=;
 b=F+7TUWtrwVmmkcOL3WGWSfQhOKgVpx2Y21/nQyg6Ym0448zzbsWd8GMV
 iaLjOEBVrjwKUHVOKdtfspfOzWJdI4TcUwYTnzPka4WdB/Z16ZglUaGpk
 JvEZckDOd5FLo7ekfQtRaZSn2WgOJgeBOLud7ujCD9my2iQD6sIU2/rlF
 L1wf5ItJGhCS/3nyqa2/wTnfR32f3IfMZtvsQChJeBSYzQlslUCDIMLBp
 5G+1CuSIEJOd2Ok62iu2PjelHX4siG07dl+mvHc3m6vNwYttv7tYTGyv8
 NQCqpUWgG0yZvmIts1ysndDjzVheBJ4MogXL6GE33iv6TAyOUDsL6L+Y8 g==;
X-CSE-ConnectionGUID: R9SFvJxDTa2myoTV3Bejhw==
X-CSE-MsgGUID: FrESkv/ZQFSQQcy8wjHBcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="73204975"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="73204975"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:41:17 -0700
X-CSE-ConnectionGUID: JUqIaNX2SH279yIdo6PqzQ==
X-CSE-MsgGUID: 6R817uKlTxK99BCYO9n+VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="143755799"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.174])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:41:15 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v4 03/11] lib/intel_cmds_info: add blt_memop_mode
 (byte/page)
Date: Fri, 30 May 2025 08:40:42 +0200
Message-ID: <20250530064050.1560398-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530064050.1560398-1-zbigniew.kempczynski@intel.com>
References: <20250530064050.1560398-1-zbigniew.kempczynski@intel.com>
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

Add 'mode' field for further extending in tests. It is used for
mem-copy linear type which supports copy mode in bytes or pages.

Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_blt.c             |  3 +++
 lib/intel_blt.h             |  2 ++
 lib/intel_cmds_info.h       | 11 +++++++++++
 tests/intel/xe_copy_basic.c |  2 +-
 4 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 4c90d157c9..6bfaf09a2b 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1802,18 +1802,21 @@ int blt_fast_copy(int fd,
  * blt_mem_copy_init:
  * @fd: drm fd
  * @mem: structure for initialization
+ * @mode: copy mode - byte or page (256B)
  * @copy_type: linear or matrix
  *
  * Function is zeroing @mem and sets fd and driver fields (INTEL_DRIVER_I915 or
  * INTEL_DRIVER_XE).
  */
 void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
+		       enum blt_memop_mode mode,
 		       enum blt_memop_type copy_type)
 {
 	memset(mem, 0, sizeof(*mem));
 
 	mem->fd = fd;
 	mem->driver = get_intel_driver(fd);
+	mem->mode = mode;
 	mem->copy_type = copy_type;
 }
 
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 9efa799881..f2509ab175 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -130,6 +130,7 @@ struct blt_copy_data {
 struct blt_mem_copy_data {
 	int fd;
 	enum intel_driver driver;
+	enum blt_memop_mode mode;
 	enum blt_memop_type copy_type;
 	struct blt_mem_object src;
 	struct blt_mem_object dst;
@@ -274,6 +275,7 @@ int blt_fast_copy(int fd,
 		  const struct blt_copy_data *blt);
 
 void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
+		       enum blt_memop_mode mode,
 		       enum blt_memop_type copy_type);
 
 void blt_mem_set_init(int fd, struct blt_mem_set_data *mem,
diff --git a/lib/intel_cmds_info.h b/lib/intel_cmds_info.h
index 88ba892645..17f60ce912 100644
--- a/lib/intel_cmds_info.h
+++ b/lib/intel_cmds_info.h
@@ -30,6 +30,17 @@ enum blt_memop_type {
 	TYPE_MATRIX,
 };
 
+/**
+ * enum blt_memop_mode - memory operation mode mem-copy.
+ *
+ * Mem-copy with linear type supports mode operation in bytes or pages
+ * (page is 256B chunk).
+ */
+enum blt_memop_mode {
+	MODE_BYTE,
+	MODE_PAGE,
+};
+
 enum blt_cmd_type {
 	SRC_COPY,
 	MEM_SET,
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index 5681d4d6ab..f252d29fd4 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -56,7 +56,7 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
 
 	bb = xe_bo_create(fd, 0, bb_size, region, 0);
 
-	blt_mem_copy_init(fd, &mem, TYPE_LINEAR);
+	blt_mem_copy_init(fd, &mem, MODE_BYTE, TYPE_LINEAR);
 	blt_set_mem_object(&mem.src, src_handle, size, width, width, height,
 			   region, src_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
 	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height,
-- 
2.43.0

