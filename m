Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51D5C3600B
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 19:00:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615E110E4DA;
	Tue, 25 Mar 2025 19:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBB2dRr2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435DE10E4DA
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 19:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742929234; x=1774465234;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AQr5gztHe3yq/wgm1Pf52DGTmdSA3D5Pr9/GtXBZHBU=;
 b=mBB2dRr282kb7Vzj6oBBS4tnd0uARyZGg/i57vj7XSn2ZBvvivSl+jzt
 VGpzHHP5rjGeX8AG0f8H95a+SQR3VQwiDt5DqaxRMoWhcksLcoaWnqiVL
 Fo5J72g9HvpkGMJ01EzOwsHEjU4vrda/5gayfY3br2R7OAPx5ChwwgCqi
 A/Ly/gAU4QGa1Qat1o7jsapSi4iRClfWwE27WFEh6FbIFcNBauvBbj7WT
 ssEbt3PCKRqNaqZxq2IhNHgWfIwmv91tqUZoyjcbRUFzry5lpcWsSQQM1
 IgLPv7k2olFWCSg+28OV+C2vGCRFJcogsy2wWyMAmMsWpkERz/BhF3Sss Q==;
X-CSE-ConnectionGUID: HXBUgpejTTWmhGJ3goWRvw==
X-CSE-MsgGUID: DpNjHejQSDO8gWU5vmWzmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="69556923"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="69556923"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 12:00:33 -0700
X-CSE-ConnectionGUID: aEj12ZcmS2ySw4txaU6UzA==
X-CSE-MsgGUID: 9fGtDRFGRdaEq5HKyWQ1uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="124276995"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 12:00:32 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v3] lib/igt_psr: Fix PSR active check for DisplayPort
 connectors
Date: Wed, 26 Mar 2025 00:30:13 +0530
Message-ID: <20250325190013.3317526-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321054345.3181622-1-ramanaidu.naladala@intel.com>
References: <20250321054345.3181622-1-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Update PSR active check logic to correctly identify active
state for Panel Replay on DisplayPort connectors.

v2: Rejected.
v3: Fix null pointer crashes by adding a change to prevent
    potential null pointer dereferences.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/igt_psr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 83c21e6ba..6e5f29b24 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -122,7 +122,9 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 
 	igt_skip_on(strstr(buf, "PSR sink not reliable: yes"));
 
-	active = strstr(buf, state);
+	active = strstr(buf, state) ||
+		 (c && (c->connector_type == DRM_MODE_CONNECTOR_DisplayPort) &&
+		  strstr(buf, "SU_STANDBY"));
 
 	if (active && output && sink_status_checks()) {
 		active = psr_active_sink_check(debugfs_fd, output);
-- 
2.43.0

