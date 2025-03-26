Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1541C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 13:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF8F10E6D1;
	Wed, 26 Mar 2025 13:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/ogaiZD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56E010E6D3
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742995622; x=1774531622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YfML6wbIIuCLEzpTnYghRnRPehOhOgr8iNtoGrCveg4=;
 b=f/ogaiZDxRmnfBxAwIwAcpGptsIoYkQfu0qEa3ZKcGrT+2dQgWWrNm09
 FczDTztf6tU7c68X89kfGqgv5M9rYCxlIgzaIhwZAcpamLyE/s3WWWAQw
 K/Tf/RbTLimCjCaamKoOEVKWehNQfzGqd8bRfmI1J3KmvfMtsp/OtSOGO
 jr/RL4kLvztJrkqfmico19rLVU+Kubv9qkVdJZAlTQ6lZUj8QpoIreN+U
 nQfDhMCkHzVSBxR/EmJRnupXLj2XhxfrgUKxTSqRBTS+PioKATaTv0Q9+
 /EgMnuiZ5G1rOBgUKOwdFdctmrp2vymed++ZV3z77svEtQNfwlcXwthcs A==;
X-CSE-ConnectionGUID: F2St4pSCSxmGXp3izTUZEg==
X-CSE-MsgGUID: VRWTA7U7TMeFAoqaBXlKLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="54486883"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="54486883"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 06:27:01 -0700
X-CSE-ConnectionGUID: yBMGhtouQ1y80tj2otqAqQ==
X-CSE-MsgGUID: h2/HqTIeSRGrilNRjf0IHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="129610480"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 06:26:59 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v4] lib/igt_psr: Fix PSR active check for DisplayPort
 connectors
Date: Wed, 26 Mar 2025 18:56:41 +0530
Message-ID: <20250326132641.3357884-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325190013.3317526-1-ramanaidu.naladala@intel.com>
References: <20250325190013.3317526-1-ramanaidu.naladala@intel.com>
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
v4: drmModeConnector pointer `c` is now initialized to NULL.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/igt_psr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 83c21e6ba..3d8f1949b 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -92,7 +92,7 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 {
 	char debugfs_file[128] = {0};
 	char buf[PSR_STATUS_MAX_LEN];
-	drmModeConnector *c;
+	drmModeConnector *c = NULL;
 	const char *state;
 	bool active;
 	int ret;
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

