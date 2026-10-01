Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DBFCA5FB3
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 06:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF6A10E0D9;
	Thu,  1 Oct 2026 06:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fyYfg7cy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8112310E03D
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 05:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790834358; x=1822370358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qcj3g9w7WlrtvcfQ9jswyPGlezr2e6uAidKzSbcU+1w=;
 b=fyYfg7cyQxSPRfMfVlgsrhkbZIPyzHjmTeXX05dmOpa+856cgMBOYWES
 G6QLoFoSKLDEOIxqQvl/WjEH0pwURqQekiSJU/CMnhhNSANv6x+mQrV17
 vZ6cOq7VV2zuh4V6yvJ4ukcN5yOl3ui1WioD/cUwpylRHSBMD/XAmnTce
 DaIp9kt8HM2f8A2MhKJDa2f1wght4Gp8aXFrGRUUU8YMw6lr4aLaprB4z
 xR+RLc61RtezDPHcKLroMsdx++IO9qMRhlz5EJHXyycXNb3mkZJDdV84Y
 NtmsQRuOm8ntMFAzjUOlmeLC5O5s/eSVdmd5i6z9pTPKuunvWA/RoMIPW A==;
X-CSE-ConnectionGUID: bE8CDHB+RJizJGSD7Vy/jA==
X-CSE-MsgGUID: 5Fg6mK2jTr6hGTuyDmo0rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102156744"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="102156744"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 22:59:17 -0700
X-CSE-ConnectionGUID: FqxMlXlvRJmkrho04TIvuA==
X-CSE-MsgGUID: H8sw7xbGTISbOshWi/TTCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="275444705"
Received: from dut1129bmgfrd.igk.intel.com ([10.211.178.46])
 by orviesa007.jf.intel.com with ESMTP; 30 Sep 2026 22:59:16 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v8 3/3] tests/intel-ci/xe.pm.d3cold.testlist: add xe_pm sysfs
 coverage subtests
Date: Thu,  1 Oct 2026 05:59:02 +0000
Message-ID: <20261001055902.5430-4-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001055902.5430-1-shivtej.eknath.patil@intel.com>
References: <20261001055902.5430-1-shivtej.eknath.patil@intel.com>
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
 tests/intel-ci/xe.pm.d3cold.testlist | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/intel-ci/xe.pm.d3cold.testlist b/tests/intel-ci/xe.pm.d3cold.testlist
index 783859fc7..71d91e9fd 100644
--- a/tests/intel-ci/xe.pm.d3cold.testlist
+++ b/tests/intel-ci/xe.pm.d3cold.testlist
@@ -1,11 +1,17 @@
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
-- 
2.43.0

