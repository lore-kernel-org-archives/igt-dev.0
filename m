Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B32FCD3447
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 12:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB0B10E2FA;
	Fri,  8 May 2026 12:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HlNa9FkH";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EC410E30B
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 12:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IilA4XTUx+y+QsFMW9NeJ487pcKHIP9xEkTBy1fl5ao=; b=HlNa9FkHv/PJmayXdtCSfj6gov
 CFEtaipmDX8AqlgfkU4Oylc3ZLgNS3l3HVcVxx7cO0Hnb4Tac1PcWe62uKe82o2//siLRLDgMFm+U
 QdoqL53iYXE7EMgOJ6MTAn//i8b6At63e20yGcDG9Yi7JX675GJeL1A68XEqoIa8SqOhtHf9s4cl9
 jdayBD9sYaljYgL1QbN4X3cbxGKpvWg79dZ8rkS3kxctmkNsHUNJCy0/ZQQ5viV0VdFopjj+HEX8F
 LPe801PLRJwegMlOWqsUCX4GM3MSJd+W2/UaRuEZwZtcyb8xyma/dKcy6LoK1Zw6xfOx8oDty7Txa
 dfREEZsA==;
Received: from [189.7.87.137] (helo=prince)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wLKav-007sqk-3Q; Fri, 08 May 2026 14:46:17 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH i-g-t 5/5] tests/v3d_perfmon: Add global perfmon and counter
 isolation tests
Date: Fri,  8 May 2026 09:42:54 -0300
Message-ID: <20260508124446.1260672-7-mcanal@igalia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508124446.1260672-2-mcanal@igalia.com>
References: <20260508124446.1260672-2-mcanal@igalia.com>
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

Exercise the DRM_IOCTL_V3D_PERFMON_SET_GLOBAL ioctl with a set of
subtests covering:

 - Input validation: invalid flags, invalid perfmon id, and clearing a
   perfmon that was never set as global all return errors.
 - Single-perfmon semantics: setting a second global perfmon while one is
   already active returns EBUSY.
 - Implicit clear on destroy: destroying a global perfmon releases the
   slot, allowing a new one to be set without EBUSY.
 - Precedence over per-job perfmon: submitting a CL job with a per-job
   perfmon_id while a global perfmon is active is rejected with EAGAIN.
 - Cross-fd tracking: a global perfmon set on one file descriptor
   accumulates cycles from CL jobs submitted on a second file descriptor,
   and that second fd cannot install its own global perfmon while the
   first is active.
 - fd close: closing a file descriptor that owns an active global
   perfmon clears it cleanly without crashing the driver.

Add two counter isolation subtests:

 - perfmon-counter-isolation: blocks 100 CSD jobs behind a sw_sync fence,
   then submits a CL job with a perfmon. The driver's queue serialization
   must drain all pending CSD work before opening the perfmon window, so
   compute-active-cycles must read zero after the CL job completes.
 - perfmon-counter-isolation-subsequent-cl: a non-perfmon CL job submitted
   after a perfmon CL job must be serialized behind it and must not
   contribute to its counter values.

Also add get-values-check-monotonically, which submits ten CL jobs in a
loop and asserts that each get-values call returns strictly larger values
than the previous one.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/v3d/v3d_perfmon.c | 529 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 528 insertions(+), 1 deletion(-)

diff --git a/tests/v3d/v3d_perfmon.c b/tests/v3d/v3d_perfmon.c
index f6f2a2774..1e854b8cc 100644
--- a/tests/v3d/v3d_perfmon.c
+++ b/tests/v3d/v3d_perfmon.c
@@ -1,19 +1,25 @@
 // SPDX-License-Identifier: MIT
 /*
  * Copyright © 2022 Igalia S.L.
+ * Copyright © 2026 Raspberry Pi Ltd
  */
 
+#include <sys/ioctl.h>
+
 #include "igt.h"
+#include "igt_syncobj.h"
 #include "igt_v3d.h"
+#include "sw_sync.h"
 
 IGT_TEST_DESCRIPTION("Tests for the V3D's performance monitors");
 
 int igt_main()
 {
-	int fd;
+	int fd, ver;
 
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_V3D);
+		ver = igt_v3d_get_version(fd);
 		igt_require(igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_PERFMON));
 	}
 
@@ -124,6 +130,65 @@ int igt_main()
 		igt_v3d_perfmon_destroy(fd, id);
 	}
 
