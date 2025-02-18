Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534C1C021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 20:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0591B10E76B;
	Tue, 18 Feb 2025 20:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lebnw/2s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA86310E762
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 20:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739910495; x=1771446495;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kqyA1rIsWqdjhgZP6x1FKRpNEptm2Z9zbVMKIxZE0tI=;
 b=Lebnw/2sfXyZTJvTv0z/yGXVo8yJhROqihsPzCw0EnBTFNdxTePySC0m
 RUAvRZ7MFPO0UpgFuwzEpDqYSMODl7F+uqd/MedaVVyoplKQAoNw+xh5s
 tX1UC3CUX8NgwXrGglAqC8UJLuy6paB2uyHdlJBC8n+JGaw2L12NVaHmv
 DPSrNmE1SRbrw9Wqx6CicVQ8KQPQuaMXCqBHO6EROzcnYqd51ycI0DAbj
 mer34wAp1SH6Clz98EgET0F5u2VXBzhkfF03Hsp3z2WtkyZRDdVFa2NIT
 inOO05p3jVp7c3kFOAa4hXUCeKK5otslfISMTAdCzDHfOncHij+TqvFlX A==;
X-CSE-ConnectionGUID: UOJwwT7LT0WixYjdz4qwEQ==
X-CSE-MsgGUID: vcTggZF4QW+RtIXpcvGICA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44545833"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="44545833"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:15 -0800
X-CSE-ConnectionGUID: bFWknS79S4eo1+cvIXHYZQ==
X-CSE-MsgGUID: vICfvxFKToCiB822G08XTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114367436"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:15 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t CI run 01/14] tests/intel/xe_oa: Use static for global
 variables
Date: Tue, 18 Feb 2025 12:27:59 -0800
Message-Id: <20250218202812.1679653-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218202812.1679653-1-umesh.nerlige.ramappa@intel.com>
References: <20250218202812.1679653-1-umesh.nerlige.ramappa@intel.com>
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

