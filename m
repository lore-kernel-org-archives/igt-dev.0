Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17456C3DA7F
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 14:37:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FFF10E219;
	Mon,  5 Aug 2024 14:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TtJn8idA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E3510E219
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 14:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722868647; x=1754404647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n2zwx/pCl6xdKVfHxC+l7xVbxCCHaoxJkYAFeJURgCM=;
 b=TtJn8idA7XAi4JsxihjxyPjWQzBzkIEN69yEHXyp4RRb+ukpFn8oUOyn
 MEnbaai5FHKBCg9wjU/t/tVrilA3qijPNzbNQXZVBydSbZJWm4LT/0/23
 wQiAHYrtAKIa0CFbTUyoPbUUlJUiqY5Ta6fBF80+DGyn5bU7TGgCNm6YB
 c/WKAIipa7SHMtu/XPCwels7B4qEa1u7duy0zLX9my0sHhvt7AW1WaVws
 wk/SIMRsHT7N8i3sg3NbNnQE4Xhk+HtSUh+xa/hlfzWGmoDlT5vQ4Ns57
 kzFNnD63OlfI+T/UhUheamOVmMPa/4e7L4ihVzXD8otizlhzN0aT65hES A==;
X-CSE-ConnectionGUID: 2Asu7yOeQSKB5DjU47dlOg==
X-CSE-MsgGUID: 5p29+5tpQHy8kByIPtClNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="24702269"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="24702269"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 07:37:26 -0700
X-CSE-ConnectionGUID: pd0Xi6WBQIOX61235d6FDg==
X-CSE-MsgGUID: AEXA2+IgQf6OIfyYkUq16g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="56754901"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.245.246])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 07:37:25 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v2 1/8] lib/drmtest: add function for retriving chipset
Date: Mon,  5 Aug 2024 16:37:04 +0200
Message-ID: <20240805143713.76034-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805143713.76034-1-kamil.konieczny@linux.intel.com>
References: <20240805143713.76034-1-kamil.konieczny@linux.intel.com>
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

A few tests uses chipset value for control and checks, so
instead of testing it with, for example, is_intel_driver(),
allow to retrieve it once and give it back to test.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/drmtest.c | 21 +++++++++++++++++++++
 lib/drmtest.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index f8810da43..8ea96ba76 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -241,6 +241,27 @@ static void modulename_to_chipset(const char *name, unsigned int *chip)
 	}
 }
 
+/**
+ * drm_get_chipset:
+ * @fd: a drm file descriptor
+ *
+ * Returns:
+ * chipset if driver name found in modules[] array, for example: DRIVER_INTEL
+ * DRIVER_ANY if drm device name not known
+ */
+unsigned int drm_get_chipset(int fd)
+{
+	unsigned int chip = DRIVER_ANY;
+	char name[32] = "";
+
+	if (__get_drm_device_name(fd, name, sizeof(name) - 1))
+		return chip;
+
+	modulename_to_chipset(name, &chip);
+
+	return chip;
+}
+
 static const char *chipset_to_str(int chipset)
 {
 	switch (chipset) {
diff --git a/lib/drmtest.h b/lib/drmtest.h
index bbe5f252f..4d9b60882 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -72,6 +72,8 @@ enum intel_driver {
 
 void __set_forced_driver(const char *name);
 
+unsigned int drm_get_chipset(int fd);
+
 /**
  * ARRAY_SIZE:
  * @arr: static array
-- 
2.43.0