+	igt_describe("Make sure the values returned by the perfmon are increasing monotonically.");
+	igt_subtest("get-values-check-monotonically") {
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
+		uint32_t id, out_sync;
+		uint64_t *prev, *curr;
+		uint8_t counters[4];
+
+		/*
+		 * Different V3D versions have different performance counters
+		 * IDs for the same counters.
+		 */
+		if (ver >= 71) {
+			counters[0] = 3;  /* CLE-bin-thread-active-cycles */
+			counters[1] = 64; /* PTB-memory-writes */
+			counters[2] = 66; /* core-memory-reads */
+			counters[3] = 71; /* PTB-memory-words-writes */
+		} else if (ver >= 42) {
+			counters[0] = V3D_PERFCNT_CLE_ACTIVE;
+			counters[1] = V3D_PERFCNT_PTB_MEM_WRITES;
+			counters[2] = V3D_PERFCNT_CORE_MEM_READS;
+			counters[3] = V3D_PERFCNT_PTB_W_MEM_WORDS;
+		} else
+			igt_abort_on_f(true, "This V3D version is not supported.");
+
+		id = igt_v3d_perfmon_create(fd, ARRAY_SIZE(counters), counters);
+
+		prev = calloc(ARRAY_SIZE(counters), sizeof(*prev));
+		curr = calloc(ARRAY_SIZE(counters), sizeof(*curr));
+
+		igt_v3d_perfmon_get_values(fd, id, prev);
+
+		for (int i = 0; i < ARRAY_SIZE(counters); i++)
+			igt_assert_eq(prev[i], 0);
+
+		out_sync = syncobj_create(fd, 0);
+		job->submit->out_sync = out_sync;
+		job->submit->perfmon_id = id;
+
+		/* Check if the counters are increasing monotonically. */
+		for (int i = 0; i < 10; i++) {
+			do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
+			igt_assert(syncobj_wait(fd, &out_sync, 1, INT64_MAX, 0, NULL));
+
+			igt_v3d_perfmon_get_values(fd, id, curr);
+
+			for (int j = 0; j < ARRAY_SIZE(counters); j++)
+				igt_assert_lt(prev[j], curr[j]);
+
+			igt_swap(prev, curr);
+		}
+
+		syncobj_destroy(fd, out_sync);
+		igt_v3d_free_cl_job(fd, job);
+		igt_v3d_perfmon_destroy(fd, id);
+
+		free(prev);
+		free(curr);
+	}
+
 	igt_describe("Make sure that destroying a non-existent perfmon fails.");
 	igt_subtest("destroy-invalid-perfmon") {
 		struct drm_v3d_perfmon_destroy destroy = {
@@ -151,6 +216,468 @@ int igt_main()
 		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_GET_VALUES, &get, EINVAL);
 	}
 
