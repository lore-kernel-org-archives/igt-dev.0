Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8259CCFD345
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 18:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFEA10E31F;
	Mon, 24 Nov 2025 18:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YyoLC3z4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEC510E2C3
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 18:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764008913; x=1795544913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/yUynnVtMdV8tGw18YiIdlGTA7yy3Tld9T9yRFqwQPs=;
 b=YyoLC3z4VTtpxpooEFfG5qByS2zJJatIeNAZoUtXOyyy3CccJ+Y9ZCb6
 HGApING9lFDq3Pd733MMNCOE2MK9rM9HoyV+IAi2HMry16Yv5YqaZs2f7
 MYVNQgInnb3NmRrxIPby6RDZVj6lRNwy/OOfUR0p8s7rSCE5Vnlmwv1/1
 9fPQNzFQG/RuoGGspiqPgGRJMRpU0LzEIV0hWUQn/c+LC5qRplE1elixS
 qCm+whndZ5ED54VBNz5whoepg6XMq/ZO8NJPeF27Z59ZnZcSLCFzZo4A+
 prIaYNdmlHVvwf0dI5Vyqg5txYTjsQ8vSy6HD+fMvMDlT08xEZ0vKrXw7 w==;
X-CSE-ConnectionGUID: VORjqsjDSs+qMTXrHGgTvQ==
X-CSE-MsgGUID: fD1cybG3SI2tpKudWL09Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66055390"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="66055390"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 10:28:33 -0800
X-CSE-ConnectionGUID: u9JGB+6ASoWeZjqXG3FyHA==
X-CSE-MsgGUID: B0TGO5lWRySdCZRsEirarQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="215747201"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 10:28:31 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, suraj.kandpal@intel.com,
 Imre Deak <imre.deak@intel.com>, Arun R Murthy <arun.r.murthy@intel.com>,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 4/6] tests/intel/kms_link_training: extend test for eDP
 connector
Date: Mon, 24 Nov 2025 23:57:54 +0530
Message-ID: <20251124182804.2095722-5-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251124182804.2095722-1-jeevan.b@intel.com>
References: <20251124182804.2095722-1-jeevan.b@intel.com>
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

From: Kunal Joshi <kunal1.joshi@intel.com>

Extend kms_link_training test for eDP connector.
non-uhbr-sst subtest expected to and skip
expected for rest of the subtest as of now.

v2: use helper for eDP/DP check (Jeevan)

Cc: Imre Deak <imre.deak@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
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
2.43.0

