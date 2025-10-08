Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FB4CCD18B
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2070710E8EA;
	Wed,  8 Oct 2025 21:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2ik0It4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0BC10E8DE
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759958296; x=1791494296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aFM9Wabi06vtfc+3fYmJGGZDEOGvNe/69+/YJEU3Otg=;
 b=m2ik0It4DSKF1kjxbZqAks/SlBXpHHsNl5Lf7m47m75hUe3EQZDfd4oq
 LKy/OOc4TWsBp1v6FnPHP5GA7nM0t40oI0cGRokusFx9HXtEE1bf/GFG8
 CmPTt7rEGqjb1ESQhoJswU5ijzrEXTvQ100mWyUs6AFrSqEHGEX/f39CJ
 ANSV++mrzYAPXztV+UT8mTnBpz6FtgqP/U6Y6c18I5gmdTvMacnWRRTjL
 EekQhqBy1f7+aW6whCOEe92/JAc4gZyx6/SfGyJa5bkQluZ47DYvUlfRQ
 ThCdI7Uw7zEQSEtimHyVbkxNc9vM1IYFvSL6BEOzxzAfYqQmpxwFAvV0O w==;
X-CSE-ConnectionGUID: ZS4Mtm5LSo2+2j4IGzQmBQ==
X-CSE-MsgGUID: e9uHp0j+RJCThdfW5SAWEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65989648"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65989648"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
X-CSE-ConnectionGUID: /1pt+D1TRSaxxJBGKqgiAg==
X-CSE-MsgGUID: dTi8oPz5TH68vPVsLY7MGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184805274"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 06/18] tests/intel/xe_oa: Add for_each_oa_unit
Date: Wed,  8 Oct 2025 14:17:53 -0700
Message-ID: <20251008211806.625154-7-ashutosh.dixit@intel.com>
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

Add a for_each_oa_unit iterator, which eliminates code duplication when
iterating over OA units obtained from OA unit query.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 012f5929ce..bc71bfcd30 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -477,18 +477,21 @@ static struct drm_xe_engine_class_instance *oa_unit_engine(struct drm_xe_oa_unit
 	return !oau ? NULL : oau->num_engines ? &oau->eci[random() % oau->num_engines] : NULL;
 }
 
+#define for_each_oa_unit(qoa, oau, poau, i) \
+	for (i = 0, qoa = xe_oa_units(drm_fd), poau = (u8 *)&qoa->oa_units[0]; \
+	     oau = (struct drm_xe_oa_unit *)poau, i < qoa->num_oa_units; \
+	     poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]), i++)
+
 static struct drm_xe_oa_unit *oa_unit_by_id(int fd, int n)
 {
-	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
+	struct drm_xe_query_oa_units *qoa;
 	struct drm_xe_oa_unit *oau;
 	u8 *poau;
+	int i;
 
-	poau = (u8 *)&qoa->oa_units[0];
-	for (int i = 0; i < qoa->num_oa_units; i++) {
-		oau = (struct drm_xe_oa_unit *)poau;
+	for_each_oa_unit(qoa, oau, poau, i) {
 		if (oau->oa_unit_id == n)
 			return oau;
-		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
 	}
 
 	return NULL;
@@ -496,16 +499,14 @@ static struct drm_xe_oa_unit *oa_unit_by_id(int fd, int n)
 
 static struct drm_xe_oa_unit *oa_unit_by_type(int fd, int t)
 {
-	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
+	struct drm_xe_query_oa_units *qoa;
 	struct drm_xe_oa_unit *oau;
 	u8 *poau;
+	int i;
 
-	poau = (u8 *)&qoa->oa_units[0];
-	for (int i = 0; i < qoa->num_oa_units; i++) {
-		oau = (struct drm_xe_oa_unit *)poau;
+	for_each_oa_unit(qoa, oau, poau, i) {
 		if (oau->oa_unit_type == t)
 			return oau;
-		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
 	}
 
 	return NULL;
-- 
2.48.1

