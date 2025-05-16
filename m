Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CACC3ABC9
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 16:06:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF34910EB1A;
	Fri, 16 May 2025 16:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bIrJWNTx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F5010EB1A
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 16:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747411595; x=1778947595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3Zs8zHX6MMrqUimCQ1233qHaaI4Pc7fDUHFEg2PM12w=;
 b=bIrJWNTxkBRe/+iwXEyL5BB9qszH5rewIed/P2LgylLYipeS1cvxAHdU
 EDFX0WcTXExeDL+rv6IYhs0WnouDB7Xe+vAvYs1h4iiRVjGaNTgtKVCKQ
 J6K+LLYOIob3FOmdulU0Gq757dKyimP4TdCaRqt4BK+lv7Wm+534SQ7NT
 DFF/baD4RdKFLqNKR01IKGK0rktplDWbmXa7ADdjGuMJsS9Hoegbpyydf
 iMONH1HYt+g4NGg9eO6U6jWKBzkucyqQWb1908UIsA/otjYr6CuQjqf4y
 KV6NQZLzBNEJ+pO/gV2so/Ved5hVHCSHPpTm8ItPTtrhe/y4/Yq4EQISo w==;
X-CSE-ConnectionGUID: W7x3rO/NTd+TlrV/w62fAw==
X-CSE-MsgGUID: YqniKZocQja+UOyU07aCrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="66941123"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="66941123"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 09:06:34 -0700
X-CSE-ConnectionGUID: eATQliIwSoSSqNlZ5OzRDQ==
X-CSE-MsgGUID: lSIU3399Sye87EmTYV1iQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="169772568"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 09:06:32 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v6 07/14] lib/igt_dummyload: Avoid pthread_cancel use by
 overriding timer value
Date: Fri, 16 May 2025 16:05:44 +0000
Message-ID: <20250516160551.58760-8-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
References: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
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

Android build fails due to pthread_cancel unavailability.
Replace pthread_cancel by overriding the expiration time of the timer.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 lib/igt_dummyload.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index 3cf80b762..cc0b4ac3b 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -631,7 +631,16 @@ void igt_spin_end(igt_spin_t *spin)
 static void __igt_spin_free(int fd, igt_spin_t *spin)
 {
 	if (spin->timerfd >= 0) {
+#ifdef ANDROID
+		struct itimerspec its;
+
+		memset(&its, 0, sizeof(its));
+		its.it_value.tv_sec = 0;
+		its.it_value.tv_nsec = 1;
+		timerfd_settime(spin->timerfd, 0, &its, NULL);
+#else
 		pthread_cancel(spin->timer_thread);
+#endif
 		igt_assert(pthread_join(spin->timer_thread, NULL) == 0);
 		close(spin->timerfd);
 	}
-- 
2.49.0

