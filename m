Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DC2C35FFF
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 05:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A9710E29A;
	Fri, 21 Mar 2025 05:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+uq8cO3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2681510E29A
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 05:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742535843; x=1774071843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bSRL+8TkdIOWG81APKCQVSMxhjJ91CN+6Vtujwj9LDg=;
 b=O+uq8cO33h78ca0s//321GI6+tHXqM0sr+9AAZQbh0DbqvxGJ0D5wy9R
 zSiDHjS5EEk2eG1cwf3ye72KFtTH3F89ONQAwksEKMWyApr6tJyMqM16s
 F3zr0nUP7RAI+x1WPEwAgc3gpyYrKHbsD3soBBxV35wqA5406p4VhaWZq
 w94Yk+xFp88pk8IGR5DAtzHZJpZdDGJG1lwJqbDquvQlMMY3Xuo/ftSPb
 TFI7XZBGcsQj+J1oHinr38Jxty95I66k9kdVzPSWPz5djcRF7Av7OIOAs
 UFWPRzIA0f0bWnchgC6tTCraemGL5X2GZm4HxvGzwN55gBIdgX1ra/Sot w==;
X-CSE-ConnectionGUID: Thgrs+n4TNGVF5N/NrA1ew==
X-CSE-MsgGUID: VO5BPCSmQC6yUcbvfPzRmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="54427320"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; d="scan'208";a="54427320"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 22:44:03 -0700
X-CSE-ConnectionGUID: 6iZREv8+Th+mVGhbtTKjAg==
X-CSE-MsgGUID: 38qURV29Q0i4MBjdaJ+5nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; d="scan'208";a="123114661"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 22:44:01 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH v2] lib/igt_psr: Fix PSR active check for DisplayPort
 connectors
Date: Fri, 21 Mar 2025 11:13:45 +0530
Message-ID: <20250321054345.3181622-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320215642.3175042-1-ramanaidu.naladala@intel.com>
References: <20250320215642.3175042-1-ramanaidu.naladala@intel.com>
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

Update PSR active check logic to correctly identify active
state for Panel Replay on DisplayPort connectors.

v1: fix warn issues on prev version

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/igt_psr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 83c21e6ba..1dac8df54 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -122,7 +122,9 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 
 	igt_skip_on(strstr(buf, "PSR sink not reliable: yes"));
 
-	active = strstr(buf, state);
+	active = strstr(buf, state) ||
+		 ((mode == PR_MODE || mode == PR_MODE_SEL_FETCH) &&
+		 strstr(buf, "SU_STANDBY"));
 
 	if (active && output && sink_status_checks()) {
 		active = psr_active_sink_check(debugfs_fd, output);
-- 
2.43.0

