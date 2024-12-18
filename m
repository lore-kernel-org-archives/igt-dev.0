Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2E1E7718B
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 23:39:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D8D10E1C6;
	Wed, 18 Dec 2024 23:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E2UbbUWi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7127E10E1C6
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 23:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734565154; x=1766101154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g/+BkKw7mH+N2OJ12zQe/Xh/HODUD2DHGX6ftoNSpMY=;
 b=E2UbbUWiWB2WfrMl9FoFasd25kfKHzjNhFnwFUWZkIUOh8tjyYqC8j3O
 QHGypzqGtE6KmxZXQnZSsr5kCKrPFlJiqNt0Dj4ZUWfnfnq6ZcEelfKSG
 Bh146HhTkrh6lMSlW4Dp+c6UcWCbtleS9J7r5fu8eL1JTvdixSSqWOiL7
 Neo7d8VGJ/sBd+tZ9XjffWSt2kVUvtgALnXkFHXqSg2fFkpNxBBEF6zGF
 +dexj8g+lclljQZ6F4xeiA3tC9yNhrZcLupsFUwEGe8p047SFwcByLqBh
 XBWRvqeBiYIGoODxMh43lhYLx9p24HUPnzNF9MlVL1rVfoSmWu7tbX8mq g==;
X-CSE-ConnectionGUID: UH1Jz+ssS9Wwt63CIUPPxw==
X-CSE-MsgGUID: IYkqX/OeTn6fAaqLcJ2kHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38844374"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="38844374"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 15:39:13 -0800
X-CSE-ConnectionGUID: n7FjyQqdRlOri2xIYaHtDA==
X-CSE-MsgGUID: 7fc/4bnqQNCXuoEhqoZPLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="97800875"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 15:39:13 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/2] lib/igt_kmod: Do not explicitly unload intel mei
 driver
Date: Wed, 18 Dec 2024 15:38:30 -0800
Message-ID: <20241218233830.2444510-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218233830.2444510-1-daniele.ceraolospurio@intel.com>
References: <20241218233830.2444510-1-daniele.ceraolospurio@intel.com>
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

The mei driver is a child of i915 on discrete, but not on integrated.
This means we want to unplug it before removing i915 in the former case
but not in the latter. Therefore, instead of manually unloading the mei
driver, we can unbind i915 and leave it to the kernel to unplug all the
dependencies. This also means that we don't need to explicitly disable
the vtcon anymore.

The other 2 dependencies are left untouched:
- intel_ips uses symbol_get, so the automatic dependency detection won't
  unload it.
- the hotunplug test mentions that the sound driver can throw errors on
  i915 unbind, so we need to keep the explicit unload.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index a8b0339b9..fa9541d72 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -620,16 +620,9 @@ int __igt_intel_driver_unload(char **who, const char *driver)
 	const char *aux[] = {
 		/* gen5: ips uses symbol_get() so only a soft module dependency */
 		"intel_ips",
-		/* mei_gsc uses an i915 aux dev and the other mei mods depend on it */
-		"mei_pxp",
-		"mei_hdcp",
-		"mei_gsc",
 		NULL,
 	};
 
-	/* unbind vt */
-	bind_fbcon(false);
-
 	ret = igt_audio_driver_unload(who);
 	if (ret)
 		return ret;
@@ -648,6 +641,8 @@ int __igt_intel_driver_unload(char **who, const char *driver)
 	}
 
 	if (igt_kmod_is_loaded(driver)) {
+		igt_kmod_unbind(driver);
+
 		ret = igt_kmod_unload(driver);
 		if (ret) {
 			if (who)
-- 
2.43.0

