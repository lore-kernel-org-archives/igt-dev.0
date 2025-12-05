Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DFAD2CDF1
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 00:05:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D520A10E9EC;
	Fri,  5 Dec 2025 00:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b5FQeruO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8E410E9E5
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 00:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764893135; x=1796429135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wGmSivA0d4Qn6t+x0/ONM/MpKBLKy6TrykkJwu0dDUE=;
 b=b5FQeruOZW0qQ/jtF2gz5dNaX/6IuYH7xuMDgX5x2SCQpJiDtQOAPLQW
 mGBihN7f2G4C9bjSQz483Jlqh+fn+bYowhv8TBxPHqtqKIEjmeeeFSJ0f
 wFVhWPEkrl+OdUvH/rwIw4KEnZFIqCEWuDB1eyuy4Ys1pK9OHv/iRVr3b
 Sz3D4kJPj523wA+QwRmJffprCIQFgn2VmYS2DolQzIviPXx1cvObMPKzt
 m5pRutNIswLitLNrqmM3AfA7ebOWmkSg8qEdkKG4iCJhLwTOMbFJjHITb
 J1ZjeeQnCMWM0I5OrunzEFc5vb+a5lrcT1tzexkW5G9MyXYOE7bewIuek w==;
X-CSE-ConnectionGUID: Kx6uCAtNSnu+94j6fWIKAA==
X-CSE-MsgGUID: VbQwaY1qSBali+W6fpgMeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66820501"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="66820501"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 16:05:34 -0800
X-CSE-ConnectionGUID: Nyy5ZPLuRUOS1HiYVUSXaw==
X-CSE-MsgGUID: cqCg0Xd5SB2KZXLsOtZM9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="194192917"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 16:05:33 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 2/4] tests/intel/xe_oa: Return hwe from same gt from
 oa_unit_engine()
Date: Thu,  4 Dec 2025 16:05:26 -0800
Message-ID: <20251205000528.720706-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251205000528.720706-1-ashutosh.dixit@intel.com>
References: <20251205000528.720706-1-ashutosh.dixit@intel.com>
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

