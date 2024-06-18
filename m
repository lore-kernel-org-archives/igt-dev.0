Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC34C2BB9A
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 08:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFB610E5E9;
	Tue, 18 Jun 2024 08:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ERzlEZho";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E0010E5E1
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 08:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718699463; x=1750235463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jZryLln9k7277dHy6DQMDi/xfFsBYV6UyIZDFSW9FN0=;
 b=ERzlEZhoT8kxoQefUSbEcL2nBPB8W/Hv0O/U8P/17+FT7QcI4MkBbxfQ
 yECMomQdn9pECYfPdaNjNaowj6dHrv/eppEcFKTi5WOG4Jt3YDsthKQNv
 1fT28zz+X8i9tcKSwwVZyc2TUU38mjF6xFkkjeukRUT+OlvtEjf94Jqhq
 hT0zpKRQ2Q+Fr+DhBicvrCOXFgettuFsfeTgAVkdTjD7dnXs6j3DMTv6z
 9L1BHnMNQ6rtwHxIwvdf+2ZImwrlZosKgWZkqvr8dZvds7sh/QKxmm+Qg
 1sy1ltqolhx4Vu4skBTs6jJMqCOhWDp0BUBak0v/T3enxzLYh+ZBqU0FB w==;
X-CSE-ConnectionGUID: 4IVi0EnJR7qzSZj1w5gu+Q==
X-CSE-MsgGUID: kZETU7ocQlWwZ8srQRnZsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="38082187"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="38082187"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 01:31:02 -0700
X-CSE-ConnectionGUID: XytKu94UQVOWi9xhmmjrEQ==
X-CSE-MsgGUID: kBguRNuwR5WqbSAZOT+t5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="64699575"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 01:31:00 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	jeevan.b@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [i-g-t V6 5/8] tests/intel/kms_pm_lpsp: Force joiner support in
 bigjoiner checks
Date: Tue, 18 Jun 2024 13:52:45 +0530
Message-ID: <20240618082248.4070611-6-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
References: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
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

As we recently introduced the option (through debugfs) to
force the bigjoiner, needs to extend the support in bigjoiner
checks to handle the force joiner.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_pm_lpsp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index a76b423f4..f9ac508fb 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -163,6 +163,9 @@ static bool test_constraint(data_t *data)
 	mode = igt_output_get_mode(data->output);
 
 	/* For LPSP avoid Bigjoiner. */
+	if (igt_check_force_joiner_status(data->drm_fd, data->output->name))
+		return false;
+
 	if (igt_bigjoiner_possible(mode, max_dotclock)) {
 		for_each_connector_mode(data->output) {
 			mode = &data->output->config.connector->modes[j__];
-- 
2.43.2

