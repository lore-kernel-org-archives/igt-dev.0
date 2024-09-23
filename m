Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02329CF9C71
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 20:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF0610E49A;
	Mon, 23 Sep 2024 20:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKCLHxBx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC6810E49A
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 20:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727124374; x=1758660374;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=UdnSHoNxMxpZDaiuQyXMPTD+uheaBb7wVhfXF2yBe8E=;
 b=NKCLHxBxu71x5Xmy8ybGmqNSJ2lRWKI4qmQDTauIbq/IYjBqA1hNOYLE
 OXlcaN3Hc1ldacDZbXCId4Ufq9fMMk3PoDhY05YlWt/l6dsyLcN+qDjZM
 PJ3/RDUnPo0AflaNsJ8P6xuayE2EPA7V6mlZPylG2OJO2j2eSEus+wMsW
 id/0DuWb7y8uOHn6tPTwbCQdsUPBagqGbZTp7H6nZnV5J1zB+AMeSRXLu
 DnijglOuYf2jjwVnDjlgr7wfUQEdhnI27DcDxF2ofmDwuq7f7xGAKyr4/
 49IxD7ug5U/rgU4bXTqP+Ho4VLzyWaewZV3aKKL161Z6Bs3dunG1bRJGb g==;
X-CSE-ConnectionGUID: i0M6nTg7SI2I8mYBd5MPUQ==
X-CSE-MsgGUID: 11qedqZaTT+OrujhWQjQIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25956000"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="25956000"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 13:46:14 -0700
X-CSE-ConnectionGUID: V5zeN6YnTqaekrPxgAd6mg==
X-CSE-MsgGUID: q88h3rZMTh+fRVl+BX8ZIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71326851"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 23 Sep 2024 13:46:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Sep 2024 23:46:11 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 5/6] igt: Get rid of AT_LEAST_DISPLAY()
Date: Mon, 23 Sep 2024 23:45:56 +0300
Message-ID: <20240923204557.32123-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240923204557.32123-1-ville.syrjala@linux.intel.com>
References: <20240923204557.32123-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

AT_LEAST_DISPLAY() looks completely pointless. Just
compare numbers naturally.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/intel_chipset.h     | 1 -
 tests/intel/kms_pm_dc.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 270392c83c2a..85c075a4ad8b 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -210,7 +210,6 @@ void intel_check_pch(void);
 
 #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
 #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
-#define AT_LEAST_DISPLAY(devid, x) (intel_get_device_info(devid)->display_ver >= x)
 
 #define IS_GEN2(devid)		IS_GEN(devid, 2)
 #define IS_GEN3(devid)		IS_GEN(devid, 3)
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index c87e1d4084fb..541e94cb5b05 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -92,7 +92,7 @@
 #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
 #define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
 #define KMS_POLL_DISABLE 0
-#define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || AT_LEAST_DISPLAY(devid, 14)))
+#define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || intel_display_ver(devid) >= 14))
 #define SEC 1
 #define MSEC (SEC * 1000)
 
-- 
2.44.2

