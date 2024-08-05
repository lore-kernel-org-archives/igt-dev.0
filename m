Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEE6C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 14:37:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E1810E217;
	Mon,  5 Aug 2024 14:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUSrqBtN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3D510E217
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 14:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722868654; x=1754404654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b9mHrAwW0tL51BdTxsr9vKcw4S59DweIpjOIiYT4lSo=;
 b=BUSrqBtNloeb+LDyj8mz0yEpBJiXEg7v+zlFlUlVteXZuVqSk/+yabFh
 0Lx22SFabkJN/IdfhRDMieR888PW0MVozoN3o6uSM0fWSNELL4zXhsGmo
 IbU7WmfvW73kBzyNhwbP/ulG8kpg1EO6P8tDtQrw9TGICLV3q+ZmNy5gD
 21Yzihr/gHCsaB5QTi6NLQaOM41UHHaLOvAyyFCCinLutHQmdDmSvK3E7
 +vtdjqsW1z9GjMXHt8BpFFRfgU4cmbYUvQkfNW/+YBL4c8EytUruxikvl
 pIq8TxdFHJu8b1LsgdJc8w/X11UanhraInby89g7JZJVXU2f1mlf0lgTx A==;
X-CSE-ConnectionGUID: tFHgRRahTyiEm441xbzLpg==
X-CSE-MsgGUID: t20eqn3AS1OdXVpY9uxUBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="24702279"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="24702279"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 07:37:34 -0700
X-CSE-ConnectionGUID: DUXV20btS36tS64NoqEXEA==
X-CSE-MsgGUID: 9XRZiINnQ8+U4lwXYyAWuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="56754981"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.245.246])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 07:37:33 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v2 3/8] lib/drmtest: Allow to get drm device name
Date: Mon,  5 Aug 2024 16:37:06 +0200
Message-ID: <20240805143713.76034-4-kamil.konieczny@linux.intel.com>
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

Make this a public function so in tests developers could use it
instead of hard-coding driver names (such as "i915" or "xe").

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
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

