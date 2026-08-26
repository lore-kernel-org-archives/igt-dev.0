Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DBEC61DBD
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 18:31:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928BB10EB88;
	Wed, 26 Aug 2026 18:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLqSxVBo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E765610EB88
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 18:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787769035; x=1819305035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GItHn0KmUczo4TSdxetpDldnJAKFCxPFH97H6gjV73E=;
 b=iLqSxVBo80OTDWG4ETM1FVfEBkht0E2yg8QgwcGJzkcCbTBya2f6RYEO
 BdZ1BijLGDVEonQiUQ2dpJNp0QfLoyHIJDGtQKXlcAhz3bz1QFKjS/J0b
 amxfhYn+NiVPFbgyHBLPn927VRyN3ZqB8l/ohvAGz16TKLSYxg7iYif3h
 puW+9tnbzKh0/VZHxiB+NzdCklNSXlq/YSLZALoX/8nGTmVqiCHHeWlBr
 6+8wo9rtcpMJgZsHbfVl3hxhwFlkqZbm7hqYabjYyPoiJn9Ouuqisb12X
 BBmo6CFa2Nk89htJW7o4dSIgtZUj5yJ+g0ppgbMJRvp9PYlATay8HZptf Q==;
X-CSE-ConnectionGUID: 1ZA75tAaR3iTK9H6VWqmww==
X-CSE-MsgGUID: t/QOfTifRs2zxARIVYPfeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88314769"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88314769"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 11:30:34 -0700
X-CSE-ConnectionGUID: ao9K3kEcTa28FUNno0n3Jw==
X-CSE-MsgGUID: YwTKTuD2QzWLLoxqeNq+yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="271159664"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 11:30:33 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 2/7] lib/igt_kms: Add FIXED_MATRIX_TYPE colorop property
Date: Thu, 27 Aug 2026 00:09:27 +0530
Message-Id: <20260826183932.351933-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260826183932.351933-1-swati2.sharma@intel.com>
References: <20260826183932.351933-1-swati2.sharma@intel.com>
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

Add IGT_COLOROP_FIXED_MATRIX_TYPE to the colorop property enumeration
and register the "FIXED_MATRIX_TYPE" property name string. This enables
IGT to discover and configure the FIXED_MATRIX_TYPE enum property on
fixed-matrix colorops exposed by the driver.

v2: -Naming changes (CSC_FF_TYPE -> FIXED_MATRIX_TYPE)
v3: -Keep NEXT as the last property (Chaitanya)

Assisted-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 lib/igt_kms.c | 1 +
 lib/igt_kms.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 42cc7c3bd..7f3b464b2 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -724,6 +724,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_DATA] = "DATA",
 	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
 	[IGT_COLOROP_LUT3D_INTERPOLATION] = "LUT3D_INTERPOLATION",
+	[IGT_COLOROP_FIXED_MATRIX_TYPE] = "FIXED_MATRIX_TYPE",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 8d4d14847..8ba8e3891 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -362,6 +362,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_DATA,
 	IGT_COLOROP_MULTIPLIER,
 	IGT_COLOROP_LUT3D_INTERPOLATION,
+	IGT_COLOROP_FIXED_MATRIX_TYPE,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
 };
-- 
2.25.1

