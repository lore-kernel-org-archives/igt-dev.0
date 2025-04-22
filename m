Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5FCC369D7
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 17:11:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4CF10E5E9;
	Tue, 22 Apr 2025 17:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VJ9XE3Zb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AB510E5E9
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 17:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745341896; x=1776877896;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6efAyXrTlSGwwAmdzoRnlqsbIxUuSVa07Jr5VjZIhJA=;
 b=VJ9XE3Zbokp/+RlbsIJ99Nau9m2b3M5sDYJ4/zuHUxoKyLUrpOyX1kv/
 0W5+AA2O4c9eL0GAZBD2qIU72CMadwF+wW6f/Jbg3YWZZCf6dhjA9YzUM
 e+eiNxja4ZQjzFjGjuwrGlHuqmx1kgZ/LnAxFvh0QG4aAXAC/zlQ9SHY5
 ZmrtaiilVgxCDXSBCDcpjzExN5v5HDQtnWnjfxf0Vgv6kyLbEBDzrsV80
 rMyiwHJJR1zheK/6O6rYk1zZwG4zgvu6R3McXAxibNPm6DYCEDItTgMGx
 NYu+8N9nFMS/XK82NqwW/XMUgTSOciiY3ahYK1otmhq6uFZMCiT/fNQbs g==;
X-CSE-ConnectionGUID: hsnwDaOxTSyCsPXjIj2isw==
X-CSE-MsgGUID: 2/qei+fjQV+eZIr+pC5x/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57102317"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="57102317"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 10:11:36 -0700
X-CSE-ConnectionGUID: c49H3MkfQwSvsSKoV/VbMw==
X-CSE-MsgGUID: e+XoUEvrSmOeVUomdm4kow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="137049715"
Received: from opintica-mobl1 (HELO localhost) ([10.245.245.150])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 10:11:34 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t] intel/xe_test_config.json: add intel_sysfs_debugfs
Date: Tue, 22 Apr 2025 19:11:25 +0200
Message-ID: <20250422171125.137275-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

Add missing intel_sysfs_debugfs, after a unify it was missing
in testlist generated for Xe.

Fixes: 68f75d1dd410 ("tests/intel/intel_sysfs_debugfs Unify sysfs and debugfs testing")
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_test_config.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index 4556025f7..b33485c96 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -2,7 +2,7 @@
     "description": "JSON file to be used to parse Xe documentation",
     "name": "Tests for Xe Driver",
     "drivers": [ "xe" ],
-    "files": [ "xe_*.c", "../core_*.c", "../sriov_basic.c", "intel_hwmon.c" ],
+    "files": [ "xe_*.c", "../core_*.c", "../sriov_basic.c", "intel_hwmon.c", "intel_sysfs_debugfs.c" ],
     "fields": {
         "Run type": {
             "_properties_": {
-- 
2.49.0

