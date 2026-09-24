Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA561C98317
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 12:06:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6756610F4DD;
	Thu, 24 Sep 2026 12:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IgSiE1RF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D546B10F4D8
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2026 12:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790251483; x=1821787483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V7CQysRttUFuOoTukxNtzKrEIqwD/hJb6GqMh/508jU=;
 b=IgSiE1RFLvSDr6aPsbjcMKVmXY8rAB+eS/Wi3nyRkDW4qTlItGd5Erww
 zhapEhPiicdn2Dpy6fBUQh7LT0Ymy94mZRbUXTbK+nv+kVJS0cDQ5AQU9
 4E2FddKWTwBNx2juZ8+0hjbIeuzt4ouTkEIbhn73M8TcyeVa+FyJuse9U
 qYMN7cSPFnFKgQxU4EG4fAS2vp+KDg8JX/BEgq7XxXulXGYUhPHx371GK
 JhTDnSmXZaZQKQNXufMbqyFAKSD94/cgd/El1/KgXXpQGJxRswbKknEBK
 /n4JHe/aRaZjeroQThC+h0LoqtbcdWZnnCecNpnD1ibkf63njBWnRfQ/Y w==;
X-CSE-ConnectionGUID: uIj7Eh86Ro++u9MYPa1XsQ==
X-CSE-MsgGUID: iVizP9/nRVSK4l+yMM8C/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="78572194"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="78572194"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 05:04:43 -0700
X-CSE-ConnectionGUID: uvplZP2ERMW+mGceqDvVAQ==
X-CSE-MsgGUID: viq+aM47SHmPB1wT6eUbPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="274122979"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa009.jf.intel.com with ESMTP; 24 Sep 2026 05:04:42 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_cw_post_sync: Destroy exec queue and
 vm on cleanup
Date: Thu, 24 Sep 2026 17:34:37 +0530
Message-ID: <20260924120438.1485077-2-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260924120438.1485077-1-dnyaneshwar.bhadane@intel.com>
References: <20260924120438.1485077-1-dnyaneshwar.bhadane@intel.com>
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

In the test_walker_notification() vm and exec queue are never destroyed
and leak on test runs.  Destroy them at the end of the test.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 tests/intel/xe_cw_post_sync.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_cw_post_sync.c b/tests/intel/xe_cw_post_sync.c
index 1aa2f1313..2e7224782 100644
--- a/tests/intel/xe_cw_post_sync.c
+++ b/tests/intel/xe_cw_post_sync.c
@@ -272,6 +272,8 @@ static void test_walker_notification(int fd, struct drm_xe_engine_class_instance
 	pthread_barrier_destroy(&t_data.barrier);
 	munmap(t_data.post_sync_ptr, t_data.post_sync->size);
 	intel_buf_destroy(t_data.post_sync);
+	xe_exec_queue_destroy(fd, t_data.exec_queue_id);
+	xe_vm_destroy(fd, t_data.vm);
 }
 
 int igt_main()
-- 
2.54.0

