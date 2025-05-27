Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C68C54F30
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 12:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D796D10E4BB;
	Tue, 27 May 2025 12:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVtDdoWa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A9510E4BB
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 12:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748347411; x=1779883411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i9mLwcurUPFDuaPJVpmLIKgLVLiNwknaMni/3ftzs6s=;
 b=DVtDdoWatQ7qS+xrONI1UwRZz46i9funEkwUW0il09QrdewpIYPRWGap
 buf5KwkGd1VyAq2OskoqCvZ7dsdKuJdO39u8BfNcmPQXnj4Yphl0tqxLv
 kYt6lymzOhLA71qgGtnzfqELI2oEwfsjtaNYK8WmS5xf04eS8AYzRhvo2
 QdjaCINdg8fdoJv5RE1z0sxqyFfd6KmFQ2LVStBMpvOwFrq9vhp0H64AX
 +8q6neTVsqjEXeNa3fcTi3dfRA3PXZQ4Hk9Y77TeJ/xAVU/ECxWLTDKmb
 aOfpgXVV/lSPmblfjwanZj1IBFq0AcNzfStb7AjWzuzH39G8jfhV4X0N9 Q==;
X-CSE-ConnectionGUID: UzK8id+6QfqyBRBXSzhnJg==
X-CSE-MsgGUID: mJwSDGIOSUGkrAhQ9RI3tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="61687797"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="61687797"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:03:31 -0700
X-CSE-ConnectionGUID: hCrgLF3STTOZ2Zew4kZq0Q==
X-CSE-MsgGUID: Lo4ZCTDXSiqr8cMuUqd/UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147558019"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:03:29 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH i-g-t v4 4/9] lib/igt_perf: fixup scan formatting for files in
 lib
Date: Tue, 27 May 2025 12:04:16 +0000
Message-Id: <20250527120421.79026-5-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527120421.79026-1-jan.sokolowski@intel.com>
References: <20250527120421.79026-1-jan.sokolowski@intel.com>
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
of scan formatting warnings.

Fix formatting by using proper formatters, eg. SCNx64.

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
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

