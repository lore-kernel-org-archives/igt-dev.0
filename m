Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7EFC3ABD8
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 14:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD74010E287;
	Wed, 14 May 2025 14:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EBVWxEQl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6663710E26A
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 14:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747232750; x=1778768750;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F7QWd4x2S/ulLwBBA0n/zvIyYg7mTelHrtH/6PBYJQ0=;
 b=EBVWxEQlDCPtPU4EU5zJ127uM+LTuANMUhgUo2txH4CeLFUO3ZlrdaM6
 ITN9tbX7bnsTwgWdn+7x0SiyF0MiVL05Sr2HRcDhto1FcTsCPNkTk3uUd
 qwZKEB7cD6OgDDltdIzovvWYbVpEKjRMIx7bsaVHb9OfMjWr9vAamfiGL
 RIQmeoFF1yxzPJz+cv+sirwSBifcvwGuO9LnYx8HttEGx1eapx27plpHG
 KYKZpwjRGB0NAkAf77mzQCIRBITTjgpy8m+NTmTo2u9NoJrUJjnSVwbH9
 KoA5tZUFuxKB3HYoCiJ0+n1AS05gv8NYgDl36K9HpmgC1yhfMc+ZvNDfr g==;
X-CSE-ConnectionGUID: JFbcZWv7SdK2ThLIItjPpw==
X-CSE-MsgGUID: A1nFxk0cSwmzLqH85t0fTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="51771581"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="51771581"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 07:25:50 -0700
X-CSE-ConnectionGUID: eS6DUaLjTQO5TVwW1fwmdw==
X-CSE-MsgGUID: D6nz72kKTpij6L+Gvid+Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="138551937"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.0.195])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 07:25:48 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_sriov_scheduling: Close open handles
 before disabling VFs
Date: Wed, 14 May 2025 16:25:43 +0200
Message-Id: <20250514142543.345665-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Prevent a potential hot-unplug scenario by explicitly closing all
open handles before disabling VFs. Extract handle cleanup into a
dedicated subm_set_close_handles() helper and invoke it before
asserts.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 89cdd8750..2cd18c982 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -241,22 +241,41 @@ static void subm_set_init_sync_method(struct subm_set *set, enum subm_sync_metho
 		pthread_barrier_init(&set->barrier, NULL, set->ndata);
 }
 
-static void subm_set_fini(struct subm_set *set)
+static void subm_set_close_handles(struct subm_set *set)
 {
+	struct subm *s;
 	int i;
 
 	if (!set->ndata)
 		return;
 
 	for (i = 0; i < set->ndata; ++i) {
-		igt_stats_fini(&set->data[i].stats.samples);
-		subm_fini(&set->data[i].subm);
-		drm_close_driver(set->data[i].subm.fd);
+		s = &set->data[i].subm;
+
+		if (s->fd != -1) {
+			subm_fini(s);
+			drm_close_driver(s->fd);
+			s->fd = -1;
+		}
 	}
-	subm_set_free_data(set);
+}
+
+static void subm_set_fini(struct subm_set *set)
+{
+	int i;
+
+	if (!set->ndata)
+		return;
 
 	if (set->sync_method == SYNC_BARRIER)
 		pthread_barrier_destroy(&set->barrier);
+
+	subm_set_close_handles(set);
+
+	for (i = 0; i < set->ndata; ++i)
+		igt_stats_fini(&set->data[i].stats.samples);
+
+	subm_set_free_data(set);
 }
 
 struct init_vf_ids_opts {
@@ -602,6 +621,7 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
 
 	/* dispatch spinners, wait for results */
 	subm_set_dispatch_and_wait_threads(set);
+	subm_set_close_handles(set);
 
 	/* verify results */
 	compute_common_time_frame_stats(set);
@@ -696,6 +716,7 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
 
 	/* dispatch spinners, wait for results */
 	subm_set_dispatch_and_wait_threads(set);
+	subm_set_close_handles(set);
 
 	/* verify results */
 	for (int n = 0; n < set->ndata; ++n) {
-- 
2.31.1

