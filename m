Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0E5C0218C
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 07:23:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A04D10E1DD;
	Wed, 22 Jan 2025 07:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SaICN0ig";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B3210E1DD
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 07:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737530613; x=1769066613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NKNQbaDOfhzkbN+Pv/apZEHksqI6/ETRUbLX5obebKY=;
 b=SaICN0igqjvcllu6Z1Y1+bGbhmo+aae370a59inXH61b5kXj4N8Y0Ero
 ZpwqaZwbLNw0tEOBvr5tj6peBp5hA5aWjvH/IQwzpFyJM++9ts03QthT1
 55wH8KMPj5/wvEKW8sOaaa/1FgL7NJxyN12aq4MfeTLo1eTu8ghdNfXvX
 Uwmv2Fsj0pFXTB+UPG1NBCF88u371nvlCeXoXFQTwNUzS5CB6ohDjdlHM
 9bBXbTmP4x3xLuXw8XvJYMPhCexyNEdNWC5U1MBXkyAx+lfjboHKuwVK7
 gLyWq+XLVuAD53mquQunrGTeFtX6aKAqy0cPhJ0tSZ7LPq62kFt0Ff8YY Q==;
X-CSE-ConnectionGUID: srDVX0CrRvGeT1BG7kdgyg==
X-CSE-MsgGUID: lE17eMyaSy+rme7QDuek5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="41903696"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="41903696"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 23:23:33 -0800
X-CSE-ConnectionGUID: XNZjPlGzT6qg2AVopduopw==
X-CSE-MsgGUID: 03/eu4FgQYGxWHgiUQvFug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="106959601"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa007.fm.intel.com with ESMTP; 21 Jan 2025 23:23:31 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v4 1/2] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_mmio_send_recv
Date: Wed, 22 Jan 2025 13:08:07 +0530
Message-Id: <20250122073808.16288-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250122073808.16288-1-satyanarayana.k.v.p@intel.com>
References: <20250122073808.16288-1-satyanarayana.k.v.p@intel.com>
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

Use the kernel fault injection infrastructure to test error handling
of xe at probe time when executing xe_guc_mmio_send_recv() so that
more code paths are tested, such as error handling and unwinding.

Error can be injected using:
igt@xe_fault_injection@inject-fault-probe-function-xe_guc_mmio_send_recv

v2: Sorted the entry xe_guc_mmio_send_recv in inject-fault-probe-function-* list

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_fault_injection.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 7ae941367..3a0e2aa29 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -163,6 +163,7 @@ static void set_retval(const char function_name[], long long retval)
  * @xe_guc_ads_init:		xe_guc_ads_init
  * @xe_guc_ct_init:		xe_guc_ct_init
  * @xe_guc_log_init:		xe_guc_log_init
+ * @xe_guc_mmio_send_recv:     xe_guc_mmio_send_recv
  * @xe_guc_relay_init:		xe_guc_relay_init
  * @xe_pm_init_early:		xe_pm_init_early
  * @xe_sriov_init:		xe_sriov_init
@@ -294,6 +295,7 @@ igt_main
 		{ "xe_guc_ads_init" },
 		{ "xe_guc_ct_init" },
 		{ "xe_guc_log_init" },
+		{ "xe_guc_mmio_send_recv" },
 		{ "xe_guc_relay_init" },
 		{ "xe_pm_init_early" },
 		{ "xe_sriov_init" },
-- 
2.35.3

