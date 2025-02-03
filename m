Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBDAC02197
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 13:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110EE10E4D0;
	Mon,  3 Feb 2025 13:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wko10V+0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5185B10E06F
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 13:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738589985; x=1770125985;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=umYZ945JjzU/hk8md2NcOrn/u4PzIIqI4vXp/5z/hNw=;
 b=Wko10V+01kd4TJij3kBNnKStq0aYBonCMcnCQjt5aLciYdHLgTTtSQqj
 4wQGIC1vDPrMAk7Vr6cnON6DO+eCYOWLc+yaNYQvIdc+uwac9j8Dw/Nol
 tyH3nyI5WLD0arCt16XGJU9aDqnKhwrKM7R2+ooV+dGJUOaJ+N1LE0y4A
 hVRef1G83fSWrzy0yU361Il5vABMaWssAzw8k08OVOSGZ4q04dleqrjaC
 liNsGvCANx2W71hK8Z+gHT3wnnstA5SoqJPgl6Ge5C/Bdy/Sz6yb2fsrU
 fT28JOyFnvFo7M2zXcnW19r+EifV6lhxArjNx7WZfHqgqP9n5D1O4IhOZ A==;
X-CSE-ConnectionGUID: qHucmbMSSCC0WAW0moFohw==
X-CSE-MsgGUID: WcxNneGaTgy3fbBZbN2B4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="26682917"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="26682917"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 05:39:45 -0800
X-CSE-ConnectionGUID: 0PyoDdK1RRe/sq0Q26p5HQ==
X-CSE-MsgGUID: p0mPgDEKQzOwTHOnlDO5lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="110242868"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.66])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 05:39:44 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 2/3] lib/intel_compute: Align objects on 64K for xehpc
Date: Mon,  3 Feb 2025 14:38:47 +0100
Message-ID: <20250203133916.843931-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203133916.843931-1-francois.dugast@intel.com>
References: <20250203133916.843931-1-francois.dugast@intel.com>
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

Some of the buffers are aligned on 4K. Ensure 64K alignment
in preparation for a switch to using xe_bo_create() during
buffers creation.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 983b2e2c3..0e1179b62 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1125,7 +1125,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_create(fd, &execenv, eci);
 
 	/* Sets Kernel size */
-	bo_dict[0].size = ALIGN(size, 0x1000);
+	bo_dict[0].size = ALIGN(size, 0x10000);
 
 	bo_execenv_bind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
 
-- 
2.43.0

