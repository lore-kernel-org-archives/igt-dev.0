Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631FDC49EA1
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 06:35:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7C810E89C;
	Thu,  1 Aug 2024 06:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gejVFBNP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B277E10E89C
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 06:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722494121; x=1754030121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ii6QRA44nJpj5tY9ahpcMVdii5dUzjAKsg8BYJV6JzM=;
 b=gejVFBNPl40QlJb5HeWqekuupM/WHbJxMAuR0D9pL8wq0SGP4epOcDxf
 bPKUYDb2ZgF0C7/BL0rZSdsRGBc5QkpmUUd8kVrsPeBO4tZsqBTIXcPkf
 WKuB6F5mMmdqKFq1+XEsXsB0okMi0X42xCXGHieNEOLyhD/o5AThP2f8V
 uDPRyFJgPW4U6q3Fut7XQKHnGLDWY5DPeuItBFdliIYtoQAt4gYjX4HvT
 vDcBCF5BvYEfWowfSWQNMTqN39GpY7c7KSFkQ+J8kMEA38e46/VwWMMd/
 LdLol3EsTURj2s99Gh/ta+mgnnGFAtx7bthhvtfMHzQwDLeHZMGLZzaOn A==;
X-CSE-ConnectionGUID: rG91yRFqQMm7WiuP94r59w==
X-CSE-MsgGUID: XWt7q9hZQIK0ggevGBWNFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31809781"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="31809781"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 23:35:21 -0700
X-CSE-ConnectionGUID: 52vpiop4S3qCKbbCYS4vKQ==
X-CSE-MsgGUID: 26R10gRoS0KylUhnKbfKCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="59727554"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 23:35:19 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [i-g-t 1/3] lib: Add u32 variants of igt_assert_{lt,lte}
Date: Thu,  1 Aug 2024 11:56:00 +0530
Message-ID: <20240801062602.2047179-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240801062602.2047179-1-bhanuprakash.modem@intel.com>
References: <20240801062602.2047179-1-bhanuprakash.modem@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

igt.cocci assumes that u32 variants of the comparison assertions exist,
so add the two that were missing.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_core.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index 084d94da7..82f474c5f 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -915,6 +915,15 @@ void igt_describe_f(const char *fmt, ...);
  */
 #define igt_assert_lte(n1, n2) igt_assert_cmpint(n1, <=, >, n2)
 
+/**
+ * igt_assert_lte_u32:
+ * @n1: first integer
+ * @n2: second integer
+ *
+ * Like igt_assert_lte(), but for uint32_t.
+ */
+#define igt_assert_lte_u32(n1, n2) igt_assert_cmpuint(n1, <=, >, n2)
+
 /**
  * igt_assert_lte_u64:
  * @n1: first integer
@@ -954,6 +963,15 @@ void igt_describe_f(const char *fmt, ...);
  */
 #define igt_assert_lt(n1, n2) igt_assert_cmpint(n1, <, >=, n2)
 
+/**
+ * igt_assert_lt_u32:
+ * @n1: first integer
+ * @n2: second integer
+ *
+ * Like igt_assert_lt(), but for uint32_t.
+ */
+#define igt_assert_lt_u32(n1, n2) igt_assert_cmpuint(n1, <, >=, n2)
+
 /**
  * igt_assert_lt_u64:
  * @n1: first integer
-- 
2.43.2

