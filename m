Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52112C369C2
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 05:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A8F10E4E9;
	Tue, 22 Apr 2025 05:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVN7OZeJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA0A10E4E9
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 05:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745298361; x=1776834361;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9PwXFOPybBJnDVclh+JdW7cQHeNG/9rTjFYtGD+FsLI=;
 b=BVN7OZeJ6sg9doFFu1WQD8fCcX4eE2z8wUJWgb10EjsTVCLUaXzxb32Y
 P+xHR6rNipHvXootMztlPGjeBYPhQRiPRMR+b1dNuDWYVghXGgV6luKjk
 mj/Tw9XbgINu08FFll+NK5b2x/5NryHv+QSvJ8GfO7sN8wJ1K6aUkuRD/
 HZZAbdIVX4NHr2MeoaCV7EK+uT8B5Ly6CT9bmBOrzOoWFAJK62at7D3EO
 P40UXNi7LlotHs0L9jHBPqTeBhDwjM8vYfdPplpyxro1ZW9EaQ6HxgV3V
 u21SMVlJ9RdrAeVTZiFJbL7C99OmL8rH6eVULaZo0Rrlo6QF5pzmh1Szj w==;
X-CSE-ConnectionGUID: 74qiuDIRRKGLMOZTcocw3w==
X-CSE-MsgGUID: Sy+nLnfDRb6yizmaDq7XAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="50643163"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="50643163"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 22:06:00 -0700
X-CSE-ConnectionGUID: ku291zcKRg2kJoP6sK50pg==
X-CSE-MsgGUID: RZgCVIEhQPqEdpAimfT3HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="155073535"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 22:05:58 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, santhosh.reddy.guddati@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] tests/intel-ci: Blocklist AMD specifc subtest
Date: Tue, 22 Apr 2025 10:35:47 +0530
Message-ID: <20250422050547.8479-1-karthik.b.s@intel.com>
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

Blocklist kms_async_flips@overlay-atomic subtest as this is an expected
skip on intel platforms.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel-ci/blacklist.txt    | 1 +
 tests/intel-ci/xe.blocklist.txt | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 1afea1c86..5a563e84d 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -103,6 +103,7 @@ igt@v3d.*
 # AMD
 ###############################################
 igt@amdgpu.*
+igt@kms_async_flips@overlay-atomic
 ###############################################
 # VMware
 ###############################################
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 506a6001e..541917393 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -92,6 +92,7 @@ igt@kms_sysfs_edid_timing
 # KMS: Non-Intel tests
 ##################################################################
 igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot
+igt@kms_async_flips@overlay-atomic
 ##################################################################
 # SR-IOV tests too stressful or time-consuming
 # to execute all dynamic subtests at once.
-- 
2.43.0

