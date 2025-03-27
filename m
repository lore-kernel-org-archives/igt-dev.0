Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66F1C3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 12:51:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5DB10E8BB;
	Thu, 27 Mar 2025 12:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkmDFfh/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED63410E8BB
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 12:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743079859; x=1774615859;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6FomIoNVVZHhlU80Gf+ZJSeX34uswKrLiV2xbdLkWNg=;
 b=jkmDFfh/XWcmHoHQUsp4IrgF0ZmQEwM/IeC1ooTCk11H5Idz4cVhFOFS
 2ZIOL9tsw4YUcPV6lFjv37+khxnC+OcZZ4P8P9wJC9g4COkv5C+Pa2JDF
 2O+kNM7D5dzDBwebwG/faPi7LyTaJ0Xire7Wx4zdmU7NrXB5istlwcjzD
 sbKEu04xqjeCKEZ96liAnHd6YaZF3t1alp0w/pRfaKTNpeS+TJtcCPLMG
 jt6fwf6UZXs8jbHuMRYe2xMDm1B+WKY8JXAGtfclF1p8DRQviV85zOWP7
 4GJ6Rc/52uQuJh+AkqdapwtprOpHhtuztkux5u5Iy9fa1yBpxRSlPfcZu g==;
X-CSE-ConnectionGUID: 3ffjBgJoTmWg+CexJ6b8Gg==
X-CSE-MsgGUID: 61IITzXyS9CJztOW7mj3cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="54610375"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="54610375"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 05:50:58 -0700
X-CSE-ConnectionGUID: mrBT+qarSySVAn39kPrFKw==
X-CSE-MsgGUID: 6FQfoiteR4i26kx9agoMqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="162365326"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.254.149])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 05:50:57 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 i-g-t] tests/intel/xe_fault_injection: Do not treat probe
 success as error
Date: Thu, 27 Mar 2025 13:50:51 +0100
Message-Id: <20250327125051.621892-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Certain functions may not be called at all, such as xe_wopcm_init,
xe_guc_log_init, and xe_guc_ads_init during VF probe.
In such cases, a successful probe should not be treated as an error.

v2: Use igt_kmod_unbind instead of xe_sysfs_driver_do.

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_fault_injection.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 24c114ba7..b4ce8972d 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -185,6 +185,8 @@ static void set_retval(const char function_name[], long long retval)
 static void
 inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 {
+	int err = 0;
+
 	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
 		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
 
@@ -192,8 +194,12 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	injection_list_do(INJECTION_LIST_ADD, function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
-	igt_assert_eq(-errno, INJECT_ERRNO);
+	err = -errno;
 	injection_list_do(INJECTION_LIST_REMOVE, function_name);
+	if (err)
+		igt_assert_eq(err, INJECT_ERRNO);
+	else
+		igt_kmod_unbind("xe", pci_slot);
 }
 
 /**
-- 
2.31.1

