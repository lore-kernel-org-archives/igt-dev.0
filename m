Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DB4C7EE30
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 12:18:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72BA10E6FD;
	Wed, 25 Jun 2025 12:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PCoRhgzI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E5C10E6FD
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 12:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750853905; x=1782389905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SIq9cxtwQXYzw6/sDzf4n4CEXq/Tko7cqlIJ7J07fhI=;
 b=PCoRhgzI97wPcJLoZlBiq4VBgvJ4Ia2epl8u5iBE8sDie4CKJoDzGkTZ
 rDhH4ZceY78clULabYS24peTgPmKsX+AGbp/BFWdIsDdAmqjo175HfEsN
 krR+CInGtCcaiUDPQ9IJf/qGnEAO+Y2T4Zg/SBXGpxgUNMrWmpDfKtPRz
 KnKXKIEdFHXWvw1vGyV+3Ap8Tha4Dbfk3GGZiIqtW1Wr5pf2wcVW7RcDF
 3SwWvTc2JO0EPBh5hGajBNC6CVnJsoukIKA4YteYZjjXufKkn+LTOkNag
 Lx9LPC6hmN6/gpOmN0bijbi9BlJmx96e09GxX6y1mzbHJPbrG6PVTP4xu A==;
X-CSE-ConnectionGUID: t55iGbcyRfOQP9PiHsiyGA==
X-CSE-MsgGUID: ZPLh5GDcRjOIn42KImtHZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53260756"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="53260756"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 05:18:24 -0700
X-CSE-ConnectionGUID: 3J7UfTE2SqqZMJtN/SKxOA==
X-CSE-MsgGUID: vtm8x8CtR/macTHfbsNohA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="151714809"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:18:22 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Imre Deak <imre.deak@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH 3/5] tests/intel/kms_link_training: extend test for eDP
 connector
Date: Wed, 25 Jun 2025 18:04:00 +0530
Message-Id: <20250625123402.3929358-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250625123402.3929358-1-kunal1.joshi@intel.com>
References: <20250625123402.3929358-1-kunal1.joshi@intel.com>
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

Extend kms_link_training test for eDP connector.
non-uhbr-sst subtest expected to and skip
expected for rest of the subtest as of now.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_link_training.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_link_training.c b/tests/intel/kms_link_training.c
index fb9b42608..3793fb84b 100644
--- a/tests/intel/kms_link_training.c
+++ b/tests/intel/kms_link_training.c
@@ -260,14 +260,18 @@ static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
 static bool test_link_rate(data_t *data, bool mst, bool uhbr)
 {
 	bool ran_any_output = false, is_mst = false;
+	bool is_edp = false, is_dp = false;
 	igt_output_t *tmp_output;
 
 	igt_skip_on_f(!is_intel_device(data->drm_fd),
 		      "Test supported only on Intel platforms.\n");
 
 	for_each_connected_output(&data->display, tmp_output) {
-		if (tmp_output->config.connector->connector_type !=
-		    DRM_MODE_CONNECTOR_DisplayPort) {
+		is_edp = tmp_output->config.connector->connector_type ==
+			 DRM_MODE_CONNECTOR_eDP;
+		is_dp = tmp_output->config.connector->connector_type ==
+			DRM_MODE_CONNECTOR_DisplayPort;
+		if (!(is_edp || is_dp)) {
 			igt_info("Skipping non-DisplayPort output %s\n",
 					tmp_output->name);
 			igt_info("----------------------------------------------------\n");
-- 
2.25.1

