Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E2ACAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6031B10E8E3;
	Wed,  8 Oct 2025 21:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gHk7b3GT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0D310E8DE
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759958295; x=1791494295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0PthG3XZad3rjr/Nl8OrOpITLmDqcSIaI7tCiwKnfeg=;
 b=gHk7b3GTD3BTbjGZH3x22QomiRnEMB9cRct22EzhTS7Qr20WDLLpzQoN
 d9lwEtFtYecRZ9sgshUKfyTYwsOw0BYfM+4WV20m4jI7Tv/56th3GJ5fW
 Kk+u17JvUjeuSssEQP/lzGVTTVyoT9s2rniqjFEbaCGh8WIO+mw5rUC2K
 HEmSJCjE07QIwHO6ySTxD1uFV5YYVeCA5hPaVeomckFhihe17ZEDWVaNW
 SRKk/KjF7mpkQS+My+qaLBTo41YbTz2gZKZHd2Kg1NuV0/BA28hsbohL6
 cHZRstDeC6rC4wqp2mJqfJAwPEQmoqL/+X4dedELARyXj3bZgrrIoqXaz A==;
X-CSE-ConnectionGUID: i/NpCdfYT3apGqvdIpRT2w==
X-CSE-MsgGUID: WAeTSISbSau5ZBtrgnj69g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65989646"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65989646"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
X-CSE-ConnectionGUID: HYMKj/HbTT2mOVcSUAykqg==
X-CSE-MsgGUID: bWOruBleRbO6XK42vGeeNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184805267"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 04/18] tests/intel/xe_oa: Change oa_unit_engine to take
 an oa_unit argument
Date: Wed,  8 Oct 2025 14:17:51 -0700
Message-ID: <20251008211806.625154-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008211806.625154-1-ashutosh.dixit@intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
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

To prevent code duplication with oa_unit_by_id(), pass 'struct
drm_xe_oa_unit *' as argument to oa_unit_engine().

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 65e03b1010..c7de1d081d 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -472,25 +472,9 @@ static u64 oa_format_fields(u64 name)
 }
 #define __ff oa_format_fields
 
-static struct drm_xe_engine_class_instance *oa_unit_engine(int fd, int n)
+static struct drm_xe_engine_class_instance *oa_unit_engine(struct drm_xe_oa_unit *oau)
 {
-	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
-	struct drm_xe_engine_class_instance *hwe = NULL;
-	struct drm_xe_oa_unit *oau;
-	u8 *poau;
-
-	poau = (u8 *)&qoa->oa_units[0];
-	for (int i = 0; i < qoa->num_oa_units; i++) {
-		oau = (struct drm_xe_oa_unit *)poau;
-
-		if (i == n) {
-			hwe = oau->num_engines ? &oau->eci[random() % oau->num_engines] : NULL;
-			break;
-		}
-		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
-	}
-
-	return hwe;
+	return !oau ? NULL : oau->num_engines ? &oau->eci[random() % oau->num_engines] : NULL;
 }
 
 static struct drm_xe_oa_unit *oa_unit_by_id(int fd, int n)
@@ -4263,7 +4247,7 @@ test_oa_unit_exclusive_stream(bool exponent)
 
 	/* for each oa unit, open one random perf stream with sample OA */
 	for (i = 0; i < qoa->num_oa_units; i++) {
-		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(drm_fd, i);
+		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oa_unit_by_id(drm_fd, i));
 
 		oau = (struct drm_xe_oa_unit *)poau;
 		if (oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
@@ -4295,7 +4279,7 @@ test_oa_unit_exclusive_stream(bool exponent)
 	/* for each oa unit make sure no other streams can be opened */
 	poau = (u8 *)&qoa->oa_units[0];
 	for (i = 0; i < qoa->num_oa_units; i++) {
-		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(drm_fd, i);
+		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oa_unit_by_id(drm_fd, i));
 		int err;
 
 		oau = (struct drm_xe_oa_unit *)poau;
@@ -4345,7 +4329,7 @@ test_oa_unit_concurrent_oa_buffer_read(void)
 	struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
 
 	igt_fork(child, qoa->num_oa_units) {
-		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(drm_fd, child);
+		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oa_unit_by_id(drm_fd, child));
 
 		/* No OAM support yet */
 		if (oa_unit_by_id(drm_fd, child)->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
@@ -4924,18 +4908,18 @@ static const char *xe_engine_class_name(uint32_t engine_class)
 
 #define __for_one_hwe_in_each_oa_unit(hwe) \
 	for (int m = 0; !m || hwe; m++) \
-		for_each_if(hwe = oa_unit_engine(drm_fd, m)) \
+		for_each_if(hwe = oa_unit_engine(oa_unit_by_id(drm_fd, m))) \
 			igt_dynamic_f("%s-%d", xe_engine_class_name(hwe->engine_class), \
 				      hwe->engine_instance)
 
 /* Only OAG (not OAM) is currently supported */
 #define __for_one_hwe_in_oag(hwe) \
-	if ((hwe = oa_unit_engine(drm_fd, 0))) \
+	if ((hwe = oa_unit_engine(oa_unit_by_id(drm_fd, 0)))) \
 		igt_dynamic_f("%s-%d", xe_engine_class_name(hwe->engine_class), \
 			      hwe->engine_instance)
 
 #define __for_one_hwe_in_oag_w_arg(hwe, str) \
-	if ((hwe = oa_unit_engine(drm_fd, 0))) \
+	if ((hwe = oa_unit_engine(oa_unit_by_id(drm_fd, 0)))) \
 		igt_dynamic_f("%s-%d-%s", xe_engine_class_name(hwe->engine_class), \
 			      hwe->engine_instance, str)
 
-- 
2.48.1

