Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69857C35FF1
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 09:57:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214BD10E99C;
	Fri, 14 Mar 2025 09:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kchckG/3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CB010E99C
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 09:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741946250; x=1773482250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9tvabUt/tBUbZkK3A0fbagXDAM2msOlJjMR45VDIJ9I=;
 b=kchckG/31/bfb4d8Si3gwqz6Q1g8AcMASa0iYvrIsXgZrgM70iBcZyd+
 3F+X02ps03PKUuQ62gklEeejkv/WRTFKMbb9qjRKnPJoBbcoLgSZ0jQiX
 kzFLt4YAjvrGEOiLYHjdFcQHMlhf4GYTszYt+BQwyqLJppjWoGYgM4pXq
 fHcHBRX9c+PxkqlqK6mY99wSPe9naPSnTyqv9yFf7fNP0fjnQlNP0Pyd7
 wJ1rKaKvw1RI0YaIm3guO7wyNYlYC2oxKLucxXXGPGARgl3mwyfIRVl/W
 433EPwvOZ9jw7YdDFBqHyEWg2OjgKnOf13ZxpvgdY+s5At46HG6+BHFwb Q==;
X-CSE-ConnectionGUID: bWtf7IcXTpmd708riHKpSg==
X-CSE-MsgGUID: UWXoJEZMSM6/f47vOWSGng==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="53745149"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="53745149"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 02:57:30 -0700
X-CSE-ConnectionGUID: HFl5qmyNQ26Dc+8wejAfWw==
X-CSE-MsgGUID: aL8bv4eqQ0uY3Grp1ZELfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="144404701"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.175])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 02:57:28 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_kmod: Allow igt_kmod_unbind() on a specific
 device
Date: Fri, 14 Mar 2025 10:55:04 +0100
Message-ID: <20250314095701.581686-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250314095701.581686-1-francois.dugast@intel.com>
References: <20250314095701.581686-1-francois.dugast@intel.com>
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
---
 lib/igt_kmod.c | 15 ++++++++++-----
 lib/igt_kmod.h |  2 +-
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 524c1a632..f00f7dd15 100644
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
@@ -671,7 +675,8 @@ int igt_kmod_unbind(const char *mod_name)
 		int devfd;
 		bool ret;
 
-		if (de->d_type != DT_LNK || !isdigit(de->d_name[0]))
+		if (de->d_type != DT_LNK || !isdigit(de->d_name[0]) ||
+		    (pci_device && strcmp(pci_device, de->d_name) != 0))
 			continue;
 
 		devfd = openat(dirfd(dir), de->d_name, O_RDONLY | O_CLOEXEC);
@@ -718,7 +723,7 @@ igt_intel_driver_unload(const char *driver)
 
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

