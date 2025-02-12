Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEDEC021A0
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 18:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF0A10E966;
	Wed, 12 Feb 2025 18:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HO+GIwZj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96B010E967
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 18:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739386118; x=1770922118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Vj8pehjP4O2SdUY+b3x+o4PFYZ22x2rI2XjtVqv6xA=;
 b=HO+GIwZjyQw69fXx5zlHnz7ih4VnKnNAAENdi1Njsf9hOBxyRTQXI9JS
 GfSfDKqthIUvLyO+ZoOJXJS5mfsQ+OOQKUZDD1aXgP4aJiolhPo+G97iE
 KAI1xzefbsp4o3kj6eBB6c4VPJ69e2xrZYGj2yerlgJVTnPB+0CLaiHUg
 IilHFoYI1hDy17c7jDfLfI1hyxehrt/X9aqhAunWmeMPew1rxxHy6YRNk
 7LMUx1L/OZHIDyadp52q6i6erVpegCEblb464uGqugErUqSBQxwlc8ZQN
 vyjzAvigbImB2FsJzOwhxbOgvgtJJh9MagnxhR1+EzKQVt3WW9NbqCuMz Q==;
X-CSE-ConnectionGUID: uKpyeSAcQ2a+DWb5VCGXJw==
X-CSE-MsgGUID: kztbwEb2S2+plCtR/zCkhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39761989"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="39761989"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 10:48:38 -0800
X-CSE-ConnectionGUID: Y07Q27d0S2yD+9v91fYGfw==
X-CSE-MsgGUID: YC66aVRYQ8CWYnD5JWpF/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="143750853"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.17.221])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 10:48:35 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v2 i-g-t 5/5] tests/xe_sriov_scheduling: Get job timeout from
 sysfs
Date: Wed, 12 Feb 2025 19:47:57 +0100
Message-Id: <20250212184757.586071-6-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250212184757.586071-1-marcin.bernatowicz@linux.intel.com>
References: <20250212184757.586071-1-marcin.bernatowicz@linux.intel.com>
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

Replace hardcoded JOB_TIMEOUT_MS with sysfs_get_job_timeout_ms() to
dynamically retrieve the value.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index fe037c1dc..82c525fe3 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -5,6 +5,7 @@
 #include "igt.h"
 #include "igt_sriov_device.h"
 #include "igt_syncobj.h"
+#include "igt_sysfs.h"
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_spin.h"
@@ -423,7 +424,6 @@ static void log_sample_values(char *id, struct subm_stats *stats,
 #define MIN_EXEC_QUANTUM_MS 8
 #define MAX_EXEC_QUANTUM_MS 32
 #define MIN_JOB_DURATION_MS 16
-#define JOB_TIMEOUT_MS 5000
 #define MAX_TOTAL_DURATION_MS 15000
 #define PREFERRED_TOTAL_DURATION_MS 10000
 #define MAX_PREFERRED_REPEATS 100
@@ -434,6 +434,18 @@ struct job_sched_params {
 	struct vf_sched_params sched_params;
 };
 
+static uint32_t sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	int engine_dir;
+	uint32_t ret;
+
+	engine_dir = xe_sysfs_engine_open(fd, eci->gt_id, eci->engine_class);
+	ret = igt_sysfs_get_u32(engine_dir, "job_timeout_ms");
+	close(engine_dir);
+
+	return ret;
+}
+
 static uint32_t derive_preempt_timeout_us(const uint32_t exec_quantum_ms)
 {
 	return exec_quantum_ms * 2 * USEC_PER_MSEC;
@@ -539,15 +551,16 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
 {
 	struct subm_set set_ = {}, *set = &set_;
 	uint8_t vf_ids[num_vfs + 1 /*PF*/];
+	uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, &xe_engine(pf_fd, 0)->instance);
 	struct job_sched_params job_sched_params = prepare_job_sched_params(num_vfs + 1,
-									    JOB_TIMEOUT_MS,
+									    job_timeout_ms,
 									    opts);
 
-	igt_info("eq=%ums pt=%uus duration=%ums repeats=%d num_vfs=%d\n",
+	igt_info("eq=%ums pt=%uus duration=%ums repeats=%d num_vfs=%d job_timeout=%ums\n",
 		 job_sched_params.sched_params.exec_quantum_ms,
 		 job_sched_params.sched_params.preempt_timeout_us,
 		 job_sched_params.duration_ms, job_sched_params.num_repeats,
-		 num_vfs + 1);
+		 num_vfs + 1, job_timeout_ms);
 
 	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
 		    &(struct init_vf_ids_opts){ .shuffle = true,
@@ -631,16 +644,17 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
 				     const struct subm_opts *opts)
 {
 	struct subm_set set_ = {}, *set = &set_;
+	uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, &xe_engine(pf_fd, 0)->instance);
 	struct vf_sched_params vf_sched_params = prepare_vf_sched_params(num_vfs, 1,
-									 JOB_TIMEOUT_MS, opts);
+									 job_timeout_ms, opts);
 	uint64_t duration_ms = 2 * vf_sched_params.exec_quantum_ms +
 			       vf_sched_params.preempt_timeout_us / USEC_PER_MSEC;
 	int preemptible_end = 1;
 	uint8_t vf_ids[num_vfs + 1 /*PF*/];
 
-	igt_info("eq=%ums pt=%uus duration=%lums num_vfs=%d\n",
-		 vf_sched_params.exec_quantum_ms,
-		 vf_sched_params.preempt_timeout_us, duration_ms, num_vfs);
+	igt_info("eq=%ums pt=%uus duration=%lums num_vfs=%d job_timeout=%ums\n",
+		 vf_sched_params.exec_quantum_ms, vf_sched_params.preempt_timeout_us,
+		 duration_ms, num_vfs, job_timeout_ms);
 
 	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
 		    &(struct init_vf_ids_opts){ .shuffle = true,
-- 
2.31.1

