Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDDFC3ABC9
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 18:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DAE10E5E2;
	Tue, 13 May 2025 18:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YU8OpSP2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499B610E5E4
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 18:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747162724; x=1778698724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AHXATSY5Y0BX6L2JIOpXu6GX7a43EqQTNnXKJ/1HdS4=;
 b=YU8OpSP2TCJ7efUzf/LJAfpBtMlXlSo858bDW8jdw82TFrISElwGKrnM
 FLdqqy+vpqnbLVpQwK8O87AgGEZkySkqjHjDB+ZtwJmOZylD3HUe8oINA
 ZCDaqIe+gTwHv+lYcxPzPYd5ZTHv87uO0Np+utcgkUh16tdC203naLdRG
 8kl8Sx5WSt+7x8kVCcZp/1yZXoL8e/2Sw+/fWEHSBCuNS2l/vV9HOfr4p
 9aZGkT5jOwPvLqjP3iZ1BefhcperQCm1mnucyzavrWlVAHwfEGDjFdlTa
 n1CkIBGeNq2rRu7I3/RY6feBHnZ/2iSoaK+UjiTyJLvPtm9hg//67reag g==;
X-CSE-ConnectionGUID: 6kq6G0J4RTSWzEEk9YgXBQ==
X-CSE-MsgGUID: SDjM4/1WSfabueolKnwwgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48960624"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="48960624"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:58:44 -0700
X-CSE-ConnectionGUID: 9mPjAbmpSGyr8Ql/gnDWPQ==
X-CSE-MsgGUID: 8hYtQJynT0a8OqC2Ur9g/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="137679188"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.60])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:58:43 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 07/15] lib/intel_cmds_info: add blt_memop_mode
 (byte/page)
Date: Tue, 13 May 2025 20:58:02 +0200
Message-ID: <20250513185811.897232-8-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
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

Add 'mode' field for further extending in tests.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_blt.c             | 3 +++
 lib/intel_blt.h             | 2 ++
 lib/intel_cmds_info.h       | 5 +++++
 tests/intel/xe_copy_basic.c | 2 +-
 4 files changed, 11 insertions(+), 1 deletion(-)

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
index 66f63d7e72..bcaad6053a 100644
--- a/lib/intel_cmds_info.h
+++ b/lib/intel_cmds_info.h
@@ -24,6 +24,11 @@ enum blt_memop_type {
 	TYPE_MATRIX,
 };
 
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

