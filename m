Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71023C369A6
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 22:48:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE4110EA7D;
	Thu, 10 Apr 2025 22:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MjNbFPyx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C1610EA7B
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 22:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744325337; x=1775861337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P0wLtwxvWRnEMm6pW3QixMoK2EetRE8izCcCLfsFStI=;
 b=MjNbFPyxyOuGQe5+kQ4KcAmYB3tD44Bs1k+CY5L0OjN03R4P4WIAayxu
 gXIEjA8QbcFNzdQB/Sa19XB4ropiaq/Wct8h+asyiZzbugHP98uo+6gWD
 lDRkJhZVBEt3hRRqyu78OFLNNHLYuVTAH3tz00VSgRIbgnD/5OrGvXNBr
 r4/jch3cZ2fpY+KR/7zsQim+49JThRQGet4lWBR2WEpJkURW/a3+zyjdi
 JAteYd34BIylVGZoZD9IobPQO4OphIKPF8OTT8gY6652Or58zJp/ey9Yj
 glXu1Jy+JDcycuc/tOATt6iWvvlZ16zMClOfVozz2EzthC1HfhBygReHy g==;
X-CSE-ConnectionGUID: Rk6eBhmSRIqVnBRzRyZPGA==
X-CSE-MsgGUID: oCnomCnuTPC8WZOx1LZYuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45757014"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="45757014"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:48:57 -0700
X-CSE-ConnectionGUID: qRZOFH7hSn6TSjck+05hfw==
X-CSE-MsgGUID: UccN5dVmRXOn5LfY8MiqVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="159998318"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:48:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 05/10] lib/igt_kmod: Add igt_kmod_bind()
Date: Thu, 10 Apr 2025 15:48:34 -0700
Message-ID: <20250410-lib-kmod-v1-5-84b1ad0b8075@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
References: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-9a9c7
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

Like the unbind/rebind, this can be easily implemented by the
driver_set_device() helper.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 32 +++++++++++++++++++++++++++++---
 lib/igt_kmod.h |  2 ++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 3f5f93f37..14b6b957a 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -598,9 +598,7 @@ int __igt_intel_driver_unload(char **who, const char *driver)
 }
 
 /**
- * igt_kmod_unbind:
- *
- * Unbind driver from devices. Currently supports only PCI bus
+ * igt_kmod_unbind: Unbind driver from devices. Currently supports only PCI bus
  * @mod_name: name of the module to unbind
  * @pci_device: if provided, unbind only this device, otherwise unbind all devices
  */
@@ -639,6 +637,34 @@ int igt_kmod_unbind(const char *mod_name, const char *pci_device)
 	return 0;
 }
 
+/**
+ * igt_kmod_bind: Bind driver to device
+ * @mod_name: name of the module to rebind
+ * @pci_device: device to bind
+ *
+ * Module should already be loaded
+ */
+int igt_kmod_bind(const char *mod_name, const char *pci_device)
+{
+	char path[PATH_MAX];
+	int dirlen, dirfd;
+	int ret;
+
+	dirlen = snprintf(path, sizeof(path), "/sys/module/%s/drivers/pci:%s/",
+			  mod_name, mod_name);
+	igt_assert(dirlen < sizeof(path));
+
+	dirfd = open(path, O_RDONLY | O_CLOEXEC);
+	if (dirfd < 0)
+		return dirfd;
+
+	ret = igt_sysfs_set(dirfd, "bind", pci_device);
+
+	close(dirfd);
+
+	return ret;
+}
+
 /**
  * igt_intel_driver_unload:
  *
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index 170a8df9d..e3a4ce671 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -37,6 +37,8 @@ int igt_kmod_load(const char *mod_name, const char *opts);
 int igt_kmod_unload(const char *mod_name);
 
 int igt_kmod_unbind(const char *mod_name, const char *pci_device);
+__attribute__((nonnull)) int igt_kmod_bind(const char *mod_name,
+					   const char *pci_device);
 
 int igt_audio_driver_unload(char **whom);
 

-- 
2.49.0

