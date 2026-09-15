Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F59C88E53
	for <igt-dev@archiver.kernel.org>; Tue, 15 Sep 2026 05:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A31B10E08B;
	Tue, 15 Sep 2026 05:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gkyW7w93";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04B510F97C
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2026 05:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789449897; x=1820985897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/4hgbddLw/H2Pt80btOwIFNKvcWa4cQL9U7OqKA1VgQ=;
 b=gkyW7w93T9TfDgVXkUG4JqRwwCTi93X0YCkgwnX3vKIov3Wx71HUa2Ba
 0adJOfhDXXlevtodTxtjaJYeS7Qo3sWuZtL0QBEXywFbP3vZK9ukxi3oW
 MAqvqSkVV3O7MF7LnbDDe613k3Zr7/bal7Ss9S+klRW0MepMV7vQMW2JV
 Bq/PqoDqNxdSfLJUdYtuJ+rSA5n7YYKOFD7Jk713jXPd+ZN0sBpc7O8mI
 9NJ+/Sj5sg2rLakpCBhRtU2Vl4GVba/6UFhsEFl5AtHl6g3EBInf7pACG
 ZfHVaCqI78u46XvrJzceHArzWufB0ooHF69L+M1N7jId8cjIc68/UoKUo g==;
X-CSE-ConnectionGUID: oN03HfwgQbSPv6o3Ci/u3A==
X-CSE-MsgGUID: oBmJv04TSWiT1E6mk7nnmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107316179"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107316179"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 22:24:57 -0700
X-CSE-ConnectionGUID: 1goPl8DRQ/KdxzKI28Pk9w==
X-CSE-MsgGUID: uWjMiJ3NTSudd3tJhAvYTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1241464"
Received: from dut1121bmgfrd.igk.intel.com ([10.211.178.40])
 by fmviesa013.fm.intel.com with ESMTP; 14 Sep 2026 22:24:56 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v7 3/3] tests/intel-ci/xe.pm.d3cold.testlist: add xe_pm sysfs
 coverage subtests
Date: Tue, 15 Sep 2026 05:24:16 +0000
Message-ID: <20260915052421.23254-4-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915052421.23254-1-shivtej.eknath.patil@intel.com>
References: <20260915052421.23254-1-shivtej.eknath.patil@intel.com>
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

From: Shivtej Patil <shivtej.eknath.patil@intel.com>

Add the newly introduced xe_pm sysfs coverage subtests
to xe.pm.d3cold.testlist so they are executed by CI.

Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
---
 tests/intel-ci/xe.pm.d3cold.testlist | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tests/intel-ci/xe.pm.d3cold.testlist b/tests/intel-ci/xe.pm.d3cold.testlist
index 783859fc7..b34da494c 100644
--- a/tests/intel-ci/xe.pm.d3cold.testlist
+++ b/tests/intel-ci/xe.pm.d3cold.testlist
@@ -1,11 +1,18 @@
-igt@xe_pm@s2idle-d3cold-basic-exec
-igt@xe_pm@s3-d3cold-basic-exec
-igt@xe_pm@s4-d3cold-basic-exec
+igt@xe_pm@auto-link-downgrade-capable-show
+igt@xe_pm@auto-link-downgrade-status-show
 igt@xe_pm@d3cold-basic
 igt@xe_pm@d3cold-basic-exec
 igt@xe_pm@d3cold-i2c
-igt@xe_pm@d3cold-multiple-execs
 igt@xe_pm@d3cold-mmap-system
 igt@xe_pm@d3cold-mmap-vram
 igt@xe_pm@d3cold-mocs
+igt@xe_pm@d3cold-multiple-execs
+igt@xe_pm@lb-fan-control-version-show
+igt@xe_pm@lb-voltage-regulator-version-show
+igt@xe_pm@s2idle-d3cold-basic-exec
+igt@xe_pm@s3-d3cold-basic-exec
+igt@xe_pm@s4-d3cold-basic-exec
 igt@xe_pm@vram-d3cold-threshold
+igt@xe_pm@vram-d3cold-threshold-show
+igt@xe_pm@vram-d3cold-threshold-store
+
-- 
2.43.0

