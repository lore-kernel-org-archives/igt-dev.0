Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72041CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 20:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C0E10EA10;
	Wed, 27 May 2026 20:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUGOmBRp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499B610EA0F
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 20:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779915417; x=1811451417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HUP2br11pik0Y1vn9Y7Ip9TAP3bgjKFcFBvTVhDNZrE=;
 b=TUGOmBRpUoRmXm0hH2xE2Z3IRfNlJZO5Z5sk6eOq0NH0d+BuFOMeVIJh
 wtG7KuR3/YrpaC5Cn8JXolPTUQ/8TAKIjz6hLkw1dT5Bvn7B6oIdO/PuN
 K9MLtTn3Spxo1nsnkSsfmEfJdjyeXygdr/WG/r8zRA4aU17yI4Yckk8nE
 T4VvrP77GJXxlj0fIs0ylzGKV2isXCmjkHnvbY65SjHGDCbw7cAK+cJhR
 mPlexq8fh9DXo4glgeAFuxnEuvHHV+/CZUkWmK47DkbdqP3dQ15pFFfmP
 eFsKI0mksjc1UYlDS5eHAS+mYRdWGlPHzVOyfaHObW+UcNmyAKlnukbuT g==;
X-CSE-ConnectionGUID: Y47iP8+GQ+Ke78fXG3tQ+w==
X-CSE-MsgGUID: KWX28SkDQty2fUB0lGGSjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84383423"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="84383423"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:56:57 -0700
X-CSE-ConnectionGUID: IQqm6BPnTCqH5Gm6LwGfhA==
X-CSE-MsgGUID: RxZ1VzzvQT6T/1bLQucVOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="239347208"
Received: from kpleskax-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.94.249.221])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:56:54 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 1/8] tests/intel/xe_sriov_scheduling: Use timestamp
 helper
Date: Wed, 27 May 2026 22:56:34 +0200
Message-ID: <20260527205644.2801165-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527205644.2801165-1-marcin.bernatowicz@linux.intel.com>
References: <20260527205644.2801165-1-marcin.bernatowicz@linux.intel.com>
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

Replace open-coded timestamp collection with current_timestamp_ns().

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 4228eea2d..509d6fd00 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -85,6 +85,15 @@ struct subm_set {
 	pthread_barrier_t barrier;
 };
 
+static uint64_t current_timestamp_ns(void)
+{
+	struct timespec tv;
+
+	igt_gettime(&tv);
+
+	return tv.tv_sec * (uint64_t)NSEC_PER_SEC + (uint64_t)tv.tv_nsec;
+}
+
 static void subm_init(struct subm *s, int fd, int vf_num, uint64_t addr,
 		      struct drm_xe_engine_class_instance hwe,
 		      unsigned int inflight)
@@ -164,8 +173,6 @@ static void subm_wait_slot(struct subm *s, unsigned int slot, uint64_t abs_timeo
 
 static void subm_exec_slot(struct subm *s, unsigned int slot)
 {
-	struct timespec tv;
-
 	syncobj_reset(s->fd, &s->done_fence[slot], 1);
 	memset(&s->sync[0], 0, sizeof(s->sync));
 	s->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
@@ -174,8 +181,7 @@ static void subm_exec_slot(struct subm *s, unsigned int slot)
 	s->exec.num_syncs = 1;
 	s->exec.syncs = to_user_pointer(&s->sync[0]);
 	s->exec.address = s->addr[slot];
-	igt_gettime(&tv);
-	s->submit_ts[slot] = (uint64_t)tv.tv_sec * (uint64_t)NSEC_PER_SEC + (uint64_t)tv.tv_nsec;
+	s->submit_ts[slot] = current_timestamp_ns();
 	xe_exec(s->fd, &s->exec);
 }
 
@@ -200,12 +206,9 @@ static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
 {
 	const unsigned int inflight = s->slots;
 	unsigned int submitted = 0;
-	struct timespec tv;
 	unsigned int i;
 
-	igt_gettime(&tv);
-	stats->start_timestamp =
-		tv.tv_sec * (uint64_t)NSEC_PER_SEC + tv.tv_nsec;
+	stats->start_timestamp = current_timestamp_ns();
 	igt_debug("[%s] start_timestamp: %f\n", s->id, stats->start_timestamp * 1e-9);
 
 	/* Prefill */
@@ -222,9 +225,7 @@ static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
 		unsigned int slot = i % inflight;
 
 		subm_wait_slot(s, slot, INT64_MAX);
-		igt_gettime(&tv);
-		stats->complete_ts[i] = (uint64_t)tv.tv_sec * (uint64_t)NSEC_PER_SEC +
-					(uint64_t)tv.tv_nsec;
+		stats->complete_ts[i] = current_timestamp_ns();
 		igt_stats_push(&stats->samples, stats->complete_ts[i] - s->submit_ts[slot]);
 
 		if (!subm_is_work_complete(s, slot)) {
@@ -246,8 +247,7 @@ static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
 		}
 	}
 
-	igt_gettime(&tv);
-	stats->end_timestamp = tv.tv_sec * (uint64_t)NSEC_PER_SEC + tv.tv_nsec;
+	stats->end_timestamp = current_timestamp_ns();
 	igt_debug("[%s] end_timestamp: %f\n", s->id, stats->end_timestamp * 1e-9);
 }
 
-- 
2.43.0

