Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA2ACF857C
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 10:23:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990D410E73C;
	Thu, 20 Nov 2025 10:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNd6u/YR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D0710E73C
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 10:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763634206; x=1795170206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WsRXX1FOOMMouIE279DzYIyT+n/PelHJSwUoBOd6O/k=;
 b=jNd6u/YR5e5h/pZZ6y6D4M2lsw5a+bXa8oamBSCamnAh3vsGQSb9fJxn
 MzcGnoBJe2SJOqhTsXpZ+XD1v8qMCmDVpNwOVOBOA3Ve+uTrP6nHGou8B
 GtJjRMztHJJ6Bp1zerB4dKR0OnI406NSlnPbWwWf1MBI2abWuUk3QwCe9
 mnaSugsvgnCQzW1OfyCcse2fCdk2zf7GipU6XgOf+DHiEW85cq4GIBEKG
 LxBkZGugJB0fa93jOyAILKeWcajSZC2qbYchMuchuZsKNgqaU5fsVhCwM
 rYScYJJzzbc/t66SdCz8VtcsKxn6K8/t3Pyz44RQlgiPeKu0olo+PjMSx A==;
X-CSE-ConnectionGUID: lpAE1B4JQ+qafcleVFjFaQ==
X-CSE-MsgGUID: Fd2PeVEHT5+WzTSJLAJsLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="77161552"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="77161552"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:23:26 -0800
X-CSE-ConnectionGUID: rp9Rn6+IRXiqVpP3LCFi/w==
X-CSE-MsgGUID: o5uz1JHgQTiRaYXl/DnU/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="221965996"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.6])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:23:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 1/2] lib/igt_kms: Always return CRTC index from
 kmstest_get_pipe_from_crtc_id()
Date: Thu, 20 Nov 2025 12:23:13 +0200
Message-ID: <e373ebb81bab94b68423a896aae05edf2b436ad9.1763634045.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1763634045.git.jani.nikula@intel.com>
References: <cover.1763634045.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

All users of kmstest_get_pipe_from_crtc_id() actually need the CRTC
index, not the hardware pipe. Stop doing the CRTC index to hardware pipe
mapping on Intel devices.

kms_setmode.c does use the result also for logging, which would now be
incorrect if pipe != CRTC index. But even there, it functionally
requires the CRTC index.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 8973ffdb22a6..0ff56653a4a7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1272,8 +1272,7 @@ int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id)
 
 	drmModeFreeResources(res);
 
-	return is_intel_device(fd) ?
-		__intel_get_pipe_from_crtc_id(fd, crtc_id, i) : i;
+	return i;
 }
 
 /**
-- 
2.47.3

