Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35605C27C79
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 15:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53BA10E41C;
	Mon, 17 Jun 2024 15:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="inQ8wGpQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F1910E41C
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 15:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718637065; x=1750173065;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l8O2uYleGHMfARvsxEMwv1GLTa0f+HHXUiog3zRLxgs=;
 b=inQ8wGpQwLHrzo2URahWinO69NoAkUuQBmUUrdmOfg5Tu6/SfUVmpfzA
 JesQby93htJHQrUVA0KlilVs77Bseg7mmfR8zn8yk9x8dv/mXVtFkKbe8
 6sxLm84b8Vl5jxzT/wL6mbsde66NzhzqsuUpEtOyY20/jCIWqNVys1LF/
 KsUOnf/kG93Gpo+aAlyAwdaLvAAQvuDs4Q985fhpam0EXoURuQHE5QaN6
 U44HvJ/vc6uJtTkaXSFpFwzDh0JM23K1zi6se/bc/DwNEMxQANU8JDBPK
 bUHz/EjAH8JP8M+6IxAoLSoo2RMlTlOtlVxXZFF0UBQYfH+bwFxh0bQTZ w==;
X-CSE-ConnectionGUID: wGWfi4ABRkC07W8+QnX/3g==
X-CSE-MsgGUID: IpzYKQXnT6S+qHfLryoU3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19252381"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="19252381"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 08:11:05 -0700
X-CSE-ConnectionGUID: 4fodFD5STiKtw8qAGgSETg==
X-CSE-MsgGUID: WVdN6pzaSrKG3gVjFXSYfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="41096611"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.222])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 08:11:03 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH v2] tests/intel/xe_evict: Reduce allocations to maximum
 working set
Date: Mon, 17 Jun 2024 17:10:50 +0200
Message-ID: <20240617151050.3804-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

Current xe kmd allows for a maximum working set of VRAM plus
half of system memory, or if the working set is allowed only in
VRAM, the working set is limited to VRAM.

Some subtests attempt to exceed that. Detect when that happens
and limit the working set accordingly.

v2:
- The determination for which flags system bos are allowed in the
  working set was incorrect. Fix. (Zbigniew Kempczyński)
- Fix a typo.
- Add an assert that vram_size is indeed > 0.
  (Zbigniew Kempczyński, Thomas)
- Add asserts and make sure that the bo is bound to the same
  vm the exec_queue is using.
- Increase the allowed set size for the multi-vm test.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_evict.c | 89 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 76 insertions(+), 13 deletions(-)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index eebdbc84b..5691ad021 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -97,6 +97,7 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
                         uint32_t _vm = (flags & EXTERNAL_OBJ) &&
                                 i < n_execs / 8 ? 0 : vm;
 
+			igt_assert((e & 1) == (i & 1));
 			if (flags & MULTI_VM) {
 				__bo = bo[i] = xe_bo_create(fd, 0,
 							    bo_size,
@@ -115,6 +116,7 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 			}
 		} else {
+			igt_assert((e & 1) == ((i % (n_execs / 2)) & 1));
 			__bo = bo[i % (n_execs / 2)];
 		}
 		if (i)
@@ -273,6 +275,7 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
                         uint32_t _vm = (flags & EXTERNAL_OBJ) &&
                                 i < n_execs / 8 ? 0 : vm;
 
+			igt_assert((e & 1) == (i & 1));
 			if (flags & MULTI_VM) {
 				__bo = bo[i] = xe_bo_create(fd, 0,
 							    bo_size,
@@ -291,6 +294,7 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 			}
 		} else {
+			igt_assert((e & 1) == ((i % (n_execs / 2)) & 1));
 			__bo = bo[i % (n_execs / 2)];
 		}
 		if (i)
@@ -458,6 +462,46 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
 		return (ALIGN(vram_size, SZ_256M)  * mul) / div; /* small-bar */
 }
 
