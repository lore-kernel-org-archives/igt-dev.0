Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A37BC282C6
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 23:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70BB10E0A0;
	Mon,  3 Mar 2025 23:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lShAVeyx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF3410E2EB
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 23:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741043707; x=1772579707;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FC3XcpVLKiA3yB7gtYlJiQ7jx2KnnpjkuPbIqClly7Q=;
 b=lShAVeyxO5JaqGrUq8PoJ5fU539p5LoOZ9F/i7bGVLU19zjBGXczPFVx
 dc0aHC7mZagW6PEsWBnBdDIUSpF/pDds8Ki3KPtvir+BrWPywQ+LRqbpe
 jEu4DhvMMK4rn+QXVSPrv9VqUUt2oGMcJ2GfTn0G7A4lYmBUAido9SXA2
 3ej2olC5huZWfeUU+zMsqKFEJ5Baznq2pZzgxy5Hwq9ttZbOdL+IAf+y3
 2qvsrmPUeW8e99CxGGXDFhH+fiuJ73EzErHMHLj30c/1UcdgP0XyuGQIN
 XbTyXGwZto0BoJ9KZLP2bAOjnVbjQzbMG5jEpAXkjMfj49xtEwHp9rgkx w==;
X-CSE-ConnectionGUID: /CRdboadSkGNLjVT2p054Q==
X-CSE-MsgGUID: Wo8o8RGBQ5GdjGkt9hy/Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41793035"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41793035"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:07 -0800
X-CSE-ConnectionGUID: B0Jf4eS2RNWzwpLjx2rWcQ==
X-CSE-MsgGUID: 7+gnYOurQ0mEPh3HYFvnUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118716676"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:06 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 01/14] tests/intel/xe_oa: Use static for global
 variables
Date: Mon,  3 Mar 2025 15:14:49 -0800
Message-Id: <20250303231502.135720-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303231502.135720-1-umesh.nerlige.ramappa@intel.com>
References: <20250303231502.135720-1-umesh.nerlige.ramappa@intel.com>
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
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 6abf44128..562a4edf2 100644
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

