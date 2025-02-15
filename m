Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F1EC02198
	for <igt-dev@archiver.kernel.org>; Sat, 15 Feb 2025 01:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0E510ED45;
	Sat, 15 Feb 2025 01:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZyFXrFA3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7EC10ED4B
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Feb 2025 01:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739581589; x=1771117589;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kqyA1rIsWqdjhgZP6x1FKRpNEptm2Z9zbVMKIxZE0tI=;
 b=ZyFXrFA3SB/1WHS6ZQlIfZw/hw4wzdBVwnmHfGFPuRgJnxzo/6dJcynw
 7tUfC0qw3R9ImkVO+hLeXW7PcsPRGcr2OMhlDEzF1iteuTLNvwCkAALKf
 YuridugB9xWcC0k/f6SIzIZ0xlbhr1Aq0HsUZgzC/HHZbJXc5FYHCncN6
 2YaOMUu6F//xfxju1PHUE7PCLT3CV4Cqjq5kd7ojxWhT/O5UY++iu8Bt8
 SLHyItOUAWkQ8CsotOtFMIXHicLDVKvZKlJfJk3jLw3BPvmHmTJTfh7pg
 C6SipKRzssAlpRGZ/9v28viIYscud8oLkVfnpGU3a7zrvfCQSIKcjoBjI w==;
X-CSE-ConnectionGUID: ZUSHe+yiS7i+ZCm+xJ+xyw==
X-CSE-MsgGUID: 8WzYA1rrQYSSCJCIYE5n1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50555108"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="50555108"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 17:06:29 -0800
X-CSE-ConnectionGUID: T0SVKmFdRQ6tK5xE7eReyg==
X-CSE-MsgGUID: u1SpEDu0SDGg5pu4m6mkkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="118711235"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 17:06:28 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 01/13] tests/intel/xe_oa: Use static for global variables
Date: Fri, 14 Feb 2025 17:06:16 -0800
Message-Id: <20250215010628.1639986-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
References: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
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

Use static for mmio_data and hwe.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 0242fd594..3274d472d 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -296,12 +296,12 @@ static int pm_fd = -1;
 static int stream_fd = -1;
 static uint32_t devid;
 
-struct drm_xe_engine_class_instance default_hwe;
+static struct drm_xe_engine_class_instance default_hwe;
 
 static struct intel_xe_perf *intel_xe_perf;
 static uint64_t oa_exp_1_millisec;
 static size_t default_oa_buffer_size;
-struct intel_mmio_data mmio_data;
+static struct intel_mmio_data mmio_data;
 static igt_render_copyfunc_t render_copy;
 
 static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_class_instance *hwe)
-- 
2.34.1

