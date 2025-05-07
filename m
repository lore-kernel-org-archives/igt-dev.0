Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E90C3ABC5
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 16:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652F210E864;
	Wed,  7 May 2025 16:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7wkhfYn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83AD010E864
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 16:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746633891; x=1778169891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bsjLaP9H2/VJrLmfG01KFiBR8dm7M8FdwMgavaBuRrw=;
 b=d7wkhfYnKcaWI5VgADBDdUUbcLjEeeZIlUGqbD+Zux/dV1grRNFLFCIW
 XqLl9CSrbqWAW0bxn/nJ7Sj4iQI0LSHjSggHLziG38MZbdPfAA2jkZr1Y
 AbWO0eG8t+HFZce8DbDy0mD8ZaUWHFrIoU3KOlHHa2Ggm3cpdXsoqkdYi
 ZwYRgv5KNGkN+kKieIK2XlkRapYtAws/61nSDjtJoFuDNA7X1eFwVd3wx
 tT+0DTLNuPa9g3CXVsm6+mRZg186Ri7CLyB1C56LfDh+wJ7loez611fYD
 7nkk5i0hgXkNSy6D1OQg67JvLEJoS0ZRSfghjeB+1KtFoFSJT0SYsXOvu Q==;
X-CSE-ConnectionGUID: fDE1bodbRLm7bSjddfPmsg==
X-CSE-MsgGUID: l8MjkG8GQOKUgAj47/FaFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48519348"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="48519348"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:03:52 -0700
X-CSE-ConnectionGUID: 75AidHf/TSezu9uzWcaefQ==
X-CSE-MsgGUID: I9cKe7t3SkK2EatmYUz+7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="173200996"
Received: from unknown (HELO 0a83d5f6e242.iind.intel.com) ([10.66.234.123])
 by orviesa001.jf.intel.com with ESMTP; 07 May 2025 09:03:50 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH v4 08/15] lib/xe/xe_spin: Avoid pthread_cancel use by
 introducing an exit flag
Date: Wed,  7 May 2025 16:01:41 +0000
Message-ID: <20250507160148.53857-9-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
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
Replace pthread_cancel with thread exit based on an exit flag.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 lib/xe/xe_spin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index a92903b6b..2fb688179 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -264,7 +264,7 @@ void xe_spin_free(int fd, struct igt_spin *spin)
 	igt_assert(spin->driver == INTEL_DRIVER_XE);
 
 	if (spin->timerfd >= 0) {
-		pthread_cancel(spin->timer_thread);
+		spin->exit_thread = true;
 		igt_assert(pthread_join(spin->timer_thread, NULL) == 0);
 		close(spin->timerfd);
 	}
-- 
2.34.1

