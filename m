Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A7DEE0215
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 08:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08CA10E82D;
	Wed, 11 Sep 2024 08:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EoWKhyFR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4DB10E828
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 08:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726042038; x=1757578038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QgCxoghwKeO6Gu2QOYiTdrTowww31zlqd2OxyDHkJ9g=;
 b=EoWKhyFRkL9RlORHuAbRIt81kPDamLLoo3poRp8KTBYqtP7/dKph1Tf8
 pkff8pyeBPQUacsq8nSPmL5lDBBqzKl7nVmNUYxW33rG2Kqp6gKp/fVa9
 fTTESuaIHk9QDfV+t/ju4pJIWgm0fkZMh7htnF7JBCCJtRi9E+guOflqG
 I/+lK7+0V5iHs+0owpJExwEeK0VlwgN75sK2tqJ1BD+dcJI5e0VmPmWIy
 u3aZtITRfjmk0b2Xn5wu3rDRR3Jl00LM+ZZLvJQWMsu5sDcZKfV+ygjfF
 TFLqYiPvXnuweMf8J4BX/yA1jv9h25ckYOWMKEzsoLtjZrAWHMQzNv+Nk Q==;
X-CSE-ConnectionGUID: r6CajFUSSemMK2BOMsSryg==
X-CSE-MsgGUID: zec0gJuFQkeZimQMtm7Qnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="25022601"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="25022601"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 01:07:17 -0700
X-CSE-ConnectionGUID: +dslOXT2TDO9dydTPhzIBA==
X-CSE-MsgGUID: 27+kiK7cRSWQ+IyjTEYz6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="72271554"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 01:07:16 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [i-g-t 2/2] Revert "lib/igt_psr: Fix PR state check for DisplayPort
 connectors"
Date: Wed, 11 Sep 2024 13:27:45 +0530
Message-ID: <20240911075745.635978-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240911075745.635978-1-bhanuprakash.modem@intel.com>
References: <20240911075745.635978-1-bhanuprakash.modem@intel.com>
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

Causing regression in CI BAT.

This reverts commit 196c2cc9c945a66bb542fdefcf491ea62c1f885e.

Issue: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2748
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_psr.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 4e44f44e6..e3e7577eb 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -79,9 +79,8 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 		c = output->config.connector;
 	}
 
-	if (c->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
-		state = "SRDENT_ON";
-	else if (mode == PR_MODE || mode == PR_MODE_SEL_FETCH)
+	if ((mode == PR_MODE || mode == PR_MODE_SEL_FETCH) &&
+	    c && c->connector_type == DRM_MODE_CONNECTOR_eDP)
 		state = "SLEEP";
 	else if (mode == PSR_MODE_1 || mode == PR_MODE || mode == PR_MODE_SEL_FETCH)
 		state = "SRDENT";
-- 
2.43.0

