Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80298C83F22
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 18:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B8110E238;
	Thu, 10 Jul 2025 18:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPZkmcpo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1309110E238
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 18:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752171386; x=1783707386;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Acm4kZEy8caDrJu/X8KhHbGTuCuCZhwDZSkgQ6oIu7Q=;
 b=gPZkmcpoa/YhO0FeArhN2U11zuhrwE4HVsQ+XiM2JEkB0zw1lR2yUb4k
 fZTAd0aS06vOT4YqNuC9mO1c5JtYIEFmLH1sfGUnp7RFxEN3hrHoLfX4g
 tvi/jEHCGmWGGR8qiA9C2hncp54cKfMw7dFH6GJkDNb8aaIMBtqSiyjl3
 OsyUc/0pFsRwfsHGJxNZjHSaIeKZkNRzTXU+ZsYv0Cx1BHkMqGh62XBZA
 LszJZxzM7qIzjmVv45INlJ5ntFuzzWghci9flDXP1y5doFCbVZwCI2kai
 8EWG5vbJsqm8sLs7Ns8ev2d5NK23RFpJB1kJR5ZaUEP58cwKpJBC8jFaU g==;
X-CSE-ConnectionGUID: +eRmVPvJQhKit77s8oysdg==
X-CSE-MsgGUID: o/wB6VeWRxuf/msEd0MOBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="58229502"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="58229502"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 11:16:26 -0700
X-CSE-ConnectionGUID: oZH+Lh/+TbegYwGnccneWg==
X-CSE-MsgGUID: MpI9WIghTyGYkS2pVibthw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156293291"
Received: from vmorozov-mobl.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.80.27])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 11:16:25 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t] .checkpatch.conf: Add checkpatch.pl defaults for IGT
Date: Thu, 10 Jul 2025 20:16:13 +0200
Message-ID: <20250710181613.62487-1-peter.senna@linux.intel.com>
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

CONTRIBUTING.md contains instruction on how to use Linux kernel'
checkpatch.pl, including command line arguments for the tool.

As IGT maintainers use these options, let's standardize it in a
configuration file so that everyone using checkpatch.pl from IGT's
source code will use the same options.

Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 .checkpatch.conf | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 .checkpatch.conf

diff --git a/.checkpatch.conf b/.checkpatch.conf
new file mode 100644
index 000000000..eac25592f
--- /dev/null
+++ b/.checkpatch.conf
@@ -0,0 +1,6 @@
+--emacs
+--strict
+--show-types
+--max-line-length=100
+--ignore=BIT_MACRO,SPLIT_STRING,LONG_LINE_STRING,BOOL_MEMBER,PREFER_KERNEL_TYPES
+
-- 
2.43.0

