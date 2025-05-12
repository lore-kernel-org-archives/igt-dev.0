Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4B8C3ABCD
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 12:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFEC10E3F7;
	Mon, 12 May 2025 12:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0Qgc4Dt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4238310E3F7
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 12:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747054450; x=1778590450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dNYC8JFa1E+fo6R3RKj8DVjczEaFozJGRostyHMFrFI=;
 b=N0Qgc4DtUh/pUOgpS/Sy0SnHiMDVMCy8CIO9uJJ7ypj3vJLs5n7KnPHi
 Cw1Rj31v3FEZwP/mC/kC35xepWny1kM21dnVxSsSaJFW4XV4KiwfiENtq
 9rGMrOXD75SCmSh/3vkBYiIKMGKpaWxPPolyoKnjsYa6Ct2Vqc1fvqLS1
 9n4mdxORWmp5gBXeEnWelqirfCT3z+LqR4oYAEBzPSZjfxfGuBUaiFqzC
 hC57dYVuhyyBv1DI9eI7IXbiqslFMnJQwf4vN6tWzhcMBxICuGRSESyG8
 v69a70hRhPyqOGi3WlsVqilWCrmpOx9e582nXgyVikNDPIBRl9bvt0KEm w==;
X-CSE-ConnectionGUID: wNCA2Af8SumligSDDvoWjA==
X-CSE-MsgGUID: 6SPBpdmYQFmz4j2oChMl3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48967562"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="48967562"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:54:10 -0700
X-CSE-ConnectionGUID: QM8wWZTZSrOHjvZdMUh+qA==
X-CSE-MsgGUID: +9BtnuKQRQC3fey6Wz7Fmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="137828368"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.35])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:54:09 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t v3 2/2] intel/xe_test_config.json: add device_reset
Date: Mon, 12 May 2025 14:53:55 +0200
Message-ID: <20250512125355.99620-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512125355.99620-1-kamil.konieczny@linux.intel.com>
References: <20250512125355.99620-1-kamil.konieczny@linux.intel.com>
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

This test is driver agnostic and the subtest unbind-reset-rebind
is already passing.

Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_test_config.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index b3393a89e..edca243f1 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -2,7 +2,7 @@
     "description": "JSON file to be used to parse Xe documentation",
     "name": "Tests for Xe Driver",
     "drivers": [ "xe" ],
-    "files": [ "xe_*.c", "../core_*.c", "../sriov_basic.c", "intel_hwmon.c", "intel_sysfs_debugfs.c" ],
+    "files": [ "xe_*.c", "../core_*.c", "../device_*.c", "../sriov_basic.c", "intel_hwmon.c", "intel_sysfs_debugfs.c" ],
     "fields": {
         "Run type": {
             "_properties_": {
-- 
2.49.0

