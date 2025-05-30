Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7EFC54F30
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 06:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DDA10E21B;
	Fri, 30 May 2025 06:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fk2rXqQY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F31610E21B
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 06:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748587282; x=1780123282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xBkNOkTCk8JYvatfvfG6s5dmzUSLl6FKxOx8mwQO+/I=;
 b=Fk2rXqQY00zPhTHl+qvwdT6D7yg/DFSN2ElJA5PJ+IWlp/QI5b1xBO4A
 4t5R6wiTZNvGo7ozq3jIFR0OsVFAcQdKWzNg2NSMvyZvGDFomtOMTcJTv
 LI/sXdK+vcZKvhM1TnoVYJ3OcPl67SJ3T+cFk4jY/6TQQt0hEn8AMqe95
 Uxqu7jllocgUf0JDCn1Fs/ZWDj8ntS4V3CQmWzcHM8s5bDzkXyZcGvAuf
 u8+ZCNvxNDNaKvaYhL0bgbk1iyQhT3SGlE9TAwpyUEP3qZ5CwVLHID1jg
 SusMDvsxO3ENv2re1OIxzJiftlMHcJJjWyBSRth/+igEuqcn3m7/s/eb/ w==;
X-CSE-ConnectionGUID: XOMbTDcmSd+3y542fAIzOg==
X-CSE-MsgGUID: DNZZlFkwRfKf2PArfJ+YIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="73204986"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="73204986"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:41:22 -0700
X-CSE-ConnectionGUID: BRrtMsUWTuOZaOxNDkTcVQ==
X-CSE-MsgGUID: Pl5TJtA6SYW0xJB5dP0zNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="143755803"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.174])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:41:20 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v4 04/11] lib/intel_blt: add emit batchbuffer end
Date: Fri, 30 May 2025 08:40:43 +0200
Message-ID: <20250530064050.1560398-5-zbigniew.kempczynski@intel.com>
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

Blitter functions allow emit BBE on demand. This gives the caller
to combine different emit functions in single batch.

Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
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

