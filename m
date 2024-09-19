Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E259FCF395D
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 17:12:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BEA010E732;
	Thu, 19 Sep 2024 17:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDjwCbUi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FA710E732
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 17:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726765948; x=1758301948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O9lGIygx4fFJ23GLe/K9BGO6SE/c4/vSWr14hXUfoEY=;
 b=KDjwCbUiqNNaWZsSqSUlChpVlj0nOa3Ub55103jJQsX2LmgDoOF95UGg
 hAKNk6sow0ma70yQ9lVmOXv2Mgq+pJ8PbgAJY0CkeEg2bbVeW5pmzWXUP
 YXTxM0qeyVDx8RyD55cPQo0Lj6zJgPDKw+hzUN0KwSVtiWWh/BfPy3P11
 eLiFswtd7z8+f1gAb4Lz7JH3AEILcUCJnsLQZDpE0KDqCw1DpCG8bCkvS
 vp6kam4+gKdyK3iVGmZW/1DIuNKNQ2hFJeo6E+6YRRskD5hnpXdXYYj2B
 8qWgH7DkGNsLfsjSReOgFCN1YecWj3aMruWSbCHzYI2cVuTtc67hq7oqO g==;
X-CSE-ConnectionGUID: 9Vt2N+fzTGy8IVVNaw93rg==
X-CSE-MsgGUID: 4x1tOfTfTK2b58zzBOaS4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="13596797"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="13596797"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 10:12:27 -0700
X-CSE-ConnectionGUID: 4L7us2hsT8abHVnNL+HhrA==
X-CSE-MsgGUID: aBAB0TvrTqCeTQ5C5SVKwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="70457284"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 10:12:27 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_psr2_sf: Add eDP check for Early
 Transport
Date: Thu, 19 Sep 2024 22:54:25 +0530
Message-Id: <20240919172425.1154937-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
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

On current platforms early transport is supported on eDP only
so avoiding assert for other connector.

v2: Add checks to handle crashes and fix typo.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_psr2_sf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index a9be1a1ec..ca729d558 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -935,7 +935,9 @@ static void run(data_t *data)
 							  data->pipe),
 							  "FBC still disabled\n");
 
-	if (data->et_flag)
+	/* TODO: Enable this check if other connectors support Early Transport */
+	if (data->et_flag && data->output != NULL &&
+	    data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
 		igt_assert_f(early_transport_check(data->debugfs_fd),
 			     "Early Trasport Disbaled\n");
 
-- 
2.25.1

