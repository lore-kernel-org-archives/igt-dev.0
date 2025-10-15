Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B0DCCD195
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 10:02:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C61210E76E;
	Wed, 15 Oct 2025 10:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvGP15mH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDD310E76E
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 10:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760522539; x=1792058539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zHUW3ptjIpXrm5P54O6dJx4ffCNGub6lz4ExADp1U8Q=;
 b=bvGP15mHgdXTx4NdisKdb51nFJUcMPsdmdLksQ3BvQwxsrgBk092n89w
 9SxW/EWxb3GfUVeTi9cDdWNH6o1hyykBR3P6gK9UvyDIH6EfV1D2GDHeg
 sjnqT9v6ckTJf5IoRZJYXhcjXvGv9Vquyx/j66mCLrikcKkCFRlz+RMtO
 EQa76QnpMkKxJAV1aGkEou8iTlK/tC2vNSDq1ZQAUF/r3WOrlCFn+OVV7
 DBye8CRJUTP3pAPJVCEhnxP5jbpKcXx0e/Q5JTSWcBf38DCjm6wSI6USb
 npTcZrA8MHJ+LAx1s7G+QGqCTV1W2vYZVtf09Pm0f0KkBKga1/6Sb/kp0 Q==;
X-CSE-ConnectionGUID: gJjnTWlvTKu95rjN+P9V+A==
X-CSE-MsgGUID: Vg9RkYjqS2O+QyC/wmeUKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62590182"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="62590182"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 03:02:18 -0700
X-CSE-ConnectionGUID: aJL7BcOXRYKQt8JkvEWICA==
X-CSE-MsgGUID: JJ0vDh91T8mwC62zZLLaEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="205835586"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 03:02:16 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Imre Deak <imre.deak@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t 4/6] tests/intel/kms_link_training: extend test for eDP
 connector
Date: Wed, 15 Oct 2025 15:47:57 +0530
Message-Id: <20251015101759.3982477-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251015101759.3982477-1-kunal1.joshi@intel.com>
References: <20251015101759.3982477-1-kunal1.joshi@intel.com>
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

v2: use helper for eDP/DP check (Jeevan)

Cc: Imre Deak <imre.deak@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_link_training.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_link_training.c b/tests/intel/kms_link_training.c
index fb9b42608..4ddbd72f8 100644
--- a/tests/intel/kms_link_training.c
+++ b/tests/intel/kms_link_training.c
@@ -266,10 +266,8 @@ static bool test_link_rate(data_t *data, bool mst, bool uhbr)
 		      "Test supported only on Intel platforms.\n");
 
 	for_each_connected_output(&data->display, tmp_output) {
-		if (tmp_output->config.connector->connector_type !=
-		    DRM_MODE_CONNECTOR_DisplayPort) {
-			igt_info("Skipping non-DisplayPort output %s\n",
-					tmp_output->name);
+		if (!igt_output_is_dp_family(tmp_output)) {
+			igt_info("Skipping non-DisplayPort output %s\n", tmp_output->name);
 			igt_info("----------------------------------------------------\n");
 			continue;
 		}
-- 
2.25.1

