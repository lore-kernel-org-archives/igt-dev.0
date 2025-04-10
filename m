Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5090C369A8
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 22:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824C710EA83;
	Thu, 10 Apr 2025 22:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A9IvV6Rr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C5D10EA81
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 22:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744325338; x=1775861338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/8XDhqoaF5HNF26kqfolNsqGNjp+UCPZUISAQ2VEnPo=;
 b=A9IvV6RrZPT9sH4ZgjFXMdRwqis5ww9PXlTWxm8wOsgWVMuZTEFacqnF
 /OJJqMHoP6cm4/ujVBjkQuJLD+kyQxODvDsk4vOKFoqxP0S4jE2FbPV8s
 NX6OXg2PR4LCfIOjIViKf0X0XGPYGLBS1Fc0bJ38ra0ug6W2YVxSVNqx2
 seyTylk88YCH8Q1f4rm8Ln4KNHL+ULgOALLWIO4L7TpAyJoJaw7MNac5P
 ppEkDgvMzQejzZsSpcGzSttxY8yprk41AscDDt9WwBEnAwk393Eis2kAi
 +f9vqYxs833yn/XXt3lBB7GGCZ36kItKlTYlugvvMkP+MeKGAe+eXCGo8 A==;
X-CSE-ConnectionGUID: stGzCnQYSsqmgsUed8WrEA==
X-CSE-MsgGUID: nmmHQY3vQ1CzRcxfwm0I4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45757018"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="45757018"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:48:57 -0700
X-CSE-ConnectionGUID: O+gBGnycQ6eAkU6zS+LY9Q==
X-CSE-MsgGUID: V9gMKU57QOmdHF+w+ojtYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="159998324"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:48:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 07/10] lib/igt_kmod: Add rebind abstraction
Date: Thu, 10 Apr 2025 15:48:36 -0700
Message-ID: <20250410-lib-kmod-v1-7-84b1ad0b8075@intel.com>
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

Abstract the "set one file in the drivers dir" and share the
implementation with unbind/rebind.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 11 +++++++++++
 lib/igt_kmod.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 14b6b957a..6d7f5705c 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -665,6 +665,17 @@ int igt_kmod_bind(const char *mod_name, const char *pci_device)
 	return ret;
 }
 
+/**
+ * igt_kmod_rebind: Unbind driver from devices and bind it again
+ * @mod_name: name of the module to rebind
+ * @pci_device: device to rebind to
+ */
+int igt_kmod_rebind(const char *mod_name, const char *pci_device)
+{
+	return igt_kmod_unbind(mod_name, pci_device) ||
+		igt_kmod_bind(mod_name, pci_device);
+}
+
 /**
  * igt_intel_driver_unload:
  *
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index e3a4ce671..905070897 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -39,6 +39,8 @@ int igt_kmod_unload(const char *mod_name);
 int igt_kmod_unbind(const char *mod_name, const char *pci_device);
 __attribute__((nonnull)) int igt_kmod_bind(const char *mod_name,
 					   const char *pci_device);
+__attribute__((nonnull)) int igt_kmod_rebind(const char *mod_name,
+					     const char *pci_device);
 
 int igt_audio_driver_unload(char **whom);
 

-- 
2.49.0

