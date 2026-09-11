Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABD9C88E4D
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 21:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F2010E1F5;
	Fri, 11 Sep 2026 21:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHTjQOiF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CF310E1F5
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 20:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789160299; x=1820696299;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/EYo7g9+HIP03bkacWYPiQyusUdvvoXBzJbgP+t6C8g=;
 b=dHTjQOiFrxf8QXoex9RB4c1JZOBis1Uu62YQHUTJh9qoQLNyWxwGMFBi
 uA7bFf5fxFwpa+57XvuFZ1k7NwNrguAhjRm+wmwqtWcZW0cha/JqAZOJw
 y7y/HpJ5B1+KNNlo5uAlFcNH6qxRNT3V3gdXhPHDCLAFIMpuvztL/zQF+
 Kx9aBWD7g2BttFIJC9WOPfKcbe7VONR0KXmvqRQYPGOjmOma07XMjdbQe
 87Sro3P1Hsy36Xf0pSjpX3v2bK6mLyxxMeSfguBsIcuCgzq3q+136gIAg
 7sUiV9wS0dw+coX7/xokSaKB7HUjmbP3SkPpTD/o0yvcUMQaDY7vXn7jl Q==;
X-CSE-ConnectionGUID: FEdwZQUBToaEMWlw0pK7tw==
X-CSE-MsgGUID: qt4rWIJ7QamPJAKS1HY+3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="138975"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="138975"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:58:19 -0700
X-CSE-ConnectionGUID: WLmvEIIdTCaiaR43JGSEMQ==
X-CSE-MsgGUID: hvWu+TkzQOSvG59mXuHWuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; d="scan'208";a="310293737"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:58:18 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v3 8/9] lib/dsc: Handle missing max slice count capability
Date: Sat, 12 Sep 2026 02:37:08 +0530
Message-Id: <20260911210709.943683-9-swati2.sharma@intel.com>
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

Treat a missing DSC sink max slice count debugfs field as zero.
This makes joiner tests reject the output when the connector
entry is unavailable instead of aborting while parsing an empty
buffer.

Assisted-by: GitHub Copilot
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_dsc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 781b9415d..ffea285c8 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -370,15 +370,15 @@ int igt_get_dsc_fractional_bpp_debugfs_fd(int drmfd, char *connector_name)
  */
 int igt_get_dsc_sink_max_slice_count(int drmfd, char *connector_name)
 {
-	char file_name[128] = {0};
 	char buf[512];
 	char *start_loc;
-	int max_slice_count;
+	int max_slice_count = 0;
 
-	sprintf(file_name, "%s/i915_dsc_fec_support", connector_name);
-	igt_debugfs_read(drmfd, file_name, buf);
+	if (!check_dsc_debugfs(drmfd, connector_name,
+			       "DSC_Sink_Max_Slice_Count: ", buf, sizeof(buf)))
+		return max_slice_count;
 
-	igt_assert(start_loc = strstr(buf, "DSC_Sink_Max_Slice_Count: "));
+	start_loc = strstr(buf, "DSC_Sink_Max_Slice_Count: ");
 	igt_assert_eq(sscanf(start_loc, "DSC_Sink_Max_Slice_Count: %d", &max_slice_count), 1);
 	igt_assert(max_slice_count > 0);
 
-- 
2.25.1

