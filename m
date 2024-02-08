Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3D1C4828F
	for <igt-dev@archiver.kernel.org>; Thu,  8 Feb 2024 13:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D99510E77A;
	Thu,  8 Feb 2024 13:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ewwZ1Q79";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A878D10E77A
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Feb 2024 13:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707400369; x=1738936369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JbLO08Bm3BySp7ZkxSQ5Jqhle2J86BlZ+q/jV3YNtEY=;
 b=ewwZ1Q79nbvqrKtWciR/zu80U29BgSlICVLNzd9sHQmLUCOQdk24lLBR
 50Y26Euz/nfk//mXUW+dCAgSdL9jo+NGNYoIL6BzKxeu1W21E4yVkCSMd
 MAPA1wFiIsxiMu++i+I6OGAutyRJqdFy/QMQ0ptujeGhFGL/OrofiLg6m
 EftmtuqzOlS+jVcAxpPTffOydul80Wzes0U1cKEag3eSPl0fn2eEyfMaJ
 vE4sL0YDXVE4OVG1yhVRsT93Zi6kaS01MpQrwqwGKHJyBPRU32HyFqjhL
 tVMg/XRki5OR0efrI9Kj1Vw0nGtlSPeYoZ6z2Zg5kxVlUmhgxfgYQXitW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1517227"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1517227"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 05:52:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="39089919"
Received: from unknown (HELO localhost) ([10.245.101.174])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 05:52:47 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v8 2/8] lib/drmtest: Introduced drm_open_driver_another
Date: Thu,  8 Feb 2024 14:52:26 +0100
Message-ID: <20240208135232.54382-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240208135232.54382-1-kamil.konieczny@linux.intel.com>
References: <20240208135232.54382-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

For user convenience, introduce drm_open_driver_another as
a wrapper for __drm_open_driver_another with successful open
assert.

v2: rebased (Kamil)
v6: reword description (Janusz)

Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c | 19 +++++++++++++++++++
 lib/drmtest.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 52b5a2020..73d9159af 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -563,6 +563,25 @@ int __drm_open_driver_another(int idx, int chipset)
 	return fd;
 }
 
+/*
+ * drm_open_driver_another
+ * @idx: index of the device you are opening
+ * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
+ *
+ * A wrapper for __drm_open_driver with successful open assert.
+ *
+ * Returns:
+ * An open DRM fd
+ */
+int drm_open_driver_another(int idx, int chipset)
+{
+	int fd = __drm_open_driver_another(idx, chipset);
+
+	igt_assert_fd(fd);
+
+	return fd;
+}
+
 /**
  * __drm_open_driver:
  * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 6bc819734..856208c48 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -101,6 +101,7 @@ void __set_forced_driver(const char *name);
 
 int __drm_open_device(const char *name, unsigned int chipset);
 void drm_load_module(unsigned int chipset);
+int drm_open_driver_another(int idx, int chipset);
 int drm_open_driver(int chipset);
 int drm_open_driver_master(int chipset);
 int drm_open_driver_render(int chipset);
-- 
2.42.0

