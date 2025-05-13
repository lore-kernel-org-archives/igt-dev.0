Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129C3C3ABC9
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 18:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABBE10E5E4;
	Tue, 13 May 2025 18:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NAuoLjx8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D388E10E5E4
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 18:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747162728; x=1778698728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oJSeIGhpXohVD8oa63okoGryENEPsN6k1dNj8OrlykI=;
 b=NAuoLjx8VO7IZnRgoxVxXRYvDuT8cHPtudFAl6wArfj/OxKVLqREHNnC
 72UQsR73BGI+y2Q33l6wRE5Tqeax9t1P8RMKUT/u1f+KyS3gmJ4kAQafL
 zNRn2StKwaRJunvcQ2q/u+2yKVJJUls3HvKtUdC6fcIHaDyEDv7DyNQAl
 3mIK6MDXITuE4d1mwBsxRfn4W0fZfYZ5d2WuwiKUoKpCkTGj17qKR+DE8
 i7A6kGcmqRg4ic4XV3PfyiuQ1T53mM6FJ+6QuF4HO+JSTLNxVemnwNo87
 X9cihu3S+E3DdvpkIRYzc3bYKWE9xaTSX7h83iYf0GnXYO3CixqpTpjIc g==;
X-CSE-ConnectionGUID: ogWRSVzHRu6XjBggn6jqoQ==
X-CSE-MsgGUID: SX9LEBnwSry4Dmop6abCZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="60428146"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="60428146"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:58:48 -0700
X-CSE-ConnectionGUID: ZvzpU8cRRBSrwZy9Mzh8IA==
X-CSE-MsgGUID: VRHWH6odSWK/ybBYLWRlKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="137840964"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.60])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:58:47 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 08/15] lib/intel_blt: add emit batchbuffer end
Date: Tue, 13 May 2025 20:58:03 +0200
Message-ID: <20250513185811.897232-9-zbigniew.kempczynski@intel.com>
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

Blitter functions allow emit BBE on demand. This gives the caller
to combine different emit functions in single batch.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_blt.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 6bfaf09a2b..04549ab42e 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1820,7 +1820,9 @@ void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
 	mem->copy_type = copy_type;
 }
 
-static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_copy_data *mem)
+static void emit_blt_mem_copy(int fd, uint64_t ahnd,
+			      const struct blt_mem_copy_data *mem,
+			      bool emit_bbe)
 {
 	uint64_t dst_offset, src_offset;
 	int i;
@@ -1846,7 +1848,9 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_copy_d
 	batch[i++] = dst_offset;
 	batch[i++] = dst_offset << 32;
 	batch[i++] = mem->src.mocs_index << XE2_MEM_COPY_MOCS_SHIFT | mem->dst.mocs_index;
-	batch[i++] = MI_BATCH_BUFFER_END;
+
+	if (emit_bbe)
+		batch[i++] = MI_BATCH_BUFFER_END;
 
 	munmap(batch, mem->bb.size);
 }
@@ -1880,7 +1884,7 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
 					  0, mem->dst.pat_index);
 	bb_offset = get_offset(ahnd, mem->bb.handle, mem->bb.size, 0);
 
-	emit_blt_mem_copy(fd, ahnd, mem);
+	emit_blt_mem_copy(fd, ahnd, mem, true);
 
 	if (mem->driver == INTEL_DRIVER_XE) {
 		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
-- 
2.43.0

