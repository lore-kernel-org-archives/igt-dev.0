Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3609EC5AD49
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 19:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D653710E586;
	Mon,  2 Jun 2025 19:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+WNP7D2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D251F10E58B
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 19:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748892368; x=1780428368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+1ZzJegdVtqauh1qPMOS5fa7afDur1GcPiRAxziNV/o=;
 b=i+WNP7D2C8v2S083VhNfwucR2FRkO/jqLsnBfE9Rm7JVX77cFDULQJWa
 mKwdolHjYHRFjDJk1QG3Ad/2rPt7/TMWziZdBDSg4JPU2/Fm36KZvnhHS
 V6C0Bbbq2o/kDVvQk1w/ekkVZF89GqbfsI2GWZX4OWMzJpJLlgglSMPwX
 YXi6yM5vUeU7osOG4P5JH06EXYNhrJsWX16nhQW/73e4g394MpG9KQ4BH
 4/P4aeVwxaQK/n9UPuryo7c1eyo1i5RUnuuO2SZ+/QC1xRywyKqIGcC4v
 B7ay0F/PDexMigRj38NRy7cKuJHB/y8ON0i0yQVIN4t+ZFWrSfWA/4nQP w==;
X-CSE-ConnectionGUID: ZRTIhF7jTVi+2Uyebzh9sw==
X-CSE-MsgGUID: 4ubiJCxJQ9SSXqHB2HqWUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50777117"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="50777117"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 12:26:08 -0700
X-CSE-ConnectionGUID: r0cRMln7RH++ALvNbUT6/Q==
X-CSE-MsgGUID: aOywP5FPTrqO7s/gWjEGgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="144590238"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 02 Jun 2025 12:26:05 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v12 07/11] tests/testdisplay: Include local glib header
 for Android
Date: Mon,  2 Jun 2025 19:25:11 +0000
Message-ID: <20250602192515.95309-8-jeevaka.badrappan@intel.com>
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

As glib is not available in Android, added local stub header to build
igt for Android.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
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

