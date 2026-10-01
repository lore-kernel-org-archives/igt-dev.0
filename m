Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E994FCA5FCB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 12:30:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E87410E37C;
	Thu,  1 Oct 2026 12:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="itEdLqMa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F252C10E1F7
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 12:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790857631; x=1822393631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mNo4i+meim+x7AZiaUSgG1KgUeK3/FeQiOBa+BqLosg=;
 b=itEdLqMaEJuw09FxZo+rUs+8U8mPD9M6S/fNNWmBbsQT5P2T6QwcxazM
 PBfRcD5Ec9p3gT77CkHQEfi//iqUnqdSka6ONtFcOfOa4v4IztkH3HKUM
 p/tPFFIe8uZLRdWlB6gSdh+j000fK7U34wlKHF88Miw5m/ivHtrSRuPHd
 Sx6zl+VzlocRTDhPh3M0UIq/WDfyzJR8/lE5NYaYTlahs7FmuWveYoaUI
 YQxgaYsam9hWiT2GwHaHPZbP+rQQ4EBR9Z13wQ6aeTw9CBdiNF3mYXKY3
 gtLXCvAaVffi3hhc9mpF9Lu0RWZ1OzgzQqdahqB+/h2YprFFUU7qMq5iz Q==;
X-CSE-ConnectionGUID: FXRF9q5AQJ+nixmL5Ji0Rg==
X-CSE-MsgGUID: Cos6CeeZQ4aAxrji7Ra+bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91710125"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91710125"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 05:27:11 -0700
X-CSE-ConnectionGUID: PQ0y6FzdQJKbaqaAboZkJg==
X-CSE-MsgGUID: DmEEK8STQAePNtgS/Tntxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="276105623"
Received: from dut1129bmgfrd.igk.intel.com ([10.211.178.46])
 by fmviesa008.fm.intel.com with ESMTP; 01 Oct 2026 05:27:09 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: karthik.poosa@intel.com, ramadevi.gandi@intel.com, badal.nilawar@intel.com,
 Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v9 3/3] tests/intel-ci/xe.pm.d3cold.testlist: add xe_pm sysfs
 coverage subtests
Date: Thu,  1 Oct 2026 12:26:58 +0000
Message-ID: <20261001122658.6980-4-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001122658.6980-1-shivtej.eknath.patil@intel.com>
References: <20261001122658.6980-1-shivtej.eknath.patil@intel.com>
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

Also sort existing testlist entries alphabetically.

Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
---
 tests/intel-ci/xe.pm.d3cold.testlist | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/intel-ci/xe.pm.d3cold.testlist b/tests/intel-ci/xe.pm.d3cold.testlist
index 783859fc7..b935d1e52 100644
--- a/tests/intel-ci/xe.pm.d3cold.testlist
+++ b/tests/intel-ci/xe.pm.d3cold.testlist
@@ -1,11 +1,13 @@
-igt@xe_pm@s2idle-d3cold-basic-exec
-igt@xe_pm@s3-d3cold-basic-exec
-igt@xe_pm@s4-d3cold-basic-exec
 igt@xe_pm@d3cold-basic
 igt@xe_pm@d3cold-basic-exec
 igt@xe_pm@d3cold-i2c
-igt@xe_pm@d3cold-multiple-execs
 igt@xe_pm@d3cold-mmap-system
 igt@xe_pm@d3cold-mmap-vram
 igt@xe_pm@d3cold-mocs
+igt@xe_pm@d3cold-multiple-execs
+igt@xe_pm@s2idle-d3cold-basic-exec
+igt@xe_pm@s3-d3cold-basic-exec
+igt@xe_pm@s4-d3cold-basic-exec
 igt@xe_pm@vram-d3cold-threshold
+igt@xe_pm@vram-d3cold-threshold-show
+igt@xe_pm@vram-d3cold-threshold-store
-- 
2.43.0

