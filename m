Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849CFC3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 18:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA2910E516;
	Wed, 14 Aug 2024 18:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RS8xNn/3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DB110E516
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 18:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723661525; x=1755197525;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZZz4+K57hA3ecDqSoGJbM0sGh2YoqPH5+s5erkzYXLs=;
 b=RS8xNn/3uYJ8fBQcyXscGmp1g3B5+z5uOopwqDn1xwE8LFq81cEFZPsR
 Njzp4a/8+yGGG8qyuuwtnwtzvLGj7wiBdoZJC0za0uAla0COJYOqfibnc
 jtR2NcX9snWgVoO5iZC6/aTBollJda/SIVmkM0NJM7BOzIa4lNHqn7R6D
 mID0bv+nCbldPtRLH5s0EL8NcYwkwtQx4TQCmdijPLu74DqkgdVrvENQm
 Sx8eGTPGtvLmvwJ1j3r85McNjOlT2WT0gHfN5n2qK8zsgGKxZnC7XA77q
 YloscGqfXYhBJnWQtBazzvfxLstP9h/dz+B+gHK17BMkxpHbUC8XuCqR6 Q==;
X-CSE-ConnectionGUID: sDU/CPibR3GQcrR0Qe8K6A==
X-CSE-MsgGUID: SDjitEoeRveHN7eNb+KOsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="32528941"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="32528941"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 11:52:05 -0700
X-CSE-ConnectionGUID: spBmZuENTe6BCcotHnCQKQ==
X-CSE-MsgGUID: pHX4ltanS56Iwrc56vVkjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="59115538"
Received: from jcavitt.jf.intel.com ([10.165.125.150])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 11:52:05 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 john.c.harrison@intel.com, nirmoy.das@intel.com,
 chris.p.wilson@linux.intel.com
Subject: [PATCH i-g-t] tests/intel/gem_spin_batch: RCS/CCS must share VM on
 DG2 due to w/a
Date: Wed, 14 Aug 2024 11:33:36 -0700
Message-Id: <20240814183336.507650-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
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

On DG2, both the RCS and CCS engine contexts must use the same virtual
address space when running parallel, non-preemptible work.  Failure to
do so results in a GPU hang.

Suggested-by: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>
CC: Chris Wilson <chris.p.wilson@linux.intel.com>
---
 tests/intel/gem_spin_batch.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
index 682a062180..19b13f7334 100644
--- a/tests/intel/gem_spin_batch.c
+++ b/tests/intel/gem_spin_batch.c
@@ -24,6 +24,7 @@
 
 #include "i915/gem.h"
 #include "i915/gem_ring.h"
+#include "i915/gem_vm.h"
 #include "igt.h"
 /**
  * TEST: gem spin batch
@@ -179,9 +180,20 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
 	const struct intel_execution_engine2 *e;
 	intel_ctx_cfg_t cfg = ctx->cfg;
 	struct igt_spin *spin, *n;
+	uint32_t shared_vm_id = 0;
 	uint64_t ahnd;
 	IGT_LIST_HEAD(list);
 
+	/*
+	 * Wa_14014494547:DG2
+	 * Both the RCS and CCS engine contexts must use the same
+	 * virtual address space when running parallel,
+	 * non-preemptible work.  Failure to do so results in a
+	 * GPU hang.
+	 */
+	if (IS_DG2(intel_get_drm_devid(i915)))
+		shared_vm_id = gem_vm_create(i915);
+
 	for_each_ctx_cfg_engine(i915, &cfg, e) {
 		if (!gem_class_can_store_dword(i915, e->class))
 			continue;
@@ -192,8 +204,11 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
 		if (skip_bad_engine(i915, e))
 			continue;
 
-		if (flags & PARALLEL_SPIN_NEW_CTX)
+		if (flags & PARALLEL_SPIN_NEW_CTX) {
+			if (shared_vm_id)
+				cfg.vm = shared_vm_id;
 			ctx = intel_ctx_create(i915, &cfg);
+		}
 		ahnd = get_reloc_ahnd(i915, ctx->id);
 
 		/* Prevent preemption so only one is allowed on each engine */
@@ -218,6 +233,9 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
 		igt_spin_free(i915, spin);
 		put_ahnd(ahnd);
 	}
+
+	if (shared_vm_id)
+		gem_vm_destroy(i915, shared_vm_id);
 }
 
 static bool has_userptr(int fd)
-- 
2.25.1

