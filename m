Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825C2C3600C
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 07:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0490810E860;
	Thu, 27 Mar 2025 07:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQNe7KNj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F19510E860
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 07:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743061601; x=1774597601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zzf/gMYeaGT9vpg/7yCYuRDUehA1oQUzwt4JMtZhFfE=;
 b=lQNe7KNj22j2q88hlZjXRreeAln/SW+swUXBuIv6TTV8iHw+Z/H7+mQW
 BWq9s08lWV3bI3WnZcQPpSPoNS7CrNUIwB+EPT7TiFS5r/CyTSJGQknpl
 reJ8nYfvtdb84hznF4qlznIJT4t03gP+AejwpZT7K0hMOg0eMI128Q5/+
 jHF74WhhgxluwxQJNq1dxdx16FvHlhY6u3ABBEdO4xP2NEdZaiW8xI8R9
 WB13RRPqLgDoa54QazeqMV9fUPQZWRgICce+0hJbYX3wGt17RPClAa4tm
 SWEwQgmsC3yfdPNMHHjGljJKH9QKMafAMrs4mqcRG+EYkEbfpBYjY9vut w==;
X-CSE-ConnectionGUID: OcwG1aiQQI6Z3TQr1DX2qQ==
X-CSE-MsgGUID: 2vFMFf4QTUiReq4aDvyUHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="31979908"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="31979908"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 00:46:41 -0700
X-CSE-ConnectionGUID: BlpjMkRgQTOdB8LENs2hfg==
X-CSE-MsgGUID: sCgxFyAIQ0y86vetf2KBJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="162288281"
Received: from carterle-desk.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.8])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 00:46:38 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, jouni.hogander@intel.com,
 jeevan.b@intel.com, jani.saarinen@intel.com
Subject: [PATCH i-g-t v2 1/2] Revert "tests/intel/kms_frontbuffer_tracking:
 update to FBC support check"
Date: Thu, 27 Mar 2025 09:46:19 +0200
Message-ID: <20250327074621.559200-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327074621.559200-1-vinod.govindapillai@intel.com>
References: <20250327074621.559200-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

The fbc plane test do not depend on the fbc psr combination check.

This reverts commit a97469db452d7f25f6c39aeb1f601d0fff4d8d43.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 18c685e0c..0809352cb 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2713,7 +2713,7 @@ static void plane_fbc_rte_subtest(const struct test_mode *t)
 {
 	igt_plane_t *plane;
 
-	igt_require_f(intel_fbc_psr_combo_supported(drm.fd), "Can't test fbc for each plane\n");
+	igt_require_f((drm.display_ver >= 20), "Can't test fbc for each plane\n");
 
 	prepare_subtest_data(t, NULL);
 	unset_all_crtcs();
-- 
2.43.0

