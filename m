Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512A3C5B552
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 19:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4A110E02E;
	Tue,  3 Jun 2025 19:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlsC1xwE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7C410E02E
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 19:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748978685; x=1780514685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B/Zh7V+axbt34+vlx1jLYboidY42yJXDiT+GtZZ48Vk=;
 b=RlsC1xwEjvrkMMlKVDjYfeS1XrNEaZKREyLIcucEJa4/4Q3OyCHhGYta
 0ErisXQDXm4+fnr5fRsT5GK2Ugw0rTpm65HaoEfwc9fvfelnaK11ZUVNZ
 rkr8fmiTc4MwNIUxLm3J+1JnNr2x3PuUOmiYB9zfmhjuIlZ095lysMhNS
 pnPmJKy1pnt5tEUW2YvZs8PVRhoJ0ikyPXPkiW56bYWvGMfPNOIwL/k4K
 AHiIcmaw6hF2d6qV+rQARPA+U2lTiCcjOR04eoNy26YWUMuZ2BeM1/FgC
 p8Y+B9VUdUSJoEAmHKWZPf1z76cMtSeSaPrtijaVj1LC50G1Pm8IjaZ3G A==;
X-CSE-ConnectionGUID: QAtxIL2rSYOBCfqk9WBlSA==
X-CSE-MsgGUID: u3msl1hoSFawfbkPiLMnKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="76424313"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="76424313"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:24:45 -0700
X-CSE-ConnectionGUID: EC9bFam+QPCNIhwIs7k3oQ==
X-CSE-MsgGUID: Tz5l2610Tk+sBAd69qVV3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="175821622"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa001.fm.intel.com with ESMTP; 03 Jun 2025 12:24:42 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v14 07/11] tests/testdisplay: Include local glib header
 for Android
Date: Tue,  3 Jun 2025 19:23:50 +0000
Message-ID: <20250603192355.77019-8-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603192355.77019-1-jeevaka.badrappan@intel.com>
References: <20250603192355.77019-1-jeevaka.badrappan@intel.com>
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