+	igt_describe("Make sure that setting a global perfmon fails for an invalid flag.");
+	igt_subtest("global-perfmon-invalid-flag") {
+		struct drm_v3d_perfmon_set_global set_global = {
+			.flags = 0xdeadbeef,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, &set_global, EINVAL);
+	}
+
+	igt_describe("Make sure that setting a global perfmon fails for an invalid identifier.");
+	igt_subtest("global-perfmon-invalid-perfmon") {
+		struct drm_v3d_perfmon_set_global set_global = {
+			.id = 0xdeadbeef,
+		};
+		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, &set_global, EINVAL);
+	}
+
+	igt_describe("Make sure that clearing a valid identifier that it's not a global perfmon fails.");
+	igt_subtest("global-perfmon-clear-unset-perfmon") {
+		uint8_t counters[] = { V3D_PERFCNT_AXI_WRITE_STALLS_WATCH_1,
+				       V3D_PERFCNT_TMU_CONFIG_ACCESSES,
+				       V3D_PERFCNT_TLB_PARTIAL_QUADS,
+				       V3D_PERFCNT_L2T_SLC0_READS };
+		uint32_t id = igt_v3d_perfmon_create(fd, ARRAY_SIZE(counters), counters);
+		struct drm_v3d_perfmon_set_global set_global = {
+			.id = id,
+			.flags = DRM_V3D_PERFMON_CLEAR_GLOBAL,
+		};
+
+		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, &set_global, EINVAL);
+
+		igt_v3d_perfmon_destroy(fd, id);
+	}
+
+	igt_describe("Make sure that the IOCTL fails when one sets a global perfmon, but one is already set.");
+	igt_subtest("global-perfmon-set-valid-perfmon-twice") {
+		uint8_t counters[] = { V3D_PERFCNT_L2T_HITS,  V3D_PERFCNT_L2T_MISSES };
+		uint32_t id1 = igt_v3d_perfmon_create(fd, ARRAY_SIZE(counters), counters);
+		uint32_t id2 = igt_v3d_perfmon_create(fd, ARRAY_SIZE(counters), counters);
+
+		struct drm_v3d_perfmon_set_global set_global = {
+			.id = id1,
+		};
+		do_ioctl(fd, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, &set_global);
+
+		set_global.id = id2;
+		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, &set_global, EBUSY);
+
+		igt_v3d_perfmon_destroy(fd, id1);
+		igt_v3d_perfmon_destroy(fd, id2);
+	}
+
+	igt_describe("Make sure that destroying a global perfmon clears it even without "
+		     "DRM_V3D_PERFMON_CLEAR_GLOBAL.");
+	igt_subtest("global-perfmon-destroy") {
+		uint8_t counters[] = { V3D_PERFCNT_AXI_WRITE_STALLS_WATCH_1,
+				       V3D_PERFCNT_L2T_SLC0_READS };
+		uint32_t id1 = igt_v3d_perfmon_create(fd, ARRAY_SIZE(counters), counters);
+		uint32_t id2 = igt_v3d_perfmon_create(fd, ARRAY_SIZE(counters), counters);
+		struct drm_v3d_perfmon_set_global set_global = { .id = id1 };
+
+		do_ioctl(fd, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, &set_global);
+
+		igt_v3d_perfmon_destroy(fd, id1);
+
+		/* Returns success as global perfmon was cleared during destroy. */
+		set_global.id = id2;
+		do_ioctl(fd, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, &set_global);
+
+		igt_v3d_perfmon_destroy(fd, id2);
+	}
+
+	igt_describe("Make sure that submitting a per-job perfmon is rejected when a "
+		     "global perfmon is active, and that the global perfmon keeps tracking.");
+	igt_subtest("global-perfmon-precedes-per-job") {
+		struct drm_v3d_perfmon_set_global set_global = { 0 };
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
+		uint32_t id_global, id_job, out_sync;
+		uint64_t values;
+		uint8_t counter;
+		int ret;
+
+		/*
+		 * Different V3D versions have different performance counters
+		 * IDs for the same counters.
+		 */
+		if (ver >= 71)
+			counter = 0; /* cycle-count */
+		else if (ver >= 42)
+			counter = V3D_PERFCNT_CYCLE_COUNT;
+		else
+			igt_abort_on_f(true, "This V3D version is not supported.");
+
+		id_global = igt_v3d_perfmon_create(fd, 1, &counter);
+		id_job = igt_v3d_perfmon_create(fd, 1, &counter);
+
+		set_global.id = id_global;
+		do_ioctl(fd, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, &set_global);
+
+		/* Submitting a per-job perfmon while a global one is active must
+		 * be rejected: the global perfmon takes precedence.
+		 */
+		job->submit->perfmon_id = id_job;
+
+		/* Don't use drmIoctl(), as it restarts the ioctl if errno is EAGAIN. */
+		ret = ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
+		igt_assert_eq(ret, -1);
+		igt_assert_eq(errno, EAGAIN);
+
+		/* Submit a plain job (no per-job perfmon). */
+		out_sync = syncobj_create(fd, 0);
+		job->submit->perfmon_id = 0;
+		job->submit->out_sync = out_sync;
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
+		igt_assert(syncobj_wait(fd, &out_sync, 1, INT64_MAX, 0, NULL));
+
+		/* The global perfmon kept tracking. */
+		igt_v3d_perfmon_get_values(fd, id_global, &values);
+		igt_assert_lt(0, values);
+
+		igt_v3d_perfmon_destroy(fd, id_global);
+		igt_v3d_perfmon_destroy(fd, id_job);
+
+		syncobj_destroy(fd, out_sync);
+		igt_v3d_free_cl_job(fd, job);
+	}
+
+	igt_describe("Make sure that the global perfmon is tracking all jobs consistently.");
+	igt_subtest("global-perfmon-valid-perfmon") {
+		struct drm_v3d_perfmon_set_global set_global = { 0 };
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
+		uint64_t *values1, *values2;
+		uint32_t id, out_sync;
+		uint8_t counters[2];
+
+		/*
+		 * Different V3D versions have different performance counters
+		 * IDs for the same counters.
+		 */
+		if (ver >= 71) {
+			counters[0] = 0; /* cycle-count */
+			counters[1] = 1; /* core-active */
+		} else if (ver >= 42) {
+			counters[0] = V3D_PERFCNT_CYCLE_COUNT;
+			counters[1] = V3D_PERFCNT_CLE_ACTIVE;
+		} else
+			igt_abort_on_f(true, "This V3D version is not supported.");
+
+		id = igt_v3d_perfmon_create(fd, ARRAY_SIZE(counters), counters);
+
+		values1 = calloc(ARRAY_SIZE(counters), sizeof(*values1));
+		values2 = calloc(ARRAY_SIZE(counters), sizeof(*values2));
+
+		set_global.id = id;
+		do_ioctl(fd, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, &set_global);
+
+		igt_v3d_perfmon_get_values(fd, id, values1);
+
+		out_sync = syncobj_create(fd, 0);
+		job->submit->out_sync = out_sync;
+
+		/* Submit an arbitrary number of CL jobs to stress the perfcnts. */
+		for (int i = 0; i < 10; i++)
+			do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
+
+		/* Wait for the last job to complete so counters are captured. */
+		igt_assert(syncobj_wait(fd, &out_sync, 1, INT64_MAX, 0, NULL));
+
+		igt_v3d_perfmon_get_values(fd, id, values2);
+
+		/* As the global perfmon is active, the cycle-count must have
+		 * increased with time.
+		 */
+		for (int i = 0; i < ARRAY_SIZE(counters); i++)
+			igt_assert_lt(values1[i], values2[i]);
+
+		set_global.flags = DRM_V3D_PERFMON_CLEAR_GLOBAL;
+		do_ioctl(fd, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, &set_global);
+
+		igt_v3d_perfmon_get_values(fd, id, values1);
+
+		/* Submit an arbitrary number of CL jobs to stress the perfcnts. */
+		for (int i = 0; i < 10; i++)
+			do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
+
+		igt_v3d_perfmon_get_values(fd, id, values2);
+
+		/* As the global perfmon was cleared, the perfmon is inactive
+		 * and it must preserve its values.
+		 */
+		for (int i = 0; i < ARRAY_SIZE(counters); i++)
+			igt_assert_eq(values1[i], values2[i]);
+
+		igt_v3d_perfmon_destroy(fd, id);
+
+		syncobj_destroy(fd, out_sync);
+		igt_v3d_free_cl_job(fd, job);
+
+		free(values1);
+		free(values2);
+	}
+
+	igt_describe("Make sure that a global perfmon tracks jobs from other file descriptors.");
+	igt_subtest("global-perfmon-multifd") {
+		struct drm_v3d_perfmon_set_global set_global = { 0 },
+						  set_global2 = { 0 };
+		int fd2 = drm_open_driver_render(DRIVER_V3D);
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd2);
+		uint32_t id1, id2, out_sync;
+		uint64_t values1, values2;
+		uint8_t counter;
+
+		/*
+		 * Different V3D versions have different performance counters
+		 * IDs for the same counters.
+		 */
+		if (ver >= 71)
+			counter = 0; /* cycle-count */
+		else if (ver >= 42)
+			counter = V3D_PERFCNT_CYCLE_COUNT;
+		else
+			igt_abort_on_f(true, "This V3D version is not supported.");
+
+		/* Create and set global perfmon from fd. */
+		id1 = igt_v3d_perfmon_create(fd, 1, &counter);
+		set_global.id = id1;
+		do_ioctl(fd, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, &set_global);
+
+		igt_v3d_perfmon_get_values(fd, id1, &values1);
+
+		/* Submit jobs from the second fd; the global perfmon should track them. */
+		out_sync = syncobj_create(fd2, 0);
+		job->submit->out_sync = out_sync;
+		for (int i = 0; i < 10; i++)
+			do_ioctl(fd2, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
+		igt_assert(syncobj_wait(fd2, &out_sync, 1, INT64_MAX, 0, NULL));
+
+		igt_v3d_perfmon_get_values(fd, id1, &values2);
+		igt_assert_lt(values1, values2);
+
+		/* fd2 cannot set its own global perfmon while fd's is active. */
+		id2 = igt_v3d_perfmon_create(fd2, 1, &counter);
+		set_global2.id = id2;
+		do_ioctl_err(fd2, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, &set_global2, EBUSY);
+
+		igt_v3d_perfmon_destroy(fd2, id2);
+		igt_v3d_perfmon_destroy(fd, id1);
+
+		syncobj_destroy(fd2, out_sync);
+		igt_v3d_free_cl_job(fd2, job);
+
+		drm_close_driver(fd2);
+	}
+
+	igt_describe("Make sure closing a file descriptor with an active global "
+		     "perfmon does not crash the driver.");
+	igt_subtest("global-perfmon-destroy-multifd") {
+		struct drm_v3d_perfmon_set_global set_global = { 0 };
+		struct v3d_cl_job *job = igt_v3d_noop_job(fd);
+		int fd2 = drm_open_driver(DRIVER_V3D);
+		uint32_t id, new_id, out_sync;
+		uint8_t counter = 0;
+
+		/* Create and set global perfmon from fd2. */
+		id = igt_v3d_perfmon_create(fd2, 1, &counter);
+		set_global.id = id;
+		do_ioctl(fd2, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, &set_global);
+
+		/* Keep HW busy from fd while fd2 is closed. */
+		out_sync = syncobj_create(fd, 0);
+		job->submit->out_sync = out_sync;
+		for (int i = 0; i < 10; i++)
+			do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit);
+
+		/* Closing fd2 must cleanly stop the active global perfmon and
+		 * clear the global perfmon without crashing.
+		 */
+		drm_close_driver(fd2);
+
+		igt_assert(syncobj_wait(fd, &out_sync, 1, INT64_MAX, 0, NULL));
+
+		/* fd can now set a new global perfmon without EBUSY. */
+		new_id = igt_v3d_perfmon_create(fd, 1, &counter);
+
+		set_global.id = new_id;
+		do_ioctl(fd, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, &set_global);
+
+		set_global.flags = DRM_V3D_PERFMON_CLEAR_GLOBAL;
+		do_ioctl(fd, DRM_IOCTL_V3D_PERFMON_SET_GLOBAL, &set_global);
+
+		igt_v3d_perfmon_destroy(fd, new_id);
+
+		syncobj_destroy(fd, out_sync);
+		igt_v3d_free_cl_job(fd, job);
+	}
+
+	igt_describe("Make sure a perfmon CL job is not contaminated by concurrent CSD "
+		     "work on a different queue.");
+	igt_subtest("perfmon-counter-isolation") {
+		struct v3d_csd_job *csd_job = igt_v3d_empty_shader(fd);
+		struct v3d_cl_job *cl_job = igt_v3d_noop_job(fd);
+		uint32_t id, blocker, cl_out;
+		int timeline, fence_fd;
+		uint8_t counter;
+		uint64_t values;
+
+		igt_require_sw_sync();
+
+		/*
+		 * compute-active-cycles is zero during pure CL work and non-zero
+		 * while a CSD job is executing. Submitting CSD jobs alongside a
+		 * perfmon CL job lets us distinguish "CSD ran while the perfmon
+		 * window was open" (isolation broken) from "CSD finished before
+		 * the perfmon window opened" (isolation correct).
+		 */
+		if (ver >= 71)
+			counter = 4; /* compute-active-cycles */
+		else if (ver >= 42)
+			counter = V3D_PERFCNT_COMPUTE_ACTIVE;
+		else
+			igt_abort_on_f(true, "This V3D version is not supported.");
+
+		id = igt_v3d_perfmon_create(fd, 1, &counter);
+
+		/*
+		 * Create an unsignaled fence via sw_sync. All CSD jobs will
+		 * wait on this fence and stay queued until we increment the
+		 * sw_sync timeline.
+		 */
+		timeline = sw_sync_timeline_create();
+		fence_fd = sw_sync_timeline_create_fence(timeline, 1);
+
+		blocker = syncobj_create(fd, 0);
+		syncobj_import_sync_file(fd, blocker, fence_fd);
+		close(fence_fd);
+
+		cl_out = syncobj_create(fd, 0);
+
+		/*
+		 * Block all CSD jobs with the unsignaled SW fence so they are
+		 * still queued when the CL perfmon job is submitted.
+		 */
+		csd_job->submit->in_sync = blocker;
+		for (int i = 0; i < 100; i++)
+			do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CSD, csd_job->submit);
+
+		/*
+		 * Submit the CL job with the perfmon. v3d perfmon serialization
+		 * must add a fence dependency on the CSD done fences so the CL
+		 * job is forced to wait for all previous jobs to complete before
+		 * its perfmon window opens.
+		 */
+		cl_job->submit->out_sync = cl_out;
+		cl_job->submit->perfmon_id = id;
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, cl_job->submit);
+
+		/*
+		 * With serialization, the CL job waits for all CSD work to finish
+		 * first, so the perfmon sees only pure CL activity. Without it,
+		 * the two queues would race and CSD cycles would pollute the counter.
+		 */
+		sw_sync_timeline_inc(timeline, 1);
+		igt_assert(syncobj_wait(fd, &cl_out, 1, INT64_MAX, 0, NULL));
+
+		igt_v3d_perfmon_get_values(fd, id, &values);
+
+		/* All CSD activity finished before the perfmon window opened,
+		 * so no compute cycles must have been counted during the CL job.
+		 */
+		igt_assert_eq(values, 0);
+
+		close(timeline);
+		igt_v3d_perfmon_destroy(fd, id);
+
+		syncobj_destroy(fd, blocker);
+		syncobj_destroy(fd, cl_out);
+		igt_v3d_free_cl_job(fd, cl_job);
+		igt_v3d_free_csd_job(fd, csd_job);
+	}
+
+	igt_describe("Make sure a non-perfmon CL job submitted after a perfmon CL job "
+		     "is serialized behind it and does not contaminate its counter values.");
+	igt_subtest("perfmon-counter-isolation-subsequent-cl") {
+		struct v3d_cl_job *job1 = igt_v3d_noop_job(fd);
+		struct v3d_cl_job *job2 = igt_v3d_noop_job(fd);
+		uint64_t id, values, values_after_j2;
+		uint32_t blocker, out1, out2;
+		int timeline, fence_fd;
+		uint8_t counter;
+
+		igt_require_sw_sync();
+
+		/*
+		 * Different V3D versions have different performance counters IDs
+		 * for the same counters.
+		 */
+		if (ver >= 71)
+			counter = 0; /* cycle-count */
+		else if (ver >= 42)
+			counter = V3D_PERFCNT_CYCLE_COUNT;
+		else
+			igt_abort_on_f(true, "This V3D version is not supported.");
+
+		id = igt_v3d_perfmon_create(fd, 1, &counter);
+
+		/*
+		 * Create an unsignaled fence via sw_sync. job1 will wait on
+		 * this fence and stay blocked until we increment the timeline.
+		 */
+		timeline = sw_sync_timeline_create();
+		fence_fd = sw_sync_timeline_create_fence(timeline, 1);
+
+		blocker = syncobj_create(fd, 0);
+		syncobj_import_sync_file(fd, blocker, fence_fd);
+		close(fence_fd);
+
+		out1 = syncobj_create(fd, 0);
+		out2 = syncobj_create(fd, 0);
+
+		/* job1: BIN job is blocked until we signal the blocker. */
+		job1->submit->in_sync_bcl = blocker;
+		job1->submit->perfmon_id = id;
+		job1->submit->out_sync = out1;
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job1->submit);
+
+		/* job2: no perfmon, must wait for job1 due to job serialization. */
+		job2->submit->out_sync = out2;
+		do_ioctl(fd, DRM_IOCTL_V3D_SUBMIT_CL, job2->submit);
+
+		/* job2 is serialized behind job1, so it cannot have completed yet. */
+		igt_assert_eq(syncobj_wait_err(fd, &out2, 1, 0, 0), -ETIME);
+
+		/* While job1 has not started, the perfmon must still read zero. */
+		igt_v3d_perfmon_get_values(fd, id, &values);
+		igt_assert_eq(values, 0);
+
+		/* Release the blocker. */
+		sw_sync_timeline_inc(timeline, 1);
+
+		igt_assert(syncobj_wait(fd, &out1, 1, INT64_MAX, 0, NULL));
+		igt_assert(syncobj_wait(fd, &out2, 1, INT64_MAX, 0, NULL));
+
+		/* job1 must have contributed cycles to the perfmon. */
+		igt_v3d_perfmon_get_values(fd, id, &values);
+		igt_assert_lt(0, values);
+
+		/* job2 doesn't have a perfmon attached, so a second read must
+		 * return the same value.
+		 */
+		igt_v3d_perfmon_get_values(fd, id, &values_after_j2);
+		igt_assert_eq(values, values_after_j2);
+
+		close(timeline);
+		syncobj_destroy(fd, blocker);
+		syncobj_destroy(fd, out1);
+		syncobj_destroy(fd, out2);
+
+		igt_v3d_perfmon_destroy(fd, id);
+
+		igt_v3d_free_cl_job(fd, job1);
+		igt_v3d_free_cl_job(fd, job2);
+	}
+
 	igt_fixture()
 		drm_close_driver(fd);
 }
-- 
2.54.0

