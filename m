Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBF3D4921C
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 05:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5293210E06A;
	Tue, 19 Nov 2024 05:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D2cD7+lr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06E110E143
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 05:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731994824; x=1763530824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jd/90GOlS6bvYJNFM4mYL4jNVz1lLD+GwJBQBKYUyNA=;
 b=D2cD7+lr4fm3komtIyY9LdNIPyqQOL8YrYwDrsPBLT+xcEg1Kh+1Dto9
 A0jeS+WP89OSJxmSW6pq0ZNwnCE4R36nPlALdZW3DjB6/nxp7q8hD61n3
 HMwfadfSyIZ2EDvmmKTSdgRbr3Fur9c40xUL5Hk99OxoSJQBb8FNqekRc
 HL+oTk5ToPGZbm18yhJyUW7LEMFDbuqyeBra8DVTaHbbFRU4W16VjNx8P
 +E14KjECDOE+mUXiJl8ze4EPv3/+ihSyjBXRaIQ5Njl5GhLGclNmZPSuk
 zsbM27OBNhURsy4MYS5oEaQvqr0VV0i5pCFeH/W0OsrlhM7BSQgj3GYU8 A==;
X-CSE-ConnectionGUID: vCnCEdjrTpGynjF6ipK+yg==
X-CSE-MsgGUID: JMUBEJV4TxmDn16jwjj1LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="19588154"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="19588154"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:40:24 -0800
X-CSE-ConnectionGUID: ZO2kT1zXTJaTvhWR22haKg==
X-CSE-MsgGUID: IXW9CRgBQ8iafVS1Zf2Hig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89222414"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:40:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [CI 4/9] lib/igt_kmod: Remove unused low level
 __igt_intel_driver_unload()
Date: Mon, 18 Nov 2024 21:40:03 -0800
Message-ID: <20241119054008.2001984-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241119054008.2001984-1-lucas.demarchi@intel.com>
References: <20241119054008.2001984-1-lucas.demarchi@intel.com>
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

__igt_intel_driver_unload() is now unused and not needed.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 47 -----------------------------------------------
 lib/igt_kmod.h |  6 ------
 2 files changed, 53 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 0ce0b9462..1854b44ec 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -605,53 +605,6 @@ int igt_audio_driver_unload(char **who)
 	return igt_always_unload_audio_driver(who);
 }
 
-int __igt_intel_driver_unload(char **who, const char *driver)
-{
-	int ret;
-
-	const char *aux[] = {
-		/* gen5: ips uses symbol_get() so only a soft module dependency */
-		"intel_ips",
-		/* mei_gsc uses an i915 aux dev and the other mei mods depend on it */
-		"mei_pxp",
-		"mei_hdcp",
-		"mei_gsc",
-		NULL,
-	};
-
-	/* unbind vt */
-	bind_fbcon(false);
-
-	ret = igt_audio_driver_unload(who);
-	if (ret)
-		return ret;
-
-	for (const char **m = aux; *m; m++) {
-		if (!igt_kmod_is_loaded(*m))
-			continue;
-
-		ret = igt_kmod_unload(*m);
-		if (ret) {
-			if (who)
-				*who = strdup_realloc(*who, *m);
-
-			return ret;
-		}
-	}
-
-	if (igt_kmod_is_loaded(driver)) {
-		ret = igt_kmod_unload(driver);
-		if (ret) {
-			if (who)
-				*who = strdup_realloc(*who, driver);
-
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
 /*
  * Unbind driver from devices. Currently supports only PCI bus
  */
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index 88d4a51e6..67ae6833f 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -42,7 +42,6 @@ int igt_audio_driver_unload(char **whom);
 
 int igt_intel_driver_load(const char *opts, const char *driver);
 int igt_intel_driver_unload(const char *driver);
-int __igt_intel_driver_unload(char **who, const char *driver);
 
 static inline int igt_i915_driver_load(const char *opts)
 {
@@ -54,11 +53,6 @@ static inline int igt_i915_driver_unload(void)
 	return igt_intel_driver_unload("i915");
 }
 
-static inline int __igt_i915_driver_unload(char **whom)
-{
-	return __igt_intel_driver_unload(whom, "i915");
-};
-
 static inline int igt_xe_driver_load(const char *opts)
 {
 	return igt_intel_driver_load(opts, "xe");
-- 
2.47.0

