Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84629D5B873
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 22:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A55A10E280;
	Mon, 15 Dec 2025 22:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y0EArVmv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2598610E198
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 22:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765837780; x=1797373780;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yjClx5HBAnD8tzDEnOrO13rc5fLfBAssy2s9thBIVaA=;
 b=Y0EArVmv8H5NUvG4JSqi7DzZ8lKiBgDEDUlWTQhXCsXKqfgzrjweKq43
 faLikJkipLm+7VgV6abPWfWLQRVOe+MXauR4m/L2iq/4uCAGrwwlrT9AU
 AJh5i8vdHq6kI13Gf5Zb28FHv9jCPSz+8/FiovXB2dIUl/V1ENEmjvEfS
 KQ/svMr5FXGKP/KRDa43EvXQaFMOtreKOJUEoqNUfK+M7+ySxBKjZi/zW
 zD/H/KL8zRjvFEDD8DpC6IxMMCD7YGXTezQ4add3jIrtte+1CP/GBEm/q
 oxQGaq5kfQ5Tdlv2+zcKrtq6aNwHiVcER5/zkoqn1FlRPNZWlEtF3Dvpo w==;
X-CSE-ConnectionGUID: 2oyNaWj/TRKxDUfObuYsBg==
X-CSE-MsgGUID: sOaIdSUuQ9GPcniP+m00iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="55315060"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="55315060"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 14:29:39 -0800
X-CSE-ConnectionGUID: kV4q3+1kQSCr8Vi7Q5eYyw==
X-CSE-MsgGUID: kPP/yKMnRomPvaAMZUH8XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="197836369"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 14:29:40 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/xe_oa: Also print oa_unit_type
Date: Mon, 15 Dec 2025 14:29:35 -0800
Message-ID: <20251215222935.2002656-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251215222935.2002656-1-ashutosh.dixit@intel.com>
References: <20251215222935.2002656-1-ashutosh.dixit@intel.com>
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

For easier debug, print oa_unit_type when we can't find metric set.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 474070e238..927f3f4f20 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -382,7 +382,7 @@ static struct intel_xe_perf_metric_set *oa_unit_metric_set(const struct drm_xe_o
 		  oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAM_SAG))
 		test_set_name = "MediaSet1";
 	else
-		igt_assert(!"reached");
+		igt_assert_f(!"reached", "Unknown oa_unit_type %d\n", oau->oa_unit_type);
 
 	igt_list_for_each_entry(metric_set_iter, &intel_xe_perf->metric_sets, link) {
 		if (strcmp(metric_set_iter->symbol_name, test_set_name) == 0) {
-- 
2.48.1

