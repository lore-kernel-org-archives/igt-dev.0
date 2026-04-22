Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DADAF9EDF3
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 15:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E370310EA47;
	Wed, 22 Apr 2026 15:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Flz7aWTd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA5210E9E7
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 15:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776871006; x=1808407006;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aPBV8cxDKPWtK6ux3DNAhAgkqz1Sozm5TFJ0q1qnI14=;
 b=Flz7aWTd7URkOuokk57GPgGpy3dLoL3dVxiWbX9nquVAvETGmnp4o3so
 oa+h+b7JbO3BXU15UYJz6Dx5MJHaY3zSKmZkntrEaQeyEFMbC0or0xTWQ
 HGv5bBzZFKm8Kn/YC0RsvLS4WKurzSkHF9ijBzTMOG85QrAfV6s34/LzA
 W4flUYQySheiGImTiwmMg4ezi2JvFXmaf493o466uxA32bfcXb9nR5Eig
 7xis7DwtNatjRt+YgEm7yKCotc+23QcYdogHpyLp4LIDNfYc/MJ1oM4dv
 GPlxDP2cNeABdnrqC2nVRvnUrADVEI7KRPSbyoH5Rf0wa8Mv7z4fLUqXH g==;
X-CSE-ConnectionGUID: UXy+72bTSUWLCv1RIAvfNg==
X-CSE-MsgGUID: fpr8RD66TUO+18trsPTg+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88436821"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="88436821"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 08:16:46 -0700
X-CSE-ConnectionGUID: /sSDv1wqSeaI2b4AuOmqTw==
X-CSE-MsgGUID: wsbSsqQVSJOpgDzSE3jsjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="232289057"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 08:16:43 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, ramadevi.gandi@intel.com, ewelina.musial@intel.com,
 grzegorz.zuchowiecki@intel.com, himanshu.girotra@intel.com,
 mateusz.grabski@intel.com, pawel.drab@intel.com, raag.jadav@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t] intel-ci: Add a testlist for D3cold tests
Date: Wed, 22 Apr 2026 20:52:54 +0530
Message-Id: <20260422152254.858478-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Introduce a dedicated testlist for D3cold‑related tests.
This list is intended for use on CI platforms that support D3cold.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel-ci/xe.pm.d3cold.testlist | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 tests/intel-ci/xe.pm.d3cold.testlist

diff --git a/tests/intel-ci/xe.pm.d3cold.testlist b/tests/intel-ci/xe.pm.d3cold.testlist
new file mode 100644
index 000000000..783859fc7
--- /dev/null
+++ b/tests/intel-ci/xe.pm.d3cold.testlist
@@ -0,0 +1,11 @@
+igt@xe_pm@s2idle-d3cold-basic-exec
+igt@xe_pm@s3-d3cold-basic-exec
+igt@xe_pm@s4-d3cold-basic-exec
+igt@xe_pm@d3cold-basic
+igt@xe_pm@d3cold-basic-exec
+igt@xe_pm@d3cold-i2c
+igt@xe_pm@d3cold-multiple-execs
+igt@xe_pm@d3cold-mmap-system
+igt@xe_pm@d3cold-mmap-vram
+igt@xe_pm@d3cold-mocs
+igt@xe_pm@vram-d3cold-threshold
-- 
2.25.1