+static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
+				uint64_t bo_size, unsigned int num_threads,
+				unsigned int flags)
+{
+	uint64_t set_size;
+	uint64_t total_size;
+
+	igt_assert(vram_size > 0);
+
+	set_size = (vram_size - 1) / bo_size;
+
+	/*
+	 * Working set resides also in system?
+	 * Currently system graphics memory is limited to 50% of total.
+	 */
+	if (!(flags & (THREADED | MULTI_VM)))
+		set_size += (system_size / 2) / bo_size;
+
+	/* Set sizes are per vm. In the multi-vm case we use 2 vms. */
+	if (flags & MULTI_VM)
+		set_size *= 2;
+
+	/* All bos must fit in memory, assuming no swapping */
+	total_size = ((vram_size - 1) / bo_size + system_size / bo_size) /
+		num_threads;
+
+	if (set_size > total_size)
+		set_size = total_size;
+
+	/* bos are only created on half of the execs. */
+	set_size *= 2;
+
+	/*
+	 * Align down to ensure the vm the bo is bound to matches the vm
+	 * used by the exec_queue, fulfilling the asserts in the
+	 * tests.
+	 */
+	return ALIGN_DOWN(set_size, 4);
+}
+
 /**
  * SUBTEST: evict-%s
  * Description:  %arg[1] evict test.
@@ -748,6 +792,7 @@ igt_main
 		{ NULL },
 	};
 	uint64_t vram_size;
+	uint64_t system_size;
 	int fd;
 
 	igt_fixture {
@@ -755,14 +800,16 @@ igt_main
 		igt_require(xe_has_vram(fd));
 		vram_size = xe_visible_vram_size(fd, 0);
 		igt_assert(vram_size);
+		system_size = igt_get_avail_ram_mb() << 20;
 
 		/* Test requires SRAM to about as big as VRAM. For example, small-cm creates
 		 * (448 / 2) BOs with a size (1 / 128) of the total VRAM size. For
 		 * simplicity ensure the SRAM size >= VRAM before running this test.
 		 */
-		igt_skip_on_f(igt_get_avail_ram_mb() < (vram_size >> 20),
-			      "System memory %lu MiB is less than local memory %lu MiB\n",
-			      igt_get_avail_ram_mb(), vram_size >> 20);
+		igt_skip_on_f(system_size < vram_size,
+			      "System memory %llu MiB is less than local memory %llu MiB\n",
+			      (unsigned long long)system_size >> 20,
+			      (unsigned long long)vram_size >> 20);
 
 		xe_for_each_engine(fd, hwe)
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY)
@@ -770,25 +817,41 @@ igt_main
 	}
 
 	for (const struct section *s = sections; s->name; s++) {
-		igt_subtest_f("evict-%s", s->name)
-			test_evict(fd, hwe, s->n_exec_queues, s->n_execs,
-				   calc_bo_size(vram_size, s->mul, s->div),
+		igt_subtest_f("evict-%s", s->name) {
+			uint64_t bo_size = calc_bo_size(vram_size, s->mul, s->div);
+			int ws = working_set(vram_size, system_size, bo_size,
+					     1, s->flags);
+
+			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
+			test_evict(fd, hwe, s->n_exec_queues,
+				   min(ws, s->n_execs), bo_size,
 				   s->flags, NULL);
+		}
 	}
 
 	for (const struct section_cm *s = sections_cm; s->name; s++) {
-		igt_subtest_f("evict-%s", s->name)
-			test_evict_cm(fd, hwe, s->n_exec_queues, s->n_execs,
-				      calc_bo_size(vram_size, s->mul, s->div),
+		igt_subtest_f("evict-%s", s->name) {
+			uint64_t bo_size = calc_bo_size(vram_size, s->mul, s->div);
+			int ws = working_set(vram_size, system_size, bo_size,
+					     1, s->flags);
+
+			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
+			test_evict_cm(fd, hwe, s->n_exec_queues,
+				      min(ws, s->n_execs), bo_size,
 				      s->flags, NULL);
+		}
 	}
 
 	for (const struct section_threads *s = sections_threads; s->name; s++) {
-		igt_subtest_f("evict-%s", s->name)
+		igt_subtest_f("evict-%s", s->name) {
+			uint64_t bo_size = calc_bo_size(vram_size, s->mul, s->div);
+			int ws = working_set(vram_size, system_size, bo_size,
+					     s->n_threads, s->flags);
+
+			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
 			threads(fd, hwe, s->n_threads, s->n_exec_queues,
-				 s->n_execs,
-				 calc_bo_size(vram_size, s->mul, s->div),
-				 s->flags);
+				min(ws, s->n_execs), bo_size, s->flags);
+		}
 	}
 
 	igt_fixture
-- 
2.44.0

