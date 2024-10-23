Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DDED2E010
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 04:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E3010E72F;
	Wed, 23 Oct 2024 04:55:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lC3y1OT9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39AC10E730
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 04:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729659335; x=1761195335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5fuKGyaajsN0Rym/xH8/XuDZxrqRbmIGytfrNqr2ySU=;
 b=lC3y1OT9LHz69hdztPAukq+ijVqwP/qMUOFaYm9a86n1niWjuN/NermJ
 m8XN2kW59Xc96W32yPyp/b/aMKz0c8AsdWUzPmbazsJiO7qyZ+Bnyi4CE
 SsfsX2kOG1JOI0Y41ewNmMBawHt6odqkSKwxMIITHv3m23+DiRiVNRskS
 8TvJzBbVKPWwSKG7V3dgwinJh2tktoC+vS4N/GPlqfbkDWPXptTrIO1tW
 quB9YuZrUiwq1w+IdGfRqwdBWXJAcwc1utvIySIejqRMwu0X7DoA/w7H+
 Y8fqHIQfg7n2Hb4f3DiyDjqcTf186nbJfvBSlp4ViYqfey72vyTj8tOT3 Q==;
X-CSE-ConnectionGUID: TcLmXscxQKWNrA1lS8MMHg==
X-CSE-MsgGUID: guFrX1kpQC+JMgVKJatd9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29009108"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29009108"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 21:55:34 -0700
X-CSE-ConnectionGUID: J930aUHkRieYy0CutYeYXQ==
X-CSE-MsgGUID: 2/faf7vwSi+MaTn6omBKmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="84061622"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 21:55:33 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [CI 1/2] lib/igt_kmod: Export igt_kmod_unbind()
Date: Tue, 22 Oct 2024 21:55:10 -0700
Message-ID: <20241023045511.3047422-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023045511.3047422-1-lucas.demarchi@intel.com>
References: <20241023045511.3047422-1-lucas.demarchi@intel.com>
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

So it can be used directly by tests and other libs.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 6 +++---
 lib/igt_kmod.h | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 75a0d057c..039309328 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -663,7 +663,7 @@ int __igt_intel_driver_unload(char **who, const char *driver)
 /*
  * Unbind driver from devices. Currently supports only PCI bus
  */
-static int unbind(const char *driver)
+int igt_kmod_unbind(const char *mod_name)
 {
 	char path[PATH_MAX];
 	struct dirent *de;
@@ -671,7 +671,7 @@ static int unbind(const char *driver)
 	DIR *dir;
 
 	dirlen = snprintf(path, sizeof(path), "/sys/module/%s/drivers/pci:%s/",
-			  driver, driver);
+			  mod_name, mod_name);
 	igt_assert(dirlen < sizeof(path));
 
 	dir = opendir(path);
@@ -744,7 +744,7 @@ igt_intel_driver_unload(const char *driver)
 
 int igt_xe_driver_unload(void)
 {
-	unbind("xe");
+	igt_kmod_unbind("xe");
 
 	igt_kmod_unload("xe");
 	if (igt_kmod_is_loaded("xe"))
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index ee1719a8f..193b95627 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -36,6 +36,8 @@ bool igt_kmod_has_param(const char *mod_name, const char *param);
 int igt_kmod_load(const char *mod_name, const char *opts);
 int igt_kmod_unload(const char *mod_name);
 
+int igt_kmod_unbind(const char *mod_name);
+
 int igt_audio_driver_unload(char **whom);
 
 int igt_intel_driver_load(const char *opts, const char *driver);
-- 
2.47.0

