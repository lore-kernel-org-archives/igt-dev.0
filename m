Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6E6C5320E
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 18:02:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A18810E0ED;
	Sun, 25 Aug 2024 18:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PoYQ8bIv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0662710E0ED
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 18:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724608964; x=1756144964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HxovG7SKjrn4MuoNrWJ46ntD1t4NKLJS+Ijc0aYuRyM=;
 b=PoYQ8bIvcAS4Edmbm9LObkm5S7dqL1xJ7okaPvMOkUpoZhS+fHy7nXPF
 5Vbtu1n2C9gns9ccKHHteEZ4pIVos4Ya1FsE/BaVbhEYJRAAPYqX/50Sg
 BzGZvnJQOvxoCnhY5IfAN5kkTN+Y0FeAR5jMDkNBgWShlpFglCNdFmFUB
 DO29ke5JRZJ94ZShbc8cmgJl0HG7sSMIcWTfoQ9DMr8/W1zneeJlG1gM1
 5R5Nk0nkzwLcD8acZuEPUHFYTVkFkw/x3iLOpyQEiuHmCwWXCAcO1dIMA
 9wDcKLt7OLI1afy3MNkobqhPeGJkDbTTdogjMydIHkGn7KL5sXtyjP4b9 g==;
X-CSE-ConnectionGUID: 7F0w/YynSfyCPQa4DAtMlA==
X-CSE-MsgGUID: d6Rn85i6QOiNLcmXTe5qmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="25917464"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="25917464"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 11:02:44 -0700
X-CSE-ConnectionGUID: 6pVbwmrZQ+yjhl14qnuA7Q==
X-CSE-MsgGUID: pPnfFFvYSFOzYRfK9W3jAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="85488320"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 11:02:42 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 12/14] lib/igt_kms: allow set and reset value to be same
Date: Sun, 25 Aug 2024 23:44:22 +0530
Message-Id: <20240825181424.4034541-13-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240825181424.4034541-1-kunal1.joshi@intel.com>
References: <20240825181424.4034541-1-kunal1.joshi@intel.com>
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

allow set and reset value to be same, let the caller handle
this scenario instead.

example scenario where this is required.
i915_dp_force_link_rate should be auto before starting test
should be auto at exit

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b7511ccfc..5427a849e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1572,9 +1572,6 @@ static bool connector_attr_set(int idx, drmModeConnector *connector,
 		return false;
 	}
 
-	if (!strcmp(c->value, c->reset_value))
-		connector_attr_free(c);
-
 	return true;
 }
 
-- 
2.43.0

