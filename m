Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7CAC3600C
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 15:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1520410E494;
	Mon, 24 Mar 2025 15:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzW7N3uZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FDD10E492
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 15:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742830238; x=1774366238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uuIzQF9Cz5EBh5zh6+HHq6SMsJdrvLQYWrOXJFmYIAY=;
 b=gzW7N3uZ7coe1oYVK5Vov8yKAen2dVobJe4XkUZ+nBwYy41ccFp1ozNw
 ARt9TCDX6oeyKup9DvjhYo/i4zaRMhs5l5eLdUwGxCP7stbho4IqrpgBP
 uyDVLkr013iZkTMD6ktsOmlNVreAZepH2R6Jddba9lNWI1rn0+8L27/Xe
 uScYJhz8rXKhpe8AmRf0S9NGSCEntrKX9Encoj/Hbb9xnQoKwmwmpkJ21
 nv5x24HgPBV27V9mg5kwDRB6/9eZuh/XpLQbUJjXq7BYl5uTM6gToWOsM
 4pLKxect1p2xeL58y2RbGC2ekAJttU8WFjph46ZYgYserm+YvHUA6xUPy Q==;
X-CSE-ConnectionGUID: GNWGdY1cQIOe7UoO+weflQ==
X-CSE-MsgGUID: seXIlyVoQ06gUSGsVi49VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47825164"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="47825164"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 08:30:38 -0700
X-CSE-ConnectionGUID: /hSsF/DXQrK9iwz4CskC1g==
X-CSE-MsgGUID: xX+HNnZmR/aYysl73YaZeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="129143291"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.72])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 08:30:36 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_kmod: Allow igt_kmod_unbind() on a specific
 device
Date: Mon, 24 Mar 2025 16:27:53 +0100
Message-ID: <20250324153023.2493741-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324153023.2493741-1-francois.dugast@intel.com>
References: <20250324153023.2493741-1-francois.dugast@intel.com>
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

It can be that multiple devices are bound but we want to unbind only
one of them. Add an optional parameter so specificy which device.

Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 15 +++++++++++----
 lib/igt_kmod.h |  2 +-
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 524c1a632..2cf2e7894 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -633,7 +633,7 @@ int __igt_intel_driver_unload(char **who, const char *driver)
 	}
 
 	if (igt_kmod_is_loaded(driver)) {
-		igt_kmod_unbind(driver);
+		igt_kmod_unbind(driver, NULL);
 
 		ret = igt_kmod_unload(driver);
 		if (ret) {
@@ -647,10 +647,14 @@ int __igt_intel_driver_unload(char **who, const char *driver)
 	return 0;
 }
 
-/*
+/**
+ * igt_kmod_unbind:
+ *
  * Unbind driver from devices. Currently supports only PCI bus
+ * @mod_name: name of the module to unbind
+ * @pci_device: if provided, unbind only this device, otherwise unbind all devices
  */
-int igt_kmod_unbind(const char *mod_name)
+int igt_kmod_unbind(const char *mod_name, const char *pci_device)
 {
 	char path[PATH_MAX];
 	struct dirent *de;
@@ -674,6 +678,9 @@ int igt_kmod_unbind(const char *mod_name)
 		if (de->d_type != DT_LNK || !isdigit(de->d_name[0]))
 			continue;
 
+		if (pci_device && strcmp(pci_device, de->d_name) != 0)
+			continue;
+
 		devfd = openat(dirfd(dir), de->d_name, O_RDONLY | O_CLOEXEC);
 		igt_assert(devfd >= 0);
 
@@ -718,7 +725,7 @@ igt_intel_driver_unload(const char *driver)
 
 int igt_xe_driver_unload(void)
 {
-	igt_kmod_unbind("xe");
+	igt_kmod_unbind("xe", NULL);
 
 	igt_kmod_unload("xe");
 	if (igt_kmod_is_loaded("xe"))
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index 193b95627..170a8df9d 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -36,7 +36,7 @@ bool igt_kmod_has_param(const char *mod_name, const char *param);
 int igt_kmod_load(const char *mod_name, const char *opts);
 int igt_kmod_unload(const char *mod_name);
 
-int igt_kmod_unbind(const char *mod_name);
+int igt_kmod_unbind(const char *mod_name, const char *pci_device);
 
 int igt_audio_driver_unload(char **whom);
 
-- 
2.43.0

