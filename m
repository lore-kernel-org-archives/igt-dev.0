Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E430C3814E
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 00:25:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C175B10E70D;
	Wed,  3 Jul 2024 00:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YY+BVc+u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AE810E6F9
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 00:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719966338; x=1751502338;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cjCGjQj8WP0PwDXUeF/4kA37/Za9xqoAXr3WX+NK0wE=;
 b=YY+BVc+ujuvtk9QNWkyGAsQwMYTYcY9xydo2jwiZisg4WRWRC+CRUB9i
 dWdt8yzQfjKeYj2s6A3aaSjwuFyaIUIuzE2eOBcCl2o0/sE1I07fGDn+9
 QJVo0oCwJIO3s1rTs585CvJeB9j8j7P4lGRRdzRH8CL/v2EMbv4t5qgCF
 MFLXUhciI5XxYKHflMAFN/TzGvEa8NVKu5flgv46FQ6jMcyuio4ORxsLX
 185YaGAf9V36mNSFPKbvBl33zYjxJnsKca30Z8HsOHDVtma2j2IRPCFyd
 Q+FgMyj++GJwWUzjpEuHBgUIK/C2fgZbdb0/55eusnUuoQbHL4tHP3fzN A==;
X-CSE-ConnectionGUID: AlaOOwRdT6yALL8RwJJxjA==
X-CSE-MsgGUID: RPGAMCBeTA2JzRce19hG3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20074286"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="20074286"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:38 -0700
X-CSE-ConnectionGUID: oPFoKKoUSESElamphAaiaw==
X-CSE-MsgGUID: smYlcsDPQWeRFi5MfOk1TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46072882"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:38 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	lucas.demarchi@intel.com
Subject: [PATCH i-g-t v2 07/10] tests/intel/xe_drm_fdinfo: Add an iterator for
 virtual engines
Date: Tue,  2 Jul 2024 17:25:29 -0700
Message-Id: <20240703002532.3156277-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
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

Add a helper iterator for virtual engines.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index f2051c422..9d3d1b285 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -90,6 +90,34 @@ static const uint64_t batch_addr[] = {
 	0x1d0000,
 	0x1e0000,
 };
+
+#define MAX_GTS 2
+#define MAX_INSTANCE 9
+struct virtual_hwe {
+	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	int count;
+} vhwe[MAX_GTS][DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
+
+static void list_virtual_engines(int fd)
+{
+	struct drm_xe_engine_class_instance *hwe;
+
+	xe_for_each_engine(fd, hwe) {
+		struct virtual_hwe *v;
+
+		igt_assert(hwe->gt_id < MAX_GTS);
+		igt_assert(hwe->engine_class < DRM_XE_ENGINE_CLASS_COMPUTE + 1);
+		v = &vhwe[hwe->gt_id][hwe->engine_class];
+
+		igt_assert(v->count < MAX_INSTANCE);
+		v->eci[v->count++] = *hwe;
+	}
+}
+#define xe_for_each_multi_engine(__fd, __hwe, __count) \
+	for (int igt_unique(gt) = 0; igt_unique(gt) < MAX_GTS; igt_unique(gt)++) \
+		for (int igt_unique(c) = 0; igt_unique(c) < DRM_XE_ENGINE_CLASS_COMPUTE + 1; igt_unique(c)++) \
+			for_if((__hwe = &vhwe[igt_unique(gt)][igt_unique(c)].eci[0]) && ((__count = vhwe[igt_unique(gt)][igt_unique(c)].count) > 1))
+
 static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
 {
 	struct drm_client_fdinfo info = { };
@@ -678,6 +706,7 @@ igt_main
 		xe = drm_open_driver(DRIVER_XE);
 		igt_require_xe(xe);
 		igt_require(igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0));
+		list_virtual_engines(xe);
 	}
 
 	igt_describe("Check if basic fdinfo content is present for memory");
-- 
2.38.1

