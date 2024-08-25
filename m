Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6834AC54731
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 19:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1219E10E122;
	Sun, 25 Aug 2024 19:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BWPPQKR5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BCC10E11B
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 19:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724615673; x=1756151673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HSAoTlSnS5qMHkm2G1Dv9QoD4up2prOjpD5sKUkXW/c=;
 b=BWPPQKR5UfXrvk5hxbffHkcMwHZ/0TB+DS0pb6CgG3nb24/UNfvbJrzs
 zvTXyqpavwb5Tzp2zZOqtX64PK7A2Mw/fBshng6PgrSogVViS56oaZg8F
 h1g0yLDAim2146769gXbOiMzphKlJFZ/7LEshXLef3zetBHjQNYgvjzT8
 OTOiS7Ief6OfwfAedG8FM+ULlP1Cc0uF8PpaJsRXD8S408AK7fpeVBt44
 lACLf6zgHQsYgbkpTwYztuz15XUMxO+fyb3ytjhOuzMmUm0znQ2243Q6P
 KHx1qAgrAPwvvIg8OxsVCs55yODlp+0+4UBbmN7Dry50t++G9UtuRwYxx g==;
X-CSE-ConnectionGUID: xrGuSA8rRJe7MDZk57yVsA==
X-CSE-MsgGUID: /2Qu+InDRQKgsxHYRlkKeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33591509"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="33591509"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 12:54:33 -0700
X-CSE-ConnectionGUID: szELM+NERv24xU61CIwYQA==
X-CSE-MsgGUID: dPkxCOUoSNeIyfLArXegmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="62283713"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 12:54:32 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 12/14] lib/igt_kms: allow set and reset value to be same
Date: Mon, 26 Aug 2024 01:36:10 +0530
Message-Id: <20240825200612.4036178-13-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240825200612.4036178-1-kunal1.joshi@intel.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
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
2.34.1

