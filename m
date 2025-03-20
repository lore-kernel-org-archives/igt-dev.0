Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DD7C28B30
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 21:57:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488DB10E2EA;
	Thu, 20 Mar 2025 21:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A8iOWLEE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F9B10E2EA
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 21:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742507822; x=1774043822;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZTxX5V0XC0qbhJsWKwDyPoVX35jtuRd6oXJChS4PBPo=;
 b=A8iOWLEERyIIGgUfaPbCZazsTSBL7W9J5crrMkFpfxt/iW2aWWlGG7u2
 vWJ2NL0ZQrXGkws9ZiFz/ZozjyQfmlARGBlSgZR3DQCBUQQ3IcYqI6+fW
 xTDUDExCTGhLWXH7xXgPAh5psaVhpV5GuSB8dz9Axvj3NgtnOvIBZjNok
 kYJro2Rg5XcByOOafVF7YRRatcRAL8LSmA3pxS1tlwLujJ1+LXeSMTvqY
 IVWbGhyiO97HKPRzY8vq2F52FXEBzIUnwMzgKEIkhHCC5f5jDdCESoXB7
 fqRfLmwtACv4jmqDUdiYvNFGm3a8lGwkIomr38qfno4aTNBe15G4HVErG A==;
X-CSE-ConnectionGUID: I0f6smawQFm+pWYwtFlFqQ==
X-CSE-MsgGUID: Q/g7AeQnQV2y3dLirmrOlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="47642917"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="47642917"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 14:57:01 -0700
X-CSE-ConnectionGUID: rUsLkd0GTn6sVv4XejQI7Q==
X-CSE-MsgGUID: hhXQYrDIQL29w9KzU81+ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="123211400"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 14:56:59 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com, animesh.manna@intel.com, jeevan.b@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] lib/igt_psr: Fix PSR active check for DisplayPort
 connectors
Date: Fri, 21 Mar 2025 03:26:42 +0530
Message-ID: <20250320215642.3175042-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/igt_psr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 83c21e6ba..e7b630096 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -122,7 +122,9 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 
 	igt_skip_on(strstr(buf, "PSR sink not reliable: yes"));
 
-	active = strstr(buf, state);
+	active = strstr(buf, state) ||
+		 ((c->connector_type == DRM_MODE_CONNECTOR_DisplayPort) &&
+		  strstr(buf, "SU_STANDBY"));
 
 	if (active && output && sink_status_checks()) {
 		active = psr_active_sink_check(debugfs_fd, output);
-- 
2.43.0

