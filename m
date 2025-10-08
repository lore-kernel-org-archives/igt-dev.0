Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83999CCD188
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237BB10E8E2;
	Wed,  8 Oct 2025 21:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T6AXjSgW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117B010E8DF
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759958295; x=1791494295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y+IOua9yZeFJ/fFVuYGSf1K7zcEx/M6Y+e1Hzp4OwcA=;
 b=T6AXjSgWZOajaDa2w0tw9QlgLyC0XJOHONDl+oKa3ZzJBuX3Q6jwPxZj
 1hds9rWDS122DMU3M8R5FetaaB6+T9Qo2FUN/fDoU3cZwJ/cvrGlizjew
 KG8XJN06q+YEJy+Rko3JcDeVwmncj5pYg1w5GofjtLnFqa4XyYKNTggEj
 v2Os9xyCHBD/EKwI3koMMXqCmc/TVQTuLsg655i0qNnAphhBGXXdUmFyH
 3odwnbOtF3iom3KsFXLfjt9WTRt9N0jCQ/79mZizofQ7v1pG4imbWFvEo
 C6OZVRU41X7c86XKwN2VIhy8Ur0kkWj7qRdfTfe+UDQJPUqP58pud37mU A==;
X-CSE-ConnectionGUID: p/gCvKOHRs657n/szG6Zww==
X-CSE-MsgGUID: a07mds0MS56H2UpMpjNg4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65989647"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65989647"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
X-CSE-ConnectionGUID: NxabwQw/QwS/eLEYZS+Ciw==
X-CSE-MsgGUID: OT7lwRcRQ/yIyEVyBesikQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184805271"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 05/18] tests/intel/xe_oa: Add oa_unit_by_type
Date: Wed,  8 Oct 2025 14:17:52 -0700
Message-ID: <20251008211806.625154-6-ashutosh.dixit@intel.com>
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

Add a function which returns an OA unit identified by its type (similar to
oa_unit_by_id()).

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index c7de1d081d..012f5929ce 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -494,6 +494,23 @@ static struct drm_xe_oa_unit *oa_unit_by_id(int fd, int n)
 	return NULL;
 }
 
+static struct drm_xe_oa_unit *oa_unit_by_type(int fd, int t)
+{
+	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
+	struct drm_xe_oa_unit *oau;
+	u8 *poau;
+
+	poau = (u8 *)&qoa->oa_units[0];
+	for (int i = 0; i < qoa->num_oa_units; i++) {
+		oau = (struct drm_xe_oa_unit *)poau;
+		if (oau->oa_unit_type == t)
+			return oau;
+		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
+	}
+
+	return NULL;
+}
+
 static char *
 pretty_print_oa_period(uint64_t oa_period_ns)
 {
@@ -4914,12 +4931,12 @@ static const char *xe_engine_class_name(uint32_t engine_class)
 
 /* Only OAG (not OAM) is currently supported */
 #define __for_one_hwe_in_oag(hwe) \
-	if ((hwe = oa_unit_engine(oa_unit_by_id(drm_fd, 0)))) \
+	if ((hwe = oa_unit_engine(oa_unit_by_type(drm_fd, DRM_XE_OA_UNIT_TYPE_OAG)))) \
 		igt_dynamic_f("%s-%d", xe_engine_class_name(hwe->engine_class), \
 			      hwe->engine_instance)
 
 #define __for_one_hwe_in_oag_w_arg(hwe, str) \
-	if ((hwe = oa_unit_engine(oa_unit_by_id(drm_fd, 0)))) \
+	if ((hwe = oa_unit_engine(oa_unit_by_type(drm_fd, DRM_XE_OA_UNIT_TYPE_OAG)))) \
 		igt_dynamic_f("%s-%d-%s", xe_engine_class_name(hwe->engine_class), \
 			      hwe->engine_instance, str)
 
-- 
2.48.1

