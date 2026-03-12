Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA451067041
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 15:12:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5AC10EA3F;
	Thu, 12 Mar 2026 15:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbuA2VpX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E8C10EA3E
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 15:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773328315; x=1804864315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QGY3ceIFYAvCkUk2wsLpVb7FFeU3zlnXG7OJs23g/0I=;
 b=UbuA2VpXszC8iJS9OGSQ+vevzXsozMTBJrGJFlOCis/4Qa3lz3RkKOq0
 JDdKR/rYlT2ymZY+ItM9IAvSFpPpp7FpqPxadE75XfXIv8OAfhv65Y0gi
 tBgDQE6QqS0/4Rj6ukoiHctzBhhCfMUQ0fVF6OxAIMKZF69Nv7RWhGcdh
 6WTCLMgK7tQ93+4bgUR4igRLxw4tdJ3+hFIuHAWhA1gbVYMdT7jLGAjES
 +WpKDwzoM+VEnYBtv4dqyPFIeBMBrzNG+xKj8AsrfUXyV0+JVTXWThEbM
 e9itviJoYXUAC2kUrcSqTaHzrzn9w7eRd2WKX32usY4GctVjgBZgA5HQy g==;
X-CSE-ConnectionGUID: JftXntXqSEyvILdLxMPhhg==
X-CSE-MsgGUID: 3LpTCrQSQDWiYpOMHMOQpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="61997653"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="61997653"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:11:55 -0700
X-CSE-ConnectionGUID: 0OFqHLgNQPK8BjG1dgCrOw==
X-CSE-MsgGUID: ThOCez5mRfWZLr62/8qeBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="258772029"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:11:53 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v1 4/5] intel-ci: Add *-planes-random chamelium test to Xe
 blocklist
Date: Thu, 12 Mar 2026 20:39:00 +0530
Message-ID: <20260312150901.3272265-5-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260312150901.3272265-1-mohammed.bilal@intel.com>
References: <20260312150901.3272265-1-mohammed.bilal@intel.com>
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

