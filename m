Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546AEC54734
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 16:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC4E10E3B5;
	Tue, 27 Aug 2024 16:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MAIhZo9K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C0210E3AF
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 16:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724777696; x=1756313696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IQ4pPwxuqSJDjwWflDe4xYv2cYrM61tcbk+MNYmZoS8=;
 b=MAIhZo9KdN3pM4AY6SwD/F3DhamvAxtcadOxafVONhNwCtC/q73jeLZS
 y3q64xSP4X18WxEiLW9AkD0bqV+nJhHIDyYuqAoeqhOM4Vcoagnsm5SDz
 6R+ZZjKEDzulh6xImppvprzeGl3AyQpiIg49Dc5TA6G3f8BUUoqJT7vZU
 8Hz4kL0EZ+dEwQKTNlTSSMrY37ZF4/6b/Db3iTanxtxhlyqnNFyW8muO2
 8jXZWt4UvKw1TXp5ysynavvztnvFVB9miFe4XCz/GK6ogERk2kIxYvQ1k
 ERHWKckmR3VZAhIlpGPY5krBUkxDynNlbUXbwLSHK8V7+HSgk/HfR8PG7 g==;
X-CSE-ConnectionGUID: IXuywUuESM2xAQ5V6pEvIQ==
X-CSE-MsgGUID: yv/2LI4fQ1eAjYsDdMrcxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="45787330"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="45787330"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:54:56 -0700
X-CSE-ConnectionGUID: gASt5BsVRUGiRPZp//d2uA==
X-CSE-MsgGUID: 0ETMvgkPTq6hf9pDPeEsog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="63640414"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:54:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 02/10] tests/intel/xe_drm_fdinfo: Print timestamp for
 debug
Date: Tue, 27 Aug 2024 09:54:41 -0700
Message-ID: <20240827165449.1706784-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827165449.1706784-1-lucas.demarchi@intel.com>
References: <20240827165449.1706784-1-lucas.demarchi@intel.com>
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

