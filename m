Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1941C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 11:10:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBB610E5F9;
	Tue,  3 Jun 2025 11:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="myzbEmNc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C16B10E5FA
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 11:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748949009; x=1780485009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I1mnqhOJOZhl4bFvOxdDHZASJkyookpt0lf3Rh/tXdE=;
 b=myzbEmNcqtSi76qFIpNp4qlHMgl37f23BkXzNc878j7Z8znArKEw8Yzr
 6hWgPrJCIf0SrgSwHdy5dobpg011ogM7g65c/SqEHv9IN97Onw+erKh/d
 MigAYnHS03VJqg54CB0ubz9FOPS7/uSA8UzXeEtsZuqepR3QCqbef3SI8
 ZsBKFltk3X+JvLN4MI0SLVQTtIrzAYUbaM9FYTYjjcujPRZ5FhqijzKsb
 /crFItemq5RIfzyNYkVNVxkZ043Opam7nNLgO8zyTce4Y1abbNMkmfp+N
 slj3+EVDVVyfreEZUB0olhZLYLN0Ed5TwvsRDhDPTVLSoVb5EzIV4Sjxf Q==;
X-CSE-ConnectionGUID: v0g3cl0mRWmO5Ld3QOB1sg==
X-CSE-MsgGUID: TDc/avJNRTmel91OX2/VEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="61603723"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="61603723"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 04:10:09 -0700
X-CSE-ConnectionGUID: +yBXkR5TRxGLqAq/ULTP9A==
X-CSE-MsgGUID: 6u/tXCf/Rla/xenG8S7X9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149598306"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 04:10:08 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH i-g-t v5 4/9] lib/igt_perf: fix scan formatting for 32-bit
 compilation
Date: Tue,  3 Jun 2025 11:11:02 +0000
Message-Id: <20250603111107.3170529-5-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603111107.3170529-1-jan.sokolowski@intel.com>
References: <20250603111107.3170529-1-jan.sokolowski@intel.com>
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
index fb2b73915..fe60241a4 100644
--- a/lib/igt_perf.c
+++ b/lib/igt_perf.c
@@ -1,5 +1,6 @@
 #include <errno.h>
 #include <fcntl.h>
+#include <inttypes.h>
 #include <limits.h>
 #include <stdint.h>
 #include <stdlib.h>
@@ -157,7 +158,7 @@ int perf_event_config(const char *device, const char *event, uint64_t *config)
 		return -EINVAL;
 
 	buf[bytes] = '\0';
-	ret = sscanf(buf, "event=0x%lx", config);
+	ret = sscanf(buf, "event=0x%" SCNx64, config);
 	if (ret != 1)
 		return -EINVAL;
 
-- 
2.34.1

