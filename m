Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BBBD116E2
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 14:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC28510E905;
	Fri, 28 Nov 2025 14:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qh6bOuYj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3410D10E8EB
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 14:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764339273; x=1795875273;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=girIuBsP/UMO6aBJUqoMxY/xcOtcqHqqoDjxi5EsiHo=;
 b=Qh6bOuYjm3StBSyuPEZ5nFa5BQBr2fy4LotdNLfWJtiuTY9cARaVmS6H
 Yr3lu3LX8cQHQPj7rA/DElJiTGmCfVgRr1n6+vPhHgvKmh3YmuC5CfOVU
 1Axure6MhChr5Ua0ldIKhXUskdvzBo5MT8SLk0QUxh/lhXx19nkLo8XWi
 BChHsg6iqUlM/NNAZTRtOS/z5XmrTaUkmqI/GRjzofeyrGkN0qJNBSZFb
 qF51xUegp30W/7KM46DMs6OK76S72tZ6TnFN83RnEuzHednP9dcFoznTy
 jqnrELtT0rl8Rdd+FOk87PullOofKRQ91sL7iB6EVu4MOvXzgKM2j5Lic A==;
X-CSE-ConnectionGUID: Ii3MjKLFSDGLR/BopnZOsg==
X-CSE-MsgGUID: AB5bjP75SnC8m2MEuD8d2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66261617"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="66261617"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:33 -0800
X-CSE-ConnectionGUID: aq7y0ai2QbOJ1jv5fx4ZSg==
X-CSE-MsgGUID: F2glFKisSMaF4tzBHEOquQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="224173684"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:32 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 28 Nov 2025 15:12:12 +0100
Subject: [PATCH 08/11] tests/intel/xe_eudebug_online: rename threads_count
 to thread_hit_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-pagefault-one-of-many-v1-8-a8377a93da8f@intel.com>
References: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
In-Reply-To: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Jan Maslak <jan.maslak@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2405;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=girIuBsP/UMO6aBJUqoMxY/xcOtcqHqqoDjxi5EsiHo=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpKa31/Jjzt0Ed80FNGqKu762hYoMThxWV+onNQ
 Su6cPtBUheJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSmt9QAKCRAjYrKT3hD9
 14TQC/sH/YMxvfsRyFJk0wzUCH/WpfMH2X24Nhn7PpMGUzy0YQorAOayVi4rDPLi1flpoAi64Pc
 Thx6sc/CgIcSloy3VDbc9bP+H6a66/q3yKLDZQEF0Sqiv5LVeEi2v77QDAAdtokVcikiJYgSD7m
 oBq+zxK6ehhd9dYhuh/L5ysxn9Jk/mE4nDvfAocVytArfcPLkwAAS4jReD8/LiNfZVVwawAfS+T
 4D08DUJzqawUgappbMzmdz5Klj2qvUvPSNv0g0iMER7AkOajWZal+ro8+DiFFDxIiuyG9R55t0T
 TpRZvAClDRbLbJi+kj7tPejmu4E4z8qXFNZwOVXWhqJO7WkabCyaUnsM3sTPQ+dQdG4EBWgTd5z
 9rneWIESDbDGOA2MuyiAG7nY5YvFIvg2W3he0IOkiTos0/nqEAoHZeV7HA6BXl2m86Kc4hqPvNS
 JD1Yeh8xlZCsy+3OMsowip19BmtYmnwYDUKAUwSQY3zRSnxGlEN4HGrCSwAXSvXuErBXg=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

threads_count is used to count threads which hit something, either
pagefault, either breakpoint. Let's rename it to thread_hit_count
and keep the former name for future.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel/xe_eudebug_online.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index e3aa13a39082..b4c8674cb0e6 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -381,7 +381,7 @@ struct online_debug_data {
 	struct drm_xe_engine_class_instance hwe;
 	uint64_t flags;
 	/* client out */
-	int threads_count;
+	int thread_hit_count;
 	/* debugger internals */
 	uint64_t client_handle;
 	uint64_t exec_queue_handle;
@@ -1147,8 +1147,8 @@ static void run_online_client(struct xe_eudebug_client *c)
 
 	if (!(c->flags & DO_NOT_EXPECT_CANARIES)) {
 		ptr = xe_bo_mmap_ext(fd, buf->handle, buf->size, PROT_READ);
-		data->threads_count = count_canaries_neq(ptr, w_dim, 0);
-		igt_assert_f(data->threads_count, "No canaries found, nothing executed?\n");
+		data->thread_hit_count = count_canaries_neq(ptr, w_dim, 0);
+		igt_assert_f(data->thread_hit_count, "No canaries found, nothing executed?\n");
 
 		if ((c->flags & SHADER_BREAKPOINT || c->flags & TRIGGER_RESUME_SET_BP ||
 		     c->flags & SHADER_N_NOOP_BREAKPOINT) && !(c->flags & DISABLE_DEBUG_MODE)) {
@@ -1156,8 +1156,9 @@ static void run_online_client(struct xe_eudebug_client *c)
 
 			igt_assert_f(aip != SHADER_CANARY,
 				     "Workload executed but breakpoint not hit!\n");
-			igt_assert_eq(count_canaries_eq(ptr, w_dim, aip), data->threads_count);
-			igt_debug("Breakpoint hit in %d threads, AIP=0x%08x\n", data->threads_count,
+			igt_assert_eq(count_canaries_eq(ptr, w_dim, aip), data->thread_hit_count);
+			igt_debug("Breakpoint hit in %d threads, AIP=0x%08x\n",
+				  data->thread_hit_count,
 				  aip);
 		}
 
@@ -1338,7 +1339,7 @@ static void online_session_check(struct xe_eudebug_session *s, int flags)
 	 * if we have a breakpoint set and we resume all threads always.
 	 */
 	if (flags == SHADER_BREAKPOINT || flags == TRIGGER_UFENCE_SET_BREAKPOINT)
-		igt_assert_eq(sum, data->threads_count);
+		igt_assert_eq(sum, data->thread_hit_count);
 
 	if (expect_exception)
 		igt_assert(sum > 0);

-- 
2.43.0

