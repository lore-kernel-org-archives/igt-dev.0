Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B09C1067044
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 15:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FA510EA55;
	Thu, 12 Mar 2026 15:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QpuULmnt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C621B10EA54
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 15:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773329139; x=1804865139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mQGF6bnzUVVEaFwH5832mlndbgEXgwPatGeoUZI55O4=;
 b=QpuULmnt/q2mg4dAXfyyyFTOiCjErRXAaQyvMdps0BcECl1LZZXONAwd
 MuAqP5lSHJY+HdvUgLsw4hH7ZccJqhcOl34E5qLINQy5liJzdPMwuvDkj
 t7sKEwg7LfaNbaGq+tzfSdYwRV8uuN4PzpdQiHdmQRUd2qRdB3GnDP6Ms
 hhGNATHkCeIykC2c21t0CD5ZubP90erXSRX8lqMwPdaF3Y6v1TRiwQbGP
 qnlz3ZWsujyULh4ALtyIVc8Df3BBoak1GAh42WVM2VMF1AVzpCKIuaz54
 1sRFzuZ4PO8vfB9+tw0umj21MZXAG/0YiNNlxfSc23FXw7MeXr9PAtlEa A==;
X-CSE-ConnectionGUID: qJ/LwlTmRtO2aHDoHtEoiQ==
X-CSE-MsgGUID: r9x/gVL4T3uqTSZp+bOYfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85902419"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="85902419"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:25:39 -0700
X-CSE-ConnectionGUID: MS4Hwp7rQwiAia8hwNk9WA==
X-CSE-MsgGUID: hPilS3bPTH2mODFp2vyB1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225297273"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:25:37 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v2 4/5] intel-ci: Add *-planes-random chamelium test to Xe
 blocklist
Date: Thu, 12 Mar 2026 20:52:32 +0530
Message-ID: <20260312152233.3280893-5-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260312152233.3280893-1-mohammed.bilal@intel.com>
References: <20260312152233.3280893-1-mohammed.bilal@intel.com>
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

Tests are exhaustive and pick random configurations, results are
non-deterministic on each run.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 80a0ee904..80cc98608 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -132,3 +132,14 @@ igt@kms_async_flips@async-flip-with-page-flip-events-linear.*
 # driver does not support VGA connector types.
 ##################################################################
 igt@kms_chamelium.*@.*vga.*
+###############################################
+# Tends to generate invalid configurations
+# using CCS planes or configurations that
+# exceed HW capabilities resulting in sporadic
+# failure with -EINVAL.
+#
+# Maintaining extra constraints for Intel's HW
+# is too costly in comparison to the value
+# provided.
+###############################################
+igt@kms_chamelium_frames@hdmi-.*-planes-random
-- 
2.48.1

