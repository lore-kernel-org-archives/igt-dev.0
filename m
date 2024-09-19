Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76ACCE8D64
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 09:47:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A66A10E2A4;
	Thu, 19 Sep 2024 09:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KFvh0etc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162B610E2A4
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 09:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726739227; x=1758275227;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qfuJYgbLB97iwN/o6ybqRuIrR4PbquHnW6Oe2C01P4M=;
 b=KFvh0etcqDfFnkQoeAFMWd4dFs3jz0fJMW/I9eWq0V9tagEpVeGb3+DJ
 6IHVDv51F8oDXNHZnHQYzFWQS8tiUbuPSg8TRg1MI4ZEvr59Be7f1BdJH
 gs2K6Bn4pAqBnfhahMteOCwrUYyiKOHKJenVWvnBNIcioKnP63/LdTBSR
 abYHFaAHPwcxzSkzXjXF080puEwa5GohyE0nmGtqxDr+krvACsbTgdyGt
 X1riu8PPiZ3DipkkpOivL9GpJfCrF8BhaQCx2FmC69wHb+PeRfxATc7lu
 Hi50v2nGeHTInm8YdAhJ3mM8QIGnHQle97/0OjqmklOjjmX76lRrmOQT9 A==;
X-CSE-ConnectionGUID: OLNRT7MBSZSxDG5CyRg8pQ==
X-CSE-MsgGUID: 9ZB5u3CKROKEnYTb79wqtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25570732"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="25570732"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 02:47:06 -0700
X-CSE-ConnectionGUID: bCKpETZbRAu5Cy8qCL15hQ==
X-CSE-MsgGUID: 3CB8+IgqQKGr6lIU0VTMOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="73984397"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 02:47:04 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_psr2_sf: Add eDP check for Early
 Trasport
Date: Thu, 19 Sep 2024 15:29:04 +0530
Message-Id: <20240919095904.1136205-1-jeevan.b@intel.com>
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

On current platfroms early trasport is supported on eDP only
so avoiding assert for other connector.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_psr2_sf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index a9be1a1ec..14b3e20ff 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -935,7 +935,8 @@ static void run(data_t *data)
 							  data->pipe),
 							  "FBC still disabled\n");
 
-	if (data->et_flag)
+	if (data->et_flag && data->output->config.connector->connector_type ==
+	    DRM_MODE_CONNECTOR_eDP)
 		igt_assert_f(early_transport_check(data->debugfs_fd),
 			     "Early Trasport Disbaled\n");
 
-- 
2.25.1

