Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AD2ECE58B
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 07:39:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A9410E72B;
	Tue, 10 Sep 2024 07:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gdXvZ7b3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB07E10E72B
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 07:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725953984; x=1757489984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZD+b2WGsjp7ykZnN5OUMyUZjsBnK/B+5z6MWwgKw/K8=;
 b=gdXvZ7b3rPdc+v89+Vh+5KUSsPdVZOErxw+qUVQly89jfMvzBXo41KSy
 iknoFEJiVKl6AfF7ua/6BOxRGcg5Ir8xKxjyLqpC4p1yVnAIPYC+U1fec
 P+jumy4age4CLXgQLGh6YZNs2VW+h02lQeL2I4T/9ntRjmE+GYKbc21+y
 7vsCNY9QsCIL8ByKSaTl+BGH9vYM909eQ9pNf4XOfDigM4drra5HthO1I
 jeV0uarcvfXlnnioYNv54anWsT54GhjOSPouXOv94lH6qFidRjV4YiLOw
 YkJHPbRt95iSJSlK1OqqZ94rtZA9jrS9RXFomURaI50tL2cqo2m+DEn9h A==;
X-CSE-ConnectionGUID: iqAujkvDQGyMQu1c0KtZXQ==
X-CSE-MsgGUID: 0xFxJVWdSjOKMS9BuqBvxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24843755"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="24843755"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 00:39:44 -0700
X-CSE-ConnectionGUID: i0IXp/rBQHCfB7zzFKR34g==
X-CSE-MsgGUID: 0Do4+gyKRUGTjKOU1CLsiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="90233651"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 00:39:42 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH v2 2/2] lib/igt_psr: Fix PR state check for DisplayPort
 connectors
Date: Tue, 10 Sep 2024 13:09:08 +0530
Message-ID: <20240910073908.1608661-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240910073908.1608661-1-ramanaidu.naladala@intel.com>
References: <20240910073908.1608661-1-ramanaidu.naladala@intel.com>
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

The PR state check logic has been updated to handle DisplayPort
connectors.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/igt_psr.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 2677d4822..09107cd5b 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -79,8 +79,9 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 		c = output->config.connector;
 	}
 
-	if ((mode == PR_MODE || mode == PR_MODE_SEL_FETCH) &&
-	    c && c->connector_type == DRM_MODE_CONNECTOR_eDP)
+	if (c->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
+		state = "SRDENT_ON";
+	else if (mode == PR_MODE || mode == PR_MODE_SEL_FETCH)
 		state = "SLEEP";
 	else if (mode == PSR_MODE_1 || mode == PR_MODE || mode == PR_MODE_SEL_FETCH)
 		state = "SRDENT";
-- 
2.43.0

