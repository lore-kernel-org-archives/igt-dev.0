Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A54C88E4D
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 21:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A265710E1F5;
	Fri, 11 Sep 2026 21:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UxChqcfQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0501F10E1F5
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 20:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789160298; x=1820696298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S/D84TSvqe1q5JZs0vn2lUoEl62lgpBoF8KfmnzbnhQ=;
 b=UxChqcfQ4sFaFpeFvQewr8RvO/KtvmESIbaUXhSTvYpdk5r+iEAeibe+
 Vb9Hdh7ygOPImc/Rqs9t1tiGSBRHyKT1XeGNc3aFq4pYahpLe8Mm2dXkP
 pTmxikMkhDcp2VzkLLigpJZGBlylEFEYT40E31IxnYzTbi60sCWXis2PI
 Qrki6XEqSdpo9nmb1F41ONx/1uxxMla1cNBKae6biGzQ5+Njbu1dpdywQ
 ZemG7VWGThNxbP5ezNBqthQKdYbShMT+jZ2mt/LAFcEd6dwDpls+rRgOj
 9HhruwL5YDwnkSZrADBeZMb0zhwwl1ASXQ65Mr6hpsAL+YoBfHghCL3O+ w==;
X-CSE-ConnectionGUID: SrPKupiYRv6yAPnIeBqf8Q==
X-CSE-MsgGUID: OIRF5Ed8TdOfsxqZ3vqzIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="138971"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="138971"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:58:17 -0700
X-CSE-ConnectionGUID: G3tA1eJhSI+CiP0KEJT4KQ==
X-CSE-MsgGUID: z0VuEXpRQnKMGMXGT1uAhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; d="scan'208";a="310293730"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:58:17 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v3 7/9] lib/dsc: Handle missing fractional bpp capability
Date: Sat, 12 Sep 2026 02:37:07 +0530
Message-Id: <20260911210709.943683-8-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260911210709.943683-1-swati2.sharma@intel.com>
References: <20260911210709.943683-1-swati2.sharma@intel.com>
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

Treat a missing DSC sink BPP precision debugfs field as
fractional BPP unsupported. This lets the caller skip the test
when the connector debugfs entry is unavailable instead of
aborting while parsing an empty buffer.

Assisted-by: GitHub Copilot
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_dsc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 30a12ce13..781b9415d 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -271,15 +271,15 @@ int igt_force_dsc_output_format(int drmfd, char *connector_name,
  */
 int igt_get_dsc_fractional_bpp_supported(int drmfd, char *connector_name)
 {
-	char file_name[128] = {0};
 	char buf[512];
 	char *start_loc;
-	int bpp_prec;
+	int bpp_prec = 1;
 
-	sprintf(file_name, "%s/i915_dsc_fec_support", connector_name);
-	igt_debugfs_read(drmfd, file_name, buf);
+	if (!check_dsc_debugfs(drmfd, connector_name,
+			       "DSC_Sink_BPP_Precision: ", buf, sizeof(buf)))
+		return bpp_prec;
 
-	igt_assert(start_loc = strstr(buf, "DSC_Sink_BPP_Precision: "));
+	start_loc = strstr(buf, "DSC_Sink_BPP_Precision: ");
 	igt_assert_eq(sscanf(start_loc, "DSC_Sink_BPP_Precision: %d", &bpp_prec), 1);
 	igt_assert(bpp_prec > 0);
 
-- 
2.25.1

