Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93047C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 16:38:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4012F10E203;
	Tue,  3 Jun 2025 16:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dsXRVEXR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898D410E05D
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 16:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748968679; x=1780504679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lbOF34kGeB1J/05nbW+Tx67f/Kqt2NLQXqvkGEwQtHk=;
 b=dsXRVEXRwsNAyF2OC/TEVfCaH4EwqWx3dnS4mWjC/BOaao1oakNKZ8TC
 Xw2siJBz1qRlFXAhqCZz7bojo8fVwzkDNjnK2O/s3qqR61Xic/ZDBhpkp
 rts1l4tFNf4vwcutul9Fp9ONsovYoV+cLPldeXvbKey7Beqb3wuHNjl3O
 DMReijUsrIXzjldHEcsvk+CnZ1/hTx3qAGTJLNhF8Efv/45Kz5vAJ1v6K
 +Iyjtsv6g9iqDaiKkiuGda32YpdhMOwn8r0ndj9kNLB6EtvvgdOM/dhB5
 A031j0/eZJ6oHdXmNhT1Zu5Gc1ZVUOFJolSRpHYZ5ul7jcuJlh3Va4Bql Q==;
X-CSE-ConnectionGUID: ngxlLljHT7eJf7kVGXUBzQ==
X-CSE-MsgGUID: KgqLd6eUQuOfXV7kyGTN+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68573258"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="68573258"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 09:37:58 -0700
X-CSE-ConnectionGUID: CUZF1P8ORDajI4P3gWhQHw==
X-CSE-MsgGUID: 4B5nGrYaQ8qUo3h2TJ7qZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="182090308"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa001.jf.intel.com with ESMTP; 03 Jun 2025 09:37:56 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v13 05/11] lib/igt_aux: Include local igt procps header
 for Android
Date: Tue,  3 Jun 2025 16:37:08 +0000
Message-ID: <20250603163715.70774-6-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603163715.70774-1-jeevaka.badrappan@intel.com>
References: <20250603163715.70774-1-jeevaka.badrappan@intel.com>
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
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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

