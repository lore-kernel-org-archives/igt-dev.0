Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FE4C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 17:53:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E1910E45D;
	Mon, 29 Jul 2024 17:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jft2zp5g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7422810E45D
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 17:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722275613; x=1753811613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=63TyGzlA9F1GLLgaDk1W2g0QxGrJprq8pPUdaD06wGg=;
 b=Jft2zp5gDLB28jET7U5uL5f5p7INn7C1gcEEI75a8RFftU4kHHTFgDn5
 0A6cd8pbeQjsKK1GaFtVChZLiV8VjZ3FQgiXRN5GT3id6CJR9CmWRKPar
 pVMwJ/j/fIJYpoKw0VX3keA6M3PUgIrZ58dA7tZjniQSTnkl9NrIoo7aW
 pkZHwCqcLvohXIsrD8Aha7DN+IbGG1QpN+TFxSVnMpYot5uvskwCiduD5
 UngZEFy247Ag9SD37nsPZxKdWaNw7l1A+4FlcsoTcwoOCOLS+QyMD8giI
 kqecT1OdpmlrC/SfaaUPxYHuhp34cV2WU4k8Eg7OP/ki7e2y1N+Hm2a2j g==;
X-CSE-ConnectionGUID: T8A0gXsSQAy/DTDeZpxyKg==
X-CSE-MsgGUID: /uKZvIvFSEeo4sdFPha6qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="30641079"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="30641079"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 10:53:33 -0700
X-CSE-ConnectionGUID: XQt2AjzqSzSFOUFiF982PA==
X-CSE-MsgGUID: 2zMMGRR8TimIOcj6eJccqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="58184212"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.84.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 10:53:31 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: tursulin@igalia.com, kamil.konieczny@linux.intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v3 i-g-t 2/6] benchmarks/gem_wsim: Unify bond handling
Date: Mon, 29 Jul 2024 19:52:15 +0200
Message-Id: <20240729175219.1636694-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240729175219.1636694-1-marcin.bernatowicz@linux.intel.com>
References: <20240729175219.1636694-1-marcin.bernatowicz@linux.intel.com>
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

This change brings the handling of bonding information in line with
other parts of the code that use structured approaches for similar data,
enhancing overall consistency. Prepares code to use struct intel_engines as
bond.mask.

v2: Correct indentation.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 0cf93228a..0445e9942 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -172,10 +172,7 @@ struct w_step {
 		int priority;
 		struct intel_engines engine_map;
 		bool load_balance;
-		struct {
-			uint64_t bond_mask;
-			enum intel_engine_id bond_master;
-		};
+		struct bond bond;
 		int sseu;
 		struct working_set working_set;
 	};
@@ -1146,10 +1143,10 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 							  "Invalid context at step %u!\n",
 							  nr_steps);
 					} else if (nr == 1) {
-						step.bond_mask = engine_list_mask(field);
-						check_arg(step.bond_mask == 0,
-							"Invalid siblings list at step %u!\n",
-							nr_steps);
+						step.bond.mask = engine_list_mask(field);
+						check_arg(step.bond.mask == 0,
+							  "Invalid siblings list at step %u!\n",
+							  nr_steps);
 					} else if (nr == 2) {
 						tmp = str_to_engine(field);
 						check_arg(tmp <= 0 ||
@@ -1157,7 +1154,7 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 							  tmp == DEFAULT,
 							  "Invalid master engine at step %u!\n",
 							  nr_steps);
-						step.bond_master = tmp;
+						step.bond.master = tmp;
 					}
 
 					nr++;
@@ -2170,10 +2167,7 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
 						     ctx->bond_count *
 						     sizeof(struct bond));
 				igt_assert(ctx->bonds);
-				ctx->bonds[ctx->bond_count - 1].mask =
-					w->bond_mask;
-				ctx->bonds[ctx->bond_count - 1].master =
-					w->bond_master;
+				ctx->bonds[ctx->bond_count - 1] = w->bond;
 			}
 		}
 	}
-- 
2.31.1

