Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB6ACA5FA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 10:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D224810E96B;
	Tue, 29 Sep 2026 10:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IpTy6GVV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725FF10E9D7
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 10:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790679484; x=1822215484;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gFlPMVrGiXhryKZGIUiQZIbwfnh4E8tSqGFYkgJDP/c=;
 b=IpTy6GVVSI9uRakSOdwbBLU0y8ug6p6VdCJFa7jOYSEYOgZ3aOym6KJk
 oUkKS6NMdprlkdKDsnhqxcE4+T7sNfW9JwIvqhaB8ER4Z0hBBWoh1w8ks
 sDxdJz53diPnfThkFADrvVGjz9b2Do5d4gMHV1bkqeR3eUrt/kwxtF6J3
 WTIN7VMn/Jr8LFsgmr7T24WnpAtZ6pflh3+uX49N2CcbeEXQY8EZrStyw
 98+mTSlGm/LT/W8/LDz7MTR53rex0pUco/dEZ0qan3BYlOBmKjVqs1Ivj
 l9K3tZznJdUBwtmN5Te6ezsUxdzM2r0+ZUOrXSoJVO14tSMEk8Cnmb3aH Q==;
X-CSE-ConnectionGUID: JhWEJUTeQQOkS1SJmHYj6w==
X-CSE-MsgGUID: WLD9uM+BR8uU2TV0T+qr6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101918984"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="101918984"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 03:58:03 -0700
X-CSE-ConnectionGUID: pQlOzcgTTLy8B9Ylkq0D7g==
X-CSE-MsgGUID: 67pvioa+SJa8XsahYbibEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274433192"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.10])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 03:58:01 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] Update MAINTAINERS
Date: Tue, 29 Sep 2026 12:57:55 +0200
Message-ID: <20260929105755.49524-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

Add Swati Sharma.

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e0ea8f2f3..e3b810dad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4,3 +4,4 @@ Kamil Konieczny <kamil.konieczny@linux.intel.com>
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
 Karthik B S <karthik.b.s@intel.com>
+Swati Sharma <swati2.sharma@intel.com>
-- 
2.55.0

