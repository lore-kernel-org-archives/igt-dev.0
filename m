Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5507DD3B7EA
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 18:57:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E800010E054;
	Mon,  8 Dec 2025 18:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ndplyUD3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4295110E054
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 18:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765220266; x=1796756266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HLoe2ZgALy0e6/EtRjUtCmMc3diApDA2nsIKbCsVDyM=;
 b=ndplyUD3HnkiflNCNoZCmNKUtkIHEl+hYjwbNRxekOqU/ZM7yw5tp32n
 sjan6Ab9WaorJTSZBckvsmAh3rE0GRgPF2irQqsuwpHYpRXeCVMaqlBcU
 NGL8Cj0z7dWHXk3F9Jb97WsUNqb6KfNegUz5nbPN0TPwg3LQPCKUeyAvp
 /LfHKqCj/JS7gej3x9Fx7Md8/AOa6NDkN5vvBpdMZsq6OtdnkU6UNTGPn
 3Zv5c6ahVcdTNJI1DKnvk3nOafCjVlVrjPOKpyJzU8k+0+8dDEFwp7wwy
 wWJLJZe1tvkrrQU6VtGCKXJ78q1EiXWiW65r8ZLGgyk49bndnIXILggsb A==;
X-CSE-ConnectionGUID: curcxnMwSJaKgEMPqTq2cA==
X-CSE-MsgGUID: rjFVZsxOQeiJtDdYYYpgpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67219735"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="67219735"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 10:57:45 -0800
X-CSE-ConnectionGUID: Myn5KTI6TkOzwc7ZDLBbhw==
X-CSE-MsgGUID: erXTWiysTWKDVLGBgK+r2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="233384673"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 10:57:44 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 2/5] tests/intel/xe_oa: Return hwe from same gt from
 oa_unit_engine()
Date: Mon,  8 Dec 2025 10:57:34 -0800
Message-ID: <20251208185737.966218-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251208185737.966218-1-ashutosh.dixit@intel.com>
References: <20251208185737.966218-1-ashutosh.dixit@intel.com>
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

For some tests (e.g. mmio trigger) a hwe (and exec_queue) is needed for
batch submissions, even when the OA unit does not have any attached
hwe's (e.g. OAM SAG). To enable such use cases, return a hwe from the same
gt when an OA unit has no attached engines.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 9302d1c83a..c8475720c5 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -486,7 +486,22 @@ static u64 oa_format_fields(u64 name)
 
 static const struct drm_xe_engine_class_instance *oa_unit_engine(const struct drm_xe_oa_unit *oau)
 {
-	return !oau ? NULL : oau->num_engines ? &oau->eci[random() % oau->num_engines] : NULL;
+	const struct drm_xe_engine_class_instance *hwe;
+
+	igt_assert(oau);
+
+	hwe = oau->num_engines ? &oau->eci[random() % oau->num_engines] : NULL;
+
+	/* If an OA unit has no hwe's, return a hwe from the same gt */
+	if (hwe || !(oau->capabilities & DRM_XE_OA_CAPS_OA_UNIT_GT_ID))
+		goto exit;
+
+	xe_for_each_engine(drm_fd, hwe)
+		if (hwe->gt_id == oau->gt_id)
+			break;
+	igt_assert(hwe);
+exit:
+	return hwe;
 }
 
 static int __first_and_num_oa_units(const struct drm_xe_oa_unit **oau)
-- 
2.48.1

