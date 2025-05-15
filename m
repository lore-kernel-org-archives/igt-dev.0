Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8ECC3ABDD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 19:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E41F10E94E;
	Thu, 15 May 2025 19:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mARVaweD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FF710E959
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 19:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747338768; x=1778874768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KP6YjEqu9aaaKR0EZcY68MayEtcSpTZpNflTkHfVAUk=;
 b=mARVaweDwRjwliu9hS8EI9MTHatB3sYQpy4/S9v0M+eEROuO5ToJga9A
 JByU4amqYP3aATB2pjYlE1DX/t7NDfz6XYubjhzVvW0sSirAAtOUp03fE
 u0ugL9nsqyzKdJLKHj/ZWyCigqR/XEVeQTaj0YRsWF+5affm1qKxauhIC
 dZTSRWAwCrOMtDoRXdvlX6Y2486nuNtGnsxwd+ZX/fv4BtjkZOa5NjHz/
 uvkH6RQqKi/jUCeenbfyWOXCFKeskGkAgCpeVf09+vn2S8lXrwRH/zB+I
 gWvmLzOuKQzkTX10ebIVWGfY1yLNaPPoTf95Mx1ROxA/rkgJuqMzJABac g==;
X-CSE-ConnectionGUID: mW1dupeSQZGXazxMmVTHEA==
X-CSE-MsgGUID: MCuwQ1jRTbmi9cmf07eaDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49454467"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="49454467"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 12:52:48 -0700
X-CSE-ConnectionGUID: GSbFzaOTTXqiPEDFthUEEw==
X-CSE-MsgGUID: N4Cr3/SJR3iHmisVtL7Pdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="138347369"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 15 May 2025 12:52:46 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH 07/14] lib/igt_dummyload: Avoid pthread_cancel use by
 overriding timer value
Date: Thu, 15 May 2025 19:52:00 +0000
Message-ID: <20250515195207.106414-8-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515195207.106414-1-jeevaka.badrappan@intel.com>
References: <20250515195207.106414-1-jeevaka.badrappan@intel.com>
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
2.34.1

