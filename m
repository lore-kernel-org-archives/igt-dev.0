Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB6EC2A072
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 08:41:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA91A10E332;
	Mon,  5 Jan 2026 08:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTaR6xke";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B95110E332
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 08:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767602485; x=1799138485;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q+c3N5SsPFf1+VpTaV7R5s0pIdsnFLRI1ySRz2OrMQA=;
 b=lTaR6xkePqY/SwnESYVkBb0QLWAbyHlzQo55YcDP+CCxetQIv6tKav87
 UruQ4lQ1hIOdOuS9QzGUpHttXS+8aTjbIiPHAWb+mDoGU9QOYAPyNH6Jz
 9q9DBlWe8fW3+x1AwApLCGhXZdh0jJMu/6fhKifQzv8+OoBQPNHZl0edW
 NxN6ADBEoqKlh+cZBY51kjZDIJIP1xdnOjXmU13J7wZIUOcHJ4C+JMLsC
 d4Y4fHNSp2z49fvJMFoD9Hx5/NOShzTw8/eBO5aw1IogrPMpdcf5ZfH69
 FkmTYCdXsf+p0oW+J5xvSeoefeb4XTgaAmyXli/bZweelHe/ofzNJbu68 A==;
X-CSE-ConnectionGUID: 1fCrWY/JRbu/nldOrMSNRg==
X-CSE-MsgGUID: bJ3bczn5QU2DNV9lesNQyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="80413034"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="80413034"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 00:41:24 -0800
X-CSE-ConnectionGUID: 1IMCrBJ6QCuwkqXN7MNOMA==
X-CSE-MsgGUID: ESYBnIxIQxuCFD7sfMueqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="201464385"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 00:41:22 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] intel-ci: Update LNL/PTL display blocklist
Date: Mon,  5 Jan 2026 14:11:03 +0530
Message-ID: <20260105084103.27898-1-jeevan.b@intel.com>
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

Add kms_pm_rpm@package-g7 subtest as it's not supported on igfx.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel-ci/xe.lnl.display.blocklist.txt | 5 +++++
 tests/intel-ci/xe.ptl.display.blocklist.txt | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
index cd1e6d19c..830fec241 100644
--- a/tests/intel-ci/xe.lnl.display.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
@@ -173,3 +173,8 @@ igt@kms_vrr@seamless-rr-switch-drrs
 igt@kms_vrr@seamless-rr-switch-vrr
 igt@kms_dirtyfb@drrs-dirtyfb-ioctl
 igt@kms_frontbuffer_tracking@.*drrs.*
+#########################################
+# Valid Skip : Not supported on igfx
+#########################################
+igt@kms_pm_rpm@package-g7
+#########################################
diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
index 27261fa00..ba784140e 100644
--- a/tests/intel-ci/xe.ptl.display.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
@@ -172,3 +172,8 @@ igt@kms_vrr@seamless-rr-switch-drrs
 igt@kms_vrr@seamless-rr-switch-vrr
 igt@kms_dirtyfb@drrs-dirtyfb-ioctl
 igt@kms_frontbuffer_tracking@.*drrs.*
+#########################################
+# Valid Skip : Not supported on igfx
+#########################################
+igt@kms_pm_rpm@package-g7
+#########################################
-- 
2.43.0

