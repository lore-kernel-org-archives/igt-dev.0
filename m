Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40B9C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 16:38:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963E110E05D;
	Tue,  3 Jun 2025 16:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jDS8W2yt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5AF10E05D
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 16:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748968685; x=1780504685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OU+QV3msmDB3qhmggXY2EmiEVkbd4/qw6pHr2ujoSyU=;
 b=jDS8W2ytv8507DNsbGufk/zRBfE1jR/7KmOau3k8p61J6VcCJUPyRFQn
 yfdkFSVZKq/l5f2L+woScIB1qYUXKPN5n1+t5Cy1LtCUZKrjqLHqQwKRI
 x2MWgsoLRh2j+Zf0bgYX3rnBG04g4PJgavMfc7XLmKtix22cok4eLcVxZ
 p6njTwgngtupVHAQVvG8U6ki9JSI4uGhmstEoInDREsF3qVaO8j0CEojG
 aqyZU2GDXC/8p+Rjo7+kXdutb7M8e19QUOhjteDBk0RFN81iTZX4NHxIT
 33ygETrj+cRVylFt95sYtP9gv7xwCbVz7nlBU1QsFATrtJf+SAxwlZH4D A==;
X-CSE-ConnectionGUID: ZwvJUt6oSfKhROjF3g54NQ==
X-CSE-MsgGUID: 8pVxAQkdQ1+F+3kXM2IEuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68573292"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="68573292"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 09:38:05 -0700
X-CSE-ConnectionGUID: 4vOpxnaGSUm0esie6oiSiw==
X-CSE-MsgGUID: 2rexr7oEQ0KCJuHdWFNjJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="182090327"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa001.jf.intel.com with ESMTP; 03 Jun 2025 09:38:01 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v13 07/11] tests/testdisplay: Include local glib header
 for Android
Date: Tue,  3 Jun 2025 16:37:10 +0000
Message-ID: <20250603163715.70774-8-jeevaka.badrappan@intel.com>
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

As glib is not available in Android, added local stub header to build
igt for Android.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/testdisplay.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/testdisplay.h b/tests/testdisplay.h
index 27f8209e2..0f606c028 100644
--- a/tests/testdisplay.h
+++ b/tests/testdisplay.h
@@ -24,7 +24,11 @@
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
+#ifdef ANDROID
+#include "android/glib.h"
+#else
 #include <glib.h>
+#endif
 
 extern int drm_fd;
 
-- 
2.49.0

