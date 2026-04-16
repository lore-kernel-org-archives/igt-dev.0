Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F854F8A14D
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 09:26:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327E810E098;
	Thu, 16 Apr 2026 09:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YxBoXAOb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A242B10E098
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 09:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776331601; x=1807867601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N6EE0b8MGhyj1a0jmX+60uSu836oq29R0QIdf7ze8pQ=;
 b=YxBoXAOb0OrmsAQq83teyBXYvp3aoXWD7i8DYZUb4zFKIqShaZWL48W2
 RlvrBsdgU58JUxEOXhNAwTZ+6hGSg3Fy6iJJdZKIXatRSsXCktOztxju0
 EiCniz3EnSp9l5MYIYQc2RbW8rtQu4ez1VRxfBGCA0kubUQ3esLbeTL/7
 qFUPIU97F7fY1OgxalGBSIUo7HeCHo202TKbDjT+VCv6dOO4/6o9a9s3l
 wW2+LKMMPThtd57IXlzOOZ9Z0+XO9SrI+csuZ9qi1X8SpVQ5t6qKq8POu
 74a6BIBv6OT52mUQRBxRsrWRQ6SMRW6Aq7v1eJ6/SWvV0EEC1havR42+4 w==;
X-CSE-ConnectionGUID: ZboaE0zDQcKqKsW/5C2RPw==
X-CSE-MsgGUID: hMhPTErBRouKOxxMK40g+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88775922"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="88775922"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:33 -0700
X-CSE-ConnectionGUID: kme2xcBYSOylX8Aezmy63g==
X-CSE-MsgGUID: h76TKbfNT962WeGtBVSWnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235063004"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.194])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:31 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jani.nikula@intel.com
Subject: [PATCH i-g-t v3 06/11] tests/intel/kms_fbcon_fbt: use a bigger buffer
 for fbc status
Date: Thu, 16 Apr 2026 12:25:54 +0300
Message-ID: <20260416092559.88735-7-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416092559.88735-1-vinod.govindapillai@intel.com>
References: <20260416092559.88735-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

As the FBC status now include plane specific FBC status as well, we
need a bigger buffer to capture the complete FBC status. Use the
already defined buffer length to assess the FBC status

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_fbcon_fbt.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index e44be15f6..b36582011 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -33,6 +33,7 @@
  * Mega feature: General Display Features
  */
 
+#include "i915/intel_fbc.h"
 #include "igt.h"
 #include "igt_device.h"
 #include "igt_psr.h"
@@ -81,7 +82,7 @@ static void wait_user(const char *msg)
 
 static bool fbc_supported_on_chipset(int device, int debugfs_fd)
 {
-	char buf[128];
+	char buf[FBC_STATUS_BUF_LEN];
 	int ret;
 
 	ret = igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status",
@@ -100,7 +101,7 @@ static bool connector_can_fbc(drmModeConnectorPtr connector)
 
 static void fbc_print_status(int debugfs_fd)
 {
-	static char buf[128];
+	static char buf[FBC_STATUS_BUF_LEN];
 
 	igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status", buf,
 				sizeof(buf));
@@ -109,7 +110,7 @@ static void fbc_print_status(int debugfs_fd)
 
 static bool fbc_check_status(int debugfs_fd, bool enabled)
 {
-	char buf[128];
+	char buf[FBC_STATUS_BUF_LEN];
 
 	igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status", buf,
 				sizeof(buf));
@@ -310,7 +311,7 @@ static void fbc_skips_on_fbcon(int debugfs_fd)
 		"plane height + offset is non-modulo of 4"
 	};
 	bool skip = false;
-	char buf[128];
+	char buf[FBC_STATUS_BUF_LEN];
 	int i;
 
 	igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status", buf, sizeof(buf));
-- 
2.43.0

