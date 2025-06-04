Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A58C67861
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 17:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4181D10E78C;
	Wed,  4 Jun 2025 17:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbPR2e9e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59D610E787
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 17:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749057573; x=1780593573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TyTd7sWbGHsn1BqOCgJK7BqiIV4S0mbESycGb41irzk=;
 b=UbPR2e9ezwRwPxypu9atjt32/eqiqQQDgixfzZ0tIb+pNaH+Dw0OsO7U
 Whal9m7yZV1tEpyLPpFySSsV1TG9OaZF7aZakcNwCPWVpB0IsJOrB3sTe
 rviSg6WPg6X2/m2RHi94klMYuu2x9ZqeaQZ/4SKlrBGmw7IPuL1Uw92cC
 hQ5xgCL4wPeXz7zw+vDzHUTSwZDzEEvjWuRSg+Q8n9/zilMMxgLshhmeY
 v/l6wtWBtycrmICTe3NnYiJbNaINfAZJctYP2HSoqYP1woD7f6n12QtwS
 MtkH+rps6HnmsH4ug16tTOrvfKVHtPE5gdyDu/pymTtcUQsYx1XiSQ71+ Q==;
X-CSE-ConnectionGUID: hE28QE8RRZOyDYCKsl5cmA==
X-CSE-MsgGUID: cGSNj37WSC2kP6OXvaW2wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68595981"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="68595981"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 10:17:49 -0700
X-CSE-ConnectionGUID: xr4Q5UTDQl6NOtTpy5TBhg==
X-CSE-MsgGUID: lFdsuHlLREe1E7sT5INwKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145203330"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 04 Jun 2025 10:17:47 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH v15 9/9] tools/intel_firmware_decode: Conditionally define
 __packed
Date: Wed,  4 Jun 2025 17:16:56 +0000
Message-ID: <20250604171656.31559-10-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
References: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
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

Ensure __packed is defined only if it is not already defined,
addressing compatibility with Android where __packed is predefined.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 tools/intel_firmware_decode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/intel_firmware_decode.c b/tools/intel_firmware_decode.c
index 61ce3a531..270d1b693 100644
--- a/tools/intel_firmware_decode.c
+++ b/tools/intel_firmware_decode.c
@@ -37,7 +37,9 @@
 
 #include "igt_core.h"
 
+#ifndef __packed
 #define __packed                        __attribute__((packed))
+#endif
 
 struct intel_css_header {
 	/* 0x09 for DMC */
-- 
2.49.0

