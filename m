Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AD7C48291
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 14:10:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE0810EE18;
	Thu,  1 Feb 2024 14:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nsPJvWNu";
	dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 01 Feb 2024 14:10:36 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67EAA10EE11
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 14:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706796637; x=1738332637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oFJQQpRaIpkLOIW/t0h6ERCciQMJ1VIkq2pK2CPhoQg=;
 b=nsPJvWNuYwk2WLwmantcV20k/7Ptid0dRH1uEk9KTinlg34d3LipFE4b
 QUtxXIpQzFV3A4Wig65yPLDnFwd0etOao7bjqzl/uIBrfdUEh/BbKvJQS
 DWTXvHcDs1dRCsmUtJZGXDwwm/WHZQSPJTJNKa5XjHNwx36lDz26ar0JQ
 tVs+aEAHEXv8MM6nDxaIFWeipSBXdhxe4jKiEHr9dOOUCmGbXOwh7gxrN
 72SnrPNk+2NfdQ3fori8HLdccgFXY2fbSJ5vyT30rd8hsJNXfyYJmFtlh
 TNA4n4YkWTNsp5ffy6731OR7Up3yhZURZ1ONGyoogCNMfbMZ3GdWBrjza Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="119636"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="119636"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:03:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="78772"
Received: from abojovix-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.0.176])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:03:27 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v3 2/3] tests/intel/xe_ccs: require flat CCS on xe2
Date: Thu,  1 Feb 2024 14:03:14 +0000
Message-ID: <20240201140315.334388-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201140315.334388-1-matthew.auld@intel.com>
References: <20240201140315.334388-1-matthew.auld@intel.com>
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

On Xe2 compression is handled via PAT indexes and flat CCS, even on
igpu. Ensure the device has flat CCS support on such hardware, to
determine if these tests are valid.

v2: (Zbigniew)
 - There is at least one uncompressed test also, which is valid
   regardless of CCS. Move the skip deeper.
v3:
 - HAS_FLATCCS() expects dev_id.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_ccs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 7d0e8ed7a..9cfff8c50 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -532,6 +532,7 @@ static void block_copy_test(int xe,
 			    struct igt_collection *set,
 			    enum copy_func copy_function)
 {
+	uint16_t dev_id = intel_get_drm_devid(xe);
 	struct drm_xe_engine_class_instance inst = {
 		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
 	};
@@ -540,6 +541,9 @@ static void block_copy_test(int xe,
 	uint32_t vm, exec_queue;
 	int tiling;
 
+	if (AT_LEAST_GEN(dev_id, 20) && config->compression)
+		igt_require(HAS_FLATCCS(dev_id));
+
 	if (config->compression && !blt_block_copy_supports_compression(xe))
 		return;
 
-- 
2.43.0

