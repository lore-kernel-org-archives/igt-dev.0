Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF63FF8867
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 21:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019D510E07E;
	Mon, 27 Apr 2026 21:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DhRMox2T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44A010E07E
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 21:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777324835; x=1808860835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JHunuRZsx8ePjHzfLa8+zcZndDm4VY3CtczvsNwP8HI=;
 b=DhRMox2TN7SvCVbgTrCBKoonSosPK62tI9N6VscBuMIUTCUI9BYSO4g8
 E1AynOVIJ8IaDlbu5aZa/siD6OvGj/ZQqc16IAuzKF0hltj0y1iT0IFeY
 3o0Ry0eiIhzqsT6ZwdjkQm0h2KAMLY7n8nIxBhV95kHOQeuwn+wOq6dqO
 0lA+7LgeJI37o8rxGi2vHI6uVe9bKax4vFg570JR2u4/iTE6ZesYqKuDh
 UwD8vV5Fj5SYqUe2z/WOAMJr171r/fe/wocjc+jIqeiXP28QykGs8b8ij
 sSP2wYg/4o6LNKD9IOo7uwE+OuZX7QhyK0J/slUCY9TNT39ywEs5G+t1W A==;
X-CSE-ConnectionGUID: rmj82a/sTXSX7rXz6YiE3g==
X-CSE-MsgGUID: 5pjyHHJeQ1S///yoihmxTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78104254"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78104254"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 14:20:35 -0700
X-CSE-ConnectionGUID: VB8ypuZrSK+XkSxQgBCxVg==
X-CSE-MsgGUID: 489tJ5XvRHSTcQzzj+DdMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="234034916"
Received: from dut4344arlh.fm.intel.com ([10.105.10.102])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 14:20:36 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, niranjana.vishwanathapura@intel.com,
 Stuart Summers <stuart.summers@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t 1/4] tests/intel/xe_exec_reset: Remove CANCEL logic for
 CM variants
Date: Mon, 27 Apr 2026 21:20:30 +0000
Message-ID: <20260427212034.18486-2-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427212034.18486-1-stuart.summers@intel.com>
References: <20260427212034.18486-1-stuart.summers@intel.com>
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

The compute mode tests are expected to be long running and will
not trigger the TDR logic in the KMD. This is illustrated in
the test in that the legacy cases implement the CANCEL case,
which is meant to trigger the TDR based resets vs the CM
cases which do not support this.

Remove the CANCEL logic from the CM tests since it isn't actually
used in any of the test cases here.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_exec_reset.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 66580ea44..bc1a74fa3 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -422,7 +422,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		uint64_t exec_addr;
 		int e = i % n_exec_queues;
 
-		if (!i || flags & CANCEL) {
+		if (!i) {
 			spin_opts.addr = base_addr + spin_offset;
 			xe_spin_init(&data[i].spin, &spin_opts);
 			exec_addr = spin_opts.addr;
@@ -479,7 +479,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, 3 * NSEC_PER_SEC);
 
-	if (!(flags & (GT_RESET | CANCEL))) {
+	if (!(flags & GT_RESET)) {
 		for (i = 1; i < n_execs; i++)
 			igt_assert_eq(data[i].data, 0xc0ffee);
 	}
-- 
2.43.0

