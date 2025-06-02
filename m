Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC58FC61CE5
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 19:26:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBC010E585;
	Mon,  2 Jun 2025 19:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kDVMi7KQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A1610E589
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 19:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748892363; x=1780428363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B9VZbrpXT1AyaKMioMoU17hYSEtbJWPabEhQGXEiUgE=;
 b=kDVMi7KQGFH4pX34b6kMG9CRH08ikfO8nJ+7hlcBUc0CJlzlRgMLEpbl
 /8YirJtAbU5zlTxzuazC2Ap/LpzKxjJKkVY8c/AuLYvTAdFW79SgPLAph
 nvIHSkj6Yyj3Aa86a9Z2fF3YCVeUvSClaCX+xZRQ2pbNtBstbffUwf1LI
 CRkVxDLswn08kpmTjxvQpZJbkGT2tEMUGHEdQRqiVpBWerTCo0iqKIM31
 J9Gfo0yfSBWH4QuBKisH1mtJxgeeTyxKbDPvzvCiDt5OK4HKbHDkPbg+t
 cjZ0ixQhVijSgXn+/eXhFqWM4o859o1DAkbEZBY+6GQeW0K5bS7mnZjuj g==;
X-CSE-ConnectionGUID: kq6wJ7oRSSi9BE1lCI4jPg==
X-CSE-MsgGUID: l5v8gUwiTw2mzHxGQ7S25w==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50777108"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="50777108"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 12:26:02 -0700
X-CSE-ConnectionGUID: LyKinZNOTeGfq2A+GOKWaA==
X-CSE-MsgGUID: rhIV5mfSQp2BQmgV8w11DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="144590228"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 02 Jun 2025 12:26:00 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v12 05/11] lib/igt_aux: Include local igt procps header
 for Android
Date: Mon,  2 Jun 2025 19:25:09 +0000
Message-ID: <20250602192515.95309-6-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
References: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
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

As procps is not available in Android, added local stub procps header
to build igt for Android. Inclusion of libproc2/pids.h is now
conditional, based on the HAVE_LIBPROC2 definition, ensuring that it
is only included when the library is available.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 lib/igt_aux.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 2905824a5..83809e770 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -55,8 +55,12 @@
 
 #ifdef HAVE_LIBPROCPS
 #  include <proc/readproc.h>
-#else
+#elif HAVE_LIBPROC2
 #  include <libproc2/pids.h>
+#else
+#  ifdef ANDROID
+#    include "android/procps.h"
+#  endif
 #endif
 
 #include <dirent.h>
-- 
2.49.0

