Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F91FF8869
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 13:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8F910E743;
	Mon, 27 Apr 2026 13:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gt02ioIM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1146410E743
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 13:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777294853; x=1808830853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wrBQaK7S71Qi3/qyGah8VPn33EFKXwFgYJXB/wP0YbU=;
 b=Gt02ioIMIko5v0yCrc0OAjGJBGBX3yCzpcLgMaMlIH0zM+izM7ZPML7D
 yv+K43YKFt6l7CIdyAEjfQuPj9qrcfbC/zxfJiQ+30dxQJGKEpgp/AFl2
 1YwxAtpChRyK2f1nROKfdFAOGtx654znOVtVlFwHvau+yduPcug0CG/4u
 3Tda+mwQ19cGkek5BD56tA8CEZLSC48IBTl0Jf3XczAhflIZLjVI00D2Y
 /nJU0F7wiQeIqUyqzTGMUnDKThCVtS4JmpVT8K/uZJ0zhCh4urTW3CGE2
 okiHY06oN77JIPbLMJEVyYG4Lo1RWMtVt6eaL6qzOTC1m4ad6rCRpwcHU A==;
X-CSE-ConnectionGUID: d1KOMsXrRzqLUtoEPSMr5g==
X-CSE-MsgGUID: 6yyT+EcxTH+HbqGHWWXgxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77339193"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="77339193"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 06:00:53 -0700
X-CSE-ConnectionGUID: 55doDo1YTW+nAnXUe0i07g==
X-CSE-MsgGUID: pckJtRybR/mGuwLEjeWywQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="237597719"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 06:00:51 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 2/8] tools/intel_vbt_decode.c: Include linux_scaffold.h
Date: Mon, 27 Apr 2026 18:16:01 +0530
Message-ID: <20260427124607.3115567-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260427124607.3115567-1-ankit.k.nautiyal@intel.com>
References: <20260427124607.3115567-1-ankit.k.nautiyal@intel.com>
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
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
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

