Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A9CD6ACEE
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 12:11:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184F510EEC5;
	Thu, 18 Dec 2025 12:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nge8jYuB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F4910EEC5
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 12:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766059888; x=1797595888;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x7+1k+htSd5r/SKvidBiDufopFU+a065vb6rSZE4ayo=;
 b=Nge8jYuBMX9XRSv92g/+Q4Ah3/kfrFHKHiMSBCBGdOUcSyfnYAwiNwIB
 liWBzhAcEDRi7tkpFpVKI/J4bwpVcJ94/4Cx/13zrX9kEbz71F2aiYqwk
 YL08XEtPg6CjfFcm/+OiUkFZPBKk7tWiFqOWhxM88FsaHhp4LZYA2WiNn
 ejcu8J86xNVBAXJni0Z/s0ObRIOxrcbSd2viVhCvIcH6p8EYQdfK1nPlr
 bIW0xbHk6L1PiG9Gg1Vx2JDhLcAqhGwheQ3ENeCKcNI539D8JkCd9ERYB
 mmts7afclUt1kxEIAfZvbCsSiW6pTTD+0TW9MpQGKvl0U6QZopctjP9zm A==;
X-CSE-ConnectionGUID: 2MvqieC1S+qo3Yv84o4KpA==
X-CSE-MsgGUID: 7syO8//sSrafqSE51P50pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68165984"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="68165984"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:11:28 -0800
X-CSE-ConnectionGUID: 8PyRmBPfRXKxErmZV7DPyw==
X-CSE-MsgGUID: w5PW0XfRQKGoMueUz9UA2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="203640792"
Received: from prudnick-desk.igk.intel.com ([10.91.34.80])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:11:27 -0800
From: Piotr Rudnicki <piotr.rudnicki@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Piotr Rudnicki <piotr.rudnicki@intel.com>,
 Himanshu Girotra <himanshu.girotra@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>
Subject: [PATCH v2 1/1] intel-ci: add eudebug tests to multigpu blocklist
Date: Thu, 18 Dec 2025 13:13:09 +0100
Message-ID: <20251218121308.2991594-2-piotr.rudnicki@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add eudebug tests to multigpu blocklist, as they are not yet supported
on Xe multigpu setups.

Cc: Himanshu Girotra <himanshu.girotra@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>
Signed-off-by: Piotr Rudnicki <piotr.rudnicki@intel.com>
---
V1 -> V2: Separate the eudebug blocklist entry.

 tests/intel-ci/xe.multigpu.blocklist.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel-ci/xe.multigpu.blocklist.txt b/tests/intel-ci/xe.multigpu.blocklist.txt
index 387c3413e..5affcc8fa 100644
--- a/tests/intel-ci/xe.multigpu.blocklist.txt
+++ b/tests/intel-ci/xe.multigpu.blocklist.txt
@@ -3,3 +3,6 @@
 #####################################################
 igt@(?!.*xe.*multigpu.*|xe_peer2peer.*).*
 #####################################################
+# Kernel support not available
+#####################################################
+igt@xe_eudebug@multigpu-basic-client*
-- 
2.43.0

