Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AE3C3600C
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 08:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4B110E86E;
	Thu, 27 Mar 2025 08:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GiJqYK31";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9546B10E86E
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 08:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743062657; x=1774598657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zzf/gMYeaGT9vpg/7yCYuRDUehA1oQUzwt4JMtZhFfE=;
 b=GiJqYK31OswHMRJLMQSvMrTeWNjbHVLwnvdGcbf+cH9ygKLx0F+cq6Wh
 iGjSSWo+Z8uo6m5Z1u6DgQMO2F2U9cNP7hynBS2aeHWxsLZUZ1aU+tYXO
 94nS+r4ud+1O/Y5xzzDaue5rEuz4C4HNhac3yatuGiDFv3CjrCwN4lqte
 3UXfjAaxWfhrKy1K6T3YMxv7ukIutfyN2cola20hdp80RjJXbgu8gaPcF
 HO4g1TahL1WrR27FvD3Gp/0l3lAAgy5xB+PdN48mE78U+VCrxTSO2FCHx
 kDMe/7KV6givczvlCnLmOvJ4+qZtqgjjlUJHKGZhezQZQ3XbyOajHSYOH w==;
X-CSE-ConnectionGUID: yg2XDTzbRPuJW/C+JX7W6w==
X-CSE-MsgGUID: AkKrr+PzTtWKjJWKJqK5vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55745381"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="55745381"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 01:04:17 -0700
X-CSE-ConnectionGUID: KN6nbYX+QaO6xhMp8IaAzg==
X-CSE-MsgGUID: Fh/RjUvEQL6lU9m0qGBU5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="130165698"
Received: from carterle-desk.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.8])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 01:04:15 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, jouni.hogander@intel.com,
 jeevan.b@intel.com, jani.saarinen@intel.com
Subject: [PATCH i-g-t v3 1/2] Revert "tests/intel/kms_frontbuffer_tracking:
 update to FBC support check"
Date: Thu, 27 Mar 2025 10:03:57 +0200
Message-ID: <20250327080358.559968-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327080358.559968-1-vinod.govindapillai@intel.com>
References: <20250327080358.559968-1-vinod.govindapillai@intel.com>
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

