Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AECC5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 05:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990F310E235;
	Tue, 27 Aug 2024 05:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tr2Dowim";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC3710E1C7
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 05:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724737921; x=1756273921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IQ4pPwxuqSJDjwWflDe4xYv2cYrM61tcbk+MNYmZoS8=;
 b=Tr2Dowimfz+4HexPL7qgnAydBELbl6dFSQwrfbkXqHKt4NaJlU67ZuQW
 LtLE6AgRh6ytO8XgiLUnd6p98x+lCo1gaa7/K+GL/6U+R+3LzXWA/Y3k9
 CHYdmQpqSkMgdLGuTfrQIB3z9HJVeRd9pZ/J0Le2S8sbVz2h9KAFg9gqy
 w1TgFv4wpoNT+YuIWUj2QLrArI97AFsRL0xGojdGrBJ0Rl8VSrCD/KVQO
 fq3Gu86+PnZF/1HRGEKBUacnR0LNYPmlbrsAfS1NEdFnIZJrXxTLM9stL
 o7rWkFxfS6MqmVmYox/JtMzrF4GXoI5tiu7ltS07+l/QUSgNJmQHybpaw g==;
X-CSE-ConnectionGUID: BdUyxlGpSMe5AeSZUXq7lg==
X-CSE-MsgGUID: ta70khXFTESWbTyHAnmR+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23355590"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="23355590"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:52:00 -0700
X-CSE-ConnectionGUID: DUyMv1imTUuQj/bh3kPUAg==
X-CSE-MsgGUID: YNO/bZUhQy6UCI6fB9tZcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="62800386"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:52:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 02/10] tests/intel/xe_drm_fdinfo: Print timestamp for
 debug
Date: Mon, 26 Aug 2024 22:51:21 -0700
Message-ID: <20240827055129.1671873-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827055129.1671873-1-lucas.demarchi@intel.com>
References: <20240827055129.1671873-1-lucas.demarchi@intel.com>
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

xe_spin is capable of writing the timestamp from the GPU side. This is a
good way to compare what we are reading from the fdinfo with what the
GPU is seeing. Example output:

(xe_drm_fdinfo:10404) DEBUG: rcs: spinner ended (timestamp=9817720)
(xe_drm_fdinfo:10404) DEBUG: bcs: spinner ended (timestamp=9755785)
(xe_drm_fdinfo:10404) DEBUG: vecs: spinner ended (timestamp=9653024)
(xe_drm_fdinfo:10404) DEBUG: ccs: spinner ended (timestamp=9722776)
(xe_drm_fdinfo:10404) DEBUG: rcs: sample 1: cycles 19513436, total_cycles 130596422980
(xe_drm_fdinfo:10404) DEBUG: rcs: sample 2: cycles 29331470, total_cycles 130606141449

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index e3a99a2dc..074a89711 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -416,6 +416,7 @@ spin_sync_start(int fd, struct spin_ctx *ctx)
 		return;
 
 	ctx->spin_opts.addr = ctx->addr;
+	ctx->spin_opts.write_timestamp = true;
 	ctx->spin_opts.preempt = true;
 	xe_spin_init(ctx->spin, &ctx->spin_opts);
 
@@ -448,7 +449,8 @@ spin_sync_end(int fd, struct spin_ctx *ctx)
 	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
 
 	ctx->ended = true;
-	igt_debug("%s: spinner ended\n", engine_map[ctx->class]);
+	igt_debug("%s: spinner ended (timestamp=%u)\n", engine_map[ctx->class],
+		  ctx->spin->timestamp);
 }
 
 static void
-- 
2.43.0

