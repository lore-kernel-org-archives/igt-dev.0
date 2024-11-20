Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F6CD743EA
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 22:35:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3466310E0E0;
	Wed, 20 Nov 2024 22:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JnW71LeG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB7310E0E0
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 22:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732142159; x=1763678159;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4iTH3RlS1YNxnNgkFV8QhjMyFV8P+keEW/D6Qr9k1RI=;
 b=JnW71LeGeFI6jhSQYuGVdhM59VeR4R/TZwcmIXV05Kc6pZpEBh+omo95
 d0Kh4n2uHBxRqRCfpWv0JlScyIkyc3w9EDksWT0H/MQTZLmq0r+K2tYjg
 +nTXOfl02ZOmsf5DQpyaIv7/WpDdpjK75tp27lThtiK3JC9N1BXBzi+o6
 i1Dc6v315N9vfvZ/3nfRabaKR7jw3brk8cdn130o14leOEuyRhigaL3V3
 DL0hqaaKpDnBjW0GlsFmTvq6vT5QgrBwId4wPjwpgKjJtaHvM2d0WnjcJ
 oJGE1ueAJbUiktFEfxA3fkaMCt8oNZ5kY2ZVDG6uD5T0ZDEUGaecA7sAI g==;
X-CSE-ConnectionGUID: YRdTxwsbTVC0CuXqefjtxw==
X-CSE-MsgGUID: R0u19witSKWj7cj1Hs0Weg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="42736485"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="42736485"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 14:35:53 -0800
X-CSE-ConnectionGUID: qfl9mbcRT+O6NdDghV9aLg==
X-CSE-MsgGUID: YrA7tf1rRzKyugJE8fQX9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="95120233"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 14:35:52 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t] lib/intel_device_info: Use per-thread device info cache
Date: Wed, 20 Nov 2024 14:35:46 -0800
Message-ID: <20241120223546.145304-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.47.0
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

Relying on static variables to act as a cache inside the device info
lookup function is racy for multi-threaded tests since there's only one
copy of the static variables shared by all threads.  E.g.,

    Thread 1                Thread 2
    ========                ========
    cached_devid = devid;
                            if (cached_devid == devid)
                            return cache;
    cache = ...

Indeed, running xe_exec_threads repeatedly turns up cases where the test
fails with "Platform is missing PAT settings for uc/wt/wb" because a
racing thread wound up getting 'intel_generic_info' rather than a proper
device info structure (although it can take a couple thousand tries to
hit this specific race condition).  CI also sees this from time to time,
but the bugs often get closed as "cannot reproduce" because the failure
rate is so low.

We're probably going to be reworking this code completely in the
not-too-distant future since we really need to be looking things up from
the GMD_ID query rather than using hardcoded device ID table lookups,
but for now we can apply a quick fix of just making 'cached_devid' and
'cache' thread-local so that we're not racing on a  shared copy.  Simply
swapping the order of the assignment of 'cache' and 'cached_devid'
probably would have also worked around the specific race condition noted
above, but it would have left tests susceptible to other race conditions
in cases where a multi-threaded test is actually looking up different
device IDs / GPUs in its multiple threads.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1600
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1535
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3236
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/intel_device_info.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 546b9c65a..d38dc415d 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -658,8 +658,8 @@ static const struct pci_id_match intel_device_match[] = {
  */
 const struct intel_device_info *intel_get_device_info(uint16_t devid)
 {
-	static const struct intel_device_info *cache = &intel_generic_info;
-	static uint16_t cached_devid;
+	static __thread const struct intel_device_info *cache = &intel_generic_info;
+	static __thread uint16_t cached_devid;
 	int i;
 
 	if (cached_devid == devid)
-- 
2.47.0

