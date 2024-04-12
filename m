Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16211C00A94
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 09:11:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4673610F54B;
	Fri, 12 Apr 2024 09:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVW8qds+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E551910F537
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 09:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712913115; x=1744449115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DYYihVbhsdxhebtaoTRzbZ87ejAr7AqdKGg2N2nohE8=;
 b=DVW8qds+/9OgZrLUebUHYC4SUnd2iUDVwiOoCfIOIGCaHE6Fi79dPlCt
 hX+sYBfVb8RA/BYfkWVA4C5YzJ+PhZNq5CZ1UksAumfbDWYt6CKGm1nru
 MblxoHGYlqpYNAXchcnRSgXrzjmKrHF/7ka2IBXxBwL4LvzrzNjhLeXpt
 MosX97tlrQyJwcqaRgp7lr6fsCbXTHj5z63Pts+APGzh9k2/2Mg+yqr7E
 qVasXguA9STOxSwUmBmmlNWZRnXMm9yHhMF9mm2E62O+CHtA8VD36a+hq
 ANIPAeigpSS8Rs/muyudtdBUkxe8KeAfobJ2LQS/+fs9WTU7Gme9S8lp7 g==;
X-CSE-ConnectionGUID: OE+Lnkc6TcKjRmGYMy+f6g==
X-CSE-MsgGUID: 57P6jvw5TieEWSpgTD0Uvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="30842851"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="30842851"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:11:55 -0700
X-CSE-ConnectionGUID: oZ/Pbtd7Ql67DGysKFGgQA==
X-CSE-MsgGUID: jlJOK45UQwSXFZvoie5qtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="25625118"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:11:54 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel/gem_spin_batch: Skip some test on MTL
Date: Fri, 12 Apr 2024 10:57:44 +0200
Message-ID: <20240412085744.21196-9-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240412085744.21196-1-nirmoy.das@intel.com>
References: <20240412085744.21196-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

We do GGTT update on MTL using bcs engine, blocking that would
fail the test so skip such subtests on bcs engine for MTL.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/gem_spin_batch.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
index 18873be16..ec1458e35 100644
--- a/tests/intel/gem_spin_batch.c
+++ b/tests/intel/gem_spin_batch.c
@@ -227,6 +227,9 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
 		if (!gem_class_can_store_dword(i915, e->class))
 			continue;
 
+		if (gem_engine_can_block_ggtt_binder(i915, e))
+			continue;
+
 		if (flags & PARALLEL_SPIN_NEW_CTX)
 			ctx = intel_ctx_create(i915, &cfg);
 		ahnd = get_reloc_ahnd(i915, ctx->id);
-- 
2.41.0

