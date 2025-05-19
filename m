Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D59C3DA6D
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 15:12:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0236610E392;
	Mon, 19 May 2025 15:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWnkF/pK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5E710E392
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 15:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747667536; x=1779203536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FSilhWtHlCtnxM8IrYTQg/oZRvmdQ+NJJBJRcnTCTxo=;
 b=XWnkF/pKUB6LRVEqIow5fYp61+tyYdJm29lH9CFmv2Zn8Yu8qLSqhRae
 U4tExo95lpYgMUMm8WBiy54+Q9GWCgtNZuVTYCm+Mw1TWQSdRK5cqzkK2
 A9pKAo1j3rrn3TCcU1C28x4bqfRvOWk2uTZS9KOoo2YYJAfw8+LBdjMbu
 AmTdbYMQ5dMcOtaMYXi0Do17pfRAT3YnwXqtinViBuKK4r+TqJkpzbxqN
 gg27FlBEfivGJqw1A3UZnOEH49QxDRbeqL4mvBK864pIr/6BAOcQW2KRl
 vtlI+PXzY8uJOCuqZHnO7dsVy2sa/FUZ6WcaewqLsJmbBFlq0FrVDINWR w==;
X-CSE-ConnectionGUID: 6HbwOVfUTOCLalPckybQkg==
X-CSE-MsgGUID: LqUyc2PpRLaiDGyqx41OcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49710556"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="49710556"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 08:12:16 -0700
X-CSE-ConnectionGUID: qmAWftoiTF2Ukzi5rxO16g==
X-CSE-MsgGUID: TsD/wKqOQ5SDMm1Iplu6vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="139287968"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 19 May 2025 08:12:13 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v9 07/14] lib/igt_dummyload: Avoid pthread_cancel use by
 overriding timer value
Date: Mon, 19 May 2025 15:11:28 +0000
Message-ID: <20250519151135.43874-8-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519151135.43874-1-jeevaka.badrappan@intel.com>
References: <20250519151135.43874-1-jeevaka.badrappan@intel.com>
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

Android build fails due to pthread_cancel unavailability.
Replace pthread_cancel by overriding the expiration time of the timer.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
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

