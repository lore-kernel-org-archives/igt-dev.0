Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3531DD1CA3A
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 06:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF72810E527;
	Tue,  5 Nov 2024 06:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QNmS/PR4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6D010E51C
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 06:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730787557; x=1762323557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fpUtl9cdKGh8al6Tila3zMW2IGUGPpL53ZXEOdyYJgo=;
 b=QNmS/PR4YqB3mZqmX4TWbs07rkbtAJazuTgnW+MY7JneW36HMM3any4L
 IQgDqPnvaHQ7LtE/5U2VPJDLA+IChhs4owNSfP+KyDUZfejfQreGURopw
 ERl7tijWsXWNWSCJ3MmsdA1kmhsWlGpfZqx1sjqWajuAaWOOS/H1ZW4I7
 BZEJ1lcOpqxwGcxIQQ4rGfIhZU3WrLOnLBQMpLkiXuQYhMv+GcIR+PzxL
 VBkvzo7a7MGjaRr+n9hRb2noSAEBUBYEeQ0lMV1TtpK2bfPQJ48FaWG13
 EzoRAo1R+/zeT/RkqpGn0rCvyPGFofeloTdaQzhKOXy64/ytf76AEPLBT A==;
X-CSE-ConnectionGUID: F0CNQFcbT7SWH9NfUiOVLA==
X-CSE-MsgGUID: mcY0wt7zSumGU2NZocpt8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="18133567"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="18133567"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:19:16 -0800
X-CSE-ConnectionGUID: ra4AzcqaRKqUoH/Eddb6WQ==
X-CSE-MsgGUID: 6xyvasG8QoKb0P20rzbyig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="83781731"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:19:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 4/9] lib/igt_kmod: Remove unused low level
 __igt_intel_driver_unload()
Date: Mon,  4 Nov 2024 22:18:40 -0800
Message-ID: <20241105061845.2486557-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105061845.2486557-1-lucas.demarchi@intel.com>
References: <20241105061845.2486557-1-lucas.demarchi@intel.com>
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 47 -----------------------------------------------
 lib/igt_kmod.h |  6 ------
 2 files changed, 53 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 0c093ec62..972dc490d 100644
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

