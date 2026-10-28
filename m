Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A1B606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 05:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eCzlE9vl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D9A10E00B;
	Wed, 28 Oct 2026 05:33:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11B310E00B
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 05:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793165528; x=1824701528;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fxL5Le5thovXIQnJzUIEulQ8jX4k/KDIKh2pZweulEs=;
 b=eCzlE9vl9RQnChu4VnXZmuL+3uurtvqjAX5NgppndJzI5y1Ri/mCYkoG
 1x/dN85R4Rqjx9K+xScDk7PKbjgL+fwUUHVRcpxwP1/ipahK0gbAx0/Vy
 gUciKX+31ufXrjq0SOLB+gwcUMZ9c9QaoEErw4Kd1r5Rg71qoJ1Hl1xM5
 o4ug6FrmIuutU0pXOdQDrUGA1OzTR51gsaHwiRKrGKHTvjSNmj3BPtQHP
 VB+8MM1NjnxPaRMcxA97Bd/RfGfBYDNqJqjmVB80YMaV5U/FWBJ/h6ApV
 RBbE5AwPyqbDmflSHCTou6wY1rFfS0nRqUexslkQLWzZRYLMOwuBH0Yqh A==;
X-CSE-ConnectionGUID: enycBSN5TuSy1fCuLbN7FA==
X-CSE-MsgGUID: kUOxL4pnSq2entMdBxKv4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1890382"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1890382"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 22:32:07 -0700
X-CSE-ConnectionGUID: zoeiHM+mSDyHbVA1dOtoIw==
X-CSE-MsgGUID: wNV1MDssQkW9OvRB2gFK2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4787770"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by orviesa009.jf.intel.com with ESMTP; 27 Oct 2026 22:32:06 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	varun.gupta@intel.com
Subject: [PATCH] tests/intel/xe_madvise: bound VRAM overpressure by available
 RAM
Date: Wed, 28 Oct 2026 05:32:05 +0000
Message-ID: <20261028053205.1526497-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nishit Sharma <nishit.sharma@intel.com>

The dGPU memory-pressure helper allocates visible VRAM plus 50% and
requires enough system RAM for the entire allocation. This skips
purge-related tests on systems with substantially more VRAM than RAM,
such as configurations with 256 GiB VRAM and 32 GiB RAM.

Limit the overpressure to the smaller of half the visible VRAM and
a quarter of available RAM, retaining the existing 64 MiB minimum.
Apply the RAM requirement only to this overpressure rather than the
entire VRAM allocation.

This retains pressure beyond visible VRAM while bounding the expected
system-memory backing needed for eviction. Leave the iGPU shrinker
path unchanged and log the selected VRAM and overpressure sizes.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_madvise.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index a33a08630..383115a74 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -78,12 +78,17 @@ static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
  * trigger_memory_pressure - Force kernel to reclaim DONTNEED BOs
  * @fd: DRM file descriptor
  *
- * dGPU: over-fill VRAM by ~50 % so TTM evicts purgeable BOs.
+ * dGPU: fill VRAM and then over-fill it so TTM has to evict. The DONTNEED
+ * BOs under test were created before the pressure BOs, so they are the
+ * oldest on the LRU and get evicted (purged) first. Only the over-fill part
+ * ends up in system RAM (VRAM-resident pressure BOs do not consume RAM), so
+ * the over-fill is capped by available RAM, which lets the test run on
+ * systems where RAM is much smaller than VRAM.
  * iGPU: poke the shrinker via igt_purge_vm_caches() (avoids OOM).
  */
 static void trigger_memory_pressure(int fd)
 {
-	uint64_t mem_size, overpressure;
+	uint64_t mem_size, overpressure, ram_limit;
 	const uint64_t chunk = 8ull << 20; /* 8 MiB */
 	int max_objs, n = 0;
 	uint32_t *handles;
@@ -99,16 +104,17 @@ static void trigger_memory_pressure(int fd)
 
 	/* dGPU: fill VRAM + 50 % to force TTM eviction */
 	mem_size = xe_visible_vram_size(fd, 0);
-	overpressure = mem_size / 2;
+	ram_limit = (igt_get_avail_ram_mb() << 20) / 4;
+	overpressure = min_t(uint64_t, mem_size / 2, ram_limit);
 	if (overpressure < (64 << 20))
 		overpressure = 64 << 20;
 	max_objs = DIV_ROUND_UP(mem_size + overpressure, chunk);
 
-	/*
-	 * Pressure BOs are faulted in and kept alive until cleanup. If the
-	 * system is already low on RAM, this can cause OOM.
-	 */
-	igt_require_memory(max_objs, chunk, CHECK_RAM);
+	igt_debug("memory pressure: vram %" PRIu64 " MiB, over-fill %" PRIu64 " MiB\n",
+		  mem_size >> 20, overpressure >> 20);
+
+	/* Only the over-fill is evicted to system RAM, the rest stays in VRAM */
+	igt_require_memory(DIV_ROUND_UP(overpressure, chunk), chunk, CHECK_RAM);
 
 	/* Separate VM so pressure BOs don't interfere with the test */
 	vm = xe_vm_create(fd, 0, 0);
-- 
2.43.0

