Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAE9C021BE
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 09:41:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0070410EA76;
	Thu, 27 Feb 2025 09:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0k+vFC5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B5510EA76
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 09:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740649303; x=1772185303;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QVDZeTmNWdyYJBG2gokjQSWnXH4Pn94h9YHK/Y7IOBI=;
 b=N0k+vFC5qiOIJZnh1+3DwIXGSmtS1KfScXuM97nRXH5TtOHW3SrRZQvA
 QPTykTz8Q5ySN4elbZpIXysL8n/W5iHqPM7+FJfGio5aRIZGldyJn9x5A
 DaKMLx+a1NQfLgonU1E5LRyd1oUZKLYqjI5SZhd3rJI+tU0I6eEXMIPdu
 oHPEdaUK3B/K6azzxDfMtvccDnju3CA4zDKr2W1t4sNeBTW51qcC2H7ZZ
 fEgDcVXSTCiu5kLeZHOZJGPjqgSLdQnnOTq9Kx75Y7K3G2qDeEvgY4bjW
 HO3nbYRsOXefpQ3Ehabz5E7wii8Tu68STi1c+SnvWyAxkjGmrAr8o81iF A==;
X-CSE-ConnectionGUID: oxJLO+TpQRWD+b5R3k5QZg==
X-CSE-MsgGUID: V9Gw76h6RpmqrkdnIGpJyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="40707145"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="40707145"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 01:41:35 -0800
X-CSE-ConnectionGUID: MnFLQkb+T/2sY37zVc+EGA==
X-CSE-MsgGUID: q3z0rVzRRrqHVxFLju8yWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="147897601"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 01:41:33 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH] tests/intel/kms_dp_link_training: fix assert
Date: Thu, 27 Feb 2025 15:27:13 +0530
Message-Id: <20250227095713.2908011-1-kunal1.joshi@intel.com>
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

fix return type of igt_find_all_mst_output_in_topology
from bool to int

Fixes: 983ffca5ff96fd67c937691337f4488e28948aa7
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_link_training.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index f00376614..05aeefdd4 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -95,7 +95,7 @@ static void assert_link_status_good(data_t *data, bool mst)
 	if (mst) {
 		igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd,
 								 &data->display, data->output,
-								 outputs, &count),
+								 outputs, &count) == 0,
 								 "Unable to find MST outputs\n");
 
 		for (i = 0; i < count; i++) {
-- 
2.25.1

