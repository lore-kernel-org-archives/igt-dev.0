Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2AAC27C6E
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 15:30:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D7210ED9B;
	Fri, 14 Jun 2024 15:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dlq+ctMS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E497810ED95
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 15:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718379019; x=1749915019;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LOZQACd9z7l/hHXvLD/dW9x2zZZtviSQIGuS4Bzg6nI=;
 b=dlq+ctMSQ9FWwngwOAcbVbt1P/PE9Se9LM6pJ5Gyn3PmQAoUnMqBNBiH
 3MuHu1q/xtFgMYVXu9eeElhd6PLPqqvyHCY2/7tXBVX3GQ17rqTczExAn
 cu91OOYN+iAyR9kIvRME8NHuN/pmscV6N6wNna6iKSDfFjC+0EXOTNEdy
 m7i2padf0PfeiLqujj+TuLFrUL7hr/UPgztqP9x1Iq5Ly+rNXOFGSuj0p
 q6+ykpbo288nl5X7Kful+z7ZKADpd70d15Dd3bIi0LEFgcRlO2Zzmi3Vt
 fLKG0ilu2uB4mLzeNlcUsmNkRdrVMnW/4h6b9mEMn4zg23twmRseeQwuF A==;
X-CSE-ConnectionGUID: 8+U349WASRGxmM7hTpgt5A==
X-CSE-MsgGUID: s3dziUXpSxWYfrv7mxPEow==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15050052"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="15050052"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 08:30:12 -0700
X-CSE-ConnectionGUID: /eylsSP6TmOWGwAMN0o/Aw==
X-CSE-MsgGUID: FrEd86TuS+SS/aRw9dkH6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40615075"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.153])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 08:30:11 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_evict: Reduce allocations to maximum
 working set
Date: Fri, 14 Jun 2024 17:30:00 +0200
Message-ID: <20240614153001.9387-1-thomas.hellstrom@linux.intel.com>
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

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_evict.c | 72 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 13 deletions(-)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index eebdbc84b..af5e5e5b6 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -458,6 +458,33 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
 		return (ALIGN(vram_size, SZ_256M)  * mul) / div; /* small-bar */
 }
 
+static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
+				uint64_t bo_size, unsigned int num_threads,
+				unsigned int flags)
+{
+	uint64_t set_size;
+	uint64_t total_size;
+
+	set_size = (vram_size - 1) / bo_size;
+
+	/*
+	 * Working set resizes also in system?
+	 * Currently system graphics memory is limited to 50% of total.
+	 */
+	if (!(flags & !(THREADED | MULTI_VM)))
+		set_size += (system_size / 2) / bo_size;
+
+	/* All bos must fit in memory, assuming no swapping */
+	total_size = ((vram_size - 1) / bo_size + system_size / bo_size) /
+		num_threads;
+
+	if (set_size > total_size)
+		set_size = total_size;
+
+	/* bos are only created on half of the execs. */
+	return set_size * 2;
+}
+
 /**
  * SUBTEST: evict-%s
  * Description:  %arg[1] evict test.
@@ -748,6 +775,7 @@ igt_main
 		{ NULL },
 	};
 	uint64_t vram_size;
+	uint64_t system_size;
 	int fd;
 
 	igt_fixture {
@@ -755,14 +783,16 @@ igt_main
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
@@ -770,25 +800,41 @@ igt_main
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

