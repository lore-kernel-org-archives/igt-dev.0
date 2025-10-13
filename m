Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80935CCD18C
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 20:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363B910E545;
	Mon, 13 Oct 2025 20:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PHj06YQD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDA210E52D
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 20:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760387449; x=1791923449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kJYCQVZntqv7KMKb61wqXKXNpmXGav/3R6ER/rq6Y+U=;
 b=PHj06YQDyWCVwRYw12Sv6nsh4ru7tITSQEvrbRTWs6RPbETe4oekUB29
 cwvRmcaYjEqGNt3tOmS3d4MXOKBWri4Lc4CPO3m752XxIBhQFIMYMTikr
 1n1IRTnNo5+7wkUygXSf4ihKrFYrs5aQRUw4z7gD2obQ6i8XBzEItRRdD
 tzJYxvTg4OrX2GLvWgwdl2UIQC06zbD4maIZN772z9QgquVmuZXjOVuDZ
 9BboKQN/W6PpddyNj0S6mmBRgBGMXXXI5rlw8Jeeg08Qmlgxv7QhGI9Gl
 mPbyP/zO/qTp/fn/THrZdJB2BZuOtCn9x1zINysT2mQnvSXE1rr10bn6h g==;
X-CSE-ConnectionGUID: j/yEMDQOSkGSfZjeuiK46A==
X-CSE-MsgGUID: yJyY22N5Q4qCPr74FRp6Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73641933"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="73641933"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
X-CSE-ConnectionGUID: KX44+HraQCSRn1/2KgEATQ==
X-CSE-MsgGUID: sxE7BpioSFC2GX199ZCtNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="180924023"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t v2 06/18] tests/intel/xe_oa: Add for_each_oa_unit
Date: Mon, 13 Oct 2025 13:30:29 -0700
Message-ID: <20251013203042.925115-7-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013203042.925115-1-ashutosh.dixit@intel.com>
References: <20251013203042.925115-1-ashutosh.dixit@intel.com>
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

Add a for_each_oa_unit iterator, which eliminates code duplication when
iterating over OA units obtained from OA unit query.

v2: Only retain oau argument for for_each_oa_unit() (Umesh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index a4aeaf2c70..8e73182700 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -477,18 +477,34 @@ static struct drm_xe_engine_class_instance *oa_unit_engine(struct drm_xe_oa_unit
 	return !oau ? NULL : oau->num_engines ? &oau->eci[random() % oau->num_engines] : NULL;
 }
 
+static int __first_and_num_oa_units(struct drm_xe_oa_unit **oau)
+{
+	struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
+
+	*oau = (struct drm_xe_oa_unit *)&qoa->oa_units[0];
+
+	return qoa->num_oa_units;
+}
+
+static struct drm_xe_oa_unit *__next_oa_unit(struct drm_xe_oa_unit *oau)
+{
+	u8 *poau = (u8 *)oau;
+
+	return (struct drm_xe_oa_unit *)(poau + sizeof(*oau) +
+					 oau->num_engines * sizeof(oau->eci[0]));
+}
+
+#define for_each_oa_unit(oau) \
+	for (int _i = 0, _num_oa_units = __first_and_num_oa_units(&oau); \
+	     _i < _num_oa_units; oau = __next_oa_unit(oau), _i++)
+
 static struct drm_xe_oa_unit *oa_unit_by_id(int fd, int id)
 {
-	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
 	struct drm_xe_oa_unit *oau;
-	u8 *poau;
 
-	poau = (u8 *)&qoa->oa_units[0];
-	for (int i = 0; i < qoa->num_oa_units; i++) {
-		oau = (struct drm_xe_oa_unit *)poau;
+	for_each_oa_unit(oau) {
 		if (oau->oa_unit_id == id)
 			return oau;
-		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
 	}
 
 	return NULL;
@@ -496,16 +512,11 @@ static struct drm_xe_oa_unit *oa_unit_by_id(int fd, int id)
 
 static struct drm_xe_oa_unit *oa_unit_by_type(int fd, int t)
 {
-	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
 	struct drm_xe_oa_unit *oau;
-	u8 *poau;
 
-	poau = (u8 *)&qoa->oa_units[0];
-	for (int i = 0; i < qoa->num_oa_units; i++) {
-		oau = (struct drm_xe_oa_unit *)poau;
+	for_each_oa_unit(oau) {
 		if (oau->oa_unit_type == t)
 			return oau;
-		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
 	}
 
 	return NULL;
-- 
2.48.1

