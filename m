Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA517C02185
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 12:13:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF7D10E3CE;
	Mon, 20 Jan 2025 12:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VwnkOCsv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B300B10E3CE
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 12:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737375195; x=1768911195;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8y2qc8vNcPaoE2iRFsqJjKU2FgdOqI3DRTlifL4kXHw=;
 b=VwnkOCsvYzPs9Pev4UOyKSzQu30dXIrMMMrsPc044D53/UJHKpWFoaf0
 2a1hwh2PC/SxmnHiiYFA1BbwqK6k3z8dtFnkc0ISsmFmc2hfLleVOMzW3
 jOXPLTjrk2IP/xXUXTyj68ZajMOppyvfZHoujFmVrbNjq9zEQSCAyTrxa
 hlYDl58UusWOVzsZnoKCX25BZEXjPBiNOuiwZm0g5H5aLBTYfPg24qa/i
 W2bYyaVE2+m0paibS2Pyk3BASDeUxEY+otxfMyIsNPtWp/LXKBdRYdJVB
 yJ1Ke9+4AOZWRjhkP7QxKZ/f95+jYu4xKos+siL5QjjgKxcq3/aYlGRkB Q==;
X-CSE-ConnectionGUID: XQuZZz/9Rwu3hlozSJZA7Q==
X-CSE-MsgGUID: y5DkyMmPTYesilgbvsKQ8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37787225"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="37787225"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 04:13:15 -0800
X-CSE-ConnectionGUID: rPefDbedSzyJD16ElGOVzw==
X-CSE-MsgGUID: hQXl6CfESGqkvkOZq4XCnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="129762998"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa002.fm.intel.com with ESMTP; 20 Jan 2025 04:13:13 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v3 1/2] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_mmio_send_recv
Date: Mon, 20 Jan 2025 17:58:34 +0530
Message-Id: <20250120122835.10511-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250120122835.10511-1-satyanarayana.k.v.p@intel.com>
References: <20250120122835.10511-1-satyanarayana.k.v.p@intel.com>
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

