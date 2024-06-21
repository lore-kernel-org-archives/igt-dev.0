Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0BDC27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 11:53:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CDF10F167;
	Fri, 21 Jun 2024 11:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VCH3ZEsq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B97510F167
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 11:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718970799; x=1750506799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fj424aKmYqtf7uWCsUBTBq8kDAUde99Jn7aInJDo0XA=;
 b=VCH3ZEsqtRprGsxeVZxgwK9OBhgKlmAO864fR1xaDwbo3tV8jR0ASCPO
 6PhfPj6egCik+9Ow7edaaC//2vwvixdxAc14xosvx8wUx7uPv9U5HQIe7
 Jqck5qtmob0YM5+nYp366LKEvNd2vtU6+hoDYXWj7hS6mG6GxUL+ZYMsx
 rQ35xV4/lb+rRPEOIXlbc+1TLvoY+CbRl6dJESaVFEM6DbqFAFaGrYZX3
 EhlkJX9vgaxvswUaH0aSWmbgVW/MXoUnnI8SXycGRq8mvtryh7jVT0S5z
 7Piy3gljf5wTUBzEtykhyYLxYJ+lR/FXoaoJ58SflaW4Kljtzb/0+RUwo g==;
X-CSE-ConnectionGUID: V+cazuIlSVKWOdmDVPJjTw==
X-CSE-MsgGUID: naf7Sc8bT/+MAnPOq8YLSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16142331"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="16142331"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 04:53:18 -0700
X-CSE-ConnectionGUID: tfxhb9F5Sr6itYzQvRIz/A==
X-CSE-MsgGUID: CeXyV6f/SoKTmdGGDK/wUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="65807633"
Received: from smousa-mobl.amr.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.251.214.62])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 04:53:16 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_spin_batch: Check duration of preempter
 execution
Date: Fri, 21 Jun 2024 13:53:03 +0200
Message-ID: <20240621115303.1772645-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

The preempter is expected to execute without waiting, in a short
time. The synchronous call takes roughly 1 ms under normal
conditions. This duration will be higher if the preempter is
waiting. For example if the priorities are reversed in this test
then this duration will be close to duration_ns (currently set
to 100 ms) which was undetected by the test without this change.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_spin_batch.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 4e95060d3..e57318801 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -253,7 +253,7 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
 	uint64_t ext = 0;
 	size_t bo_size;
 	struct xe_spin *spin;
-	struct timespec tv;
+	struct timespec tv, tv_preempter;
 	double elapsed_ms;
 	igt_stats_t stats;
 	int i;
@@ -289,9 +289,11 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
 		igt_gettime(&tv);
 		xe_exec(fd, &exec);
 		xe_spin_wait_started(spin);
-		if (flags & SPIN_FIX_DURATION_PREEMPT)
+		if (flags & SPIN_FIX_DURATION_PREEMPT) {
+			igt_gettime(&tv_preempter);
 			preempter(fd, hwe);
-
+			igt_assert(igt_nsec_elapsed(&tv_preempter) * 1e-6 < 10);
+		}
 		igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
 		igt_stats_push_float(&stats, igt_nsec_elapsed(&tv) * 1e-6);
 		syncobj_reset(fd, &sync.handle, 1);
-- 
2.43.0

