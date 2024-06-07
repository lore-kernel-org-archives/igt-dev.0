Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC73C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 15:36:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5547B10ECD0;
	Fri,  7 Jun 2024 15:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khvBPS0F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4BE10ECBF
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 15:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717774610; x=1749310610;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gqm4ti8P1va5gKY7Dsetti7RQm67TLeBC+XWS/wdY6A=;
 b=khvBPS0FTQbkfhr3poBfGBa3I243AsnVskY2ARULbw8WR3pD97EeR8OC
 Y3lkQ3vUzzvbVDeRosVdbVZT/cxrz62zO4xyhRdn5nEhcecSXzJ+PQnH4
 YFRFcqZjNn+A6ByhMg8Pef3V+faS6GzgTdvWWws3lRVr0oINOum22TPfo
 LbJ3yJiIYlGMAGIweo5qSxqmg0KoktaNfcYI5KeKcNGwN21dW25is9Wwq
 GGB4t/Hey82WGdw+L9cKMKYdcP1TSxTC8OSO2q7BuliTPUjGKNpjoWyVP
 oJ5/FnFxTIzwl3XL4kbDQWVZy8tTLn/bOExe2NCtqc4r81Z6FdRuakp3G A==;
X-CSE-ConnectionGUID: g09IG1gtQ0uusbNcNhFZEA==
X-CSE-MsgGUID: S7cckszVQimusr/3kaeXug==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14620073"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14620073"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:36:50 -0700
X-CSE-ConnectionGUID: P3ha6fhdR9KQXFfcR+dTXQ==
X-CSE-MsgGUID: 6BPxsOCcTTyj287+TEgIyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38805266"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.84])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:36:49 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 4/7] lib/drmtest: Allow to get drm device name
Date: Fri,  7 Jun 2024 17:36:16 +0200
Message-ID: <20240607153629.52596-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240607153629.52596-1-kamil.konieczny@linux.intel.com>
References: <20240607153629.52596-1-kamil.konieczny@linux.intel.com>
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

Make this a public function so in tests developers could use it
instead of hard-coding driver names (such as "i915" or "xe").

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c | 14 +++++++++++++-
 lib/drmtest.h |  2 ++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 8ea96ba76..2dd4540b8 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -81,7 +81,19 @@
  * and [batchbuffer](igt-gpu-tools-intel-batchbuffer.html) libraries as dependencies.
  */
 
-static int __get_drm_device_name(int fd, char *name, int name_size)
+/**
+ * __get_drm_device_name:
+ * @fd: a drm file descriptor
+ * @name: pointer to memory
+ * @name_size: size of @name
+ *
+ * A wrapper for DRM_IOCTL_VERSION which will write drm device name in @name.
+ *
+ * Returns:
+ * 0  if name of DRM driver was filled in @name
+ * -1 on ioctl fail
+ */
+int __get_drm_device_name(int fd, char *name, int name_size)
 {
 	drm_version_t version;
 
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 4d9b60882..27e5a18e2 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -38,6 +38,8 @@
 
 #include "igt_core.h"
 
+int __get_drm_device_name(int fd, char *name, int name_size);
+
 /*
  * NOTE: Theser are _only_ for testcases exercising driver specific rendering
  * ioctls and uapi (and a bunch of historical reasons). And KMS testcase should
-- 
2.43.0

