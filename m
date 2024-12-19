Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FF1E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 23:05:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D46910EE06;
	Thu, 19 Dec 2024 23:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AHWzdVAE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B0D10EE06
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 23:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734649537; x=1766185537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yyf+tcRfi8O1TZmxbgZ8nSvhCxDoxebxeQrLUMqqPEE=;
 b=AHWzdVAEv0VcdvqDUt7jxz4MMel8extkcTliIHPZ4MFKhrqbzxbe+G6K
 IUhTgipM7o3/v8KvJSbI4OemMoreeefZNGQlEsl7rR/nDNQHoWZ2rM/74
 uxWfJmOHQhTNHZexmVLqFT9jO8ZkiralgJfrxGYyp1dX/Zqm5oXABHbcH
 aBZ69NeZPz1226TKSUN3++8lZ/IqnRB6wlsXqxE0RZwTpPDQrhVw17vrQ
 WdUOHtd8zPHc1558aUWdUtuGLKVNR7oHk5YRKxalSgGuphePb9QnQsmkk
 c2hXwPS0yPp6JQpJ+Ow+jS2mnHrXnqvOD+R8BN+1lFMYqr4xtgY6hu6/A g==;
X-CSE-ConnectionGUID: tdroM1ONQrqKhy/V7HpvOw==
X-CSE-MsgGUID: XW1H1xUwT3u7H0PQsUSwIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="45874525"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="45874525"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 15:05:37 -0800
X-CSE-ConnectionGUID: JvY8IAWJT/6W87bhrG0Fag==
X-CSE-MsgGUID: pgRylbVTRKemPaPWNL+kKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="98141523"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 15:05:36 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 3/3] lib/igt_kmod: Do not explicitly unload intel mei
 driver
Date: Thu, 19 Dec 2024 15:05:17 -0800
Message-ID: <20241219230517.2492196-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241219230517.2492196-1-daniele.ceraolospurio@intel.com>
References: <20241219230517.2492196-1-daniele.ceraolospurio@intel.com>
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
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index a008b3c29..07c5781f7 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -612,16 +612,9 @@ int __igt_intel_driver_unload(char **who, const char *driver)
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
@@ -640,6 +633,8 @@ int __igt_intel_driver_unload(char **who, const char *driver)
 	}
 
 	if (igt_kmod_is_loaded(driver)) {
+		igt_kmod_unbind(driver);
+
 		ret = igt_kmod_unload(driver);
 		if (ret) {
 			if (who)
-- 
2.43.0

