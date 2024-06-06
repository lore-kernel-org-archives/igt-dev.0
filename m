Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3BEC25B75
	for <igt-dev@archiver.kernel.org>; Thu,  6 Jun 2024 05:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B30F10E165;
	Thu,  6 Jun 2024 05:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dlx3PMr/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D0010E165
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jun 2024 05:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717650659; x=1749186659;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=10sX9pjMfNxE6xqjCrBzXk4lpz6y44R+J638evDr+TQ=;
 b=dlx3PMr/NEF6YyVr6BiLHGikvYFTawpAaffduMXUBNLWQTu1Uw18KfrG
 4BlRg4tiYMEmvHul9Okx+gZ0bXHExyvbPp1EGM5ajqwioL6RDEDkIm62U
 Hdn5STAqNeROxborjStmcduSiM6RwApTNDycFWUZ3CUBMzekwfQbHx5Sz
 4ATM2rI7jldUiORFiwjx/01exAOH2gH0jk1dWS8AZ+PW4fK98kWpDpO34
 MwNRlwhjiooRx76H5zUaelaK3MgZub23muSMF8rClpbG3ZNZepeImhj8O
 2i5dDKUif6Ph0ioHTdcDaSzqRHqnhKyvgyDXUicsgcrNhNubzWCDIRBjS g==;
X-CSE-ConnectionGUID: POqg2frpTG6nzlTa08iFYg==
X-CSE-MsgGUID: QM0+NNjhRYe9L056oXiAOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="25695173"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="25695173"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 22:10:59 -0700
X-CSE-ConnectionGUID: 3KPG3XqBQuC6C5UJThKFJw==
X-CSE-MsgGUID: x+UYIv/TRMmLwqJkmMJVjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="37810479"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa006.fm.intel.com with ESMTP; 05 Jun 2024 22:10:57 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t] tests/chamelium/hpd: No need to disconnect at the
 begining of the test
Date: Thu,  6 Jun 2024 10:31:05 +0530
Message-Id: <20240606050105.4179950-1-arun.r.murthy@intel.com>
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

In the subtest hpd-for-each-pipe unplug/disconnect is done to ensure
that nothing is connected which is not required. The first subtest hpd
doesnt do the same in the begining and disconnect/unplug is done at the
end of each subtest.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 tests/chamelium/kms_chamelium_hpd.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index 858c595cb..3ad56c71a 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -329,10 +329,6 @@ static void test_hotplug_for_each_pipe(chamelium_data_t *data,
 			      data->ports, data->port_count);
 
 	igt_hpd_storm_set_threshold(data->drm_fd, 0);
-	/* Disconnect if any port got connected */
-	chamelium_unplug(data->chamelium, port);
-	chamelium_wait_for_connector_after_hotplug(data, mon, port,
-						   DRM_MODE_DISCONNECTED);
 
 	for_each_pipe(&data->display, pipe) {
 		igt_modeset_disable_all_outputs(&data->display);
-- 
2.25.1

