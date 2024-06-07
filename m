Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E0BC27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 15:36:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342D510ECB9;
	Fri,  7 Jun 2024 15:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mwFCa3FN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813EC10ECB9
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 15:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717774599; x=1749310599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=quAtcWqpOkyuEOecOpqEWO+g7uSwEmOlsRUuSxXzm5E=;
 b=mwFCa3FNeyYpAQEa1wNNzMt7gwIyDLAPy6Thkr0ay6bw9WHG1FaDwiY+
 /Q5oNERjvvda7eK+1anjxijYM7ygYhdfyaUetKmHKthaBiyiwtuQdtHya
 U1jKAYRwELst/gmj1QMO3ixJk7PijH9Iy8yM286PkoTnOPdlRSQgKpnFx
 t/NbHx2mELl6uE4L9slYJlY5jXFFGwsV521rl7YjpkqC0BKCA+cqzhn/W
 mH7lywLi4JqbIunAGpr8d2ml1um9CpE9Xc0DgKRoL21o9jYbGqxnHRnpx
 8sXJ+ilI04pK3V6gNhGSyXONNnycpU4Tf9z8/5N4du9XhOeYLqiJeDach g==;
X-CSE-ConnectionGUID: +8sMQ4TpTGyw7l/10CGRXQ==
X-CSE-MsgGUID: pcgixGFXQi2GfgU8N9a4kg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14620063"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14620063"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:36:39 -0700
X-CSE-ConnectionGUID: l6aeKS4aTTafZPFmfyYySQ==
X-CSE-MsgGUID: uqnkeC2ZR4CAm07YU19c5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38805261"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.84])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:36:39 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 1/7] lib/drmtest: add function for retriving chipset
Date: Fri,  7 Jun 2024 17:36:13 +0200
Message-ID: <20240607153629.52596-2-kamil.konieczny@linux.intel.com>
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

A few tests uses chipset value for control and checks, so
instead of testing it with, for example, is_intel_driver(),
allow to retrieve it once and give it back to test.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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

