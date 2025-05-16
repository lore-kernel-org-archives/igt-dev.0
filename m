Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E781CC54754
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 18:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD7310EB69;
	Fri, 16 May 2025 18:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hMVmryTw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F80010EB6D
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 18:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747420066; x=1778956066;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3Zs8zHX6MMrqUimCQ1233qHaaI4Pc7fDUHFEg2PM12w=;
 b=hMVmryTwOkBuwTnpZ20mce21EyPY/g1Go5i4BZLCQk4aFMhTbBmpC936
 cMNmx14/VWZSqpJ3s2+0gY60gpFAAX6B2aKZM7OAGWiZGJCH4gQAekgNu
 O5Y6lv0db/Xr9Bi13GUlTUUEgkckqxVY9BKj1gifS0APjkGxc4VpViyOz
 trnaAKAtCtOKO1Ma42YmMq2zHMzWcRKPV0uAzaBo32i+lmKop9u6NhqLf
 Wj++N+DdtcWd2k2/VK5jOrqmXuQ2tAFYygmr3iFmdoOw9CY2+yMDrI8Me
 Hig/htYI7qSnvHQQx9wt0+JBTHqbcn+L1nRizCwdazpK1xxvFmltFbI+M A==;
X-CSE-ConnectionGUID: NT7g4S8VSgaaIuV7Hqr5qA==
X-CSE-MsgGUID: faCEkfVKRAuBCq6J7oLlJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60059892"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="60059892"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 11:27:46 -0700
X-CSE-ConnectionGUID: zdTXzuy/Qdqyy6fFNmgKeA==
X-CSE-MsgGUID: wJnW06pmS1CbUQJjvcnKVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="143736926"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa004.jf.intel.com with ESMTP; 16 May 2025 11:27:44 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com, adrinael@adrinael.net,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v8 07/14] lib/igt_dummyload: Avoid pthread_cancel use by
 overriding timer value
Date: Fri, 16 May 2025 18:26:57 +0000
Message-ID: <20250516182704.97912-8-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516182704.97912-1-jeevaka.badrappan@intel.com>
References: <20250516182704.97912-1-jeevaka.badrappan@intel.com>
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

