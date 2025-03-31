Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A867FC3600B
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 13:36:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624D210E407;
	Mon, 31 Mar 2025 13:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zn5VFDL/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5568A10E403
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 13:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743428215; x=1774964215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SiWe0m0wJBsY6oSQTuMx/5u0WVWFZamhSq+BJm9oBVo=;
 b=Zn5VFDL/Fej76GndJAf3FE+R0FI/8R9O4iXgzj5p6lwTn4vOO/DE+QgY
 V1Z1P+73t/nmqB/EjbtIQlhXuEJYuUMquSZnrzm2rdeWY2bt3IRQBo3af
 3981k+WeYmmk03/s8sTqgpae6NHstXfJX64nefOo9WSONevNnpdDh7HGC
 aRAJhDnXjtpDjIJl6TmLOzUpW24JuFJbuNm6/7OIfmDocNh4rFxr07sk8
 zShTyIWkYigeV9VNg8Ge4oUWPZx7oAuT/T6/Uq5zKl5ZBAd+rILQuGdqX
 OoX3hadbIkG2U5gxTugDQ3bgMvr/kAVlTGb2PkR0Zqg/4wVbP8+KY6k76 A==;
X-CSE-ConnectionGUID: mpdBoa3cTe2T94HuxPAL6w==
X-CSE-MsgGUID: D0i7tAeLRnaH+DEL+Tr0MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="43862962"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="43862962"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 06:36:29 -0700
X-CSE-ConnectionGUID: r6DQetjKSGutoOOaoMNjoA==
X-CSE-MsgGUID: 5/lEWJIpTpiBHKlKiz9HVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="149267426"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.15])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 06:36:30 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v2 1/2] CONTRIBUTING: Add subscription and patchwork info
Date: Mon, 31 Mar 2025 15:34:23 +0200
Message-ID: <20250331133424.35873-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331133424.35873-1-kamil.konieczny@linux.intel.com>
References: <20250331133424.35873-1-kamil.konieczny@linux.intel.com>
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

Add guide and link to subscription into mailing list and link
for patchwork.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 CONTRIBUTING.md | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 81057a2ad..8370451d6 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -63,6 +63,13 @@ Sending Patches
 
   on its first invocation.
 
+- If you plan to contribute regularly, please subscribe to igt-dev mailinglist:
+  https://lists.freedesktop.org/mailman/listinfo/igt-dev
+  When you are not subscribed, please note that your contribution will take
+  more time to reach to mailing list. You could find out if it was delivered or
+  what is a testing status of your patches at page:
+  https://patchwork.freedesktop.org/project/igt/series/
+
 - Place relevant prefix in subject, for example when your change is in one
   testfile, use its name without '.c' nor '.h' suffix, like:
   tests/simple_test: short description
-- 
2.49.0

