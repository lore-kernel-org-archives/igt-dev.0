Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F60FD116E2
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 09:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B8310E7FB;
	Thu, 27 Nov 2025 09:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQIojO0L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E088F10E7FB
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 09:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764237072; x=1795773072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=apdOf3PSxol20bhy4bnJU8HpAfqPujZrDBhQNiQZIZ0=;
 b=GQIojO0Lye9E9drHZCauXiegKJUMFJTQYxdrTcTZ9CSdGisIREA2wVGh
 uLzcugQDvUFvEFc/oOynw2fWdu8UsyL7bqZJB05tp0o7LpSFV9xvjRnZU
 qUfhNw2J4evkjc3ktgTPw2NKa5t61tniYimiRwBhkZEOpAh4xvzn2W8M9
 ACYaZvdPRa5AVBwLa3r3oBTXJJ7jq/KxafHtyDrlA6aKyHZqXaB1krRbl
 s6CDL8oryRKf3GdB5bRJROAhCebbgGwdoIEmtGWTAP3hTgKE3RhFcwqpH
 CqN0mMj8rc79ILlWtkIriv6Cbf9+FTUQVPQYZy3xsfq+ihSjVakZa63ru g==;
X-CSE-ConnectionGUID: 7vhXNmpgTnS3IiOsd+TGoQ==
X-CSE-MsgGUID: zyGkpBirTuG3wKNB1MHILg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65467982"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="65467982"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:51:12 -0800
X-CSE-ConnectionGUID: fp2ZzsT7TVS9tlLE+/0HBQ==
X-CSE-MsgGUID: FESXFP/FTnyApQRSrVSkIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="194001875"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:51:09 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t 1/2] tools/gputop/xe_gputop: Close card_fd after engine
 population in xe_populate_engines()
Date: Thu, 27 Nov 2025 15:10:42 +0530
Message-Id: <20251127094043.3916839-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251127094043.3916839-1-soham.purkait@intel.com>
References: <20251127094043.3916839-1-soham.purkait@intel.com>
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

During the engine initialization for a specific device in GPUTOP, IGT helper
functions need card_fd to access each engine and respective configs.
These are required in obtaining the busyness of the respective engines through
PMU in GPUTOP. But for KMS tests no other DRM client should run while it is running.
So once the required configs and engines are obtained, the card_fd is closed
as opened card_fd in xe_populate_engines() makes appear itself as DRM client.

Fixes: c8106465683f ("tools/gputop/xe_gputop: Add gputop support for xe specific devices")
Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tools/gputop/xe_gputop.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
index bb2caa6ea..69818cbdc 100644
--- a/tools/gputop/xe_gputop.c
+++ b/tools/gputop/xe_gputop.c
@@ -197,6 +197,8 @@ void *xe_populate_engines(const void *obj, int index)
 		engines->num_engines++;
 	}
 
+	close(card_fd);
+
 	if (!ret) {
 		errno = ret;
 		return NULL;
@@ -263,11 +265,11 @@ int xe_pmu_init(const void *obj, int index)
 		fd = _open_pmu(type, &engines->num_counters, &engine->engine_active_ticks,
 			       &engines->fd);
 		if (fd < 0)
-			return -1;
+			return fd;
 		fd = _open_pmu(type, &engines->num_counters, &engine->engine_total_ticks,
 			       &engines->fd);
 		if (fd < 0)
-			return -1;
+			return fd;
 	}
 	return 0;
 }
-- 
2.34.1

