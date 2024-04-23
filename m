Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4630AC04FF8
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 08:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7C31125CC;
	Tue, 23 Apr 2024 08:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jbZwO0oF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6D11125CC
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 08:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713862670; x=1745398670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tTLhq8rPOQV/9n9/Y7CGeRLLOEWswPCeLhOd2oT6X+c=;
 b=jbZwO0oFmqjvV6kRPDBruWeLbJPB6kTiXwT4GryqO8g7KzQ7V1uVUTKJ
 WFiVNW7kqsuf/4IsTYHV42y480iLrbcy5EnbAj52IyQHvHSfmI5l8iBnj
 dJDPdUMfAGE1mY65hRndsl75g1Pa3DuF7ZNqqNsTJzZSxpLmDz0Y1O157
 DEA+KXw/Y0+d54ou2w+1NpxeqZLojIxzQunzcwrBSh8yD3SeHglnhwZCA
 HKNPhQ4dqipd81ULCbdbyBVS6w8Z+V4gqWG+KfPBFS9u1omu8nXxqZGZn
 ofjzuIPgZ4TbqjacMqrlqbhtvjNxw0FSi6/HAisAc2AnNBP7/HjqdZXYd w==;
X-CSE-ConnectionGUID: NATc8h94RLeEsskH/ufLng==
X-CSE-MsgGUID: 55VhAYR0RnSGxaHjFnR9bw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9602677"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9602677"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 01:57:50 -0700
X-CSE-ConnectionGUID: sGfX5LQaQoSlwn4b5sh6kw==
X-CSE-MsgGUID: jz3A7vIyTI6W+nB4EIDE9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="47587900"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.96.225])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 01:57:49 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: tvrtko.ursulin@linux.intel.com, kamil.konieczny@linux.intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v2 i-g-t 2/6] benchmarks/gem_wsim: Unify bond handling
Date: Tue, 23 Apr 2024 10:56:42 +0200
Message-Id: <20240423085646.6672-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240423085646.6672-1-marcin.bernatowicz@linux.intel.com>
References: <20240423085646.6672-1-marcin.bernatowicz@linux.intel.com>
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

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index e98624221..98e8fe55c 100644
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
@@ -1146,8 +1143,8 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 							  "Invalid context at step %u!\n",
 							  nr_steps);
 					} else if (nr == 1) {
-						step.bond_mask = engine_list_mask(field);
-						check_arg(step.bond_mask == 0,
+						step.bond.mask = engine_list_mask(field);
+						check_arg(step.bond.mask == 0,
 							"Invalid siblings list at step %u!\n",
 							nr_steps);
 					} else if (nr == 2) {
@@ -1157,7 +1154,7 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
 							  tmp == DEFAULT,
 							  "Invalid master engine at step %u!\n",
 							  nr_steps);
-						step.bond_master = tmp;
+						step.bond.master = tmp;
 					}
 
 					nr++;
@@ -2174,10 +2171,7 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
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

