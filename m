Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF9BC71136
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 15:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A0C10E6B3;
	Wed, 11 Jun 2025 15:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aVpEQnHe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F347610E6C0
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749655704; x=1781191704;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YKGQDK59cvXhboeeJOt95lU9jSBqTIDMCg5O5kXtMCY=;
 b=aVpEQnHeN4PYRn4dm5aK7ZOJE26Q7w67zROnPB+Z3LjksGeGnmAuUDlu
 EN6/egYQiMz2smYFrcsB5xyhcFG39l4WXJR573diWmejIbUGS9Ei/3jjj
 zGkXFYNveDvdsvP9ttV8L4OxdxVQqDNKApQZoApeAdnA5usPb3m0GLQV4
 NrfLv0U1bIoxGZdFwXiKnw6pE/NK3WE3ePSixMVF6qSsH4zJMwSh3EHJz
 zpi1y4a+0CAp41SSryaPDW5qwNNFN+asutt9EkrH5IJG7wGUKcY96NjKo
 uTv+KHUHiqtIhdoWj7mSl2SNnLXhrGdHC/8ardIVPa2E7z2H5QGu5a9YP Q==;
X-CSE-ConnectionGUID: YrVn4HHWRiW3kT0G2kiI6Q==
X-CSE-MsgGUID: 5ead0Re1RS2ytSUIBWBDHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51797020"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="51797020"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 08:28:24 -0700
X-CSE-ConnectionGUID: WU6dJNzdRO6fi8E4d5QcdA==
X-CSE-MsgGUID: FDEEfoGaQI2TrSGmHg3vsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="147723187"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 08:28:15 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, karthik.b.s@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_vrr: Skip LOBF test if PR is not supported on
 sink
Date: Wed, 11 Jun 2025 21:14:04 +0530
Message-Id: <20250611154404.3111025-1-jeevan.b@intel.com>
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

LOBF requires Panel Replay, which is only available on eDP 1.5 panel.
If PR is not supported on the sink, skip the test early since LOBF
cannot be enabled without it.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_vrr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index d371d9d7f..4919b7cb7 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -1049,6 +1049,11 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 				continue;
 			}
 
+			if (flags == TEST_LINK_OFF)
+				igt_require_f(psr_sink_support(data->drm_fd,
+					      data->debugfs_fd, PR_MODE, output),
+					      "LOBF not supported");
+
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe), output->name)
 				test(data, pipe, output, flags);
-- 
2.25.1

