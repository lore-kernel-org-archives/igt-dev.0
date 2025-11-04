Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF70ACCFA04
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 16:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05F710E292;
	Tue,  4 Nov 2025 16:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AaUvokXF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2C010E292
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 16:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762274537; x=1793810537;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZOck2s/iVXNVrgl3HyC3SM+44+kYb7L8fGwtrcoKP3Q=;
 b=AaUvokXF0fH5JuzgR698MXQucSxpYLJ37yz0htrlAViDwYRPLiYHfi/G
 Bb9Za5U65/oemKzoprIV/FnmS6XZk3BZrDEWl5hhCMYg83UTUp0uw+jRG
 n9zA/vZq7tOvX5ZNA3zjDokYWclOYIdPJXPbIPv5/oYKhXJpcN++NPoR0
 LE2wR+gU3CRWwjcgJd52SWZGj/5o2DqibvUxyIPRfQXrKZUkQbzYScdhF
 szkq0cH75eP7/15xC0XoHXq12tZ2Z66/G/CFQkWp2WllarQqTrC2o2UT8
 xO6uncYxkPLIMI2l2e5hADFhHADM6ei2ae42c8ZVfzfSEKX6dLoHau3S1 g==;
X-CSE-ConnectionGUID: A5LxXdJ0Q9uYFFJWGnJ/lA==
X-CSE-MsgGUID: hOe55HZzTCmLfJS6izVO0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75055204"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="75055204"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 08:42:16 -0800
X-CSE-ConnectionGUID: zbR9slStQleEt6f662Pkbw==
X-CSE-MsgGUID: 6ub4GvbvTzWQln0Ro2CAoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="217857351"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 08:42:15 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH i-g-t v2 1/2] tests/intel/xe_configfs: Test invalid engine
 with valid class
Date: Tue,  4 Nov 2025 08:41:42 -0800
Message-ID: <20251104164141.712312-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.51.2
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

ctx_restore_* expects only the engine class. Pass in an invalid engine
with a valid engine class to make sure it's correctly handled in the
kernel.

Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_configfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 7a7a7edf4..ecba69dbd 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -177,6 +177,9 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
 		{ .test = "invalid-reg-addr-only",
 		  .in = "rcs reg 4F100",
 		},
+		{ .test = "invalid-engine-instance",
+		  .in = "rcs0 reg 4F100 DEADBEEF",
+		},
 	};
 	char buf[4096] = { };
 	char file[64] = { };
-- 
2.51.2

