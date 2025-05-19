Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DC0C2D0CD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 11:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181F610E367;
	Mon, 19 May 2025 11:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ROfa9Cdb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333CB10E35D
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 11:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747654173; x=1779190173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3MRiGhQcBzfzAk3NKdQRLLnY5yUnyQ5HwN53LofnRVk=;
 b=ROfa9Cdb4rR0boH/Ue6zAXa/JCxlwkU1QSruKjMYpPJds99q/QWVONzP
 jE0JFdlEEf49EdygV7kLcWAGazIWLJuEjLAbdbQJS0uJ/xpVEZ2nj505r
 0xt8n6QKlyseuTUCUDiZlhxku/QeVJA1hTy/6FcOObwwyKmgor9qMqQKH
 DlXxfE+a0aEbbc8ihd5X2NeF6p992SdUs7aCb9rb/ovAUlbZRHu1WC859
 AiccIibhesYb37JFWRPFo31AMVeQoSZ9ksCC/nbhB23FC84hO+y2EvllR
 8zJ1U0QagxgGhoOJHAJ9QYovLRBXrjgK6Scuz/izgtnu2TwxR9t61zykP w==;
X-CSE-ConnectionGUID: PMusWwpPQDeYMsOBlD6IfQ==
X-CSE-MsgGUID: 2HCUlIuPTmSx2jDUQGU3WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="53347312"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="53347312"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 04:29:33 -0700
X-CSE-ConnectionGUID: ASiP7+ZxR9KTMu+6yUvjGA==
X-CSE-MsgGUID: 9jdCoTiOSmS3ADRPw85Xhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="139385820"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 04:29:32 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH i-g-t v2 4/8] lib/igt_perf: fixup print/scan formatting for
 files in lib
Date: Mon, 19 May 2025 11:30:06 +0000
Message-Id: <20250519113010.125751-5-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519113010.125751-1-jan.sokolowski@intel.com>
References: <20250519113010.125751-1-jan.sokolowski@intel.com>
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

Compiling on other architectures than x86-64 causes a lot
of print/scan formatting warnings.

Fix formatting by using proper formatters, eg. SCNx64.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 lib/igt_perf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_perf.c b/lib/igt_perf.c
index fb2b73915..2b7170094 100644
--- a/lib/igt_perf.c
+++ b/lib/igt_perf.c
@@ -5,6 +5,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <sys/stat.h>
+#include <inttypes.h>
 #ifdef __linux__
 #include <sys/sysinfo.h>
 #include <sys/sysmacros.h>
@@ -157,7 +158,7 @@ int perf_event_config(const char *device, const char *event, uint64_t *config)
 		return -EINVAL;
 
 	buf[bytes] = '\0';
-	ret = sscanf(buf, "event=0x%lx", config);
+	ret = sscanf(buf, "event=0x%" SCNx64, config);
 	if (ret != 1)
 		return -EINVAL;
 
-- 
2.34.1

