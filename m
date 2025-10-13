Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD3FCCD18C
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 20:30:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D04910E52D;
	Mon, 13 Oct 2025 20:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Db3ioiuV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CF010E526
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 20:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760387449; x=1791923449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IRMdsas3fr5Xwjno4EsZP/RdugT0cqTHG68LtnmQy4E=;
 b=Db3ioiuVEo7v1U+xQjEud0x+TQRfpir/RcJZCODxbjvPa4JLbIFaFnoY
 HiGNzEYcictnK3zRyodpzenrRLS7fl4zAUPHl38f3BKWqlctnJVCt1i0A
 QHyzQX41JN0iORf59nRURvEJs6xexx7Fqq1SL9yaGdM42Dil1vXt+Jdy0
 tp7nzGVixzBh6tazeUxtpg49aHjAnGHJcZ5YjoaRJ7VISg0LDMQgppar7
 C8uJYT/PEKIAylh076kspATdQKNemd8Qd8+HIQd5TUZtGGOarLLlEGb2F
 JFCi/xhICf38qArUvAaiNtRx+tds8EF6UKhbvsC6joCoQNpFKnheAkkps Q==;
X-CSE-ConnectionGUID: ORRGTAB2RkW9U8KVXF+aIw==
X-CSE-MsgGUID: sq7T8PY9SgWqBr9zNzNINQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73641932"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="73641932"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
X-CSE-ConnectionGUID: e7IKiDmqR9ydRc0jDcAvog==
X-CSE-MsgGUID: 4TVicNtJQkOKXspe8p6pRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="180924020"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 05/18] tests/intel/xe_oa: Add oa_unit_by_type
Date: Mon, 13 Oct 2025 13:30:28 -0700
Message-ID: <20251013203042.925115-6-ashutosh.dixit@intel.com>
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

Add a function which returns an OA unit identified by its type (similar to
oa_unit_by_id()).

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 65b13267fb..a4aeaf2c70 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -494,6 +494,23 @@ static struct drm_xe_oa_unit *oa_unit_by_id(int fd, int id)
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

