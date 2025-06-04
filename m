Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC54C61CE7
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 17:19:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C4C10E771;
	Wed,  4 Jun 2025 17:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DKyHaKEM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA6C10E75F
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 17:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749057572; x=1780593572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B/Zh7V+axbt34+vlx1jLYboidY42yJXDiT+GtZZ48Vk=;
 b=DKyHaKEMTgSWS+ViYVs8cE2y2bwJdbCu/EqeQEuv2FK/BTpKHDVAAP+Z
 +8RuVgl1lUt0TteJQzwtlmSjPgkjyGI8M6GY/TCNZ6mO7BwlvEQ1tYBUA
 G97nEkYeKIseD7i5nNfV5Bbaaq8xV+7tiraCT6o5yw2aPPCt+i4At9iqh
 4m+UtPhXSDa55C6PTE7azkLn8aEBPfQD19Jx51xQqTaO8rlYbJEiHjcBJ
 a3JBL++/Ud2ZjFCFHOD0Xp5dLY37fV/i2d7J1KgcKEFUrXUS9Ny0zBZJH
 3IXN+3vcn5dgWoTnoKUdMp2B6EAYtucfnK1fDBzkRSy3rIq/BQ2VfcJMs w==;
X-CSE-ConnectionGUID: 9xfJMDPWTJ2t7LN04ZRLmg==
X-CSE-MsgGUID: zR6DB+m2TBu1PDObzXCKXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68595964"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="68595964"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 10:17:39 -0700
X-CSE-ConnectionGUID: H5MjDRjgT+OUdRsVMiPajg==
X-CSE-MsgGUID: mvvunW8sRrO1z49OlGQGUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145203294"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 04 Jun 2025 10:17:37 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH v15 5/9] tests/testdisplay: Include local glib header for
 Android
Date: Wed,  4 Jun 2025 17:16:52 +0000
Message-ID: <20250604171656.31559-6-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
References: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
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

