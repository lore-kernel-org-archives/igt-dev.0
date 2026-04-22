Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69C0F94CB2
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 03:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F15210E261;
	Wed, 22 Apr 2026 03:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EUlq9TZm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527AC10E261
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 03:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776830310; x=1808366310;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nigPON6BJREhbkJGDyt9vX4CwJDxFMdW6llL036E3Sw=;
 b=EUlq9TZmMetd/mZXMaiWoXDcmo6HpL3ZKJmoWqnz5l9p9+KR/ICQZZWF
 pAdLaUj9ZkkVLAAzdkjAV8KdvGzo6VW1nybdFs9eVLOCg9imYZUTN/8QM
 TZSfPl4Xb1T7sa3ZHc5mG6oaUnCbyJwqSWV433boUA5IQPWVbTTNWKDzQ
 ohXO4p0TeJGeEnFZQSsnPm0hASHb28wokntK3P0qLM2QtbcCxOaXVZxZP
 3V8hyYOG81gVBuAWU9xoMfwbxxSYKgz8S06EONwCQXAQnJe0mrQ6nKR4X
 MPvePPn1FK8UBE0ao6dINrbKZI0IL4GToYJ+Iph1RtjuUM5vdsEYtdTmD w==;
X-CSE-ConnectionGUID: 8swwkOO5T4GNOmANHbVsKw==
X-CSE-MsgGUID: i5BHZ5G6RMiF5NyvOGP7cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="95338484"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="95338484"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 20:58:30 -0700
X-CSE-ConnectionGUID: FoepqPZ9Qhe5UXO996wr0g==
X-CSE-MsgGUID: j9OzTHllRGK2vXg9lY98HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="232151334"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 20:58:28 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 2/8] tools/intel_vbt_decode.c: Include linux_scaffold.h
Date: Wed, 22 Apr 2026 09:13:29 +0530
Message-ID: <20260422034335.2326098-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260422034335.2326098-1-ankit.k.nautiyal@intel.com>
References: <20260422034335.2326098-1-ankit.k.nautiyal@intel.com>
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

linux_scaffold.h provides kernel compat macros including GENMASK and
BIT_U32, which will be needed by intel_vbt_defs.h in subsequent changes.
Include it in intel_vbt_decode.c and remove the now duplicate typedefs
for u8, u16, u32, and u64.

While at it, move drmtest.h in asciibetical order.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tools/intel_vbt_decode.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index d4aada743e42..7785e9e82b1f 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -38,17 +38,13 @@
 #include <sys/stat.h>
 #include <sys/types.h>
 
+#include "drmtest.h"
 #include "igt_aux.h"
 #include "igt_halffloat.h"
 #include "intel_chipset.h"
 #include "intel_io.h"
-#include "drmtest.h"
+#include "linux_scaffold.h"
 
-/* kernel types for intel_vbt_defs.h */
-typedef uint8_t u8;
-typedef uint16_t u16;
-typedef uint32_t u32;
-typedef uint64_t u64;
 #define __packed __attribute__ ((packed))
 
 #define _INTEL_BIOS_PRIVATE
-- 
2.45.2

