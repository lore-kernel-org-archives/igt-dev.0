Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D29C5475B
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 04:46:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010F310F04C;
	Thu, 14 Mar 2024 04:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="clc9rQtp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3D310F04C
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 04:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710391594; x=1741927594;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1gvEUfZN94+jwcHEDVBhg8rnUvLXFvDh6W6WT3YIgoU=;
 b=clc9rQtpSKrNptkbZFlaMZL7f95YEpxBUv0hSQNSwIdjeM5MLDzFe7f5
 7ouUtmvwPzlmnq8MU9ohIpiTHOoHVDStze8CX7mhdEjuv2CBEpqRZZfYR
 KQWEW32MOeMtFhwKqYEy9Z32tP7z/0SQuBJ4yR+FKlRi9QZJ6lyAlTiQE
 v1qqGzt9DyM9je6GhgKq94W2IdlX0y/zlOX8HRphjr7dxW0XyfydW/a0o
 YCOG2YqD+q6kqDMX1zhd6VuQnSPzl8XD80oLEpwxE7AJ8iSW7vmLrP3Mb
 N8bBTbOpuEA2lq70eI/Tq/TtrImDliQchtPleIetUTNfO7cyZMBGzt6k3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5062245"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="5062245"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 21:46:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="16906264"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.145.169.80])
 by orviesa005.jf.intel.com with ESMTP; 13 Mar 2024 21:46:32 -0700
From: himanshu.girotra@intel.com
To: ramadevi.gandi@intel.com, katarzyna.piecielska@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel-ci: Unblock core hotunplug test
Date: Thu, 14 Mar 2024 10:16:30 +0530
Message-Id: <20240314044630.9816-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.40.0
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

Unblock core hotunplug for XE as it is one of the core driver test and
should not create problem anymore since XE no more in enabling stage.

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index f414017eb..fa963faf9 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -31,7 +31,6 @@ igt@kms_selftest.*
 ##################################################################
 # Exclude all other non-Xe tests
 ##################################################################
-igt@core_(?!hotunplug@unbind-rebind).*
 igt@debugfs.*
 igt@device_reset
 igt@drm_fdinfo
-- 
2.40.0

